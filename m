Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECCBC433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Apr 2021 13:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A79EA610FA
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Apr 2021 13:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhDHNvQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Apr 2021 09:51:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:49720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231526AbhDHNvP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Apr 2021 09:51:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29ED261025;
        Thu,  8 Apr 2021 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617889864;
        bh=aj1/6tdwLlJn2Ovbt0oe87pb3tJSIbtL2CpqmLVQjj4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zwr5kG7iV0LD2AFTXPTzo7XUNUMPxUvEM4edyB4B4XiVQq3ocXqg6Uu59hXHcY+zZ
         wLHJTnufWMM5lmh2fN+Cy+Raf32dM62QNd/1VZ5LfXqECAXwuDuJyZp09Pdyf0rIBU
         q7I27EXr2kxZXicFdhgw0G5LDZX+K+KUZ6R8Qxoz7pauikj7Mtf4UUeI4YpmIMPJuV
         K09e/GRsDb5rvChkgKOhvQDkelj+qir2Gi8RMHUhidBl32pTPnRBceb0z937/GqPXT
         y624uw+sHS1dN50rZGjwJDrC2KgBO8ScZSMqxpzXKbyWAc7U/ba67BlggbjKJJCoop
         L8hg17Jz+FRpQ==
Received: by earth.universe (Postfix, from userid 1000)
        id 4B1B03C0C96; Thu,  8 Apr 2021 15:51:02 +0200 (CEST)
Date:   Thu, 8 Apr 2021 15:51:02 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "jwrdegoede@fedoraproject.org" <jwrdegoede@fedoraproject.org>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>,
        "linrunner@gmx.net" <linrunner@gmx.net>
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
Message-ID: <20210408135102.6r2przibgngaavkp@earth.universe>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y5ctd6dbsc6ngys5"
Content-Disposition: inline
In-Reply-To: <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--y5ctd6dbsc6ngys5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 07, 2021 at 10:33:41AM +0000, Barnab=C3=A1s P=C5=91cze wrote:
> 2021. =C3=A1prilis 7., szerda 12:24 keltez=C3=A9ssel, Hans de Goede =C3=
=ADrta:
> > 2. If we add support for this to the kernel we should probably
> > first agree on standardized power-supply class property names for
> > these, rather then coming up with our own names. ATM we register
> > 2 names for the charge start threshold, the one which the thinkpad_acpi
> > code invented and the standardized name which was later added.
> >
> > I've added Sebastian, the power-supply class / driver maintainer to
> > the Cc. for this. Sebastian Nicolo wants to add support for 2 new
> > features as power-supply properties:
> >
> > --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > ...
> > +Battery forced discharging
> > +--------------------------
> > +
> > +sysfs attribute:
> > +/sys/class/power_supply/BATx/force_discharge
> > +
> > +Setting this attribute to 1 forces the battery to discharge while AC i=
s attached.
> > +Setting it to 0 terminates forced discharging.
> > +
> > +Battery charge inhibiting
> > +--------------------------
> > +
> > +sysfs attribute:
> > +/sys/class/power_supply/BATx/inhibit_discharge
> > +
> > +Setting this attribute to 1 stops charging of the battery as a manual =
override
> > +over the threshold attributes. Setting it to 0 terminates the override.
> >
>=20
> "inhibit_**discharge**"
> "stops **charging** of the battery"
>=20
> I'm wondering if it should be "inhibit_charge" or something like that?

Text and file name also seem to have reverse meaning for me. I
assume the text is the correct one, since it does not seem to
make sense inhibiting discharge. That would result in instant
poweroff on AC loss?

> > Sebastian, I believe that this should be changes to instead be document=
ed
> > in: Documentation/ABI/testing/sysfs-class-power
> > and besides the rename I was wondering if you have any remarks on the p=
roposed
> > API before Nicolo sends out a v2 ?

IIUIC you have 'force_discharge', which basically means the system
is running from battery power despite an AC adapter being connected
and 'inhibit_discharge', which inhibits charging, so system does not
charge battery when AC is connected, but uses AC to supply itself
(so battery is idle)?

We already have this kind of features on embedded systems (which
often provide all kind of charger details). Those drivers solve
this by having a writable 'status' property in the charger device:

What:           /sys/class/power_supply/<supply_name>/status
Date:           May 2007
Contact:        linux-pm@vger.kernel.org
Description:
                Represents the charging status of the battery. Normally this
                is read-only reporting although for some supplies this can =
be
                used to enable/disable charging to the battery.
=20
                Access: Read, Write
=20
                Valid values:
                              "Unknown", "Charging", "Discharging",
                              "Not charging", "Full"

If I do not miss anything writing "Discharging" is the same as forced
discharge and "Not Charging" (AKA Idle) is the same as your inhibit feature.

-- Sebastian

--y5ctd6dbsc6ngys5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBvCjwACgkQ2O7X88g7
+ppFiw//U4cJr3kjLMY9+73ZOpVL3ryvbYxTPLySs/daKHIV3V001X5yQmHumNJ7
oszBdX612YCAuhCqZfwV58Ehbz+0yeZohU4rgt4nme1es+HMObOXUxD1cm7zAJO3
Pgwg3KDgm7OPppQMdeLaBgUBS+5JzE5vRk4DXTg9EqNhqS8APAjaLZktzRv509XL
rWcfL4TspM815qWTou5WQ+wXWcUgIL0u+a1RD+M6u4ZMiEepXlP+FFE5+hMNGsdv
XlfR2eom/4k9RLknlIs0h6E7ZTqc9TJJzNHt+LfE9SAqhToz3B2wYwvu3NRrhJBh
+gMlb+Dds3nnH+4RgcmkWuyib5dNfa1b7DR1SIgpCUVoQdMJ7JqoCzLxnichUDJQ
hAUTTsLnvprn1t5SVHFAluHgCqYNMKvXyOb7kQESTMT25YYYkUUDeQbBlqitJjc+
Vwr//B8ZSCYoUd9MG9/ZAM8cW0YC477DGp0trvkNAVnSD4Xeyi8nwZIkLb/V5St8
PL17AU/Q7K2h1vSw8CMxdAlhwYfHsDZhjFaugedCWjzx+c4P37d/Sqy5iMi2sbK2
q+PyQSms//f8PjBsfF6EhvT5GbeoMyyzdY0o+GHLwKSfSsc+xvIf3XAcF2GiHLpr
S5D4kbyP47SUSUSvgE5WhKI3LJ6xYvEgUdtNiOsxt0zmgVV6/vM=
=Dr09
-----END PGP SIGNATURE-----

--y5ctd6dbsc6ngys5--
