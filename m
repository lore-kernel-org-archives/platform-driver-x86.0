Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A38344051
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761244070; cv=none; b=O8CfPbCAHdI2RwTz6ndP/7tR9zfVGH68Bijy/HqIm35WTtWVGdg26cqsEvxJ/vPvo7mfmi941w4G0vB1TiIUvVFQnNZxaB+r6SrkCIazhSt4R7YNVHgL/miAAWmiVa3WX1Scnvgkh+1763fsJ953ZRUsrjcsdrr/ZTgs2XewkfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761244070; c=relaxed/simple;
	bh=Dqmhx2T8Z4PUBHkc0XnnJwfmL/y9EVJ2+HpMIXQjexM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Egs286O+q6+k1Kro++lU/1TXwjRQ8CjawV1IKVCt409xDJHAkUcvXZBwKRzqcn65Qm+73J45kNr2FChHCTNozQ6zS/tfg1eyjNjH+FAY+FEGBqi4wx+34FysCxCngh1BlkFfXFtiUIZYfJCaNfP752sdGRXVwHva+NvufAgGBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VezrEuq9; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VezrEuq9"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 844C545BAA
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 21:27:46 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 9497445B9C
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 21:27:45 +0300 (EEST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B88601FFE44
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 21:27:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761244065;
	bh=YS/72VHhH/g/YFNa4ff51+NZvroLJ77Vov5cSnMbTD4=;
	h=Received:From:Subject:To;
	b=VezrEuq9EDPF70CuwrEa2faTdBu2wn1DSrucqZf5vZnMqPTZiKM2EnvpJdBbtlPix
	 HthIkMnSEFNbnoOpm1Cw8AHdYBpCqKRy0bQPok9Q1Fei7JTYkUX4B5TGRlGOzlZON9
	 mAU4gtbrFuWRcNm6RDMTYZlEPTPFgaMdX/q428wFs9/F0Mwi3PTkogI7gjJfSa21qr
	 0cpm32uLtR9DpCb8Eo4cDo2DnfSx20uZ8V+ip88pEwg/eVW3BBKWP3ze9Z5tPKLzp5
	 qdi6L5dZacsI+TbVsfZHGsLrDyDt+3iL0PRYqOWyncTHbRUOmw0NbWXh0S9YMZ0hru
	 NJNSMZNdn7D/A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.48) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f48.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-592f1988a2dso1963718e87.0
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 23 Oct 2025 11:27:44 -0700 (PDT)
X-Gm-Message-State: AOJu0YzaFLDp/m1c1vMd/1V44CP3nk/wz+PxhzvMMWNrl//1dqay4j9j
	C/bBs4jg/vliNBScYl3KN0KK5frUwmoMl2anGPNKKODaEI70W7llU5M0wqTZAwKE742jyyk6UUz
	tVeU9Kjsa+V021R9PmFTnuuaF7lZbHHQ=
X-Google-Smtp-Source: 
 AGHT+IHilJ4ewlHSY4xggMhYaacCiDaa1aE1mkJY+Ltinfbu2Uaioj7vl798C2CEKwXIMBC7drdEmuXC3d2pPsrSukk=
X-Received: by 2002:a05:651c:3136:b0:376:3792:1a9b with SMTP id
 38308e7fff4ca-378cf944538mr19889991fa.21.1761244064142; Thu, 23 Oct 2025
 11:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018101759.4089-1-lkml@antheas.dev>
 <20251018101759.4089-5-lkml@antheas.dev>
 <f1d2dece-6e51-4092-9f2e-58dc93508a25@gmail.com>
In-Reply-To: <f1d2dece-6e51-4092-9f2e-58dc93508a25@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 23 Oct 2025 20:27:32 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGzN9Z5iQAVeYbmmAAf9jxhTw5Yy8f36BfwYdgN45kqNA@mail.gmail.com>
X-Gm-Features: AWmQ_bms1zXHxIp5gYKbu1d_fiWt-GifAEGH7Jd-F-Qmm03vnpBn86iRp-VuEP8
Message-ID: 
 <CAGwozwGzN9Z5iQAVeYbmmAAf9jxhTw5Yy8f36BfwYdgN45kqNA@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] HID: asus: prevent binding to all HID devices on
 ROG
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176124406511.1372891.15621526825130123494@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 23 Oct 2025 at 20:23, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 10/18/25 12:17, Antheas Kapenekakis wrote:
> > Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
> > event devices with a pretty ASUSTEK name. When it loads, it concatenates
> > all applications per HID endpoint, renames them, and prints errors
> > when some of them do not have an input device.
> >
> > Therefore, change probe so that this is no longer the case. Stop
> > renaming the devices, omit the check for .input which causes errors on
> the devices -> devices
> > e.g., the Z13 for some hiddev only devices, and add
> > HID_QUIRK_INPUT_PER_APP so that each application gets its own event.
>
> event -> event device (or evdev?)
>
> It is not clear from the message what HID_QUIRK_INPUT_PER_APP has to do with
> renaming the devices/having one evdev vs multiple: please make
> it explicit in the commit message (and perhaps make explicit if (and how),
> in case it could make any difference, how programs might change
> theirs behavior as a consequence).
>
> I like the fact that userspace only sees one keyboard for what is,
> effectively, one keyboard device.
>
> The code looks good to me: make the commit message more
> explanatory and I'll include my reviewed-by.

