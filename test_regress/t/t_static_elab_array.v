// DESCRIPTION: Verilator: Simple static elaboration case
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2015 by Todd Strader.

module t (/*AUTOARG*/);

    typedef integer [ 4 : 0 ] five_t;
//    typedef logic [ 4 : 0 ] [ 31 : 0 ] five_t;

    function five_t gimme_five ();
        automatic five_t result;
    
        result = '{32'd1, 32'd2, 32'd3, 32'd4, 32'd5};
    
        return result;
    endfunction

    localparam five_t FIVE = gimme_five();

    initial begin
        if (FIVE[0] != 5) begin
            $display("%%Error: Got 0b%b instead of 5", FIVE[0]);
            $stop;
        end

        $write("*-* All Finished *-*\n");
        $finish;
    end

endmodule

