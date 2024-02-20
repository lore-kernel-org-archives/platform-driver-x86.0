Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1FC433B3
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Feb 2024 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708399352; cv=none; b=hRN02T6Wqv0fqOPXl9tEhq+mh6vTRwzuh7fi+l6TynA8mwyWgysmkCpvGAHZHm7Xu4sB1Z63HfuQPHUr7mEo0439OQkBrE29NB3eKgj+eY7TJHXczSv30FFtZDg9gPg6//m4W8IdkJeZ6myMpwmJLgBS2cUf6P/FskYi9DVeFkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708399352; c=relaxed/simple;
	bh=rfzvkOhB9n0o92OjX4KVr3WKohjSPYI1immR2QTUzzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0uB2sAl9dswdiWVr+5zJLUN7kwXIM/rO8H2TEffeFzp45R4n0zVsR+cIASCwoIgxdvW9pHJeE2tS+Uakm0GixdYFHOND4ZxuSPPZduTPwGeOMZGR3NmDABVQvsIAObXAajbY3J2F+4HeMA7Y3KHeoPMl8NtbWiVuqqsCOecKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dnw2gAO6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dnw2gAO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708399349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgZ3DZJH6yJf4Z505nsD03xy3EYWtnd7biAaT8oFQxQ=;
	b=Dnw2gAO6ll3fRzCzyrGjQ8o4exoMS0WNdrIkiFcUoHW5Hqk7z0QFLa7Y4sh5gbb3fNdbrN
	ffmSaDRtbWrmEqwJlJdbbHaKa6ihIUiRBV+3AK23xyfzZcc8Sb/o6YB3nYaVpvgfui37a8
	LTFRrlUN1AgeN9TOhSWjXMAX6KCZib8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-ACB2AgBUM4mMcv6FX9Q8Pg-1; Mon, 19 Feb 2024 22:22:27 -0500
X-MC-Unique: ACB2AgBUM4mMcv6FX9Q8Pg-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-299727c3e8bso2130734a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 19:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708399346; x=1709004146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgZ3DZJH6yJf4Z505nsD03xy3EYWtnd7biAaT8oFQxQ=;
        b=NmICv7KVAp0VFIqEKsfUAfoEbqBMteyQ6/PhtIHCbySgH6sV7+Hmhd4bLwQYM5uRqu
         WCET6KHeS65zCOYREcrH5l5XC4lcCRG1snJHmcYFnkr0XqJAPZM8X8bL6+KwLi0ptDgZ
         w8XfrML7AUX7qzDSblcOL8AH3aC69if/titwc26x0KEhwT8ziJTKIfbsnoZuIBfh3dEK
         t94ZmhAwfmnVW9XOfQeLEJIe8dKypCCGEX8N8vtOp4vJVwExVUYunmHhqilaMbjq93KP
         xZAuIZX6U/pSzM5Zw6y/C6TgHth3FI3d2JYUhwhvD/qBjjCAO8B8cE2U93pC2TIQ7Y6E
         Pc5w==
X-Forwarded-Encrypted: i=1; AJvYcCWhPvsfGkmisvrMAo7Sv3sdeiUS4CH2owgFQPooa+1P79uIGToWByrtb8rfgwCI+3NIgFbo3cKTCT26dk3FX/0uo5TpKbbZnl+MPMFjCF17/2AFxg==
X-Gm-Message-State: AOJu0YwO9B2iBfrP3PU7Ei9zrvSRf7rCk/eOPcV3Wdw2xckd+tag2qLw
	xzf8tqsjixtp055yUWfxY5fpeB1j3RW7Zuj/Mgxyf4HRbKn/v3ryx6MZotzOMwIapConSDj0Dwp
	NgDIkR8pM5msNrb3/QO2Gs7uj/baSle8rDPugrN28eWLKwOobgk6eyEbGGVd30fo4iVaNx/TsBr
	aHUtZ5Ci3tntF6OufjqjUjGdhMgNigkiJmjbyXjdJOCJOj4abxIClnu/zd
