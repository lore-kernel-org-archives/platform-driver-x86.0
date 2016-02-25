From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 5/5] dell-rbtn: Add a comment about the XPS 13 9350
Date: Thu, 25 Feb 2016 11:45:28 +0100
Message-ID: <20160225104528.GT4606@pali>
References: <cover.1455553470.git.luto@kernel.org>
 <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
 <20160217111634.GQ1476@pali>
 <56C47090.1050106@dell.com>
 <20160223120100.GN4606@pali>
 <CALCETrU98nEhLQSr7M+DsvD2Fgk5K0GFPFBoLE8_k-_ZRg72mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36709 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759460AbcBYKpc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Feb 2016 05:45:32 -0500
Received: by mail-wm0-f49.google.com with SMTP id g62so22316186wme.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Feb 2016 02:45:31 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CALCETrU98nEhLQSr7M+DsvD2Fgk5K0GFPFBoLE8_k-_ZRg72mA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>, Darren Hart <dvhart@infradead.org>
Cc: Jon Eyolfson <jon@eyl.io>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>

On Tuesday 23 February 2016 09:35:47 Andy Lutomirski wrote:
> On Feb 23, 2016 4:01 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com> wro=
te:
> >
> > On Wednesday 17 February 2016 07:07:28 Mario Limonciello wrote:
> > >
> > >
> > > On 02/17/2016 05:16 AM, Pali Roh=C3=A1r wrote:
> > > > On Monday 15 February 2016 08:32:37 Andy Lutomirski wrote:
> > > >> On the XPS 13 9350, the dell-rbtn mechanism has a new device i=
d, and
> > > >> the DSDT turns it off if a new enough _OSI is supported.  Add =
a
> > > >> comment about why we don't bother supporting it.
> > > >>
> > > >> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > > >> ---
> > > >>  drivers/platform/x86/dell-rbtn.c | 15 +++++++++++++++
> > > >>  1 file changed, 15 insertions(+)
> > > >>
> > > >> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platfo=
rm/x86/dell-rbtn.c
> > > >> index cd410e392550..b51a2008d782 100644
> > > >> --- a/drivers/platform/x86/dell-rbtn.c
> > > >> +++ b/drivers/platform/x86/dell-rbtn.c
> > > >> @@ -217,6 +217,21 @@ static void rbtn_notify(struct acpi_devic=
e *device, u32 event);
> > > >>  static const struct acpi_device_id rbtn_ids[] =3D {
> > > >>    { "DELRBTN", 0 },
> > > >>    { "DELLABCE", 0 },
> > > >> +
> > > >> +  /*
> > > >> +   * This driver can also handle the "DELLABC6" device that
> > > >> +   * appears on the XPS 13 9350, but that device is disabled
> > > >> +   * by the DSDT unless booted with acpi_osi=3D"!Windows 2012=
"
> > > >> +   * acpi_osi=3D"!Windows 2013".  Even if we boot that and bi=
nd
> > > >> +   * the driver, we seem to have inconsistent behavior in
> > > >> +   * which NetworkManager can get out of sync with the rfkill
> > > >> +   * state.
> > > > Do you know reason for such behaviour? It is because event is s=
end
> > > > duplicated (by dell-rbtn and also by intel-hid)?
> > > DELLABC6 is a custom interface that was created solely to have ai=
rplane
> > > mode support for Windows 7.
> > > For Windows 10 the proper interface is to use that which is handl=
ed by
> > > intel-hid.  A OEM airplane mode driver is not used.
> > >
> > > Since the kernel doesn't identify as Windows 7 it would be incorr=
ect to
> > > do attempt to use that interface.
> >
> > Ok, I understand. But what user can is to tell linux kernel to iden=
tify
> > as Windows 7.
> >
> > And I would like to know reason for that inconsistent behaviour. It=
 is
> > because of bug in NetworkManager or because of some hidden bug in
> > dell-rbnt.c or in rfkill kernel subsystem? If it is in kernel there=
 is
> > really big change that it can occur also on other machines which us=
es
> > dell-rbtn and so we should fix it.
> >
> > Andy, can you look at it and try identify where is the problem?
>=20
> I think it's straightforward.  If we identify as Windows 7 and enable
> this driver then, when we press the wireless button, dell-rbtn
> switches its state *and* NetworkManager gets KEY_RFKILL from intel-hi=
d
> and changes its state.  Then you can tell NetworkManager to turn wifi
> on using the menu, at which point dell-rbtn is off but NM's software
> state is on.  Then you press the button again, turning on dell-rbtn
> but turning NM off again.  The result is that the last button press
> direct work as expected.
>=20
> I haven't verified that this is actually what happens, but it's
> certainly the case that a button that triggers a state toggle should
> only change the state by *one* mechanism.
>=20
> Presumably this works on Windows 7 because either there is no
> equivalent of intel-hid or because the DSDT turns it off -- I haven't
> checked which is the case.
>=20
> --Andy

Understood, this is just big API mess in Dell APCI/EC/firmware and also
our kernel implementation in (dell-(laptop|wmi|rbtn)|intel-hid) drivers
is not ideal and clean...

Darren, add my Acked-by also for this patch (if you already have not
done it).

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
