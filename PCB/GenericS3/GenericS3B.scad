// Generated case design for GenericS3/GenericS3.kicad_pcb
// By https://github.com/revk/PCBCase
// Generated 2025-08-25 11:43:00
// title:	GenericS3
// rev:	1
// comment:	www.me.uk
// comment:	@TheRealRevK
//

// Globals
margin=0.250000;
lip=3.000000;
lipa=0;
lipt=2;
casebottom=2.000000;
casetop=6.000000;
casewall=3.000000;
fit=0.000000;
snap=0.150000;
edge=2.000000;
pcbthickness=1.000000;
nohull=false;
hullcap=1.000000;
hulledge=1.000000;
useredge=false;
spacing=47.800000;
pcbwidth=31.800000;
pcblength=30.000000;
originx=108.160000;
originy=100.000000;

module outline(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[15.900000,15.000000],[-15.900000,15.000000],[-15.900000,-15.000000],[15.900000,-15.000000]],paths=[[0,1,2,3]]);}

module pcb(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[15.900000,15.000000],[-15.900000,15.000000],[-15.900000,-15.000000],[15.900000,-15.000000]],paths=[[0,1,2,3]]);}
module part_J1(part=true,hole=false,block=false)
{
translate([10.840000,9.000000,1.000000])rotate([0,0,180.000000])translate([0.000000,-1.900000,0.000000])rotate([90.000000,0.000000,0.000000])m0(part,hole,block,casetop); // RevK:USB-C-Socket-H CSP-USC16-TR (back)
};
module part_C17(part=true,hole=false,block=false)
{
translate([6.590000,-4.000000,1.000000])rotate([0,0,90.000000])m1(part,hole,block,casetop); // RevK:C_0805 C_0805_2012Metric (back)
};
module part_R6(part=true,hole=false,block=false)
{
translate([7.440000,3.550000,1.000000])m2(part,hole,block,casetop); // RevK:R_0201 R_0201_0603Metric (back)
};
module part_C3(part=true,hole=false,block=false)
{
translate([-14.760000,8.400000,1.000000])rotate([0,0,180.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_C5(part=true,hole=false,block=false)
{
translate([9.040000,0.300000,1.000000])rotate([0,0,180.000000])m1(part,hole,block,casetop); // RevK:C_0805 C_0805_2012Metric (back)
};
module part_C11(part=true,hole=false,block=false)
{
translate([12.940000,5.800000,1.000000])rotate([0,0,-90.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_C10(part=true,hole=false,block=false)
{
translate([12.340000,5.800000,1.000000])rotate([0,0,-90.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_R2(part=true,hole=false,block=false)
{
translate([5.440000,14.300000,1.000000])rotate([0,0,180.000000])m2(part,hole,block,casetop); // RevK:R_0201 R_0201_0603Metric (back)
};
module part_C4(part=true,hole=false,block=false)
{
translate([6.590000,-0.750000,1.000000])rotate([0,0,-90.000000])m1(part,hole,block,casetop); // RevK:C_0805 C_0805_2012Metric (back)
};
module part_C2(part=true,hole=false,block=false)
{
translate([6.590000,-11.750000,1.000000])rotate([0,0,-90.000000])m1(part,hole,block,casetop); // RevK:C_0805 C_0805_2012Metric (back)
};
module part_R8(part=true,hole=false,block=false)
{
translate([8.340000,2.650000,1.000000])rotate([0,0,-90.000000])m2(part,hole,block,casetop); // RevK:R_0201 R_0201_0603Metric (back)
};
module part_C1(part=true,hole=false,block=false)
{
translate([-14.960000,-8.200000,1.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_U3(part=true,hole=false,block=false)
{
translate([9.240000,4.100000,1.000000])rotate([0,0,180.000000])m4(part,hole,block,casetop); // U3 (back)
};
module part_D6(part=true,hole=false,block=false)
{
translate([-14.760000,-13.800000,1.000000])rotate([0,0,90.000000])m5(part,hole,block,casetop); // D6 (back)
};
module part_PCB1(part=true,hole=false,block=false)
{
};
module part_C8(part=true,hole=false,block=false)
{
translate([15.140000,-0.900000,1.000000])rotate([0,0,90.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_C16(part=true,hole=false,block=false)
{
translate([10.140000,2.000000,1.000000])rotate([0,0,-90.000000])m6(part,hole,block,casetop); // RevK:C_0402 C_0402_1005Metric (back)
};
module part_D2(part=true,hole=false,block=false)
{
translate([6.589000,-7.900000,1.000000])rotate([0,0,-90.000000])m7(part,hole,block,casetop); // RevK:D_SOD-123FL D_SOD-123 (back)
};
module part_C19(part=true,hole=false,block=false)
{
translate([7.740000,2.650000,1.000000])rotate([0,0,-90.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_R1(part=true,hole=false,block=false)
{
translate([-15.260000,9.860000,1.000000])rotate([0,0,-90.000000])m2(part,hole,block,casetop); // RevK:R_0201 R_0201_0603Metric (back)
};
module part_J4(part=true,hole=false,block=false)
{
translate([11.640000,-7.100000,1.000000])rotate([0,0,90.000000])m8(part,hole,block,casetop,452); // J4 (back)
};
module part_R5(part=true,hole=false,block=false)
{
translate([7.440000,4.100000,1.000000])m2(part,hole,block,casetop); // RevK:R_0201 R_0201_0603Metric (back)
};
module part_C18(part=true,hole=false,block=false)
{
translate([7.440000,4.650000,1.000000])rotate([0,0,180.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_L1(part=true,hole=false,block=false)
{
translate([13.040000,2.300000,1.000000])rotate([0,0,-90.000000])m9(part,hole,block,casetop); // L1 (back)
};
module part_U2(part=true,hole=false,block=false)
{
translate([-8.160000,0.000000,1.000000])rotate([0,0,90.000000])m10(part,hole,block,casetop); // U2 (back)
};
module part_R3(part=true,hole=false,block=false)
{
translate([4.365000,14.300000,1.000000])m2(part,hole,block,casetop); // RevK:R_0201 R_0201_0603Metric (back)
};
module part_C7(part=true,hole=false,block=false)
{
translate([5.940000,10.900000,1.000000])rotate([0,0,90.000000])m3(part,hole,block,casetop); // RevK:C_0201 C_0201_0603Metric (back)
};
module part_D1(part=true,hole=false,block=false)
{
translate([8.340000,5.900000,1.000000])m7(part,hole,block,casetop); // RevK:D_SOD-123FL D_SOD-123 (back)
};
// Parts to go on PCB (top)
module parts_top(part=false,hole=false,block=false){
part_J1(part,hole,block);
part_C17(part,hole,block);
part_R6(part,hole,block);
part_C3(part,hole,block);
part_C5(part,hole,block);
part_C11(part,hole,block);
part_C10(part,hole,block);
part_R2(part,hole,block);
part_C4(part,hole,block);
part_C2(part,hole,block);
part_R8(part,hole,block);
part_C1(part,hole,block);
part_U3(part,hole,block);
part_D6(part,hole,block);
part_PCB1(part,hole,block);
part_C8(part,hole,block);
part_C16(part,hole,block);
part_D2(part,hole,block);
part_C19(part,hole,block);
part_R1(part,hole,block);
part_J4(part,hole,block);
part_R5(part,hole,block);
part_C18(part,hole,block);
part_L1(part,hole,block);
part_U2(part,hole,block);
part_R3(part,hole,block);
part_C7(part,hole,block);
part_D1(part,hole,block);
}

parts_top=5;
module part_J3(part=true,hole=false,block=false)
{
translate([-13.240000,12.700000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m11(part,hole,block,casebottom,08); // J3
};
module part_V2(part=true,hole=false,block=false)
{
};
module part_J5(part=true,hole=false,block=false)
{
translate([2.000000,-7.620000,0.000000])rotate([180,0,0])m11(part,hole,block,casebottom,07); // J3
};
module part_V1(part=true,hole=false,block=false)
{
};
module part_J2(part=true,hole=false,block=false)
{
translate([-13.240000,-10.160000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m11(part,hole,block,casebottom,08); // J3
};
// Parts to go on PCB (bottom)
module parts_bottom(part=false,hole=false,block=false){
part_J3(part,hole,block);
part_V2(part,hole,block);
part_J5(part,hole,block);
part_V1(part,hole,block);
part_J2(part,hole,block);
}

parts_bottom=3;
module b(cx,cy,z,w,l,h){translate([cx-w/2,cy-l/2,z])cube([w,l,h]);}
module m0(part=false,hole=false,block=false,height)
{ // RevK:USB-C-Socket-H CSP-USC16-TR
// USB connector
rotate([-90,0,0])translate([-4.47,-3.84,0])
{
	if(part)
	{
		b(4.47,7,0,7,2,0.2);	// Pads
		translate([1.63,-0.2,1.63])
		rotate([-90,0,0])
		hull()
		{
			cylinder(d=3.26,h=7.55,$fn=24);
			translate([5.68,0,0])
			cylinder(d=3.26,h=7.55,$fn=24);
		}
		translate([0,6.2501,0])cube([8.94,1.1,1.6301]);
		translate([0,1.7,0])cube([8.94,1.6,1.6301]);
	}
	if(hole)
		translate([1.63,-20,1.63])
		rotate([-90,0,0])
	{
		// Plug
		hull()
		{
			cylinder(d=2.5,h=21,$fn=24);
			translate([5.68,0,0])
			cylinder(d=2.5,h=21,$fn=24);
		}
		hull()
		{
			cylinder(d=7,h=21,$fn=24);
			translate([5.68,0,0])
			cylinder(d=7,h=21,$fn=24);
		}
		translate([2.84,0,-100])
			cylinder(d=5,h=100,$fn=24);
	}
}
}

module m1(part=false,hole=false,block=false,height)
{ // RevK:C_0805 C_0805_2012Metric
// 0805 Capacitor
if(part)
{
	b(0,0,0,2,1.2,1); // Chip
	b(0,0,0,2,1.45,0.2); // Pad size
}
}

module m2(part=false,hole=false,block=false,height)
{ // RevK:R_0201 R_0201_0603Metric
// 0402 Resistor
if(part)
{
	b(0,0,0,1.1,0.4,0.2); // Pad size
	b(0,0,0,0.6,0.3,0.3); // Chip
}
}

module m3(part=false,hole=false,block=false,height)
{ // RevK:C_0201 C_0201_0603Metric
// 0402 Capacitor
if(part)
{
        b(0,0,0,1.1,0.4,0.2); // Pad size
        b(0,0,0,0.6,0.3,0.3); // Chip
}
}

module m4(part=false,hole=false,block=false,height)
{ // U3
// SOT-563
if(part)
{
	b(0,0,0,1.3,1.7,1); // Part
	b(0,0,0,1.35,2.1,0.2); // Pads
}
}

module m5(part=false,hole=false,block=false,height)
{ // D6
// 1x1mm LED
if(part)
{
        b(0,0,0,1.2,1.2,.8);
}
if(hole)
{
	hull()
	{
                b(0,0,.8,1.2,1.2,1);
        	rotate([-60,0,0]) translate([0,0,5]) b(0,0,0,5,5,1);
	}
}
}

module m6(part=false,hole=false,block=false,height)
{ // RevK:C_0402 C_0402_1005Metric
// 0402 Capacitor
if(part)
{
	b(0,0,0,1.0,0.5,1); // Chip
	b(0,0,0,1.5,0.65,0.2); // Pad size
}
}

module m7(part=false,hole=false,block=false,height)
{ // RevK:D_SOD-123FL D_SOD-123
// SOD-123 Diode
if(part)
{
	b(0,0,0,2.85,1.8,1.35); // part
	b(0,0,0,4.2,1.2,0.7); // pads
}
}

module m8(part=false,hole=false,block=false,height,N=0)
{ // J4
// WAGO-2060-45x-998-404
n=N%10; // 45x
if(part)
{
	translate([-0.9,0,0])hull()
	{
		b(0,0,0,12.7,n*4-0.1,1);
		translate([0.8,0,0])b(0,0,0,11.1,n*4-0.1,4.5);
	}
	for(p=[0:n-1])hull()
    {
        translate([-6,-4*(n-1)/2+p*4,2])sphere(d=3,$fn=12);
        translate([-11.510,0,2])sphere(d=4,$fn=12);
    }
}
if(hole)
{
    hull()
    {
        translate([-11.510,0,2])sphere(d=4,$fn=12);
        translate([-11.510,0,-height])sphere(d=4,$fn=12);
    }
    hull()
    {
        translate([-11.510,0,2])sphere(d=4,$fn=12);
        translate([-50,0,2])sphere(d=4,$fn=12);
    }
}
}

module m9(part=false,hole=false,block=false,height)
{ // L1
// 5x5x4 Inductor
if(part)
{
	b(0,0,0,5,5,4.3);
}
}

module m10(part=false,hole=false,block=false,height)
{ // U2
// ESP32-S3-MINI-1
translate([-15.4/2,-15.45/2,0])
{
	if(part)
	{
		cube([15.4,20.5,0.8]);
		translate([0.7,0.5,0])cube([14,13.55,2.4]);
		cube([15.4,20.5,0.8]);
	}
}
}

module m11(part=false,hole=false,block=false,height,N=0)
{ // J3
translate([1.27,-(N-1)*2.54/2,0])
{
if(part)
{
	//b(0,0,0,5.08,N*2.54,4);
}
if(hole)
{
	b(0,0,0,5.08-0.01,N*2.54-0.01,height+1);
}
}
}

// Generate PCB casework

height=casebottom+pcbthickness+casetop;
$fn=48;

module pyramid()
{ // A pyramid
 polyhedron(points=[[0,0,0],[-height,-height,height],[-height,height,height],[height,height,height],[height,-height,height]],faces=[[0,1,2],[0,2,3],[0,3,4],[0,4,1],[4,3,2,1]]);
}


module pcb_hulled(h=pcbthickness,r=0)
{ // PCB shape for case
	if(useredge)outline(h,r);
	else hull()outline(h,r);
}

module solid_case(d=0)
{ // The case wall
	hull()
        {
                translate([0,0,-casebottom])pcb_hulled(height,casewall-edge);
                translate([0,0,edge-casebottom])pcb_hulled(height-edge*2,casewall);
        }
}

module preview()
{
	pcb();
	color("#0f0")parts_top(part=true);
	color("#0f0")parts_bottom(part=true);
	color("#f00")parts_top(hole=true);
	color("#f00")parts_bottom(hole=true);
	color("#00f8")parts_top(block=true);
	color("#00f8")parts_bottom(block=true);
}

module top_half(fit=0)
{
	difference()
	{
		translate([-casebottom-100,-casewall-100,pcbthickness+0.01]) cube([pcbwidth+casewall*2+200,pcblength+casewall*2+200,height]);
		translate([0,0,pcbthickness])
        	{
			snape=lip/5;
			snaph=(lip-snape*2)/3;
			if(lipt==1)rotate(lipa)hull()
			{
				translate([0,-pcblength,lip/2])cube([0.001,pcblength*2,0.001]);
				translate([-lip/2,-pcblength,0])cube([lip,pcblength*2,0.001]);
			} else if(lipt==2)for(a=[0,90,180,270])rotate(a+lipa)hull()
			{
				translate([0,-pcblength-pcbwidth,lip/2])cube([0.001,pcblength*2+pcbwidth*2,0.001]);
				translate([-lip/2,-pcblength-pcbwidth,0])cube([lip,pcblength*2+pcbwidth*2,0.001]);
			}
            		difference()
            		{
                		pcb_hulled(lip,casewall);
				if(snap)
                        	{
					hull()
					{
						pcb_hulled(0.1,casewall/2-snap/2+fit);
						translate([0,0,snape])pcb_hulled(snaph,casewall/2+snap/2+fit);
						translate([0,0,lip-snape-snaph])pcb_hulled(0.1,casewall/2-snap/2+fit);
					}
					translate([0,0,lip-snape-snaph])pcb_hulled(snaph,casewall/2-snap/2+fit);
					hull()
					{
						translate([0,0,lip-snape])pcb_hulled(0.1,casewall/2-snap/2+fit);
						translate([0,0,lip])pcb_hulled(0.1,casewall/2+snap/2+fit);
					}
                        	}
				else pcb_hulled(lip,casewall/2+fit);
				if(lipt==0)translate([-pcbwidth,-pcblength,0])cube([pcbwidth*2,pcblength*2,lip]);
				else if(lipt==1) rotate(lipa)translate([0,-pcblength,0])hull()
				{
					translate([lip/2,0,0])cube([pcbwidth,pcblength*2,lip]);
					translate([-lip/2,0,lip])cube([pcbwidth,pcblength*2,lip]);
				}
				else if(lipt==2)for(a=[0,180])rotate(a+lipa)hull()
                		{
                            		translate([lip/2,lip/2,0])cube([pcbwidth+pcblength,pcbwidth+pcblength,lip]);
                            		translate([-lip/2,-lip/2,lip])cube([pcbwidth+pcblength,pcbwidth+pcblength,lip]);
                		}
            		}
            		difference()
            		{
				if(snap)
                        	{
					hull()
					{
						translate([0,0,-0.1])pcb_hulled(0.1,casewall/2+snap/2-fit);
						translate([0,0,snape-0.1])pcb_hulled(0.1,casewall/2-snap/2-fit);
					}
					translate([0,0,snape])pcb_hulled(snaph,casewall/2-snap/2-fit);
					hull()
					{
						translate([0,0,snape+snaph])pcb_hulled(0.1,casewall/2-snap/2-fit);
						translate([0,0,lip-snape-snaph])pcb_hulled(snaph,casewall/2+snap/2-fit);
						translate([0,0,lip-0.1])pcb_hulled(0.1,casewall/2-snap/2-fit);
					}
                        	}
				else pcb_hulled(lip,casewall/2-fit);
				if(lipt==1)rotate(lipa+180)translate([0,-pcblength,0])hull()
				{
					translate([lip/2,0,0])cube([pcbwidth,pcblength*2,lip+0.1]);
					translate([-lip/2,0,lip])cube([pcbwidth,pcblength*2,lip+0.1]);
				}
				else if(lipt==2)for(a=[90,270])rotate(a+lipa)hull()
                		{
                            		translate([lip/2,lip/2,0])cube([pcbwidth+pcblength,pcbwidth+pcblength,lip]);
                            		translate([-lip/2,-lip/2,lip])cube([pcbwidth+pcblength,pcbwidth+pcblength,lip]);
                		}
			}
            	}
		minkowski()
                {
                	union()
                	{
                		parts_top(part=true);
                		parts_bottom(part=true);
                	}
                	translate([-0.01,-0.01,-height])cube([0.02,0.02,height]);
                }
        }
	minkowski()
        {
        	union()
                {
                	parts_top(part=true);
                	parts_bottom(part=true);
                }
                translate([-0.01,-0.01,0])cube([0.02,0.02,height]);
        }
}

module case_wall()
{
	difference()
	{
		solid_case();
		translate([0,0,-height])pcb_hulled(height*2);
	}
}

module top_side_hole()
{
	difference()
	{
		intersection()
		{
			parts_top(hole=true);
			case_wall();
		}
		translate([0,0,-casebottom])pcb_hulled(height,casewall-edge);
	}
}

module bottom_side_hole()
{
	difference()
	{
		intersection()
		{
			parts_bottom(hole=true);
			case_wall();
		}
		translate([0,0,edge-casebottom])pcb_hulled(height-edge*2,casewall);
	}
}

module parts_space()
{
	minkowski()
	{
		union()
		{
			parts_top(part=true,hole=true);
			parts_bottom(part=true,hole=true);
		}
		sphere(r=margin,$fn=6);
	}
}

module top_cut(fit=0)
{
	difference()
	{
		top_half(fit);
		if(parts_top)difference()
		{
			minkowski()
			{ // Penetrating side holes
				top_side_hole();
				rotate([180,0,0])
				pyramid();
			}
			minkowski()
			{
				top_side_hole();
				rotate([0,0,45])cylinder(r=margin,h=height,$fn=4);
			}
		}
	}
	if(parts_bottom)difference()
	{
		minkowski()
		{ // Penetrating side holes
			bottom_side_hole();
			pyramid();
		}
			minkowski()
			{
				bottom_side_hole();
				rotate([0,0,45])translate([0,0,-height])cylinder(r=margin,h=height,$fn=4);
			}
	}
}

module bottom_cut()
{
	difference()
	{
		 translate([-casebottom-50,-casewall-50,-height]) cube([pcbwidth+casewall*2+100,pcblength+casewall*2+100,height*2]);
		 top_cut(-fit);
	}
}

module top_body()
{
	difference()
	{
		intersection()
		{
			solid_case();
			pcb_hulled(height);
		}
		if(parts_top)minkowski()
		{
			if(nohull)parts_top(part=true);
			else hull(){parts_top(part=true);pcb_hulled();}
			translate([0,0,margin-height])cylinder(r=margin*2,h=height,$fn=8);
		}
	}
	intersection()
	{
		solid_case();
		parts_top(block=true);
	}
}

module top_edge()
{
	intersection()
	{
		case_wall();
		top_cut();
	}
}

module top_pos()
{ // Position for plotting bottom
	translate([0,0,pcbthickness+casetop])rotate([180,0,0])children();
}

module pcb_pos()
{	// Position PCB relative to base 
		translate([0,0,pcbthickness-height])children();
}

module top()
{
	top_pos()difference()
	{
		union()
		{
			top_body();
			top_edge();
		}
		parts_space();
		pcb_pos()pcb(height,r=margin);
	}
}

module bottom_body()
{ // Position for plotting top
	difference()
	{
		intersection()
		{
			solid_case();
			translate([0,0,-height])pcb_hulled(height+pcbthickness);
		}
		if(parts_bottom)minkowski()
		{
			if(nohull)parts_bottom(part=true);
			else hull()parts_bottom(part=true);
			translate([0,0,-margin])cylinder(r=margin*2,h=height,$fn=8);
		}
	}
	intersection()
	{
		solid_case();
		parts_bottom(block=true);
	}
}

module bottom_edge()
{
	intersection()
	{
		case_wall();
		bottom_cut();
	}
}

module bottom_pos()
{
	translate([0,0,casebottom])children();
}

module bottom()
{
	bottom_pos()difference()
	{
		union()
		{
        		bottom_body();
        		bottom_edge();
		}
		parts_space();
		pcb(height,r=margin);
	}
}
difference(){bottom();translate([11.400000,0.000000,-0.001])rotate(90)scale([-1,1])linear_extrude(0.500000)text("2025-08-25",size=3.000000,halign="center",valign="center",font="OCRB");}