Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28091C7619A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Apr 2023 14:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjDOOXH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Apr 2023 10:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDOOXG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Apr 2023 10:23:06 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DC049E1
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Apr 2023 07:23:03 -0700 (PDT)
Date:   Sat, 15 Apr 2023 14:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielbertalan.dev;
        s=protonmail; t=1681568577; x=1681827777;
        bh=AQzYB9fJwI/sM7xG60VSim/olfgB4JoPouNdQelf33M=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=fnBa8+yy3h/bst7XnfdqCkIlj5Evtitgl2gkJ7k8CP5mMiDwbFMLRhDelop8lnUbF
         /2D4wsS17pQZG3qV+p17YGGjsi7o648COBhN1uEKJpQSRXXYocbDmZzK4ce7Ljr5DQ
         tlg1w2bB+vP3GWYqgw/CIDBAk4c3O4PWI4W+WhqOxotZNtGRfeHz4D6OW2Pzqia+es
         CwwKJfpN2XhvdFQjNJXgkB+I7kEzrIp1LAsTTjPMYvT5BZUrHNyuMrZK8tWzbNTJsP
         a5vIRm2n/eAP0v791FtzQRrDbC0MOtrZUeRPe8/4Q+xusdVO6F6UXsf1WviBhrqCj8
         JgWSFFpWS+bSg==
To:     Hans de Goede <hdegoede@redhat.com>
From:   Daniel Bertalan <dani@danielbertalan.dev>
Cc:     Liav Albani <liavalb@gmail.com>, Mark Gross <markgross@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller access on X380 Yoga
Message-ID: <c7LGto3wAWSkvfZaIEtB9_5EhTFe8ZdAOCKSZE8m8L18w0kJu2tms1RSdhrdUPBfHy5f-GMvxi_Etc5s8e7NOdF_xG4atmwco2QQ41bv9Sc=@danielbertalan.dev>
In-Reply-To: <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com>
References: <20230414180034.63914-1-dani@danielbertalan.dev> <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com> <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com> <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com>
Feedback-ID: 20340505:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Saturday, April 15th, 2023 at 15:30, Hans de Goede <hdegoede@redhat.com>=
 wrote:

> Hi,
>=20
> On 4/15/23 15:24, Liav Albani wrote:
>=20
> > On 4/15/23 13:12, Hans de Goede wrote:
> >=20
> > > Hi,
> > >=20
> > > On 4/14/23 20:02, Daniel Bertalan wrote:
> > >=20
> > > > On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used=
 for
> > > > accessing the Embedded Controller: instead of a method that reads f=
rom
> > > > the EC's memory, `ECRD` is the name of a location in high memory. T=
his
> > > > meant that trying to call them would fail with the following messag=
e:
> > > >=20
> > > > ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-meth=
od
> > > > ACPI object (RegionField)
> > > >=20
> > > > With this commit, it is now possible to access the EC and read
> > > > temperature and fan speed information. Note that while writes to th=
e
> > > > HFSP register do go through (as indicated by subsequent reads showi=
ng
> > > > the new value), the fan does not actually change its speed.
> > > >=20
> > > > Signed-off-by: Daniel Bertalan dani@danielbertalan.dev
> > > > Interestig, this looks like a pretty clean solution to me.
> >=20
> > Daniel and I have looked in the DSDT ASL code and found a bunch of regi=
sters in high physical memory location (which is an ACPI OpRegion),
> > and one of the registers had a bit called ECRD.
> > However, there were many other registers that might be interesting as w=
ell, the problem is the short names in the ASL code (so we only see abbrevi=
ations essentially).
> >=20
> > While I do agree that adding this code is indeed a clean solution, if y=
ou (people that are dealing with Thinkpad laptops) know about cleaner way t=
o access the embedded controller, I think it's preferable, because this way=
 Daniel might be able to trigger the fan on that laptop so it will actually=
 spin and will dissipate-out heat from the system, without the relying on t=
he embedded controller to get into some sort of thermal state and then to t=
rigger the fan.
>=20
>=20
> Have you tried falling back to the ec_read() and ec_write() helpers
> exported by the ACPI EC code ?
>=20
> The "first_ec" pointer used by these functions is exported too,
> so you could try modifying thinkpad_acpi to use ec_read() and
> ec_write() as fallback when first_ec is set (and the quirk
> added by this patch triggers).

This is basically what my patch does. If the ECRD/ECWR method handles
are NULL, thinkpad_acpi's acpi_ec_{read,write} functions fall back to
the regular ACPI EC helpers you mentioned.

Speaking of which, does anyone know why these private helper functions
exist in the first place? The code seems to use them interchangeably.
Even in the fan control code, there are places where the regular EC
helpers are called directly. Can we get away with always doing that?

Back to the issue at hand, is there someone we could ask if the X380Y
even supports manual fan control in the first place? My debugging
efforts are starting to look like a wild goose chase.

The thermal sensors and fan PWM readings now work, which is better
than nothing, but it would be good to get to the bottom of this.

All the best,

Daniel

> Regards,
>=20
> Hans
>=20
>=20
> > > Mark Pearson, do you have any remarks on this ?
> > >=20
> > > Regards,
> > >=20
> > > Hans
> > >=20
> > > > ---
> > > > drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++++
> > > > 1 file changed, 16 insertions(+)
> > > >=20
> > > > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platfor=
m/x86/thinkpad_acpi.c
> > > > index 7191ff2625b1..6fe82f805ea8 100644
> > > > --- a/drivers/platform/x86/thinkpad_acpi.c
> > > > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > > > @@ -11699,6 +11699,7 @@ static int __init thinkpad_acpi_module_init=
(void)
> > > > {
> > > > const struct dmi_system_id *dmi_id;
> > > > int ret, i;
> > > > + acpi_object_type obj_type;
> > > >=20
> > > > tpacpi_lifecycle =3D TPACPI_LIFE_INIT;
> > > >=20
> > > > @@ -11724,6 +11725,21 @@ static int __init thinkpad_acpi_module_ini=
t(void)
> > > > TPACPI_ACPIHANDLE_INIT(ecrd);
> > > > TPACPI_ACPIHANDLE_INIT(ecwr);
> > > >=20
> > > > + /*
> > > > + * Quirk: in some models (e.g. X380 Yoga), an object named ECRD
> > > > + * exists, but it is a register, not a method.
> > > > + */
> > > > + if (ecrd_handle) {
> > > > + acpi_get_type(ecrd_handle, &obj_type);
> > > > + if (obj_type !=3D ACPI_TYPE_METHOD)
> > > > + ecrd_handle =3D NULL;
> > > > + }
> > > > + if (ecwr_handle) {
> > > > + acpi_get_type(ecwr_handle, &obj_type);
> > > > + if (obj_type !=3D ACPI_TYPE_METHOD)
> > > > + ecwr_handle =3D NULL;
> > > > + }
> > > > +
> > > > tpacpi_wq =3D create_singlethread_workqueue(TPACPI_WORKQUEUE_NAME);
> > > > if (!tpacpi_wq) {
> > > > thinkpad_acpi_module_exit();
