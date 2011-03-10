From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 10 Mar 2011 00:45:02 -0700
Message-ID: <4D791C2E0200002300029A36@novprvlin0050.provo.novell.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
 <20110103204910.GA4223@srcf.ucam.org>
 <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
 <201103022109.51600.carlos@strangeworlds.co.uk>
 <4D6FDCA0020000230002951C@novprvlin0050.provo.novell.com>
 <4D786E67.5050100@pardus.org.tr>
 <4D790C240200002300029A17@novprvlin0050.provo.novell.com>
 <4D787685.80009@pardus.org.tr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4D787685.80009@pardus.org.tr>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ozan@pardus.org.tr
Cc: ike.pan@canonical.com, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, Joey Lee <JLee@novell.com>, mjg59@srcf.ucam.org, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-03-10 =E6=96=BC 08:58 +0200=EF=BC=8COz=
an =C3=87a=C4=9Flayan =E6=8F=90=E5=88=B0=EF=BC=9A
> 10-03-2011 08:36 tarihinde, Joey Lee yazd=C4=B1:
> > My idea is direct ignore all machines that have VPC2004 acpi device=
 in
> > DSDT, because ideapad-laptop driver talks with BIOS though VPC2004.
> >
> > Did you see VPC2004 device declare in Lenovo 3000 V200 and b560's D=
SDT?
>=20
> Unfortunately I can't see any VPC2004 references in 3000 v200's dsdt=20
> which is at:
>=20
> http://cekirdek.pardus.org.tr/~ozan/ivir/lenovo3000v200_dsdt.dsl
>=20
> I don't have the other one's acpidump but I'll try to get it from the=
 user.
>=20
> Thanks.
>=20

OK, there have no VPC2004 and VPCW, VPCR method in your DSDT, that mean=
s
ideapad-laptop doesn't support 3000 V200 and b560.

If we are lucky, we can find out which EC register mapping to wifi key'=
s
status.

If you want...
Could you please help to try Carlos's acer_ec.pl tool?

http://code.google.com/p/aceracpi/wiki/EmbeddedController

Download the acer_ec.pl file then put to your Lenovo machine.
Run:
	watch -n 1 perl acer_ec.pl regs

Start to press wifi Fn key on Lenovo machines' keyboard, then monitor
the result from acer_ec. Please press wifi Fn key a couple of times,
fine out which register changed when you press Fn key.

Please send out the register number and value when wifi on/off.
e.g.
	E0 04		128 (on)	144 (off)


Thank's a lot!
Joey Lee
