Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB13F34B1A9
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242816; cv=none; b=YrpFLYx2/G03aUmEpchdOwdEJI34zJRezIWTE61hBoLQo8fmoilUXpSnfgXF6ia6vOCoM35o1tZhpBrVuJr/YUNhGacwYVMr/rkMeiripM5YA76GvtrH3lDbO9ILFtZZUbVTDJk9NwkNRdMKOd1hQrpICNRpwmTPx4YKAzUm7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242816; c=relaxed/simple;
	bh=ppj0zcw0nPTgt5YFcPTF4lftuYec/xhtUP33N63ySMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvdL1GcUChITcjuZH4TS6cMV6iTou5Y/9N+KM5ReQh6iS29zuJgO2dG0QJpN37CR1Xc5uh3nuK/DVAEAlzHRKtU76n7Kjt+Mvo/7if4dRd8dSKifvmqZO8PRCdYpDW4vqlEQ7Dkop2LccnL5iY/vBwpcnKAlzhLdwTMHFjluRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QyIJIwJx; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QyIJIwJx"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id B6F20BDC05
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 21:06:51 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id B6F06BCF2D
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 21:06:47 +0300 (EEST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D511D200A4D
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 21:06:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761242807;
	bh=m14a92JklS8k80iJ56VPWp9IsKb1nU+gd3TmcV65a5U=;
	h=Received:From:Subject:To;
	b=QyIJIwJxiTIyIs/UPjLVCPi/blbpz8BkZ8dSXRS5HHV2oj9lLsQMN31/7o3wlDfWq
	 IU+szWfQXKmjRJ+yfp6h2EDkkfjU7/50RCKhff5bbGwr5NFtNXAQcmP7D9sczzyIrv
	 duVghqqVPW6Nwuq1ODmhfKScPt/vThmurQcAiayk4M/l9CriKtWqXmp4wvUiSqgtN9
	 ONAR9AkasV4SaeyUSaCVnJReV0aCKzCFyE9her6VykMEGDlZBqQkDxuDJV6CJ3rfzA
	 IZD3MVEq6FV4if6GxXEfYkAprckxRYfK3abJEI7dTetgw4wj2ZTsBCsXtA4lIBsrAV
	 9zjF44uizh15A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3737d0920e6so17545181fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 23 Oct 2025 11:06:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YzfHmYhGOeS6ByogDg2AhKtxP7mX9YGoPX6Qd39qsV6dHjbMxw2
	iSKTmOuJkjDgcf0q/OT67ZmYiF6WNDX+W5mudwAW1eBMKBlpK3uZ4YqA0obTQBzwszJfj4ZsSbl
	Tr4f4y5I1MhnOdhAmBgQTi3ZNGDPC880=
X-Google-Smtp-Source: 
 AGHT+IFcUgsgSdTJiZj1AqDBjAMYFbKScOYBIhn/+8PQKtOpHY4PRYrVoOocH9TesdLvOUYCW49wRox7xM007Wsi58E=
X-Received: by 2002:a2e:a98c:0:b0:378:dd0a:4233 with SMTP id
 38308e7fff4ca-378dd0a455cmr9957901fa.17.1761242806227; Thu, 23 Oct 2025
 11:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018101759.4089-1-lkml@antheas.dev>
 <20251018101759.4089-2-lkml@antheas.dev>
 <e6328da3-8099-4540-9cb0-4fc28b359ee7@gmail.com>
In-Reply-To: <e6328da3-8099-4540-9cb0-4fc28b359ee7@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 23 Oct 2025 20:06:34 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG+gf09PQf9o9YkKFYVgVn-1w5CDVrpOe4uFavVYCNijQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmsy9CCcsdB92GuTUjf8GbwA3AnnHeLMMwi-B00I8zG6wET36zOcRfpf80
Message-ID: 
 <CAGwozwG+gf09PQf9o9YkKFYVgVn-1w5CDVrpOe4uFavVYCNijQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] HID: asus: simplify RGB init sequence
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176124280723.1275306.9204647269060401442@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 23 Oct 2025 at 19:38, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 10/18/25 12:17, Antheas Kapenekakis wrote:
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
> What benefits do we get from removing the unused initialization?
>
> If this has never caused any troubles I don't see the reason for removing
> them. Moreover the lighting protocol is known and I might as well add
> support for it in the near future,

I already have a patch that adds RGB and delay inits that endpoint. It
got removed to make this easier to merge. See [1].

[1] https://lore.kernel.org/lkml/20250324210151.6042-10-lkml@antheas.dev/

> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
> >  1 file changed, 19 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index a444d41e53b6..7ea1037c3979 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >       unsigned char kbd_func;
> >       int ret;
> >
> > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > -             /* Initialize keyboard */
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             /* The LED endpoint is initialised in two HID */
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > -                     ret = asus_kbd_disable_oobe(hdev);
> > -                     if (ret < 0)
> > -                             return ret;
> > -             }
> > -
> > -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > -                     intf = to_usb_interface(hdev->dev.parent);
> > -                     udev = interface_to_usbdev(intf);
> > -                     validate_mcu_fw_version(hdev,
> > -                             le16_to_cpu(udev->descriptor.idProduct));
> > -             }
> > +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -     } else {
> > -             /* Initialize keyboard */
> > -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > +     /* Get keyboard functions */
> > +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -             /* Get keyboard functions */
> > -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> > +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > +             ret = asus_kbd_disable_oobe(hdev);
> >               if (ret < 0)
> >                       return ret;
> > +     }
> >
> > -             /* Check for backlight support */
> > -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > -                     return -ENODEV;
> > +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > +             intf = to_usb_interface(hdev->dev.parent);
> > +             udev = interface_to_usbdev(intf);
> > +             validate_mcu_fw_version(
> > +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
> >       }
> >
> > +     /* Check for backlight support */
> > +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > +             return -ENODEV;
> > +
> >       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
> >                                             sizeof(struct asus_kbd_leds),
> >                                             GFP_KERNEL);
>