X-Received: by 2002:a17:90a:e010:b0:299:24a6:1345 with SMTP id u16-20020a17090ae01000b0029924a61345mr10416898pjy.43.1708399346041;
        Mon, 19 Feb 2024 19:22:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJn8WOloMjV6gvuqKoLn4qySk/Bd6ceru9E0EPfES9GwATAvvxLWnFRT8XZMJvH6ANwk3LY0y8zZGaS+pb+AM=
X-Received: by 2002:a17:90a:e010:b0:299:24a6:1345 with SMTP id
 u16-20020a17090ae01000b0029924a61345mr10416882pjy.43.1708399345625; Mon, 19
 Feb 2024 19:22:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216160526.235594-1-hpa@redhat.com> <20240216160526.235594-2-hpa@redhat.com>
 <a62e3df9-b111-4093-a9de-cc7897f1b306@redhat.com>
In-Reply-To: <a62e3df9-b111-4093-a9de-cc7897f1b306@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 20 Feb 2024 11:22:14 +0800
Message-ID: <CAEth8oGN6pwWxjsHb25cnU_wvCKhLYJWogJj-zPOke1vHrkm8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Feb 19, 2024 at 10:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi Kate,
>
> On 2/16/24 17:05, Kate Hsuan wrote:
> > There is a KTD2026 LED controller to manage the indicator LED for Xiaom=
i
> > pad2. The ACPI for it is not properly made so the kernel can't get
> > a correct description of it.
> >
> > This work add a description for this RGB LED controller and also set a
> > trigger to indicate the chaging event (bq27520-0-charging). When it is
> > charging, the indicator LED will be turn on.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
> >  .../x86/x86-android-tablets/shared-psy-info.h |  2 +
> >  2 files changed, 87 insertions(+)
> >
> > diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers=
/platform/x86/x86-android-tablets/other.c
> > index bc6bbf7ec6ea..542ef6667b7b 100644
> > --- a/drivers/platform/x86/x86-android-tablets/other.c
> > +++ b/drivers/platform/x86/x86-android-tablets/other.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/gpio/machine.h>
> >  #include <linux/input.h>
> >  #include <linux/platform_device.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  #include "shared-psy-info.h"
> >  #include "x86-android-tablets.h"
> > @@ -593,6 +594,87 @@ const struct x86_dev_info whitelabel_tm800a550l_in=
fo __initconst =3D {
> >       .gpiod_lookup_tables =3D whitelabel_tm800a550l_gpios,
> >  };
> >
> > +/*
> > + * The fwnode for ktd2026 on Xaomi pad2. It composed of a RGB LED node
> > + * with three subnodes for each color (B/G/R). The RGB LED node is nam=
ed
> > + * "multi-led" to align with the name in the device tree.
> > + */
> > +
> > +/* main fwnode for ktd2026 */
> > +static const struct software_node ktd2026_node =3D {
> > +};
> > +
> > +static const struct property_entry ktd2026_rgb_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 0),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> > +     PROPERTY_ENTRY_STRING("function", "indicator"),
> > +     PROPERTY_ENTRY_STRING("linux,default-trigger",
> > +                           "bq27520-0-charging"),
> > +
> > +     { }
> > +};
>
> What is the result of setting this default trigger on
> the multi-color LED class device ?

Thank you for reviewing it.

>
> Will the LED now turn on at whatever color it was last
> set (presumably white?)

You are right. It is white.

> when charging and turn off
> again when charging is complete, or the charger is plugged out ?

The behavior is simple. It is lit up when the charger is connected. It
is turned off when the charger is disconnected.
Many triggers can be used.
bq27520-0-charging-or-full
[bq27520-0-charging]
bq27520-0-full
bq27520-0-charging-blink-full-solid

