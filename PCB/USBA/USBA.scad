// Generated case design for PCB/USBA/USBA.kicad_pcb
// By https://github.com/revk/PCBCase
// Generated 2023-01-09 08:51:15
// title:	Generic ESP32 USB-A
// date:	2021-11-06
// rev:	1
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
pcbthickness=1.950000;
nohull=false;
hullcap=1.000000;
hulledge=1.000000;
useredge=false;

module pcb(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[14.000000,25.000000],[14.000000,12.750000],[13.965926,12.491181],[13.866026,12.250000],[13.707107,12.042893],[13.500000,11.883974],[13.258819,11.784074],[13.000000,11.750000],[12.554958,11.699856],[12.132233,11.551938],[11.753020,11.313663],[11.436337,10.996980],[11.198062,10.617767],[11.050144,10.195042],[11.000000,9.750000],[11.050144,9.304958],[11.198062,8.882233],[11.436337,8.503020],[11.753020,8.186337],[12.132233,7.948062],[12.554958,7.800144],[13.000000,7.750000],[13.000000,0.300000],[12.977164,0.185195],[12.912132,0.087868],[12.814805,0.022836],[12.700000,0.000000],[1.300000,0.000000],[1.185195,0.022836],[1.087868,0.087868],[1.022836,0.185195],[1.000000,0.300000],[1.000000,7.750000],[1.445042,7.800144],[1.867767,7.948062],[2.246980,8.186337],[2.563663,8.503020],[2.801938,8.882233],[2.949856,9.304958],[3.000000,9.750000],[2.949856,10.195042],[2.801938,10.617767],[2.563663,10.996980],[2.246980,11.313663],[1.867767,11.551938],[1.445042,11.699856],[1.000000,11.750000],[0.741181,11.784074],[0.500000,11.883974],[0.292893,12.042893],[0.133974,12.250000],[0.034074,12.491181],[0.000000,12.750000],[0.000000,25.000000],[0.030448,25.153074],[0.117157,25.282843],[0.246926,25.369552],[0.400000,25.400000],[13.600000,25.400000],[13.753074,25.369552],[13.882843,25.282843],[13.969552,25.153074]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61]]);}

