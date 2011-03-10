From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Wed, 09 Mar 2011 23:36:36 -0700
Message-ID: <4D790C240200002300029A17@novprvlin0050.provo.novell.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
 <20110103204910.GA4223@srcf.ucam.org>
 <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
 <201103022109.51600.carlos@strangeworlds.co.uk>
 <4D6FDCA0020000230002951C@novprvlin0050.provo.novell.com>
 <4D786E67.5050100@pardus.org.tr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4D786E67.5050100@pardus.org.tr>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ozan@pardus.org.tr
Cc: ike.pan@canonical.com, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-03-10 =E6=96=BC 08:23 +0200=EF=BC=8COz=
an =C3=87a=C4=9Flayan =E6=8F=90=E5=88=B0=EF=BC=9A
> 03-03-2011 09:23 tarihinde, Joey Lee yazd=C4=B1:
> > The original issue was reported by Ville-Pekka Vaino, acer-wmi driv=
er
> > auto-probe on Ideapad S12 machine by detection AWM0. But, acer-wmi =
adds
> > a soft blocked wifi killswitch, which can't be unblocked with rfkil=
l, it
> > causes problems with NetworkManager wireless network can't be enabl=
ed at
> > all.
>=20
> This also happens with Lenovo 3000 V200 and Lenovo b560. I'm adding t=
hem=20
> to blacklist with the Ideapad S12
> to fix users' no-wlan-at-all complains. Maybe you can just blacklist=20
> them for stable kernel releases and try to find a proper solution aft=
er.
>=20
> Thanks,
> Ozan Caglayan
>=20
>=20

My idea is direct ignore all machines that have VPC2004 acpi device in
DSDT, because ideapad-laptop driver talks with BIOS though VPC2004.

Did you see VPC2004 device declare in Lenovo 3000 V200 and b560's DSDT?


Thank's a lot!
Joey Lee
