Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82E3815D5
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433755; cv=none; b=YK1sf2fRjdqgIZiBtxys585l19MYelY1TQYYVImvyJEJaK2g4+g6aw/IPoPTc0SfRnTBfGLh//DFLs5FxODq7jYVE2TeExJJiNNEKcq9h1nVWpys0whJ4e8h3ib721fn2c1byp6K15Myez0/icCkheVldbehCUgWco3bVWDtiPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433755; c=relaxed/simple;
	bh=q9qrL3ymO56+DmjRh28sOewfjg/7Tzkxw32VRA81q+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZ0bHrLzDpCAeZhqQhU4/qjapkRd0SmOphgvG+/5Bly3pkWqtHAOLVcueCGKbG7hLeuTPJnBMJkiFKxSmGXOUjFltqd9uYunu2mKsf0IHf5pFXWGU8qxXthgO4ms9QfyTti+WquAfQCC4rpziAlO6EYE/7j1SzjK/Pnfdp+BdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=DBMFdBAO; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="DBMFdBAO"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 6D4FF3FE8D
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:49:11 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id AB4923FABD
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:49:10 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id F1CBB1FF257
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 20:49:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1785433750;
	bh=nKhW9Xx5IZBw02kl17vkF2fw84zi2Rdz/asHN0iUmHk=;
	h=Received:From:Subject:To;
	b=DBMFdBAOcFVuetjtAJNoIPS0hRwRmjdWSOhWE2vFRtXP28rx0bmNX/Jw+ZvwBhRaF
	 nzoqZk1v28wUr1cW0JvZwELUgzEYEE2koh3oQ1PaExBkNfYk68irguD+vQHAh9LEHi
	 nL7bf92OkMo9sFyC4+ne2flyL8Kgw5NyNvQlfv6B0crb04fjDtCHkHewMm8MRARkNn
	 QdNBv2ItYbh2UwiGl2ZHgK7dfhmoAly//DLD8VAcwVi7Y6U/h+j1P63L/5gLnLA4CT
	 SLHwkCY2PWSe51ZtX5qmisNTF+R/ASPPcZ3iQkNJ+Uv5dqj/0j7N5MiiCvQsL6qqNH
	 ynoYXJ/1zHEtw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.46) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f46.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-38a0c7e841fso208119a91.2
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 30 Jul 2026 10:49:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YwuAHRuhpLjflgP7jSDlIhxluLG/Go4I/3x206avPIIlS8pFj9K
	OJdtfFywlL8MQvi35puvavqVEjWSNdcMdOLJ/aTJYpJhGwliry+iZUQrP00pDkHJTDCegDLFuww
	3j4h6QP55DkdHrC5VDc6L2UPLcEfc9EI=
X-Received: by 2002:a17:90b:5403:b0:37f:9ce1:cda4 with SMTP id
 98e67ed59e1d1-38f9bfff879mr3156935a91.26.1785433748533; Thu, 30 Jul 2026
 10:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727215947.118292-1-begeebe@gmail.com>
 <20260728083529.329772-1-begeebe@gmail.com>
 <20260728083529.329772-3-begeebe@gmail.com>
In-Reply-To: <20260728083529.329772-3-begeebe@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 30 Jul 2026 19:48:57 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFAcHh0iUsKRcvtMe=Cn+pdNXAoSYqZ09k2srsSrqWs_w@mail.gmail.com>
X-Gm-Features: AUfX_mzgBOL7nUOhP6riWSizjfNapwm1Ddf7m1xu_vIm5vUTQKyWXJMibay3ZKI
Message-ID: 
 <CAGwozwFAcHh0iUsKRcvtMe=Cn+pdNXAoSYqZ09k2srsSrqWs_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: oxpec: Report tablet mode on
 OneXPlayer detachables
