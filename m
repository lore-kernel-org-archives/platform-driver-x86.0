Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D516313E18
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 23:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605044; cv=none; b=nGpRuuEXBeIgUeaG7k7WATbAiJIhB1JkC0sjfX0UuDcRFJ75xeaQXCEzuKI4Zbt89qQUUkSfx8gt9GiEjbSU5aFoKh1Kb3t7godxyVyKW4eIffpCI25MAo/H8Qnx0PYwjFELpCOjhXa0FRv7k7N2diQVdpj2cT54gPlTFxt9POQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605044; c=relaxed/simple;
	bh=TJosHKRGzCY6t3vXfvC5MKeXYQzLJShSr+kT7jDk0IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=at7XSFAMaN294HyKPElw71xqOqqI0Rx9cCYSQ88Vm7ahkevNl2rHjMbfZaAW/IxUhXeMp6EFD9VyTwyiMj5M6G3BeyvT3rGlWAnj/DSM3fRTXNVhzLwg3xsl3qn9Mu+gK8oZ47ZDdJuRLJmsFZqI4Nv0VBHNP3TsS9D7vYxGhic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=mggkpwgY; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="mggkpwgY"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 72A1AC0630
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 01:10:38 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 71B7DC055E
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 01:10:37 +0200 (EET)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id AD8EA202668
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 01:10:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768605036;
	bh=q56jDIRlmSfjLHG7VwrMJyLogHl3eKHzYr+H7yCD34Q=;
	h=Received:From:Subject:To;
	b=mggkpwgY4DY45V29gFgLYnOLBtn0sTOAkqH25dZ54UX1ybkYKyfeTfpcsXfIJg0W5
	 kq2IhihNgUD+621994k0RdHrUmilYtzSOSbUGZnRoeZxtZKwt3rnkdh/arQW9jOD6U
	 REvOhXeZWZicbwrJ6SANyZ2wW+WVeJ9j7+tqPqMnVrU6gEvjgDD56ahS6m2MR0PtBh
	 KMqlASTxc/7PXXaJhuufBmIJGRG1mLUC57gGA2ZmG+Eh1xLd2TYgWVBReFRhizEIor
	 Qcu8hI1FfuwKogeNkCO2KtXrPY3sf2fKUoLb7J0RYNdN1yRkaD86+jTC1Y5Aaw81/p
	 0R7vSQH7MZgvQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-382fea4a160so22487781fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 16 Jan 2026 15:10:36 -0800 (PST)
X-Gm-Message-State: AOJu0YxNXtZNoDaaOAhQrGJbcFHY5V++f25XdfGLqr23r+LgEw+leQ6G
	xK39dtpEPDf2j90ABYkED8B1PW38E4HiAcWTlQW/Wg0xpmKtx/BSu2qwday8npf3Q5BZIaGFnx8
	Tcb3K7YgGp0RdTtcFsiQj3uNDRnFkIbQ=
X-Received: by 2002:a2e:b8ce:0:b0:383:1b54:2f34 with SMTP id
 38308e7fff4ca-383841aa222mr11373641fa.18.1768605036036; Fri, 16 Jan 2026
 15:10:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-3-lkml@antheas.dev>
 <14407ba9-34f1-4114-bfb3-043b53ea7769@linux.dev>
In-Reply-To: <14407ba9-34f1-4114-bfb3-043b53ea7769@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 17 Jan 2026 00:10:24 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGyUpBq4GGvyDHj089a9-vxNOnqgSBys3-CC_+tKDywaA@mail.gmail.com>
X-Gm-Features: AZwV_QhtkpYwWk41tccphCew9AREU1JxoREoh-BtI1M_DPEZu1LK6pZc2FvSnPQ
Message-ID: 
 <CAGwozwGyUpBq4GGvyDHj089a9-vxNOnqgSBys3-CC_+tKDywaA@mail.gmail.com>
Subject: Re: [PATCH v11 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176860503694.1710111.5040801902963932276@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
>
> On 1/16/26 14:31, Antheas Kapenekakis wrote:
>
> > Currently, ID1/ID2 initializations are performed for all NKEY devices.
> > However, ID1 initializations are only required for RGB control and are
> > only supported for RGB capable devices. ID2 initializations are only
> > required for initializing the Anime display endpoint which is only
> > supported on devices with an Anime display. Both of these
> > initializations are out of scope for this driver (this is a brightness
> > control and keyboard shortcut driver) and they should not be performed
> > for devices that do not support them in any case.
> >
> > At the same time, there are older NKEY devices that have only been
> > tested with these initializations in the kernel and it is not possible
> > to recheck them. There is a possibility that especially with the ID1
> > initialization, certain laptop models might have their shortcuts stop
> > working (currently unproven).
> >
> > For an abundance of caution, only initialize ID1/ID2 for those older
> > NKEY devices by introducing a quirk for them and replacing the NKEY
> > quirk in the block that performs the inits with that.
> >
> > In addition, as these initializations might not be supported by the
> > affected devices, change the function to not bail if they fail.
> >
> > Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 323e6302bac5..dc7af12cf31a 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> > +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> These past days I have taken a look at new 2025 models and they do make use of ID2,
> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.

Hi Denis,
it is not the responsibility of this driver. ID2 is used by Anime
models. It is a concession to make sure that we do not cause a
regression that will cause warnings for a lot of users.

> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> No consequences.

In your laptop. In the other user's laptop, the get feature report fails

> Regardless the name is wrong: mine is a 2023 rog strix with
> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> and surely isn't legacy.

Sure, can you try removing the if block?

If it works in your laptop, that is one less reason to keep it for 19b6

Antheas

> >
> >  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >                                                QUIRK_NO_INIT_REPORTS | \
> > @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >               return -ENODEV;
> >
> > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > -             if (ret < 0)
> > -                     return ret;
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> > +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >       }
> >
> >       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >         QUIRK_USE_KBD_BACKLIGHT },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>

On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
>
> On 1/16/26 14:31, Antheas Kapenekakis wrote:
>
> > Currently, ID1/ID2 initializations are performed for all NKEY devices.
> > However, ID1 initializations are only required for RGB control and are
> > only supported for RGB capable devices. ID2 initializations are only
> > required for initializing the Anime display endpoint which is only
> > supported on devices with an Anime display. Both of these
> > initializations are out of scope for this driver (this is a brightness
> > control and keyboard shortcut driver) and they should not be performed
> > for devices that do not support them in any case.
> >
> > At the same time, there are older NKEY devices that have only been
> > tested with these initializations in the kernel and it is not possible
> > to recheck them. There is a possibility that especially with the ID1
> > initialization, certain laptop models might have their shortcuts stop
> > working (currently unproven).
> >
> > For an abundance of caution, only initialize ID1/ID2 for those older
> > NKEY devices by introducing a quirk for them and replacing the NKEY
> > quirk in the block that performs the inits with that.
> >
> > In addition, as these initializations might not be supported by the
> > affected devices, change the function to not bail if they fail.
> >
> > Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 323e6302bac5..dc7af12cf31a 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> > +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> These past days I have taken a look at new 2025 models and they do make use of ID2,
> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
>
> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> No consequences.
>
> Regardless the name is wrong: mine is a 2023 rog strix with
> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> and surely isn't legacy.
> >
> >  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >                                                QUIRK_NO_INIT_REPORTS | \
> > @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >               return -ENODEV;
> >
> > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > -             if (ret < 0)
> > -                     return ret;
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> > +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >       }
> >
> >       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >         QUIRK_USE_KBD_BACKLIGHT },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>

