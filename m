Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7147827A47F
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Dec 2025 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765271569; cv=none; b=BjW1Y53hp0cg4oDtUn6UU1xufbwvf5pwpagiGfGmFwqAS9l4UL+m7Ak7PpEnRYYOiGKzqj3SwkCAKqf5ELQvJlpvmXqbRfHEDodkP+CNDQabqTM3ixsFop7JnKRZQZR7GeMJWgS2oLY2+58X6pcDm9DQXKZmRIKRuh3T+ueBoS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765271569; c=relaxed/simple;
	bh=9zmBbWbRImWRdJgWga8epc3BLm+Rcf1D6zJU+mw+os4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFyb/WUYiuWwqn2jLQrewayASva2JGOARc6kvA7eU2EK/yj5DVwvOMlgJO81H1yFU5MKmTMGUlrPIHR/noqNo40ZvOS7SyN2pUSQH7ibQQJ5GFU+XhU8Az9WLfJCPSt2TmjxctEf+Q66SryThh0VXRf6Mfe9f27zReQ716V47Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QrNFKciX; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QrNFKciX"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id C280943F73
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Dec 2025 09:12:38 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id C587C43F55
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Dec 2025 09:12:37 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id DFB0B1FE5CD
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Dec 2025 11:12:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1765271557;
	bh=3K8QBCeC0fJaTLvxIvNmHdMK3cQJaRit1KWWquGMhsY=;
	h=Received:From:Subject:To;
	b=QrNFKciXqBsuc9WSrAe2e7m0fOdIWOk33hL17irzQzQVH7Nvg4FzsMaaOYf4C+X9B
	 Rgh+xRnE0Et0fkstgE+/+fVqfdY+A8y4X2JRvenYgRPHJRaNlncPsE1NHeZCV7ik/e
	 lQgY6uhrpXu0rifLDYk1ChJAYEl+dTyzAO0PwLUwN0fsZCIYFX4BbFy8WUx8+RpbVu
	 GPYShs8PY6Oevi3hkpwaR9VEPwyKSvdHVTDVgGZLwPyW7l8SAtxk9yKkscaj/yqNjm
	 RPF3eZNVkxMk3FnjApLWDc7GwdC/IB1pMnYLAhJu75oiUpF33y0M0afOzcFjOeLPzc
	 a8fXbWwDpnITw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37d13ddaa6aso34972721fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 09 Dec 2025 01:12:36 -0800 (PST)
X-Gm-Message-State: AOJu0Yz4uOGylRdc3CpYN/lySwmnoiC5v29UwQc/obD5Zk7ks8yLw6Gl
	DydmewoCAx60I72zy0XnV1dJPmAx/UpuEwAmUP+gzlRdWFIuH8BozlKq+wouq+05BqacvfO9faX
	Ez3VBvwkIueKR4H0KBB/7vq04vA41QWY=
X-Google-Smtp-Source: 
 AGHT+IFdWBDjquv9IWBtiFHrZuzYYdRUDlIq8aohdZDAnNGIYdA3mm9ciblhnYrIzcaGCnKre0tGSwciqsjgfowKEjg=
X-Received: by 2002:a05:651c:31cf:b0:37c:c370:60a3 with SMTP id
 38308e7fff4ca-37ec5079e31mr24542801fa.0.1765271556329; Tue, 09 Dec 2025
 01:12:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-6-lkml@antheas.dev>
 <8e3817f1-73e8-6f61-3eca-e45aa4d46af3@linux.intel.com>
In-Reply-To: <8e3817f1-73e8-6f61-3eca-e45aa4d46af3@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 9 Dec 2025 10:12:23 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEN-Rzjk2nZ9mbROE2vbiQ4LUiTn5OB6mKSfArRwDgL7Q@mail.gmail.com>
X-Gm-Features: AQt7F2r4d2I2mYtDrrVzWy7wlOq-9Y_8c2lXl7IdlFgpc70msYGHl4IBehsd7B4
Message-ID: 
 <CAGwozwEN-Rzjk2nZ9mbROE2vbiQ4LUiTn5OB6mKSfArRwDgL7Q@mail.gmail.com>
Subject: Re: [PATCH v10 05/11] HID: asus: move vendor initialization to probe
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176527155727.2174971.4458819111260907195@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 8 Dec 2025 at 18:11, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 22 Nov 2025, Antheas Kapenekakis wrote:
>
> > ROG NKEY devices have multiple HID endpoints, around 3-4. One of those
> > endpoints has a usage page of 0xff31, and is the one that emits keyboar=
d
> > shortcuts and controls RGB/backlight. Currently, this driver places
> > the usage page check under asus_input_mapping and then inits backlight
> > in asus_input_configured which is unnecessarily complicated and prevent=
s
> > probe from performing customizations on the vendor endpoint.
> >
> > Simplify the logic by introducing an is_vendor variable into probe that
> > checks for usage page 0xff31. Then, use this variable to move backlight
> > initialization into probe instead of asus_input_configured, and remove
> > the backlight check from asus_input_mapping.
>
> In the changelogs, please add () after any name that refers to a C
> function so the reader immediately knows you're talking about a function.