I think bq27520-0-charging-or-full or
bq27520-0-charging-blink-full-solid can be used in the v3 patch.
(The battery status is always "charging" for my Xiaomi pad2. Even the
battery is 100%. When the pad is off and then connect the charger, it
will be turned on immediately. The LED will be lit up after the kernel
module is loaded)

>
> Regards,
>
> Hans
>
>
>
>
> > +
> > +static const struct software_node ktd2026_rgb_led_node =3D {
> > +     .name =3D "multi-led",
> > +     .properties =3D ktd2026_rgb_led_props,
> > +     .parent =3D &ktd2026_node,
> > +};
> > +
> > +/* B */
> > +static const struct property_entry ktd2026_red_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 0),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
> > +     { }
> > +};
> > +
> > +static const struct software_node ktd2026_red_led_node =3D {
> > +     .properties =3D ktd2026_red_led_props,
> > +     .parent =3D &ktd2026_rgb_led_node,
> > +};
> > +
> > +/* G */
> > +static const struct property_entry ktd2026_green_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 1),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_GREEN),
> > +     { }
> > +};
> > +
> > +static const struct software_node ktd2026_green_led_node =3D {
> > +     .properties =3D ktd2026_green_led_props,
> > +     .parent =3D &ktd2026_rgb_led_node,
> > +};
> > +
> > +/* R */
> > +static const struct property_entry ktd2026_blue_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 2),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
> > +     { }
> > +};
> > +
> > +static const struct software_node ktd2026_blue_led_node =3D {
> > +     .properties =3D ktd2026_blue_led_props,
> > +     .parent =3D &ktd2026_rgb_led_node,
> > +};
> > +
> > +static const struct software_node *ktd2026_node_group[] =3D {
> > +     &ktd2026_node,
> > +     &ktd2026_rgb_led_node,
> > +     &ktd2026_red_led_node,
> > +     &ktd2026_green_led_node,
> > +     &ktd2026_blue_led_node,
> > +     NULL
> > +};
> > +
> > +static int __init xiaomi_mipad2_init(void)
> > +{
> > +     return software_node_register_node_group(ktd2026_node_group);
> > +}
> > +
> > +static void xiaomi_mipad2_exit(void)
> > +{
> > +     software_node_unregister_node_group(ktd2026_node_group);
> > +}
> > +
> >  /*
> >   * If the EFI bootloader is not Xiaomi's own signed Android loader, th=
en the
> >   * Xiaomi Mi Pad 2 X86 tablet sets OSID in the DSDT to 1 (Windows), ca=
using
> > @@ -616,6 +698,7 @@ static const struct x86_i2c_client_info xiaomi_mipa=
d2_i2c_clients[] __initconst
> >                       .type =3D "ktd2026",
> >                       .addr =3D 0x30,
> >                       .dev_name =3D "ktd2026",
> > +                     .swnode =3D &ktd2026_node,
> >               },
> >               .adapter_path =3D "\\_SB_.PCI0.I2C3",
> >       },
> > @@ -624,4 +707,6 @@ static const struct x86_i2c_client_info xiaomi_mipa=
d2_i2c_clients[] __initconst
> >  const struct x86_dev_info xiaomi_mipad2_info __initconst =3D {
> >       .i2c_client_info =3D xiaomi_mipad2_i2c_clients,
> >       .i2c_client_count =3D ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
> > +     .init =3D xiaomi_mipad2_init,
> > +     .exit =3D xiaomi_mipad2_exit,
> >  };
> > diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h=
 b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > index c2d2968cddc2..8c33ec47ee12 100644
> > --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > @@ -29,4 +29,6 @@ extern const char * const bq24190_modules[];
> >  extern const struct platform_device_info int3496_pdevs[];
> >  extern struct gpiod_lookup_table int3496_reference_gpios;
> >
> > +extern const struct software_node ktd2026_leds_node;
> > +
> >  #endif
>


--=20
BR,
Kate