If I respin the series to a v8 I will reword this patch subject.

Antheas

> Thanks,
> Denis
>
> > When this is done, the probes are called multiple times. Due to this,
> > the rgb check needs to be moved into probe, and the report fixup should
> > be skipped for non-vendor endpoints (prevents multiple prints).
> >
> > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 59 +++++++++++++++++++++++++++---------------
> >  1 file changed, 38 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 03f0d86936fc..bbbac98f76c6 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -47,6 +47,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define T100CHI_MOUSE_REPORT_ID 0x06
> >  #define FEATURE_REPORT_ID 0x0d
> >  #define INPUT_REPORT_ID 0x5d
> > +#define HID_USAGE_PAGE_VENDOR 0xff310000
> >  #define FEATURE_KBD_REPORT_ID 0x5a
> >  #define FEATURE_KBD_REPORT_SIZE 64
> >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > @@ -89,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> > +#define QUIRK_SKIP_REPORT_FIXUP              BIT(14)
> >
> >  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >                                                QUIRK_NO_INIT_REPORTS | \
> > @@ -125,7 +127,6 @@ struct asus_drvdata {
> >       struct input_dev *tp_kbd_input;
> >       struct asus_kbd_leds *kbd_backlight;
> >       const struct asus_touchpad_info *tp;
> > -     bool enable_backlight;
> >       struct power_supply *battery;
> >       struct power_supply_desc battery_desc;
> >       int battery_capacity;
> > @@ -316,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
> >  static int asus_event(struct hid_device *hdev, struct hid_field *field,
> >                     struct hid_usage *usage, __s32 value)
> >  {
> > -     if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> > +     if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
> >           (usage->hid & HID_USAGE) != 0x00 &&
> >           (usage->hid & HID_USAGE) != 0xff && !usage->type) {
> >               hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> > @@ -931,11 +932,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
> >
> >       drvdata->input = input;
> >
> > -     if (drvdata->enable_backlight &&
> > -         !asus_kbd_wmi_led_control_present(hdev) &&
> > -         asus_kbd_register_leds(hdev))
> > -             hid_warn(hdev, "Failed to initialize backlight.\n");
> > -
> >       return 0;
> >  }
> >
> > @@ -1008,15 +1004,6 @@ static int asus_input_mapping(struct hid_device *hdev,
> >                       return -1;
> >               }
> >
> > -             /*
> > -              * Check and enable backlight only on devices with UsagePage ==
> > -              * 0xff31 to avoid initializing the keyboard firmware multiple
> > -              * times on devices with multiple HID descriptors but same
> > -              * PID/VID.
> > -              */
> > -             if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
> > -                     drvdata->enable_backlight = true;
> > -
> >               set_bit(EV_REP, hi->input->evbit);
> >               return 1;
> >       }
> > @@ -1133,8 +1120,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
> >
> >  static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >  {
> > -     int ret;
> > +     struct hid_report_enum *rep_enum;
> >       struct asus_drvdata *drvdata;
> > +     struct hid_report *rep;
> > +     int ret, is_vendor = 0;
> >
> >       drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
> >       if (drvdata == NULL) {
> > @@ -1218,18 +1207,42 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >               return ret;
> >       }
> >
> > +     /* Check for vendor for RGB init and handle generic devices properly. */
> > +     rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
> > +     list_for_each_entry(rep, &rep_enum->report_list, list) {
> > +             if ((rep->application & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR)
> > +                     is_vendor = true;
> > +     }
> > +
> > +     /*
> > +      * For ROG keyboards, make them HID/hiddev compliant by creating one
> > +      * input per application. For interfaces other than the vendor one,
> > +      * disable report fixups.
> > +      */
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > +             if (!is_vendor)
> > +                     drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
> > +             hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> > +     }
> > +
> >       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> >       if (ret) {
> >               hid_err(hdev, "Asus hw start failed: %d\n", ret);
> >               return ret;
> >       }
> >
> > +     if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> > +         !asus_kbd_wmi_led_control_present(hdev) &&
> > +         asus_kbd_register_leds(hdev))
> > +             hid_warn(hdev, "Failed to initialize backlight.\n");
> > +
> >       /*
> > -      * Check that input registration succeeded. Checking that
> > -      * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> > -      * were freed during registration due to no usages being mapped,
> > -      * leaving drvdata->input pointing to freed memory.
> > +      * For ROG keyboards, skip rename for consistency and ->input check as
> > +      * some devices do not have inputs.
> >        */
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> > +             return 0;
> > +
> >       if (!drvdata->input || !(hdev->claimed & HID_CLAIMED_INPUT)) {
> >               hid_err(hdev, "Asus input not registered\n");
> >               ret = -ENOMEM;
> > @@ -1352,6 +1365,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> >               rdesc = new_rdesc;
> >       }
> >
> > +     /* Vendor fixups should only apply to NKEY vendor devices. */
> > +     if (drvdata->quirks & QUIRK_SKIP_REPORT_FIXUP)
> > +             return rdesc;
> > +
> >       if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> >                       *rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
> >                       rdesc[204] == 0x95 && rdesc[205] == 0x05) {
>