Sure. What should be my timeline for fixing this?

I assume we missed the merge window. If not, I can tweak the series
and send it later today

Antheas

> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 35 ++++++++++++++++++-----------------
> >  1 file changed, 18 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 2a412e10f916..faac971794c0 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -48,6 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define T100CHI_MOUSE_REPORT_ID 0x06
> >  #define FEATURE_REPORT_ID 0x0d
> >  #define INPUT_REPORT_ID 0x5d
> > +#define HID_USAGE_PAGE_VENDOR 0xff310000
> >  #define FEATURE_KBD_REPORT_ID 0x5a
> >  #define FEATURE_KBD_REPORT_SIZE 64
> >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > @@ -127,7 +128,6 @@ struct asus_drvdata {
> >       struct input_dev *tp_kbd_input;
> >       struct asus_kbd_leds *kbd_backlight;
> >       const struct asus_touchpad_info *tp;
> > -     bool enable_backlight;
> >       struct power_supply *battery;
> >       struct power_supply_desc battery_desc;
> >       int battery_capacity;
> > @@ -318,7 +318,7 @@ static int asus_e1239t_event(struct asus_drvdata *d=
rvdat, u8 *data, int size)
> >  static int asus_event(struct hid_device *hdev, struct hid_field *field=
,
> >                     struct hid_usage *usage, __s32 value)
> >  {
> > -     if ((usage->hid & HID_USAGE_PAGE) =3D=3D 0xff310000 &&
> > +     if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_USAGE_PAGE_VENDOR &&
> >           (usage->hid & HID_USAGE) !=3D 0x00 &&
> >           (usage->hid & HID_USAGE) !=3D 0xff && !usage->type) {
> >               hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02=
x\n",
> > @@ -941,11 +941,6 @@ static int asus_input_configured(struct hid_device=
 *hdev, struct hid_input *hi)
> >
> >       drvdata->input =3D input;
> >
> > -     if (drvdata->enable_backlight &&
> > -         !asus_kbd_wmi_led_control_present(hdev) &&
> > -         asus_kbd_register_leds(hdev))
> > -             hid_warn(hdev, "Failed to initialize backlight.\n");
> > -
> >       return 0;
> >  }
> >
> > @@ -1018,15 +1013,6 @@ static int asus_input_mapping(struct hid_device =
*hdev,
> >                       return -1;
> >               }
> >
> > -             /*
> > -              * Check and enable backlight only on devices with UsageP=
age =3D=3D
> > -              * 0xff31 to avoid initializing the keyboard firmware mul=
tiple
> > -              * times on devices with multiple HID descriptors but sam=
e
> > -              * PID/VID.
> > -              */
> > -             if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
> > -                     drvdata->enable_backlight =3D true;
> > -
> >               set_bit(EV_REP, hi->input->evbit);
> >               return 1;
> >       }
> > @@ -1143,8 +1129,11 @@ static int __maybe_unused asus_reset_resume(stru=
ct hid_device *hdev)
> >
> >  static int asus_probe(struct hid_device *hdev, const struct hid_device=
_id *id)
> >  {
> > -     int ret;
> > +     struct hid_report_enum *rep_enum;
> >       struct asus_drvdata *drvdata;
> > +     struct hid_report *rep;
> > +     bool is_vendor =3D false;
> > +     int ret;
> >
> >       drvdata =3D devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL=
);
> >       if (drvdata =3D=3D NULL) {
> > @@ -1228,12 +1217,24 @@ static int asus_probe(struct hid_device *hdev, =
const struct hid_device_id *id)
> >               return ret;
> >       }
> >
> > +     /* Check for vendor for RGB init and handle generic devices prope=
rly. */
> > +     rep_enum =3D &hdev->report_enum[HID_INPUT_REPORT];
> > +     list_for_each_entry(rep, &rep_enum->report_list, list) {
> > +             if ((rep->application & HID_USAGE_PAGE) =3D=3D HID_USAGE_=
PAGE_VENDOR)
> > +                     is_vendor =3D true;
> > +     }
> > +
> >       ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
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
> >        * Check that input registration succeeded. Checking that
> >        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> >
>
> --
>  i.
>
>

