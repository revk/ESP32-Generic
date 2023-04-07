// Generated case design for PCB/LED/LED.kicad_pcb
// By https://github.com/revk/PCBCase
// Generated 2023-04-07 10:16:25
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

module outline(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[11.500000,27.700000],[11.500000,2.000000],[11.461571,1.609819],[11.347759,1.234633],[11.162940,0.888859],[10.914214,0.585786],[10.611141,0.337060],[10.265367,0.152241],[9.890181,0.038429],[9.500000,0.000000],[2.000000,0.000000],[1.609819,0.038429],[1.234633,0.152241],[0.888859,0.337060],[0.585786,0.585786],[0.337060,0.888859],[0.152241,1.234633],[0.038429,1.609819],[0.000000,2.000000],[0.000000,27.700000],[0.034074,27.958819],[0.133974,28.200000],[0.292893,28.407107],[0.500000,28.566026],[0.741181,28.665926],[1.000000,28.700000],[10.500000,28.700000],[10.758819,28.665926],[11.000000,28.566026],[11.207107,28.407107],[11.366026,28.200000],[11.465926,27.958819]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]]);}

module pcb(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[11.500000,27.700000],[11.500000,2.000000],[11.461571,1.609819],[11.347759,1.234633],[11.162940,0.888859],[10.914214,0.585786],[10.611141,0.337060],[10.265367,0.152241],[9.890181,0.038429],[9.500000,0.000000],[2.000000,0.000000],[1.609819,0.038429],[1.234633,0.152241],[0.888859,0.337060],[0.585786,0.585786],[0.337060,0.888859],[0.152241,1.234633],[0.038429,1.609819],[0.000000,2.000000],[0.000000,27.700000],[0.034074,27.958819],[0.133974,28.200000],[0.292893,28.407107],[0.500000,28.566026],[0.741181,28.665926],[1.000000,28.700000],[10.500000,28.700000],[10.758819,28.665926],[11.000000,28.566026],[11.207107,28.407107],[11.366026,28.200000],[11.465926,27.958819]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]]);}
spacing=27.500000;
pcbwidth=11.500000;
pcblength=28.700000;
// Populated PCB
module board(pushed=false,hulled=false){
translate([5.750000,13.800000,0.800000])rotate([0,0,90.000000])m0(pushed,hulled); // RevK:ESP32-PICO-MINI-02 ESP32-PICO-MINI-02 (back)
translate([7.750000,26.000000,0.800000])rotate([0,0,180.000000])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric (back)
translate([4.450000,24.200000,0.800000])rotate([0,0,-90.000000])m5(pushed,hulled); // RevK:SOT-323_SC-70 SOT-323_SC-70 (back)
translate([9.645000,24.700000,0.800000])rotate([0,0,-90.000000])translate([0.000000,-0.100000,0.400000])rotate([-90.000000,-0.000000,-0.000000])m7(pushed,hulled); // RevK:MHS190RGBCT LED_0603_1608Metric (back)
translate([7.750000,23.600000,0.800000])rotate([0,0,180.000000])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric (back)
translate([1.850000,24.200000,0.800000])rotate([0,0,90.000000])m5(pushed,hulled); // RevK:SOT-323_SC-70 SOT-323_SC-70 (back)
translate([7.750000,24.800000,0.800000])rotate([0,0,180.000000])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric (back)
translate([6.850000,12.100000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])rotate([-0.000000,-0.000000,-90.000000])m10(pushed,hulled); // RevK:SOT-23-Thin-6-Reg SOT-23-6
translate([10.150000,8.900000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([3.300000,11.250000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])m13(pushed,hulled); // RevK:C_0805_ C_0805_2012Metric
translate([6.600000,10.000000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])m15(pushed,hulled); // RevK:C_0603_ C_0603_1608Metric
translate([3.300000,17.500000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])m13(pushed,hulled); // RevK:C_0805_ C_0805_2012Metric
translate([10.150000,14.300000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([10.150000,11.600000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([5.750000,4.350000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])translate([0.000000,-1.050000,0.000000])rotate([90.000000,-0.000000,-0.000000])m17(pushed,hulled); // RevK:USC16-TR CSP-USC16-TR
translate([8.150000,8.100000,0.000000])rotate([180,0,0])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([6.850000,16.000000,0.000000])rotate([0,0,-90.000000])rotate([180,0,0])rotate([-0.000000,-0.000000,-90.000000])m19(pushed,hulled); // RevK:L_4x4_ TYA4020
translate([5.750000,21.400000,0.000000])rotate([180,0,0])m21(pushed,hulled,3); // RevK:PTSM-HH-3-RA PTSM-HH-3-RA
translate([3.350000,8.100000,0.000000])rotate([180,0,0])m3(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([3.680000,14.380000,0.000000])rotate([0,0,90.000000])rotate([180,0,0])m24(pushed,hulled); // RevK:D_1206_ D_1206_3216Metric
}

module b(cx,cy,z,w,l,h){translate([cx-w/2,cy-l/2,z])cube([w,l,h]);}
module m0(pushed=false,hulled=false)
{ // RevK:ESP32-PICO-MINI-02 ESP32-PICO-MINI-02
translate([-13.2/2,-16.6/2+2.7,0])
{
	if(!hulled)cube([13.2,16.6,0.8]);
	cube([13.2,11.2,2.4]);
}
}

module m3(pushed=false,hulled=false)
{ // RevK:R_0603 R_0603_1608Metric
b(0,0,0,2.8,0.95,0.5); // Pad size
}

module m5(pushed=false,hulled=false)
{ // RevK:SOT-323_SC-70 SOT-323_SC-70
b(0,0,0,1.26,2.2,1.2);
b(0,0,0,2.2,2.2,0.6);
}

module m7(pushed=false,hulled=false)
{ // RevK:MHS190RGBCT LED_0603_1608Metric
b(0,0,0,1.6,0.8,0.25);
b(0,0,0,1.2,0.8,0.55);
b(0,0,0,0.8,0.8,0.95);
if(!hulled&&pushed)b(0,0,0,1,1,20);
}

module m10(pushed=false,hulled=false)
{ // RevK:SOT-23-Thin-6-Reg SOT-23-6
b(0,0,0,3.05,3.05,0.5);
b(0,0,0,1.45,3.05,1.1);
}

module m13(pushed=false,hulled=false)
{ // RevK:C_0805_ C_0805_2012Metric
b(0,0,0,2,1.45,0.2); // Pad size
b(0,0,0,2,1.2,1); // Chip
}

module m15(pushed=false,hulled=false)
{ // RevK:C_0603_ C_0603_1608Metric
b(0,0,0,1.6,0.95,0.2); // Pad size
b(0,0,0,1.6,0.8,1); // Chip
}

module m17(pushed=false,hulled=false)
{ // RevK:USC16-TR CSP-USC16-TR
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

module m19(pushed=false,hulled=false)
{ // RevK:L_4x4_ TYA4020
b(0,0,0,4,4,2.1);
}

module m21(pushed=false,hulled=false,n=0)
{ // RevK:PTSM-HH-3-RA PTSM-HH-3-RA
hull()
{ // Socket
	b(0,-7.5/2+0.3,0,1.7+n*2.5,7.5,4);
	b(0,-7.5/2+0.3,0,1.7+n*2.5-2,7.5,5);
}
// Plug
b(0,-10.5/2-7.5+0.3,0,1.1+n*2.5,10.5,5);
// Pins
if(!hulled)for(p=[0:n-1])translate([-2.5*(n-1)/2+p*2.5,0,-2.1])cylinder(r=0.3,h=2.1);
}

module m24(pushed=false,hulled=false)
{ // RevK:D_1206_ D_1206_3216Metric
b(0,0,0,4.4,1.75,1.2); // Pad size
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
	translate([0,0,-casebase-d])
	{
		if(useredge)
			intersection()
			{
				pcb(height+d*2,margin/2+d);
				pcbh(height+d*2,margin/2+d);
			}
		else pcbh(height+d*2,margin/2+d);
	}
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
