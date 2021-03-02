--Elec 204 Project
--Instructor: Mehmet Cengiz Onbaþlý
--Ayþenur Torun Id: 0060587 Department: Electrical and Electronics Engineering
--Ýrem Arpag Id: 0050306 Department: Computer Engineering
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity arbitrarybaseconverter is
    generic (X : INTEGER:=50*10**6;                        -- 50*10^6 Hertz Clock
				Y: INTEGER:=65536);                            -- 2^13=8192
	 Port (CLOCK : in  STD_LOGIC; 
			  B: in  STD_LOGIC_VECTOR (1 downto 0);           --base of the second number
           A : in  STD_LOGIC_VECTOR (1 downto 0);          --base of the first number
           N  : in  STD_LOGIC_VECTOR (5 downto 0);         --the number which is in binary
			  SevSeg : out  STD_LOGIC_VECTOR (6 downto 0);    --seven segment
			  Digits: out STD_LOGIC_VECTOR(7 downto 0));      --anodes
end arbitrarybaseconverter;

architecture Behavioral of arbitrarybaseconverter is


begin


process(CLOCK)
	variable Counter : INTEGER range 0 to Y;
	begin		
		if(rising_edge(CLOCK)) then
			Counter :=Counter+1;
			if (Counter mod Y = 0) then        --the procedure for the number whose base is controlled by 'A' switches
				Digits <= "11111110";           --to choose the last anode  
				if(A="00") then                 --'00' case -> base:3
					if(N="111110" or N="111011" or N="111000"or N="110101"or N="110010"or N="101111"or N="101100"or N="101001"or N="100110"or N="100011"or N="100000"or N="011101"or N="011010"or N="010111"or N="010100"or N="010001"or N="001110"or N="001011"or N="001000"or N="000101"or N="000010" ) then SevSeg <=  "0010010"; --all the possibilities which makes the last anode 2 in base 3
					elsif(N="111101" or N="111010" or N="110111" or N="110100" or N="110001" or N="101110" or N="101011" or N="101000" or N="100101" or N="100010" or N="011111" or N="011100" or N="011001" or N="010110" or N="010011" or N="010000" or N="001101" or N="001010" or N="000111" or N="000100" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the last anode 1 in base 3
					elsif(N="111111" or N="111100" or N="111001" or N="110110" or N="110011" or N="110000" or N="101101" or N="101010" or N="100111" or N="100100" or N="100001" or N="011110" or N="011011" or N="011000" or N="010101" or N="010010" or N="001111" or N="001100" or N="001001" or N="000110" or N="000011" or N="000000")  then SevSeg <= "0000001"; -- all the possibilities which makes the last anode 0 in base 3
					end if;
				elsif(A="01") then              --'01' case -> base: 4
					if (N="111111" or N="111011" or N="110111" or N="110011" or N="101111" or N="101011" or N="100111" or N="100011" or N="011111" or N="011011" or N="010111" or N="010011" or N="001111" or N="001011" or N="000111" or N="000011") then SevSeg <=  "0000110"; --all the possibilities which makes the last anode 3 in base 4
					elsif(N="111110" or N="111010" or N="110110" or N="110010" or N="101110" or N="101010" or N="100110" or N="100010" or N="011110" or N="011010" or N="010110" or N="010010" or N="001110" or N="001010" or N="000110" or N="000010") then SevSeg <= "0010010"; --all the possibilities which makes the last anode 2 in base 4
					elsif(N="111101" or N="111001" or N="110101" or N="110001" or N="101101" or N="101001" or N="100101" or N="100001" or N="011101" or N="011001" or N="010101" or N="010001" or N="001101" or N="001001" or N="000101" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the last anode 1 in base 4
					elsif(N="111100" or N="111000" or N="110100" or N="110000" or N="101100" or N="101000" or N="100100" or N="100000" or N="011100" or N="011000" or N="010100" or N="010000" or N="001100" or N="001000" or N="000100" or N="000000") then SevSeg <=  "0000001"; --all the possibilities which makes the last anode 0 in base 4
					end if;
				elsif(A="10") then              --'10' case -> base 5
					if (N="111011" or N="110110" or N="110001" or  N="101100" or  N="100111" or  N="100010" or  N="011101" or  N="011000" or  N="010011" or  N="001110" or  N="001001" or  N="000100") then SevSeg <=  "1001100"; --all the possibilities which makes the last anode 4 in base 5
					elsif(N="111111" or N="111010" or  N="110101" or N="110000" or N="101011" or N="100110" or N="100001" or N="011100" or N="010111" or N="010010" or N="001101" or N="001000" or N="000011") then SevSeg <=  "0000110"; --all the possibilities which makes the last anode 3 in base 5
					elsif (N="111110" or N="111001" or N="110100" or N="101111" or N="101010" or N="100101" or N="100000" or N="011011" or N="010110" or N="010001" or N="001100" or N="000111" or N="" or N="000010")  then SevSeg <= "0010010"; --all the possibilities which makes the last anode 2 in base 5
					elsif (N="111101" or N="111000" or N="110011" or N="101110" or N="101001" or N="100100" or N="011111" or N="011010" or N="010101" or N="010000" or N="001011" or N="000110" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the last anode 1 in base 5
					elsif (N="111100" or N="110111" or N="110010" or N="101101" or N="101000" or N="100011" or N="011110" or N="011001" or N="010100" or N="001111" or N="001010" or N="000101" or N="000000") then SevSeg <=  "0000001"; --all the possibilities which makes the last anode 0 in base 5
					end if;
				elsif(A="11") then              --'11' case -> base:6
					if (N="111011" or N="110101" or N="101111" or N="101001" or  N="100011" or N="011101" or N="010111" or N="010001" or N="001011" or N="000101") then SevSeg <=  "0100100";                --all the possibilities which makes the last anode 5 in base 6
					elsif(N="111010" or N="110100" or N="101110" or N="101000" or  N="100010" or N="011100" or N="010110" or N="010000" or N="001010" or N="000100") then SevSeg <=  "1001100";              --all the possibilities which makes the last anode 4 in base 6
					elsif(N="111111" or N="111001" or N="110011" or N="101101" or N="100111" or N="100001" or N="011011" or N="010101" or N="001111" or N="001001" or N="000011") then SevSeg <=  "0000110"; --all the possibilities which makes the last anode 3 in base 6
					elsif(N="111110" or N="111000" or N="101100" or N="100110" or N="100000" or N="011010" or N="010100" or N="001110" or N="001000" or N="000010") then SevSeg <= "0010010";                --all the possibilities which makes the last anode 2 in base 6
					elsif(N="111101" or N="110111" or N="110001" or N="101011" or N="100101" or N="011111" or N="011001" or N="010011" or N="001101" or N="000111" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the last anode 1 in base 6
					elsif(N="111100" or N="110110" or N="110000" or N="101010" or N="101010" or N="011110" or N="011000" or N="010010" or N="001100" or N="000110" or N="000000") then SevSeg <=  "0000001"; --all the possibilities which makes the last anode 0 in base 6
					end if;	
				end if;
			elsif (Counter mod Y = 1*Y/8) then
				Digits <= "11111101";         --to choose the second anode
				if(A="00") then               --'00' case -> base:3
					if((N<="111110" and N>="111100") or (N<="101100" and N>="101010") or (N<="100011" and N>="100001") or (N<="011010" and N>="011000") or (N<="010001" and N>="001111") or (N<="001000" and N>="000110")) then SevSeg <= "0010010"; --all the possibilities which makes the second anode 2 in base 3
					 elsif(N="111001" or N="111010" or N="111011" or N="110000" or N="110001" or N="110010" or N="100111" or N="101000" or N="101001" or N="011110" or N="011111" or N="100000" or N="010101"  or N="010110" or N="010111" or N="001100" or N="001101" or N="001111" or N="000011" or N="000100" or N="000101") then SevSeg <= "1001111";  --all the possibilities which makes the second anode 1 in base 3
					 elsif(N="111111" or N="110110" or N="110111" or N="111000" or N="101101" or N="101110" or N="101111" or N="100100" or N="100101" or N="100110" or N="011011" or N="011100" or N="011101" or N="010010" or N="010011" or N="010100" or N="001001" or N="001010" or N="001011" or N="000000" or N="000001" or N="000010") then SevSeg <=  "0000001"; --all the possibilities which makes the second anode 0 in base 3
					 end if;
				elsif(A="01") then             -- 01' case -> base:4
					if((N<="111111" and N>="111100") or (N<="101111" and N>="101100") or (N<="011111" and N>="011100") or (N<="001111" and N>="001100")) then SevSeg <=  "0000110"; --all the possibilities which makes the second anode 3 in base 4
					elsif ((N<="111011" and N>="111000") or (N<="101011" and N>="101000") or (N<="011011" and N>="011000") or (N<="001011" and N>="001000")) then SevSeg <=  "0010010"; --all the possibilities which makes the second anode 2 in base 4 
					elsif ((N<="110111" and N>="110100") or (N<="100111" and N>="100100") or (N<="010111" and N>="010100") or (N<="000111" and N>="000100")) then SevSeg <= "1001111";  --all the possibilities which makes the second anode 1 in base 4
					elsif ((N<="110011" and N>="110000") or (N<="100011" and N>="100000") or (N<="010011" and N>="010000") or (N<="000011" and N>="000000")) then SevSeg <=  "0000001"; --all the possibilities which makes the second anode 0 in base 4
					end if;
				elsif(A="10") then             --'10' case -> base:5
					if((N<="110001" and N>="101101") or (N<="011000" and N>="010100")) then SevSeg <=  "1001100"; --all the possibilities which makes the second anode 4 in base 5
					elsif((N<="101100" and N>="101000") or (N<="010011" and N>="001111"))  then SevSeg <=  "0000110"; --all the possibilities which makes the second anode 3
					elsif((N<="111111" and N>="111100") or (N<="100111" and N>="100011") or (N<="001110" and N>="001010")) then SevSeg <=  "0010010"; --all the possibilities which makes the second anode 2 in base 5
					elsif((N<="111011" and N>="110111") or (N<="100010" and N>="011110") or (N<="001001" and N>="000101")) then SevSeg <= "1001111";  --all the possibilities which makes the second anode 1 in base 5 
					elsif((N<="110110" and N>="110010") or (N<="011101" and N>="011001") or (N<="000100" and N>="000000")) then SevSeg <= "0000001"; --all the possibilities which makes the second anode 0 in base 5
					end if;
				elsif(A="11") then              --'11' case -> base:6
					if(N<="100011" and N>="011110") then SevSeg <=  "0100100";-- 5
					elsif((N<="111111" and N>="111100") or (N<="011101" and N>="011000")) then SevSeg <=  "1001100"; --all the possibilities which makes the second anode 4 in base 6
					elsif((N<="111011" and N>="110110") or (N<="010111" and N>="010010")) then SevSeg <=  "0000110"; --all the possibilities which makes the second anode 3 in base 6
					elsif((N<="110101" and N>="110000") or (N<="010001" and N>="001100")) then SevSeg <=  "0010010"; --all the possibilities which makes the second anode 2 in base 6 
					elsif((N<="101111" and N>="101010") or (N<="001011" and N>="000110")) then SevSeg <= "1001111";  --all the possibilities which makes the second anode 1 in base 6
					elsif((N<="101001" and N>="100100") or (N<="000101" and N>="000000")) then SevSeg <= "0000001"; --all the possibilities which makes the second anode 0 in base 6
					end if;
				end if;	
			elsif (Counter mod Y = 2*Y/8) then
				Digits <= "11111011";
				if(A="00") then               --'00' case -> base:3
					if((N>="101101" and N<"110110") or (N>="010010" and N<"011011")) then SevSeg <=  "0010010"; --all the possibilities which makes the third anode 2 in base 3
					elsif(N="111111" or (N>="100100" and N<="101100") or (N>="001001" and N<="010001")) then SevSeg <= "1001111";  --all the possibilities which makes the third anode 1 in base 3
					elsif((N<"111111" and N>="110110") or (N<="011011" and N>="100011") or (N>="000000" and N<="001000"))then SevSeg <=  "0000001"; --all the possibilities which makes the third anode 0 in base 3
					end if;
				elsif(A="01") then            --'01' case -> base:4
					if(N>"101111") then SevSeg <=  "0000110"; --all the possibilities which makes the third anode 3 in base 4
					elsif(N>"011111") then SevSeg <=  "0010010"; --all the possibilities which makes the third anode 2 in base 4
					elsif(N>"001111") then SevSeg <= "1001111";  --all the possibilities which makes the third anode 1 in base 4
					else SevSeg <=  "0000001"; -- 0
					end if;
				elsif(A="10") then             -- '10' case -> base:5
					if(N>"110001") then SevSeg <=  "0010010"; --all the possibilities which makes the third anode 2 in base 5
					elsif(N>"011000") then SevSeg <= "1001111";  --all the possibilities which makes the third anode 1 in base 5
					else SevSeg <=  "0000001"; -- 0
					end if;
				elsif(A="11") then           --'11' case -> base:6
					if(N>"100011") then SevSeg <= "1001111";  --all the possibilities which makes the third anode 1 in base 6
					else SevSeg <=  "0000001"; -- 0
					end if;
				end if;
			elsif (Counter mod Y = 3*Y/8) then
				Digits <= "11110111";
				if (A="00") then    --'00' case -> base:3
					if(N>"110101") then SevSeg <=  "0010010"; --all the possibilities which makes the fourth anode 2 in base 3
					elsif(N>"011010") then SevSeg <= "1001111";  --all the possibilities which makes the fourth anode 1 in base 3
					else SevSeg <=  "0000001"; --all the possibilities which makes the fourth anode 0 in base 3
					end if;
				end if;	
			elsif (Counter mod Y = 4*Y/8) then
				Digits <= "11101111";         --the same procedure is applied for the number whose base is controlled by 'B' inputs
				if(B="00") then     --'00' case -> base:3
					if(N="111110" or N="111011" or N="111000"or N="110101"or N="110010"or N="101111"or N="101100"or N="101001"or N="100110"or N="100011"or N="100000"or N="011101"or N="011010"or N="010111"or N="010100"or N="010001"or N="001110"or N="001011"or N="001000"or N="000101"or N="000010" ) then SevSeg <=  "0010010"; --all the possibilities which makes the fifth anode 2 in base 3
					elsif(N="111101" or N="111010" or N="110111" or N="110100" or N="110001" or N="101110" or N="101011" or N="101000" or N="100101" or N="100010" or N="011111" or N="011100" or N="011001" or N="010110" or N="010011" or N="010000" or N="001101" or N="001010" or N="000111" or N="000100" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the fifth anode 1 in base 3
					elsif(N="111111" or N="111100" or N="111001" or N="110110" or N="110011" or N="110000" or N="101101" or N="101010" or N="100111" or N="100100" or N="100001" or N="011110" or N="011011" or N="011000" or N="010101" or N="010010" or N="001111" or N="001100" or N="001001" or N="000110" or N="000011" or N="000000")  then SevSeg <= "0000001"; --all the possibilities which makes the fifth anode 0 in base 3
					end if;
				elsif(B="01") then    --'01' case -> base:4
					if (N="111111" or N="111011" or N="110111" or N="110011" or N="101111" or N="101011" or N="100111" or N="100011" or N="011111" or N="011011" or N="010111" or N="010011" or N="001111" or N="001011" or N="000111" or N="000011") then SevSeg <=  "0000110"; --all the possibilities which makes the fifth anode 3 in base 4
					elsif(N="111110" or N="111010" or N="110110" or N="110010" or N="101110" or N="101010" or N="100110" or N="100010" or N="011110" or N="011010" or N="010110" or N="010010" or N="001110" or N="001010" or N="000110" or N="000010") then SevSeg <= "0010010"; --all the possibilities which makes the fifth anode 2 in base 4
					elsif(N="111101" or N="111001" or N="110101" or N="110001" or N="101101" or N="101001" or N="100101" or N="100001" or N="011101" or N="011001" or N="010101" or N="010001" or N="001101" or N="001001" or N="000101" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the fifth anode 1 in base 4
					elsif(N="111100" or N="111000" or N="110100" or N="110000" or N="101100" or N="101000" or N="100100" or N="100000" or N="011100" or N="011000" or N="010100" or N="010000" or N="001100" or N="001000" or N="000100" or N="000000") then SevSeg <=  "0000001"; --all the possibilities which makes the fifth anode 0 in base 4
					end if;
				elsif(B="10") then     --'10' case -> base:5
					if (N="111011" or N="110110" or N="110001" or  N="101100" or  N="100111" or  N="100010" or  N="011101" or  N="011000" or  N="010011" or  N="001110" or  N="001001" or  N="000100") then SevSeg <=  "1001100"; -- all the possibilities which makes the fifth anode 4 in base 5
					elsif(N="111111" or N="111010" or  N="110101" or N="110000" or N="101011" or N="100110" or N="100001" or N="011100" or N="010111" or N="010010" or N="001101" or N="001000" or N="000011") then SevSeg <=  "0000110"; --all the possibilities which makes the fifth anode 3 in base 5
					elsif (N="111110" or N="111001" or N="110100" or N="101111" or N="101010" or N="100101" or N="100000" or N="011011" or N="010110" or N="010001" or N="001100" or N="000111" or N="" or N="000010")  then SevSeg <= "0010010"; --all the possibilities which makes the fifth anode 2 in base 5
					elsif (N="111101" or N="111000" or N="110011" or N="101110" or N="101001" or N="100100" or N="011111" or N="011010" or N="010101" or N="010000" or N="001011" or N="000110" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the fifth anode 1 in base 5
					elsif (N="111100" or N="110111" or N="110010" or N="101101" or N="101000" or N="100011" or N="011110" or N="011001" or N="010100" or N="001111" or N="001010" or N="000101" or N="000000") then SevSeg <=  "0000001"; --all the possibilities which makes the fifth anode 0 in base 5
					end if;
				elsif(B="11") then     --'11' case -> base:6
					if (N="111011" or N="110101" or N="101111" or N="101001" or  N="100011" or N="011101" or N="010111" or N="010001" or N="001011" or N="000101") then SevSeg <=  "0100100";--all the possibilities which makes the fifth anode 5 in base 6
					elsif(N="111010" or N="110100" or N="101110" or N="101000" or  N="100010" or N="011100" or N="010110" or N="010000" or N="001010" or N="000100") then SevSeg <=  "1001100"; --all the possibilities which makes the fifth anode 4 in base 6
					elsif(N="111111" or N="111001" or N="110011" or N="101101" or N="100111" or N="100001" or N="011011" or N="010101" or N="001111" or N="001001" or N="000011") then SevSeg <=  "0000110"; --all the possibilities which makes the fifth anode 3 in base 6
					elsif(N="111110" or N="111000" or N="101100" or N="100110" or N="100000" or N="011010" or N="010100" or N="001110" or N="001000" or N="000010") then SevSeg <= "0010010"; --all the possibilities which makes the fifth anode 2 in base 6
					elsif(N="111101" or N="110111" or N="110001" or N="101011" or N="100101" or N="011111" or N="011001" or N="010011" or N="001101" or N="000111" or N="000001") then SevSeg <= "1001111";  --all the possibilities which makes the fifth anode 1 in base 6
					elsif(N="111100" or N="110110" or N="110000" or N="101010" or N="101010" or N="011110" or N="011000" or N="010010" or N="001100" or N="000110" or N="000000") then SevSeg <=  "0000001"; --all the possibilities which makes the fifth anode 0 in base 6
					end if;
				end if;	
			elsif (Counter mod Y = 5*Y/8) then
				Digits <= "11011111";
				if(B="00") then        --'00' case -> base:3
					if((N<="111110" and N>="111100") or (N<="101100" and N>="101010") or (N<="100011" and N>="100001") or (N<="011010" and N>="011000") or (N<="010001" and N>="001111") or (N<="001000" and N>="000110")) then SevSeg <= "0010010"; --all the possibilities which makes the sixth anode 2 in base 3
					 elsif(N="111001" or N="111010" or N="111011" or N="110000" or N="110001" or N="110010" or N="100111" or N="101000" or N="101001" or N="011110" or N="011111" or N="100000" or N="010101"  or N="010110" or N="010111" or N="001100" or N="001101" or N="001111" or N="000011" or N="000100" or N="000101") then SevSeg <= "1001111";  --all the possibilities which makes the sixth anode 1 in base 3
					 elsif(N="111111" or N="110110" or N="110111" or N="111000" or N="101101" or N="101110" or N="101111" or N="100100" or N="100101" or N="100110" or N="011011" or N="011100" or N="011101" or N="010010" or N="010011" or N="010100" or N="001001" or N="001010" or N="001011" or N="000000" or N="000001" or N="000010") then SevSeg <=  "0000001"; --all the possibilities which makes the sixth anode 0 in base 3
					 end if;
				elsif(B="01") then     --'01' case -> base:4
					if((N<="111111" and N>="111100") or (N<="101111" and N>="101100") or (N<="011111" and N>="011100") or (N<="001111" and N>="001100")) then SevSeg <=  "0000110"; --all the possibilities which makes the sixth anode 3 in base 4
					elsif ((N<="111011" and N>="111000") or (N<="101011" and N>="101000") or (N<="011011" and N>="011000") or (N<="001011" and N>="001000")) then SevSeg <=  "0010010"; --all the possibilities which makes the sixth anode 2 in base 4
					elsif ((N<="110111" and N>="110100") or (N<="100111" and N>="100100") or (N<="010111" and N>="010100") or (N<="000111" and N>="000100")) then SevSeg <= "1001111";  --all the possibilities which makes the sixth anode 1 in base 4
					elsif ((N<="110011" and N>="110000") or (N<="100011" and N>="100000") or (N<="010011" and N>="010000") or (N<="000011" and N>="000000")) then SevSeg <=  "0000001"; --all the possibilities which makes the sixth anode 0 in base 4
					end if;
				elsif(B="10") then      --'10' case -> base:5
					if((N<="110001" and N>="101101") or (N<="011000" and N>="010100")) then SevSeg <=  "1001100"; --all the possibilities which makes the sixth anode 4 in base 5
					elsif((N<="101100" and N>="101000") or (N<="010011" and N>="001111"))  then SevSeg <=  "0000110"; --all the possibilities which makes the sixth anode 3 in base 5
					elsif((N<="111111" and N>="111100") or (N<="100111" and N>="100011") or (N<="001110" and N>="001010")) then SevSeg <=  "0010010"; --all the possibilities which makes the sixth anode 2 in base 5
					elsif((N<="111011" and N>="110111") or (N<="100010" and N>="011110") or (N<="001001" and N>="000101")) then SevSeg <= "1001111";  --all the possibilities which makes the sixth anode 1 in base 5
					elsif((N<="110110" and N>="110010") or (N<="011101" and N>="011001") or (N<="000100" and N>="000000")) then SevSeg <= "0000001"; --all the possibilities which makes the sixth anode 0 in base 5
					end if;
				elsif(B="11") then       --'11' case -> base:6
					if(N<="100011" and N>="011110") then SevSeg <=  "0100100";--all the possibilities which makes the sixth anode 5 in base 6
					elsif((N<="111111" and N>="111100") or (N<="011101" and N>="011000")) then SevSeg <=  "1001100"; --all the possibilities which makes the sixth anode 4 in base 6
					elsif((N<="111011" and N>="110110") or (N<="010111" and N>="010010")) then SevSeg <=  "0000110"; --all the possibilities which makes the sixth anode 3 in base 6
					elsif((N<="110101" and N>="110000") or (N<="010001" and N>="001100")) then SevSeg <=  "0010010"; --all the possibilities which makes the sixth anode 2 in base 6
					elsif((N<="101111" and N>="101010") or (N<="001011" and N>="000110")) then SevSeg <= "1001111";  --all the possibilities which makes the sixth anode 1 in base 6
					elsif((N<="101001" and N>="100100") or (N<="000101" and N>="000000")) then SevSeg <= "0000001"; --all the possibilities which makes the sixth anode 0 in base 6
					end if;
				end if;	
			elsif (Counter mod Y = 6*Y/8) then
				Digits <= "10111111";
				if(B="00") then         --'00' case -> base:3
					if((N>="101101" and N<"110110") or (N>="010010" and N<"011011")) then SevSeg <=  "0010010"; --all the possibilities which makes the seventh anode 2 in base 3
					elsif(N="111111" or (N>="100100" and N<="101100") or (N>="001001" and N<="010001")) then SevSeg <= "1001111";  --all the possibilities which makes the seventh anode 1 in base 3
					elsif((N<"111111" and N>="110110") or (N<="011011" and N>="100011") or (N>="000000" and N<="001000"))then SevSeg <=  "0000001"; --all the possibilities which makes the seventh anode 0 in base 3
					end if;
				elsif(B="01") then      --'01' case -> base:4
					if(N>"101111") then SevSeg <=  "0000110"; --all the possibilities which makes the seventh anode 3 in base 4
					elsif(N>"011111") then SevSeg <=  "0010010"; --all the possibilities which makes the seventh anode 2 in base 4
					elsif(N>"001111") then SevSeg <= "1001111";  --all the possibilities which makes the seventh anode 1 in base 4
					else SevSeg <=  "0000001"; -- 0
					end if;
				elsif(B="10") then      --'10' case -> base:5
					if(N>"110001") then SevSeg <=  "0010010"; --all the possibilities which makes the seventh anode 2 in base 5
					elsif(N>"011000") then SevSeg <= "1001111";  --all the possibilities which makes the seventh anode 1 in base 5
					else SevSeg <=  "0000001"; --all the possibilities which makes the seventh anode 0 in base 5
					end if;
				elsif(B="11") then  --'11' case -> base:6
					if(N>"100011") then SevSeg <= "1001111";  --all the possibilities which makes the seventh anode 1 in base 5
					else SevSeg <=  "0000001"; --all the possibilities which makes the seventh anode 0 in base 6
					end if;
				end if;
			elsif (Counter mod Y = 7*Y/8) then
				Digits <= "01111111";
				if (B="00") then    --'00' case -> base:3
					if(N>"110101") then SevSeg <=  "0010010"; --all the possibilities which makes the eigth anode 2 in base 3
					elsif(N>"011010") then SevSeg <= "1001111";  --all the possibilities which makes the eigth anode 1 in base 3
					else SevSeg <=  "0000001"; --all the possibilities which makes the eigth anode 0 in base 3
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