To: Alexander Egorov <begeebe@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, derekjohn.clark@gmail.com, samsagax@gmail.com,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <178543375019.1630551.5404073115537926195@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.5 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 28 Jul 2026 at 10:35, Alexander Egorov <begeebe@gmail.com> wrote:
>
> The OneXPlayer X1 family and Super X have detachable pogo-pin
> keyboards. The firmware does not expose a tablet-mode input switch.
>
> The Super X keyboard enumerates as 1a86:1305. The X1 family folio
> keyboard enumerates as 258a:001e.
>
> Register an input device on these boards and report SW_TABLET_MODE from
> the model-specific pogo keyboard USB hotplug state. Other USB and
> Bluetooth keyboards do not affect the switch.
>
> A complete dump of the 256-byte Super X EC register map was compared
> with the keyboard attached, detached, and reattached. No register
> changed predictably with the attachment state.
>
> Tested on a OneXPlayer Super X. Mutter enables accelerometer-driven
> display rotation only while the pogo keyboard is absent.
>
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Alexander Egorov <begeebe@gmail.com>
> ---
>  drivers/platform/x86/Kconfig |   2 +
>  drivers/platform/x86/oxpec.c | 103 +++++++++++++++++++++++++++++++++++
>  2 files changed, 105 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b521..3bcbd49 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1055,6 +1055,8 @@ config OXP_EC
>         depends on ACPI_EC
>         depends on ACPI_BATTERY
>         depends on HWMON
> +       depends on INPUT
> +       depends on USB
>         depends on X86
>         help
>                 Enables support for the platform EC of OneXPlayer and AOKZOE
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index df29e41..5c07a35 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -18,10 +18,12 @@
>  #include <linux/dmi.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
> +#include <linux/input.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/processor.h>
> +#include <linux/usb.h>
>  #include <acpi/battery.h>
>
>  /* Handle ACPI lock mechanism */
> @@ -55,6 +57,8 @@ enum oxp_board {
>
>  static enum oxp_board board;
>  static struct device *oxp_dev;
> +static struct input_dev *oxp_tablet_mode_input;
> +static struct notifier_block oxp_usb_notifier;
>
>  /* Fan reading and PWM */
>  #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
> @@ -293,6 +297,74 @@ static const struct dmi_system_id dmi_table[] = {
>         {},
>  };
>
> +#define OXP_KEYBOARD_VID_QINHENG       0x1a86
> +#define OXP_KEYBOARD_PID_K2445         0x1305
> +#define OXP_KEYBOARD_VID_HAILUCK       0x258a
> +#define OXP_KEYBOARD_PID_HAILUCK       0x001e

These defines need to go above with the other defines.

Can you explain the reasoning behind the name PID_K2445 and PID_HAILUCK?

> +
> +static int oxp_find_keyboard(struct usb_device *udev, void *data)
> +{
> +       bool *keyboard_attached = data;
> +       u16 vid = le16_to_cpu(udev->descriptor.idVendor);
> +       u16 pid = le16_to_cpu(udev->descriptor.idProduct);
> +
> +       switch (board) {
> +       case oxp_x1:
> +               if (vid == OXP_KEYBOARD_VID_HAILUCK &&
> +                   pid == OXP_KEYBOARD_PID_HAILUCK)
> +                       *keyboard_attached = true;
> +               break;
> +       case oxp_super_x:
> +               if (vid == OXP_KEYBOARD_VID_QINHENG &&
> +                   pid == OXP_KEYBOARD_PID_K2445)
> +                       *keyboard_attached = true;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int oxp_usb_notify(struct notifier_block *nb,
> +                         unsigned long action, void *data)
> +{
> +       struct usb_device *udev = data;
> +       u16 vid = le16_to_cpu(udev->descriptor.idVendor);
> +       u16 pid = le16_to_cpu(udev->descriptor.idProduct);
> +       bool keyboard = false;
> +
> +       switch (board) {
> +       case oxp_x1:
> +               keyboard = vid == OXP_KEYBOARD_VID_HAILUCK &&
> +                          pid == OXP_KEYBOARD_PID_HAILUCK;
> +               break;
> +       case oxp_super_x:
> +               keyboard = vid == OXP_KEYBOARD_VID_QINHENG &&
> +                          pid == OXP_KEYBOARD_PID_K2445;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       if (!keyboard)
> +               return NOTIFY_DONE;
> +
> +       switch (action) {
> +       case USB_DEVICE_ADD:
> +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE, false);
> +               break;
> +       case USB_DEVICE_REMOVE:
> +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE, true);
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       input_sync(oxp_tablet_mode_input);
> +       return NOTIFY_OK;
> +}
> +
>  /* Helper functions to handle EC read/write */
>  static int read_from_ec(u8 reg, int size, long *val)
>  {
> @@ -948,6 +1020,7 @@ static const struct hwmon_chip_info oxp_ec_chip_info = {
>  /* Initialization logic */
>  static int oxp_platform_probe(struct platform_device *pdev)
>  {
> +       bool keyboard_attached = false;
>         struct device *dev = &pdev->dev;
>         struct device *hwdev;
>         int ret;
> @@ -965,6 +1038,33 @@ static int oxp_platform_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> +       switch (board) {
> +       case oxp_x1:
> +       case oxp_super_x:
> +               oxp_tablet_mode_input = devm_input_allocate_device(dev);
> +               if (!oxp_tablet_mode_input)
> +                       return -ENOMEM;
> +
> +               oxp_tablet_mode_input->name = "OneXPlayer Tablet Mode Switch";
> +               oxp_tablet_mode_input->phys = "oxp-platform/input0";
> +               oxp_tablet_mode_input->id.bustype = BUS_HOST;
> +               input_set_capability(oxp_tablet_mode_input, EV_SW, SW_TABLET_MODE);
> +
> +               ret = input_register_device(oxp_tablet_mode_input);
> +               if (ret)
> +                       return ret;
> +
> +               oxp_usb_notifier.notifier_call = oxp_usb_notify;
> +               usb_register_notify(&oxp_usb_notifier);
> +               usb_for_each_dev(&keyboard_attached, oxp_find_keyboard);
> +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE,
> +                                   !keyboard_attached);
> +               input_sync(oxp_tablet_mode_input);
> +               break;
> +       default:
> +               break;
> +       }
> +
>         return 0;
>  }
>
> @@ -1005,6 +1105,9 @@ static int __init oxp_platform_init(void)
>
>  static void __exit oxp_platform_exit(void)
>  {
> +       if (board == oxp_x1 || board == oxp_super_x)
> +               usb_unregister_notify(&oxp_usb_notifier);

You used a switch statement above. Match the logic and use a switch
statement here too.

Give it a few days before sending a V3 for Ilpo to reply.

@Ilpo do you think this is an acceptable expansion for the EC driver?

The rest of the patch looks fine to me.

Best,
Antheas

> +
>         platform_device_unregister(oxp_platform_device);
>         platform_driver_unregister(&oxp_platform_driver);
>  }
> --
> 2.55.0
>
>

