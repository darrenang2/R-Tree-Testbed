-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Tool Version Limit: 2019.12
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity krnl_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 7;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    HBM_PTR               :out  STD_LOGIC_VECTOR(63 downto 0);
    operations            :out  STD_LOGIC_VECTOR(63 downto 0);
    parameters_for_operations :out  STD_LOGIC_VECTOR(63 downto 0);
    number_of_operations  :out  STD_LOGIC_VECTOR(31 downto 0);
    board_num             :out  STD_LOGIC_VECTOR(31 downto 0);
    exe                   :out  STD_LOGIC_VECTOR(31 downto 0)
);
end entity krnl_control_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of HBM_PTR
--        bit 31~0 - HBM_PTR[31:0] (Read/Write)
-- 0x14 : Data signal of HBM_PTR
--        bit 31~0 - HBM_PTR[63:32] (Read/Write)
-- 0x18 : reserved
-- 0x1c : Data signal of operations
--        bit 31~0 - operations[31:0] (Read/Write)
-- 0x20 : Data signal of operations
--        bit 31~0 - operations[63:32] (Read/Write)
-- 0x24 : reserved
-- 0x28 : Data signal of parameters_for_operations
--        bit 31~0 - parameters_for_operations[31:0] (Read/Write)
-- 0x2c : Data signal of parameters_for_operations
--        bit 31~0 - parameters_for_operations[63:32] (Read/Write)
-- 0x30 : reserved
-- 0x34 : Data signal of number_of_operations
--        bit 31~0 - number_of_operations[31:0] (Read/Write)
-- 0x38 : reserved
-- 0x3c : Data signal of board_num
--        bit 31~0 - board_num[31:0] (Read/Write)
-- 0x40 : reserved
-- 0x44 : Data signal of exe
--        bit 31~0 - exe[31:0] (Read/Write)
-- 0x48 : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of krnl_control_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_HBM_PTR_DATA_0                   : INTEGER := 16#10#;
    constant ADDR_HBM_PTR_DATA_1                   : INTEGER := 16#14#;
    constant ADDR_HBM_PTR_CTRL                     : INTEGER := 16#18#;
    constant ADDR_OPERATIONS_DATA_0                : INTEGER := 16#1c#;
    constant ADDR_OPERATIONS_DATA_1                : INTEGER := 16#20#;
    constant ADDR_OPERATIONS_CTRL                  : INTEGER := 16#24#;
    constant ADDR_PARAMETERS_FOR_OPERATIONS_DATA_0 : INTEGER := 16#28#;
    constant ADDR_PARAMETERS_FOR_OPERATIONS_DATA_1 : INTEGER := 16#2c#;
    constant ADDR_PARAMETERS_FOR_OPERATIONS_CTRL   : INTEGER := 16#30#;
    constant ADDR_NUMBER_OF_OPERATIONS_DATA_0      : INTEGER := 16#34#;
    constant ADDR_NUMBER_OF_OPERATIONS_CTRL        : INTEGER := 16#38#;
    constant ADDR_BOARD_NUM_DATA_0                 : INTEGER := 16#3c#;
    constant ADDR_BOARD_NUM_CTRL                   : INTEGER := 16#40#;
    constant ADDR_EXE_DATA_0                       : INTEGER := 16#44#;
    constant ADDR_EXE_CTRL                         : INTEGER := 16#48#;
    constant ADDR_BITS         : INTEGER := 7;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_HBM_PTR         : UNSIGNED(63 downto 0) := (others => '0');
    signal int_operations      : UNSIGNED(63 downto 0) := (others => '0');
    signal int_parameters_for_operations : UNSIGNED(63 downto 0) := (others => '0');
    signal int_number_of_operations : UNSIGNED(31 downto 0) := (others => '0');
    signal int_board_num       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_exe             : UNSIGNED(31 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_HBM_PTR_DATA_0 =>
                        rdata_data <= RESIZE(int_HBM_PTR(31 downto 0), 32);
                    when ADDR_HBM_PTR_DATA_1 =>
                        rdata_data <= RESIZE(int_HBM_PTR(63 downto 32), 32);
                    when ADDR_OPERATIONS_DATA_0 =>
                        rdata_data <= RESIZE(int_operations(31 downto 0), 32);
                    when ADDR_OPERATIONS_DATA_1 =>
                        rdata_data <= RESIZE(int_operations(63 downto 32), 32);
                    when ADDR_PARAMETERS_FOR_OPERATIONS_DATA_0 =>
                        rdata_data <= RESIZE(int_parameters_for_operations(31 downto 0), 32);
                    when ADDR_PARAMETERS_FOR_OPERATIONS_DATA_1 =>
                        rdata_data <= RESIZE(int_parameters_for_operations(63 downto 32), 32);
                    when ADDR_NUMBER_OF_OPERATIONS_DATA_0 =>
                        rdata_data <= RESIZE(int_number_of_operations(31 downto 0), 32);
                    when ADDR_BOARD_NUM_DATA_0 =>
                        rdata_data <= RESIZE(int_board_num(31 downto 0), 32);
                    when ADDR_EXE_DATA_0 =>
                        rdata_data <= RESIZE(int_exe(31 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    HBM_PTR              <= STD_LOGIC_VECTOR(int_HBM_PTR);
    operations           <= STD_LOGIC_VECTOR(int_operations);
    parameters_for_operations <= STD_LOGIC_VECTOR(int_parameters_for_operations);
    number_of_operations <= STD_LOGIC_VECTOR(int_number_of_operations);
    board_num            <= STD_LOGIC_VECTOR(int_board_num);
    exe                  <= STD_LOGIC_VECTOR(int_exe);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_HBM_PTR_DATA_0) then
                    int_HBM_PTR(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_HBM_PTR(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_HBM_PTR_DATA_1) then
                    int_HBM_PTR(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_HBM_PTR(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OPERATIONS_DATA_0) then
                    int_operations(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_operations(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OPERATIONS_DATA_1) then
                    int_operations(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_operations(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PARAMETERS_FOR_OPERATIONS_DATA_0) then
                    int_parameters_for_operations(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_parameters_for_operations(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PARAMETERS_FOR_OPERATIONS_DATA_1) then
                    int_parameters_for_operations(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_parameters_for_operations(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NUMBER_OF_OPERATIONS_DATA_0) then
                    int_number_of_operations(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_number_of_operations(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_BOARD_NUM_DATA_0) then
                    int_board_num(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_board_num(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_EXE_DATA_0) then
                    int_exe(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_exe(31 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
