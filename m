Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B48D1FF7C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471248; cv=none; b=PxjzgBbR7cs2QLuU1uy/gsm09FKpp/c6rllrhOEH44NMqm8t03i0D6bRH2ysfe5nLHChmkutTc7bbrSiJ4zocmaLL0sv5acx8wVqozrOMGMz1aNTyOA2iI5ER1fCAB2UA/l/r4dpUlx2VRbn9kULEL3ZAwFra6vs3H2NCRdJIWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471248; c=relaxed/simple;
	bh=/9bo5d8b3OD+SMkpRRyp/K+vofrjtZMB5EnTEZph2Wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjJVu0RsRgSK054xmWXIDW388iR2FSvJ4Y+BwfZc2DAJN2ro63T3avPJohPH42PM3rnRK4FHeRIlTs0e1kT0wtIZEXSyvujBawsGbD5tDfz5BQcBLwaVtKdTMbIlXvtovzDUOn0ikCt8gp6dKcLbd+NFAHWpI+LYcpofR1sGEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VomHUiYl; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VomHUiYl"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id B3BB244028
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 13:07:23 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id E3B8E4411E
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 13:07:22 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4BD0D200B91
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 15:07:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763471242;
	bh=cTSb5c4hQLUTbwYrYNlSOdNQhRNCsvRe4wk/r4ySSp8=;
	h=Received:From:Subject:To;
	b=VomHUiYlLKhDk/ubGfuM4OKT/BUMmu7m7x0mIK2JS6GJ/XmcAwIKCvokk4Ii1s0xt
	 VXpKtjwr5cIvHiZakRmyX0D9AB+UC+708oUsRnu2N1Q7A4HNktm1kmtHQsnBWp0qU2
	 S8mMeJJj6RwBwG4RXlalJVESHrNKr419RlJa12Oqe4iupwQouyerlS2gyu6nAIEr8q
	 HmQ1MFun3jz7z1Un8ICHrnFHvy3UlpHegFEl76yk7hHTiMNjK+TCFbMd1g6jmBYMiT
	 Z94HKWszLGPMLAy/WvgLMtnhIsA7Uj3pPLYxiX6FRUZHt3f1OzOcOcIR1IysY6I0S1
	 84yrk7dC5nJnA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-37b95f87d64so37749591fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 18 Nov 2025 05:07:22 -0800 (PST)
X-Gm-Message-State: AOJu0YwEaL6fG6BXbAgN23ZjfgWJ0WYcHVHQOjj2/lgwN8Im62mTSRzh
	YJjmi8EXHtmpqOUstOTK7y/BV1pDOiq4oxEbB1ZBQPMWjFsbubNkUduOg0NtKjjpuCO8xAFbom+
	LwwBwpwa8xxWAu9PkdmpN/bzHDTvK0a0=
X-Google-Smtp-Source: 
 AGHT+IFTsgF00L5SeAmJ4YXuUbCI69PSEEgep+CPxYlQ7JBu4lAGduk0h8hdvTBwBslL3PnTykwT8plgiVwlOF8qhJM=
X-Received: by 2002:a05:6512:4017:b0:594:26d7:c443 with SMTP id
 2adb3069b0e04-595842620d0mr5806343e87.39.1763471241808; Tue, 18 Nov 2025
 05:07:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-2-lkml@antheas.dev>
 <3018f443-e1af-7a93-f0f2-558364ecb9eb@linux.intel.com>
In-Reply-To: <3018f443-e1af-7a93-f0f2-558364ecb9eb@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 18 Nov 2025 14:07:10 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEen-gfuSKhRFXD3i7RpZUVWED+EJnA8R1aYYNs2SaWcA@mail.gmail.com>
X-Gm-Features: AWmQ_bnIAqkkumNdiVBzIEWXbkPL3duI035WlVyD4oV0o1_vJ7uqBLD0n5as1EM
Message-ID: 
 <CAGwozwEen-gfuSKhRFXD3i7RpZUVWED+EJnA8R1aYYNs2SaWcA@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] HID: asus: simplify RGB init sequence
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176347124247.3380048.4011355558938009412@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 18 Nov 2025 at 13:23, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
>
> > Currently, RGB initialization forks depending on whether a device is
> > NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
> > endpoints, and non-NKEY devices with 0x5a and then a
> > backlight check, which is omitted for NKEY devices.
> >
> > Remove the fork, using a common initialization sequence for both,
> > where they are both only initialized with 0x5a, then checked for
> > backlight support. This patch should not affect existing functionality.
> >
> > 0x5d and 0x5e endpoint initializations are performed by Windows
> > userspace programs associated with different usages that reside under
> > the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
> > controls RGB and 0x5e by an animation program for certain Asus laptops.
> > Neither is used currently in the driver.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
> >  1 file changed, 19 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index a444d41e53b6..7ea1037c3979 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_devi=
ce *hdev)
> >       unsigned char kbd_func;
> >       int ret;
> >
> > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > -             /* Initialize keyboard */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             /* The LED endpoint is initialised in two HID */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > -             if (ret < 0)
> > -                     return ret;
>
> This removal of FEATURE_KBD_LED_REPORT_ID2 should definitely be in own
> patch so a focused changelog can be written to it (who said it's
> acceptable, etc. included) and it can be pinpointed with bisect if it
> causes any issues (but I'm not entirely sure what Denis' stance is on thi=
s
> removal so it's going to be subject to some further scrunity, but in any
> case it must be in own patch if to be accepted).

Yeah this is a fair approach.

> I'm wondering though if QUIRK_ROG_NKEY_LEGACY could also cover this? At
> least it would look a path of less resistance when it comes to Denis'
> stance and would decouple the remove or not controversy from acceptance o=
f
> this series.

So a way forward would be on the simplify patch, to use an if rog
statement to do ID1 and ID2 and then on the next patch replace the
quirk in the if check with the legacy quirk. This is ok with me, as
those are older devices.

Antheas

> --
>  i.
>
> > -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > -                     ret =3D asus_kbd_disable_oobe(hdev);
> > -                     if (ret < 0)
> > -                             return ret;
> > -             }
> > -
> > -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > -                     intf =3D to_usb_interface(hdev->dev.parent);
> > -                     udev =3D interface_to_usbdev(intf);
> > -                     validate_mcu_fw_version(hdev,
> > -                             le16_to_cpu(udev->descriptor.idProduct));
> > -             }
> > +     ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -     } else {
> > -             /* Initialize keyboard */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > +     /* Get keyboard functions */
> > +     ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPOR=
T_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -             /* Get keyboard functions */
> > -             ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_K=
BD_REPORT_ID);
> > +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > +             ret =3D asus_kbd_disable_oobe(hdev);
> >               if (ret < 0)
> >                       return ret;
> > +     }
> >
> > -             /* Check for backlight support */
> > -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > -                     return -ENODEV;
> > +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > +             intf =3D to_usb_interface(hdev->dev.parent);
> > +             udev =3D interface_to_usbdev(intf);
> > +             validate_mcu_fw_version(
> > +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
> >       }
> >
> > +     /* Check for backlight support */
> > +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > +             return -ENODEV;
> > +
> >       drvdata->kbd_backlight =3D devm_kzalloc(&hdev->dev,
> >                                             sizeof(struct asus_kbd_leds=
),
> >                                             GFP_KERNEL);
> >
>

