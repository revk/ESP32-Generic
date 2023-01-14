// Generated case design for PCB/Generic5/Generic5.kicad_pcb
// By https://github.com/revk/PCBCase
// Generated 2023-01-09 08:45:52
// title:	Generic ESP32-PICO-MINI Module
// date:	${DATE}
// rev:	1
// company:	Adrian Kennard, Andrews & Arnold Ltd
//

// Globals
margin=0.500000;
overlap=2.000000;
lip=0.000000;
casebase=2.600000;
casetop=5.000000;
casewall=3.000000;
fit=0.000000;
edge=2.000000;
pcbthickness=0.800000;
nohull=false;
hullcap=1.000000;
hulledge=1.000000;
useredge=false;

module pcb(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[12.500000,31.000000],[12.500000,2.000000],[12.461571,1.609819],[12.347759,1.234633],[12.162940,0.888859],[11.914214,0.585786],[11.611141,0.337060],[11.265367,0.152241],[10.890181,0.038429],[10.500000,0.000000],[3.000000,0.000000],[2.609819,0.038429],[2.234633,0.152241],[1.888859,0.337060],[1.585786,0.585786],[1.337060,0.888859],[1.152241,1.234633],[1.038429,1.609819],[1.000000,2.000000],[1.000000,22.000000],[0.923880,22.382684],[0.707107,22.707107],[0.382684,22.923880],[0.000000,23.000000],[0.000000,31.000000]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]]);}

module outline(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[12.500000,31.000000],[12.500000,2.000000],[12.461571,1.609819],[12.347759,1.234633],[12.162940,0.888859],[11.914214,0.585786],[11.611141,0.337060],[11.265367,0.152241],[10.890181,0.038429],[10.500000,0.000000],[3.000000,0.000000],[2.609819,0.038429],[2.234633,0.152241],[1.888859,0.337060],[1.585786,0.585786],[1.337060,0.888859],[1.152241,1.234633],[1.038429,1.609819],[1.000000,2.000000],[1.000000,22.000000],[0.923880,22.382684],[0.707107,22.707107],[0.382684,22.923880],[0.000000,23.000000],[0.000000,31.000000]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]]);}
spacing=28.500000;
pcbwidth=12.500000;
pcblength=31.000000;
// Populated PCB
module board(pushed=false,hulled=false){
translate([6.850000,16.450000,0.800000])rotate([0,0,90.000000])translate([0.000000,2.700000,0.000000])rotate([90.000000,0.000000,0.000000])m0(pushed,hulled); // RevK:ESP32-PICO-MINI-02 ESP32-PICO-MINI-02
translate([6.750000,0.650000,0.800000])translate([0.000000,3.385000,0.000000])rotate([90.000000,0.000000,0.000000])m1(pushed,hulled); // RevK:USC16-TR-Round CSP-USC16-TR
translate([6.250000,24.400000,0.800000])rotate([0,0,180.000000])translate([0.000000,-3.600000,2.500000])rotate([-0.000000,0.000000,180.000000])m2(pushed,hulled); // RevK:Molex_MiniSPOX_H4RA 22057045
translate([8.000000,2.700000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])rotate([-0.000000,0.000000,90.000000])m3(pushed,hulled); // RevK:RegulatorBlockFB SOT-23-6
translate([8.000000,2.700000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])translate([-2.100000,-0.250000,0.000000])rotate([-0.000000,0.000000,90.000000])m4(pushed,hulled); // RevK:RegulatorBlockFB C_0603_1608Metric
translate([8.000000,2.700000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])translate([-0.800000,-3.550000,0.000000])rotate([-0.000000,0.000000,90.000000])m5(pushed,hulled); // RevK:RegulatorBlockFB C_0805_2012Metric
translate([8.000000,2.700000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])translate([5.400000,-3.550000,0.000000])rotate([-0.000000,0.000000,90.000000])m5(pushed,hulled); // RevK:RegulatorBlockFB C_0805_2012Metric
translate([8.000000,2.700000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])translate([3.900000,0.000000,0.000000])rotate([-0.000000,0.000000,90.000000])m6(pushed,hulled); // RevK:RegulatorBlockFB TYA4020
translate([8.000000,2.700000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])translate([2.275000,-3.200000,0.000000])m7(pushed,hulled); // RevK:RegulatorBlockFB D_1206_3216Metric
translate([1.750000,12.250000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([9.750000,12.250000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([6.000000,12.250000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([10.400000,29.500000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([3.000000,17.500000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m4(pushed,hulled); // RevK:RegulatorBlockFB C_0603_1608Metric
translate([2.600000,28.700000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m7(pushed,hulled); // RevK:RegulatorBlockFB D_1206_3216Metric
translate([10.500000,19.750000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([11.000000,12.250000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([7.599520,28.525480,0.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([2.900000,21.300000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m9(pushed,hulled); // Package_TO_SOT_SMD:SOT-323_SC-70 SOT-323_SC-70
translate([7.250000,12.250000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([1.750000,15.075000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([3.000000,12.250000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([7.599520,29.725480,0.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([7.000000,17.500000,0.000000])rotate([0,0,135.000000])rotate([180,0,0])m10(pushed,hulled); // RevK:QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm
translate([8.500000,12.250000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m8(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([5.100000,29.200000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])translate([0.000000,-0.400000,0.000000])m11(pushed,hulled); // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
translate([5.100000,29.200000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])translate([0.000000,0.400000,0.000000])m11(pushed,hulled); // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
}

module b(cx,cy,z,w,l,h){translate([cx-w/2,cy-l/2,z])cube([w,l,h]);}
module m0(pushed=false,hulled=false)
{ // RevK:ESP32-PICO-MINI-02 ESP32-PICO-MINI-02
rotate([90,0,0])
translate([-13.2/2,-16.6/2,0])
{
	if(!hulled)cube([13.2,16.6,0.8]);
	cube([13.2,11.2,2.4]);
}
}

module m1(pushed=false,hulled=false)
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

module m2(pushed=false,hulled=false)
{ // RevK:Molex_MiniSPOX_H4RA 22057045
N=4;
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

module m3(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB SOT-23-6
b(0,0,0,3.05,3.05,0.5);
b(0,0,0,1.45,3.05,1.1);
}

module m4(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB C_0603_1608Metric
b(0,0,0,1.6,0.95,0.2); // Pad size
b(0,0,0,1.6,0.8,1); // Chip
}

module m5(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB C_0805_2012Metric
b(0,0,0,2,1.45,0.2); // Pad size
b(0,0,0,2,1.2,1); // Chip
}

module m6(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB TYA4020
b(0,0,0,4,4,2.1);
}

module m7(pushed=false,hulled=false)
{ // RevK:RegulatorBlockFB D_1206_3216Metric
b(0,0,0,4.4,1.75,1.2); // Pad size
}

module m8(pushed=false,hulled=false)
{ // RevK:R_0603 R_0603_1608Metric
b(0,0,0,2.8,0.95,0.5); // Pad size
}

module m9(pushed=false,hulled=false)
{ // Package_TO_SOT_SMD:SOT-323_SC-70 SOT-323_SC-70
b(0,0,0,1.26,2.2,1.2);
b(0,0,0,2.2,2.2,0.6);
}

module m10(pushed=false,hulled=false)
{ // RevK:QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm
cube([4,4,1],center=true);
}

module m11(pushed=false,hulled=false)
{ // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
b(0,0,0,1.6,0.8,0.25);
b(0,0,0,1.2,0.8,0.55);
b(0,0,0,0.8,0.8,0.95);
if(!hulled&&pushed)b(0,0,0,1,1,20);
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