module outline(h=pcbthickness,r=0){linear_extrude(height=h)offset(r=r)polygon(points=[[14.000000,25.000000],[14.000000,12.750000],[13.965926,12.491181],[13.866026,12.250000],[13.707107,12.042893],[13.500000,11.883974],[13.258819,11.784074],[13.000000,11.750000],[12.554958,11.699856],[12.132233,11.551938],[11.753020,11.313663],[11.436337,10.996980],[11.198062,10.617767],[11.050144,10.195042],[11.000000,9.750000],[11.050144,9.304958],[11.198062,8.882233],[11.436337,8.503020],[11.753020,8.186337],[12.132233,7.948062],[12.554958,7.800144],[13.000000,7.750000],[13.000000,0.300000],[12.977164,0.185195],[12.912132,0.087868],[12.814805,0.022836],[12.700000,0.000000],[1.300000,0.000000],[1.185195,0.022836],[1.087868,0.087868],[1.022836,0.185195],[1.000000,0.300000],[1.000000,7.750000],[1.445042,7.800144],[1.867767,7.948062],[2.246980,8.186337],[2.563663,8.503020],[2.801938,8.882233],[2.949856,9.304958],[3.000000,9.750000],[2.949856,10.195042],[2.801938,10.617767],[2.563663,10.996980],[2.246980,11.313663],[1.867767,11.551938],[1.445042,11.699856],[1.000000,11.750000],[0.741181,11.784074],[0.500000,11.883974],[0.292893,12.042893],[0.133974,12.250000],[0.034074,12.491181],[0.000000,12.750000],[0.000000,25.000000],[0.030448,25.153074],[0.117157,25.282843],[0.246926,25.369552],[0.400000,25.400000],[13.600000,25.400000],[13.753074,25.369552],[13.882843,25.282843],[13.969552,25.153074]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61]]);}
spacing=30.000000;
pcbwidth=14.000000;
pcblength=25.400000;
// Populated PCB
module board(pushed=false,hulled=false){
translate([2.000000,21.550000,1.950000])m0(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([2.000000,24.250000,1.950000])translate([0.000000,-0.400000,0.000000])m1(pushed,hulled); // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
translate([2.000000,24.250000,1.950000])translate([0.000000,0.400000,0.000000])m1(pushed,hulled); // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
translate([2.000000,22.750000,1.950000])m0(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([2.000000,20.350000,1.950000])m0(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([12.250000,24.050000,1.950000])rotate([0,0,180.000000])m2(pushed,hulled); // RevK:C_0805_ C_0805_2012Metric
translate([11.870000,20.930000,1.950000])rotate([0,0,90.000000])m3(pushed,hulled); // RevK:D_1206_ D_1206_3216Metric
translate([8.700000,22.550000,1.950000])rotate([0,0,-90.000000])rotate([-0.000000,0.000000,90.000000])m4(pushed,hulled); // RevK:L_4x4_ TYA4020
translate([12.250000,17.800000,1.950000])m2(pushed,hulled); // RevK:C_0805_ C_0805_2012Metric
translate([4.900000,23.300000,1.950000])rotate([0,0,-90.000000])m5(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([8.950000,16.550000,1.950000])m5(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([5.100000,17.750000,1.950000])m0(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([8.700000,18.650000,1.950000])rotate([0,0,90.000000])rotate([-0.000000,0.000000,90.000000])m6(pushed,hulled); // RevK:SOT-23-Thin-6-Reg SOT-23-6
translate([5.100000,16.400000,1.950000])m0(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([12.150000,15.200000,1.950000])rotate([0,0,180.000000])m5(pushed,hulled); // RevK:C_0603 C_0603_1608Metric
translate([8.950000,15.200000,1.950000])m0(pushed,hulled); // RevK:R_0603 R_0603_1608Metric
translate([7.000000,19.800000,0.000000])rotate([0,0,180.000000])rotate([180,0,0])translate([0.000000,2.700000,0.000000])rotate([90.000000,0.000000,0.000000])m7(pushed,hulled); // RevK:ESP32-PICO-MINI-02 ESP32-PICO-MINI-02
}

module b(cx,cy,z,w,l,h){translate([cx-w/2,cy-l/2,z])cube([w,l,h]);}
module m0(pushed=false,hulled=false)
{ // RevK:R_0603 R_0603_1608Metric
b(0,0,0,2.8,0.95,0.5); // Pad size
}

module m1(pushed=false,hulled=false)
{ // RevK:LED-RGB-1.6x1.6 LED_0603_1608Metric
b(0,0,0,1.6,0.8,0.25);
b(0,0,0,1.2,0.8,0.55);
b(0,0,0,0.8,0.8,0.95);
if(!hulled&&pushed)b(0,0,0,1,1,20);
}

module m2(pushed=false,hulled=false)
{ // RevK:C_0805_ C_0805_2012Metric
b(0,0,0,2,1.45,0.2); // Pad size
b(0,0,0,2,1.2,1); // Chip
}

module m3(pushed=false,hulled=false)
{ // RevK:D_1206_ D_1206_3216Metric
b(0,0,0,4.4,1.75,1.2); // Pad size
}

module m4(pushed=false,hulled=false)
{ // RevK:L_4x4_ TYA4020
b(0,0,0,4,4,2.1);
}

module m5(pushed=false,hulled=false)
{ // RevK:C_0603 C_0603_1608Metric
b(0,0,0,1.6,0.95,0.2); // Pad size
b(0,0,0,1.6,0.8,1); // Chip
}

module m6(pushed=false,hulled=false)
{ // RevK:SOT-23-Thin-6-Reg SOT-23-6
b(0,0,0,3.05,3.05,0.5);
b(0,0,0,1.45,3.05,1.1);
}

module m7(pushed=false,hulled=false)
{ // RevK:ESP32-PICO-MINI-02 ESP32-PICO-MINI-02
rotate([90,0,0])
translate([-13.2/2,-16.6/2,0])
{
	if(!hulled)cube([13.2,16.6,0.8]);
	cube([13.2,11.2,2.4]);
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
