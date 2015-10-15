From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v7] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Thu, 15 Oct 2015 08:29:31 -0700
Message-ID: <20151015152931.GA3049@malice.jf.intel.com>
References: <1444380548-17366-1-git-send-email-qipeng.zha@intel.com>
 <1444397622.8361.544.camel@intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD01981358@SHSMSX104.ccr.corp.intel.com>
 <1444905355.8361.644.camel@intel.com>
 <1444905573.8361.647.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49454 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255AbbJOP3d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Oct 2015 11:29:33 -0400
Content-Disposition: inline
In-Reply-To: <1444905573.8361.647.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>

On Thu, Oct 15, 2015 at 10:39:35AM +0000, Shevchenko, Andriy wrote:
> On Thu, 2015-10-15 at 13:35 +0300, Andy Shevchenko wrote:
> > On Sat, 2015-10-10 at 03:07 +0000, Zha, Qipeng wrote:
> > > >=20
> > > > Everything is quite okay, except this BAR thingy.
> > >=20
> > > > Can you provide a DSDT excerpt for the device to see what is=20
> > > > there?
> > >=20
> > > > I can't find such device (by ACPI id) in the tables of the=20
> > > > accessible hardware in our lab.
> > >=20
> > > Please check below acpi device definition from BIOS.
> > > Punit device is created in pmc driver, since BIOS finally reject =
to=20
> > >=20
> > > create a separate device for Punit.
> >=20
> > Thank you for mention this one. It's unfortunately a show stopper f=
or
> > using this module as a driver (you can't assign two drivers to the=20
> > same
> > device). You have to convert is to a library.
>=20
> Oh, I'm sorry, I really missed that the IDs are different.
> So, discard this part.
>=20
> >=20
> > Moreover, I briefly looked at the intel_pmc_ipc and it should be
> > refactored a in a few ways: a) split to core part, PCI driver, and=20
> > ACPI
> > driver, b) improved regarding to comments you got in this review=20
> > (many
> > comments are applied to what we have there).
> >=20
> > Darren, your opinion?
>=20
> This by the way still valid.

I'm a bit confused. Are you just bringing up that the intel_pmc_ipc dri=
ver could
also be improved? Or are you sugesting that this driver needs to be ref=
actored
together with the intel_pmc_ipc driver?

With respect to the intel_punit_ipc driver, I've tried to parse/map the=
 DSDT to
the BAR mapping in the driver which you raised concerns about. Can you =
review
that bit and help us come to a conclusion on that since you asked for t=
he DSDT?
(See separate response to Qipeng on that).

Thanks,

>=20
> >=20
> > >=20
> > >   Scope (\_SB) {
> > >     Device(IPC1)
> > >     {
> > >       =E2=80=A6
> > >       Name (RBUF, ResourceTemplate ()
> > >       {
> > >         Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, BAR0)  =
=20
> > >  //=20
> > > IPC1 Bar
> > >      //   Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, BAR1)=
=20
> > >  //=20
> > > SSRAM
> > >         Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, MDAT)  =
=20
> > >  //=20
> > > PUnit BIOS mailbox Data
> > >         Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, MINF)  =
=20
> > >  //=20
> > > PUnit BIOS mailbox Interface and GTD/ISPD mailbox
> > >         IO (Decode16, 0x400, 0x480, 0x4, 0x80)                   =
=20
> > >  //=20
> > > ACPI IO Base address
> > >         Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive,=
 ,=20
> > > ,=20
> > > ) {40}  // IPC1 IRQ =20
> > >       })
> > >=20
> > >       =E2=80=A6
> > >     }
> > >   }//end scope
> >=20
>=20
> --=20
> Andy Shevchenko <andriy.shevchenko@intel.com>
> Intel Finland Oy
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki=20
> Business Identity Code: 0357606 - 4=20
> Domiciled in Helsinki=20
>=20
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.

--=20
Darren Hart
Intel Open Source Technology Center
