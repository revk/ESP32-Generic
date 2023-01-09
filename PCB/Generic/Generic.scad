// Generated case design for PCB/Generic/Generic.kicad_pcb
// By https://github.com/revk/PCBCase
// Generated 2023-01-09 08:37:49
// title:	Generic ESP32 (suitable for battery operation)
// date:	${DATE}
// rev:	6
// comment:	www.me.uk
// comment:	@TheRealRevK
//

// Globals
margin=0.500000;
overlap=2.000000;
lip=0.000000;
casebase=2.000000;
casetop=5.000000;
casewall=3.000000;
fit=0.000000;
edge=2.000000;
pcbthickness=0.800000;
nohull=false;
hullcap=1.000000;
hulledge=1.000000;
useredge=false;

module pcb(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[18.000000,0.000000],[1.000000,0.000000],[0.741181,0.034074],[0.500000,0.133974],[0.292893,0.292893],[0.133974,0.500000],[0.034074,0.741181],[0.000000,1.000000],[0.000000,28.000000],[0.034074,28.258819],[0.133974,28.500000],[0.292893,28.707107],[0.500000,28.866026],[0.741181,28.965926],[1.000000,29.000000],[18.000000,29.000000],[18.258819,28.965926],[18.500000,28.866026],[18.707107,28.707107],[18.866026,28.500000],[18.965926,28.258819],[19.000000,28.000000],[19.000000,1.000000],[18.965926,0.741181],[18.866026,0.500000],[18.707107,0.292893],[18.500000,0.133974],[18.258819,0.034074]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]);}

