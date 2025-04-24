`timescale 1ns/1ps
module ripple_carry_adder_tb;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    integer f;

    // Instantiate the ripple carry adder
    ripple_carry_adder uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        $display("=== Simulation started ===");

        // Waveform dump
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, ripple_carry_adder_tb);

        // Open monitor log file
        f = $fopen("monitor_log.txt", "w");
        if (!f) begin
            $display("❌ Failed to open monitor_log.txt");
            $finish;
        end
        $display("📄 monitor_log.txt opened");

        // Test vectors
        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        $display("a=%b, b=%b, cin=%b → sum=%b, cout=%b", a,b,cin,sum,cout);
        $fwrite(f, "a=%b, b=%b, cin=%b, sum=%b, cout=%b @ %0t ns\n", a,b,cin,sum,cout,$time);

        a = 4'b0110; b = 4'b0101; cin = 0; #10;
        $display("a=%b, b=%b, cin=%b → sum=%b, cout=%b", a,b,cin,sum,cout);
        $fwrite(f, "a=%b, b=%b, cin=%b, sum=%b, cout=%b @ %0t ns\n", a,b,cin,sum,cout,$time);

        a = 4'b1111; b = 4'b1111; cin = 0; #10;
        $display("a=%b, b=%b, cin=%b → sum=%b, cout=%b", a,b,cin,sum,cout);
        $fwrite(f, "a=%b, b=%b, cin=%b, sum=%b, cout=%b @ %0t ns\n", a,b,cin,sum,cout,$time);

        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        $display("a=%b, b=%b, cin=%b → sum=%b, cout=%b", a,b,cin,sum,cout);
        $fwrite(f, "a=%b, b=%b, cin=%b, sum=%b, cout=%b @ %0t ns\n", a,b,cin,sum,cout,$time);

        // Close log and finish
        $fclose(f);
        $display("✅ monitor_log.txt closed");
        $display("=== Simulation done ===");
        #100;
        $finish;
    end

endmodule
