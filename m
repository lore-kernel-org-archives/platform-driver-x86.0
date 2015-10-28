From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v7] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Wed, 28 Oct 2015 10:27:35 +0900
Message-ID: <20151028012735.GA1854@malice.jf.intel.com>
References: <1444397622.8361.544.camel@intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD01981358@SHSMSX104.ccr.corp.intel.com>
 <20151015051606.GD2592@malice.jf.intel.com>
 <20151021125143.GA29166@vmdeb7>
 <C6287702A945AC47BE5DB5DFD4B5C6DD02CE122D@SHSMSX104.ccr.corp.intel.com>
 <20151022080430.GB2581@malice.jf.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD03813AD0@SHSMSX104.ccr.corp.intel.com>
 <20151022154307.GB4289@malice.jf.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD0381485F@SHSMSX104.ccr.corp.intel.com>
 <1445949030.6332.26.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55264 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754902AbbJ1B1o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Oct 2015 21:27:44 -0400
Content-Disposition: inline
In-Reply-To: <1445949030.6332.26.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "Xue, Gavin" <gavin.xue@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "Westerberg, Mika" <mika.westerberg@intel.com>

On Tue, Oct 27, 2015 at 12:30:31PM +0000, Shevchenko, Andriy wrote:
> On Mon, 2015-10-26 at 08:51 +0000, Zha, Qipeng wrote:
> > > So the ASL you provided was not what the Linux kernel is seeing,
> > > correct?
> >=20
> > > Can you please provide a DSDT disassembly from the running Linux
> > > system please, such as:
> >=20
> > > # cp /sys/firmware/acpi/tables/DSDT DSDT.dat # iasl -d DSDT.dat
> >=20
> > > Then find this device in DSDT.dsl and paste it here please.
> >=20
> > Sorry for late feedback,=A0=A0got dsdt from lab machine since my bo=
ard
> > got broken,
> > Please check.
> >=20
> > Scope (\_SB)
> > =A0=A0=A0=A0=A0=A0=A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Device (IPC1)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Name (_ADR, Zero)=A0=
=A0// _ADR: Address
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Name (_HID, "INT34D=
2")=A0=A0// _HID: Hardware ID
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Name (_CID, "INT34D=
2")=A0=A0// _CID: Compatible ID
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Name (_DDN, "Intel(=
R) IPCI controller ")=A0=A0// _DDN:
> > DOS Device Name
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Name (_UID, One)=A0=
=A0// _UID: Unique ID
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Name (RBUF, Resourc=
eTemplate ()
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Memory3=
2Fixed (ReadWrite,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00000000,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Base
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00002000,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0_Y08)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Memory3=
2Fixed (ReadWrite,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00000000,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Base
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00000004,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0_Y09)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Memory3=
2Fixed (ReadWrite,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00000000,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Base
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00000040,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0_Y0A)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0IO (Dec=
ode16,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x0400,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0// Range Minimum
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x0480,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0// Range Maximum
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x04,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0// Alignment
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x80,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0// Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Memory3=
2Fixed (ReadWrite,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00000000,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Base
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00002000,=A0=A0=A0=A0=A0=A0=A0=A0=A0// Address Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0_Y0B)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Interru=
pt (ResourceConsumer, Level, ActiveLow,
> > Exclusive, ,, )
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00000028,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0})
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Method (_CRS, 0, No=
tSerialized)=A0=A0// _CRS: Current
> > Resource Settings
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y08._BAS,
> > B0BA)=A0=A0// _BAS: Base Address
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y08._LEN,
> > B0LN)=A0=A0// _LEN: Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
DD1A, B0BA)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
DD1L, B0LN)
>=20
> dd1a, dd1l has been stored to Resource 0
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y09._BAS,
> > BM01)=A0=A0// _BAS: Base Address
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y09._LEN,
> > BML1)=A0=A0// _LEN: Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y0A._BAS,
> > BM02)=A0=A0// _BAS: Base Address
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y0A._LEN,
> > BML2)=A0=A0// _LEN: Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
BMDA, BM01)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
0x04, BML1)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
BMIA, BM02)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
0x40, BML2)
>=20
> bmda, 0x04 -> Resource 1
> bmia, 0x40 -> Resource 2
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y0B._BAS,
> > B1BA)=A0=A0// _BAS: Base Address
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0CreateD=
WordField (RBUF, \_SB.IPC1._Y0B._LEN,
> > B1LN)=A0=A0// _LEN: Length
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
DD3A, B1BA)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Store (=
DD3L, B1LN)
>=20
> dd3a, dd3l -> Resource 3
>=20
>=20
> Can you create a temporary method in the ->probe() of this driver to
> iterate over resources and print them out? Or tell the values BIOS se=
t
> per values dd1a, dd1l, dd3a, dd3l, bmda, bmia.
>=20
> AFAIU you are using only resources 0 and 1. Can you put here small
> description of what each resource is meant for? (I guess couple of th=
em
> to P-Unit, and couple related to what you are trying to get, right?)

While the driver code merges the ranges of res0 and res1:

line 244-245:
	addr =3D ioremap_nocache(res0->start,
			       resource_size(res0) + resource_size(res1));

It appears that we're using very little of this:

	punit_ipcdev->base[BIOS_IPC] =3D addr;
	addr +=3D MAILBOX_REGISTER_SPACE;
	punit_ipcdev->base[GTDRIVER_IPC] =3D addr;
	addr +=3D MAILBOX_REGISTER_SPACE;
	punit_ipcdev->base[ISPDRIVER_IPC] =3D addr;

MAILBOX_REGISTER_SPACE is 0x10, but I don't know how long ISPDRIVER_IPC=
 is
expected to be, but it apears to be 4 bytes. This would mean we're usin=
g a total
of 0x24 starting res0->start. res0 has a length of 0x2000 per the ASL a=
bove, and
we're only referencing 0x24 of it.

Why, then, do we merge the lengths of res0 and res1, presumably to 0x20=
04, when
we only use 0x24?

Or, am I misreading this?

Also, Qipeng, you mentioned earlier that the firmware reported a length=
 of 0x4B
I believe? I don't see that in this ASL.

--=20
Darren Hart
Intel Open Source Technology Center
