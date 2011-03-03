From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 03 Mar 2011 00:23:28 -0700
Message-ID: <4D6FDCA0020000230002951C@novprvlin0050.provo.novell.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
 <20110103204910.GA4223@srcf.ucam.org>
 <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
 <201103022109.51600.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201103022109.51600.carlos@strangeworlds.co.uk>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: ike.pan@canonical.com, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

Hi Carios,=20

=E6=96=BC =E4=B8=89=EF=BC=8C2011-03-02 =E6=96=BC 21:09 +0000=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Wednesday 02 Mar 2011 08:53:55 Joey Lee wrote:
> > =E6=96=BC =E4=B8=80=EF=BC=8C2011-01-03 =E6=96=BC 20:49 +0000=EF=BC=8C=
Matthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> >=20
> > > It looks like this GUID is present in a surprisingly wide range o=
f
> > > devices (eg, http://pastebin.com/8BY0Dg64 from a Vaio...), which =
means
> > > that it's probably not a safe assumption that reading from the EC=
 will
> > > give us reasonable results. Do the Acer drivers definitely do tha=
t,
> > > rather than there being some SMI that returns the data?
> >=20
> > The AMW0 in acer-wmi not just used by acer machines:
> >=20
> > #define AMW0_GUID1              "67C3371D-95A3-4C37-BB61-DD47B491DA=
AB"
> >=20
> > It was also included in Lenovo Ideapad S12 and Vaio machines' DSDT.=
 For
> > Lenovo Ideapad, that will be better handle by ideapad-laptop driver=
=2E
>=20

The original issue was reported by Ville-Pekka Vaino, acer-wmi driver
auto-probe on Ideapad S12 machine by detection AWM0. But, acer-wmi adds
a soft blocked wifi killswitch, which can't be unblocked with rfkill, i=
t
causes problems with NetworkManager wireless network can't be enabled a=
t
all.

> They might not be - Matthew's original question still stands. The old=
 AMW0 was=20
> just a funny wrapper for direct BIOS calls - maybe we just need a dif=
ferent=20
> call here?
>=20

Understood your point.

In acer-wmi driver, by the default ACER_CAP_WIRELESS =3D 0, looks this
case not work for Ideapad S12.
If we want to support S12 in acer-wmi for maintain the wlan rfkill, the=
n
we need find out the new EC pattern to read the wireless state and add
it to acer-wmi.

We need Vaino help to run acer_ec.pl to capture the EC register status.

> What does Acer do - are they poking the EC directly, or is the call t=
o AMW0=20
> just different for these machines?
>=20

You are right, AMW0 just a wrapper the detail wlan rfkill state sync by
direct access EC register, we will need to know how the S12's EC
registers state changed.

On the other hand,
Vaino said the ideapad-laptop driver works fine on his S12 machine to
handle killswitches.

Per Per Ike's information, ideapad-laptop driver support S12 machine by
VPC2004 devices and I also simply check Ideapad S12's DSDT that was
dumped by Ville-Pekka Vaino, it declare VPC2004 devices in EC block.

The ideapad-laptop also maintain a wlan killswitch state by access
VPC2004 devices, but this driver have no alias and doesn't auto-probe.

Should we still maintain a wlan killswitch by acer-wmi when
ideapad-laptop also maintain the same wlan killswitch by itself?

> > Could we just direct add those model to the blacklist in acer-wmi
> > driver? or we direct check dmi in acer-wmi for only support Acer
> > machines that were included AMW0 in DSDT?
>=20
> Interesting. If we can't autodetect whether it's a dummy interface or=
 not,=20
> then, we should change acer-wmi to whitelist what it does support - A=
cer,=20
> Fujistu Siemens and Medion - rather than trying to blacklist every ve=
ndor that=20
> crops up.
>=20
> -Carlos

I thought there have 2 choices:

- In acer-wmi driver, maybe we can walk through acpi device to check if
there have VPC2004 devices in DSDT, then we direct ignore this machine'=
s
AWM0 supported.

or
- We still try to support Ideapad S12 in acer-wmi, we maintain a wlan
killswitch even it duplicate with ideapad-laptop's wlan killswitch.
We need Vaino help to run acer_ec.pl.

Do you think which one is better for this case?


Thank's a lot!
Joey Lee