module outline(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[18.000000,0.000000],[1.000000,0.000000],[0.741181,0.034074],[0.500000,0.133974],[0.292893,0.292893],[0.133974,0.500000],[0.034074,0.741181],[0.000000,1.000000],[0.000000,28.000000],[0.034074,28.258819],[0.133974,28.500000],[0.292893,28.707107],[0.500000,28.866026],[0.741181,28.965926],[1.000000,29.000000],[18.000000,29.000000],[18.258819,28.965926],[18.500000,28.866026],[18.707107,28.707107],[18.866026,28.500000],[18.965926,28.258819],[19.000000,28.000000],[19.000000,1.000000],[18.965926,0.741181],[18.866026,0.500000],[18.707107,0.292893],[18.500000,0.133974],[18.258819,0.034074]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]);}
spacing=35.000000;
pcbwidth=19.000000;
pcblength=29.000000;
// Populated PCB
module board(pushed=false,hulled=false){
translate([19.045000,16.500000,0.800000])rotate([0,0,90.000000])translate([0.000000,3.385000,0.000000])rotate([90.000000,0.000000,0.000000])m0(pushed,hulled); // RevK:USC16-TR-Round CSP-USC16-TR
translate([16.800000,1.800000,0.800000])translate([0.000000,2.540000,0.000000])m1(pushed,hulled); // RevK:DC PinHeader_1x02_P2.54mm_Vertical
translate([2.000000,25.200000,0.800000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([8.100000,20.000000,0.800000])rotate([0,0,180.000000])m3(pushed,hulled); // Diode_SMD:D_1206_3216Metric D_1206_3216Metric
translate([1.500000,21.000000,0.800000])m4(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([10.900000,19.100000,0.800000])rotate([0,0,-90.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([7.000000,9.800000,0.800000])m5(pushed,hulled); // Package_TO_SOT_SMD:SOT-363_SC-70-6 SOT-363_SC-70-6
translate([11.250000,9.800000,0.800000])m5(pushed,hulled); // Package_TO_SOT_SMD:SOT-363_SC-70-6 SOT-363_SC-70-6
translate([10.900000,13.200000,0.800000])rotate([0,0,-90.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([9.700000,13.200000,0.800000])rotate([0,0,90.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([8.500000,13.200000,0.800000])rotate([0,0,-90.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([2.000000,27.900000,0.800000])translate([0.000000,-0.400000,0.000000])m6(pushed,hulled); // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
translate([2.000000,27.900000,0.800000])translate([0.000000,0.400000,0.000000])m6(pushed,hulled); // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
translate([2.000000,26.400000,0.800000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([2.000000,24.000000,0.800000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([6.500000,18.300000,0.800000])m4(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([15.600000,10.025000,0.800000])rotate([0,0,-90.000000])m4(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([14.400000,10.025000,0.800000])rotate([0,0,-90.000000])m4(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([4.600000,20.200000,0.800000])rotate([0,0,-90.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([1.500000,22.200000,0.800000])rotate([0,0,180.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([7.200000,28.000000,0.800000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([9.900000,28.000000,0.800000])rotate([0,0,180.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([3.400000,20.200000,0.800000])rotate([0,0,90.000000])m2(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([5.500000,15.300000,0.800000])rotate([0,0,90.000000])m7(pushed,hulled); // RevK:QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm
translate([12.860000,25.850000,0.800000])rotate([-0.000000,0.000000,90.000000])m8(pushed,hulled); // RevK:RegulatorBlockFB SOT-23-6
translate([12.860000,25.850000,0.800000])translate([-2.100000,-0.250000,0.000000])rotate([-0.000000,0.000000,90.000000])m4(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([12.860000,25.850000,0.800000])translate([-0.800000,-3.550000,0.000000])rotate([-0.000000,0.000000,90.000000])m9(pushed,hulled); // RevK:RegulatorBlockFB C_0805_2012Metric
translate([12.860000,25.850000,0.800000])translate([5.400000,-3.550000,0.000000])rotate([-0.000000,0.000000,90.000000])m9(pushed,hulled); // RevK:RegulatorBlockFB C_0805_2012Metric
translate([12.860000,25.850000,0.800000])translate([3.900000,0.000000,0.000000])rotate([-0.000000,0.000000,90.000000])m10(pushed,hulled); // RevK:RegulatorBlockFB TYA4020
translate([12.860000,25.850000,0.800000])translate([2.275000,-3.200000,0.000000])m3(pushed,hulled); // Diode_SMD:D_1206_3216Metric D_1206_3216Metric
translate([9.520000,7.100000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])translate([0.000000,-3.600000,2.500000])rotate([-0.000000,0.000000,180.000000])m11(pushed,hulled); // RevK:Molex_MiniSPOX_H6RA 22057065
translate([9.500000,19.450000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])m12(pushed,hulled); // RevK:ESP32-WROOM-32 ESP32-WROOM-32
}

module b(cx,cy,z,w,l,h){translate([cx-w/2,cy-l/2,z])cube([w,l,h]);}
module m0(pushed=false,hulled=false)
{ // RevK:USC16-TR-Round CSP-USC16-TR
rotate([-90,0,0])translate([-4.47,-3.84,0])
{
	translate([1.63,0,1.63])
	rotate([-90,0,0])
	hull()
	{
		cylinder(d=3.26,h=7.75,$fn=24);
		translate([5.68,0,0])
		cylinder(d=3.26,h=7.75,$fn=24);
	}
	translate([0,6.65,0])cube([8.94,1.1,1.63]);
	translate([0,2.2,0])cube([8.94,1.6,1.63]);
	if(!hulled)
	{
		// Plug
		translate([1.63,-20,1.63])
		rotate([-90,0,0])
		hull()
		{
			cylinder(d=2.5,h=21,$fn=24);
			translate([5.68,0,0])
			cylinder(d=2.5,h=21,$fn=24);
		}
		translate([1.63,-22.5,1.63])
		rotate([-90,0,0])
		hull()
		{
			cylinder(d=7,h=21,$fn=24);
			translate([5.68,0,0])
			cylinder(d=7,h=21,$fn=24);
		}
	}
}

}

module m1(pushed=false,hulled=false)
{ // RevK:DC PinHeader_1x02_P2.54mm_Vertical
translate([-1.27,-3.81,-3])cube([2.54,5.08,hulled?12.7:100]);

}

module m2(pushed=false,hulled=false)
{ // RevK:R_0603 R_0603_1608Metric
b(0,0,0,2.8,0.95,0.5); // Pad size
}

module m3(pushed=false,hulled=false)
{ // Diode_SMD:D_1206_3216Metric D_1206_3216Metric
b(0,0,0,4.4,1.75,1.2); // Pad size
}

module m4(pushed=false,hulled=false)
{ // RevK:C_0603 C_0603_1608Metric
b(0,0,0,1.6,0.95,0.2); // Pad size
b(0,0,0,1.6,0.8,1); // Chip
}

module m5(pushed=false,hulled=false)
{ // Package_TO_SOT_SMD:SOT-363_SC-70-6 SOT-363_SC-70-6
b(0,0,0,1.15,2.0,1.1);
b(0,0,0,2.1,2.0,0.6);
}

module m6(pushed=false,hulled=false)
{ // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
b(0,0,0,1.6,0.8,0.25);
b(0,0,0,1.2,0.8,0.55);
b(0,0,0,0.8,0.8,0.95);
if(!hulled&&pushed)b(0,0,0,1,1,20);
}

module m7(pushed=false,hulled=false)
{ // RevK:QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm
cube([4,4,1],center=true);
}

module m8(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB SOT-23-6
b(0,0,0,3.05,3.05,0.5);
b(0,0,0,1.45,3.05,1.1);
}

module m9(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB C_0805_2012Metric
b(0,0,0,2,1.45,0.2); // Pad size
b(0,0,0,2,1.2,1); // Chip
}

module m10(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB TYA4020
b(0,0,0,4,4,2.1);
}

module m11(pushed=false,hulled=false)
{ // RevK:Molex_MiniSPOX_H6RA 22057065
N=6;
A=2.4+N*2.5;
rotate([0,0,180])
translate([-A/2,-2.94,-2.5])
{
	cube([A,4.9,4.9]);
	cube([A,5.9,3.9]);
	hull()
	{
		cube([A,7.4,1]);
		cube([A,7.9,0.5]);
	}
	translate([1,6,-2])cube([A-2,1.2,4.5]); // Assumes cropped pins
	// Plug
	translate([0.5,-20,0.6])cube([A-1,21,4.1]);
	translate([0,-23,0])cube([A,20,4.9]);
}

}

module m12(pushed=false,hulled=false)
{ // RevK:ESP32-WROOM-32 ESP32-WROOM-32
translate([-9,-9.75,0])
{
	cube([18,25.50,0.80]);
	translate([1.1,1.05,0])cube([15.80,17.60,3.10]);
	if(!hulled)translate([-0.5,0.865,0])cube([19,17.4,0.8]);
	translate([2.65,-0.5,0])cube([12.7,2,0.8]);

}
}

height=casebase+pcbthickness+casetop;
$fn=48;

module boardh(pushed=false)
{ // Board with hulled parts
	union()
	{
		if(!nohull)intersection()
		{
			translate([0,0,hullcap-casebase])outline(casebase+pcbthickness+casetop-hullcap*2,-hulledge);
			hull()board(pushed,true);
		}
		board(pushed,false);
		pcb();
	}
}

module boardf()
{ // This is the board, but stretched up to make a push out in from the front
	render()
	{
		intersection()
		{
			translate([-casewall-1,-casewall-1,-casebase-1]) cube([pcbwidth+casewall*2+2,pcblength+casewall*2+2,height+2]);
			union()
			{
				minkowski()
				{
					boardh(true);
					cylinder(h=height+100,d=margin,$fn=8);
				}
				board(false,false);
			}
		}
	}
}

module boardb()
{ // This is the board, but stretched down to make a push out in from the back
	render()
	{
		intersection()
		{
			translate([-casewall-1,-casewall-1,-casebase-1]) cube([pcbwidth+casewall*2+2,pcblength+casewall*2+2,height+2]);
			union()
			{
				minkowski()
				{
					boardh(true);
					translate([0,0,-height-100])
					cylinder(h=height+100,d=margin,$fn=8);
				}
				board(false,false);
			}
		}
	}
}

module boardm()
{
	render()
	{
 		minkowski()
 		{
			translate([0,0,-margin/2])cylinder(d=margin,h=margin,$fn=8);
 			boardh(false);
		}
		//intersection()
    		//{
        		//translate([0,0,-(casebase-hullcap)])pcb(pcbthickness+(casebase-hullcap)+(casetop-hullcap));
        		//translate([0,0,-(casebase-hullcap)])outline(pcbthickness+(casebase-hullcap)+(casetop-hullcap));
			boardh(false);
    		//}
 	}
}

module pcbh(h=pcbthickness,r=0)
{ // PCB shape for case
	if(useredge)outline(h,r);
	else hull()outline(h,r);
}

module pyramid()
{ // A pyramid
 polyhedron(points=[[0,0,0],[-height,-height,height],[-height,height,height],[height,height,height],[height,-height,height]],faces=[[0,1,2],[0,2,3],[0,3,4],[0,4,1],[4,3,2,1]]);
}

module wall(d=0)
{ // The case wall
    	translate([0,0,-casebase-d])pcbh(height+d*2,margin/2+d);
}

module cutf()
{ // This cut up from base in the wall
	intersection()
	{
		boardf();
		difference()
		{
			translate([-casewall+0.01,-casewall+0.01,-casebase+0.01])cube([pcbwidth+casewall*2-0.02,pcblength+casewall*2-0.02,casebase+overlap+lip]);
			wall();
			boardb();
		}
	}
}

module cutb()
{ // The cut down from top in the wall
	intersection()
	{
		boardb();
		difference()
		{
			translate([-casewall+0.01,-casewall+0.01,0.01])cube([pcbwidth+casewall*2-0.02,pcblength+casewall*2-0.02,casetop+pcbthickness]);
			wall();
			boardf();
		}
	}
}

module cutpf()
{ // the push up but pyramid
	render()
	intersection()
	{
		minkowski()
		{
			pyramid();
			cutf();
		}
		difference()
		{
			translate([-casewall-0.01,-casewall-0.01,-casebase-0.01])cube([pcbwidth+casewall*2+0.02,pcblength+casewall*2+0.02,casebase+overlap+lip+0.02]);
			wall();
			boardh(true);
		}
		translate([-casewall,-casewall,-casebase])case();
	}
}

module cutpb()
{ // the push down but pyramid
	render()
	intersection()
	{
		minkowski()
		{
			scale([1,1,-1])pyramid();
			cutb();
		}
		difference()
		{
			translate([-casewall-0.01,-casewall-0.01,-0.01])cube([pcbwidth+casewall*2+0.02,pcblength+casewall*2+0.02,casetop+pcbthickness+0.02]);
			wall();
			boardh(true);
		}
		translate([-casewall,-casewall,-casebase])case();
	}
}

module case()
{ // The basic case
	hull()
	{
		translate([casewall,casewall,0])pcbh(height,casewall-edge);
		translate([casewall,casewall,edge])pcbh(height-edge*2,casewall);
	}
}

module cut(d=0)
{ // The cut point in the wall
	translate([casewall,casewall,casebase+lip])pcbh(casetop+pcbthickness-lip+1,casewall/2+d/2+margin/4);
}

module base()
{ // The base
	difference()
	{
		case();
		difference()
		{
			union()
			{
				translate([-1,-1,casebase+overlap+lip])cube([pcbwidth+casewall*2+2,pcblength+casewall*2+2,casetop+1]);
				cut(fit);
			}
		}
		translate([casewall,casewall,casebase])boardf();
		translate([casewall,casewall,casebase])boardm();
		translate([casewall,casewall,casebase])cutpf();
	}
	translate([casewall,casewall,casebase])cutpb();
}

module top()
{
	translate([0,pcblength+casewall*2,height])rotate([180,0,0])
	{
		difference()
		{
			case();
			difference()
			{
				translate([-1,-1,-1])cube([pcbwidth+casewall*2+2,pcblength+casewall*2+2,casebase+overlap+lip-margin+1]);
				cut(-fit);
			}
			translate([casewall,casewall,casebase])boardb();
			translate([casewall,casewall,casebase])boardm();
			translate([casewall,casewall,casebase])cutpb();
		}
		translate([casewall,casewall,casebase])cutpf();
	}
}

module test()
{
	translate([0*spacing,0,0])base();
	translate([1*spacing,0,0])top();
	translate([2*spacing,0,0])pcb();
	translate([3*spacing,0,0])outline();
	translate([4*spacing,0,0])wall();
	translate([5*spacing,0,0])board();
	translate([6*spacing,0,0])board(false,true);
	translate([7*spacing,0,0])board(true);
	translate([8*spacing,0,0])boardh();
	translate([9*spacing,0,0])boardf();
	translate([10*spacing,0,0])boardb();
	translate([11*spacing,0,0])cutpf();
	translate([12*spacing,0,0])cutpb();
	translate([13*spacing,0,0])cutf();
	translate([14*spacing,0,0])cutb();
	translate([15*spacing,0,0])case();
}

module parts()
{
	base();
	translate([spacing,0,0])top();
}
base(); translate([spacing,0,0])top();
