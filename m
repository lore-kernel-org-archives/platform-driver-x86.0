Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48A3DDAF9
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 07:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223447; cv=none; b=HEazaa2kI7hd9hgrYAIeZIKijfYeaUkoln7h5iSlXRkMl8spbZdqwLaqpF92VeqKseKgDwKYEzDBEH0GOxD7QUE3AGWiGTNkbRcry54H9Z1FGghtxu/jrsg35MFP0u/U/OjAV1Vd7pt47WFOrECB4SF9mG+9C5WChZUOb9LIEX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223447; c=relaxed/simple;
	bh=16ouR3ODnEyK1HTxujONdE5aiomq7Kj3KOG2KsqiITM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFhMj2tLO8NkOgcqwAHZCO9Vg7sggCSdTX01OESl7orp7INT0WNZRzhPuwVZBefmNtAOztqi1jBZQHHp4JPVyNFI3lVNSv0w8+fPCB+8RGSodEFSVWqBGrwK4do3M7dxqNk3+iHn/ZRakTZp2iukieEB4KUxo4Y1qWGfRx01B20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=m/C97MbS; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="m/C97MbS"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id EAF1D3FF34
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 07:14:51 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id D9C3C3FEB5
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 07:14:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 1D5081FF96C
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:14:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1785222888;
	bh=AEM417twvnpjYC39VgiTrjNPdqydALIL9b35ey81KKs=;
	h=Received:From:Subject:To;
	b=m/C97MbSu1db3P3Vdo6o6r5UL74phUiqrrDtS4Mj+IohMH3zD/Q7z3bLY1Lb9HEdX
	 1BpXTrxY2Zs12zFfZgcrK73G7B0EJtUP9rmtURY65tAVne88fZNMMDVasFtbi+gWgN
	 k0HxvLRQiy1GUlAIlYFIJSgJiSG6hidqb5utJDsGlzGiNJcsCXtyWx9ZRXbdba9FQo
	 FL3p7yzQ29ru25Br1XmGdVwsJkD1t99yxjEQNLs8PblHHr8aGpxNjAA8+OeZRxkc7i
	 jc6PMXRWBER6mY18JdkGnTQeMbHd+xG1Hwe+E77Wg8AXNUbogSRtZtkZ0fhUkb3HQL
	 Yy5Y2NRn5ePiQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2caced6038eso9631375ad.0
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 28 Jul 2026 00:14:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwLmrChVG0hY8vEwblWKvHO4uMdDaeWCUXHuobkm92SgT1S41oj
	yeJ75f9gyT1wvLQy2dZWbwfixRbd1en1/7AAzfk/EX6KwOARQiuEq8i+eDvOZUtbxpI2dSk8x7W
	DLi3NUjfwB3bVa8D7vqKhBQsp4z6uDMo=
X-Received: by 2002:a17:903:b8c:b0:2ca:f417:396b with SMTP id
 d9443c01a7336-2d015c68317mr13541945ad.3.1785222886515; Tue, 28 Jul 2026
 00:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727215947.118292-1-begeebe@gmail.com>
In-Reply-To: <20260727215947.118292-1-begeebe@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 28 Jul 2026 09:14:35 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEFWJq125Deadv3vQt34ji1YnSJ2cxx0ag=gOWMPnbeGQ@mail.gmail.com>
X-Gm-Features: AUfX_mwmAUpCFIGU9T_A6diXcyc6eVoWIlVCdLiXvdi6_n3IPihWUNzGnRL1zRY
Message-ID: 
 <CAGwozwEFWJq125Deadv3vQt34ji1YnSJ2cxx0ag=gOWMPnbeGQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: Report tablet mode on OneXPlayer
 Super X
To: Alexander Egorov <begeebe@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, derekjohn.clark@gmail.com, samsagax@gmail.com,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <178522288839.1524545.2424580793497966804@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.5 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 28 Jul 2026 at 00:00, Alexander Egorov <begeebe@gmail.com> wrote:
>
> The OneXPlayer Super X has a detachable pogo-pin keyboard which
> enumerates as USB device 1a86:1305. The firmware does not expose a
> tablet-mode input switch.
>
> Without SW_TABLET_MODE, userspace treats the built-in controller and
> other pointer devices as evidence that the system is in laptop mode.
> Mutter consequently leaves automatic display rotation disabled after
> the keyboard is detached.
>
> On the Super X DMI match, register a persistent input device and report
> SW_TABLET_MODE according to the pogo keyboard USB hotplug state. Report
> laptop mode while the keyboard is present and tablet mode while it is
> absent. Other USB and Bluetooth keyboards do not affect the switch.
>
> Tested on a OneXPlayer Super X with keyboard attach and detach events.
> Mutter changes PanelOrientationManaged in both directions and applies
> accelerometer-driven display transforms only while the pogo keyboard is
> absent.
>
> Development of this patch used assistance from ChatGPT 5.6 sol.

Thanks for making this patch!

Drop, add:

Assisted-by: Codex:gpt-5.6

This is a bit of a scope extension for the driver. I would like Ilpo
to perhaps weigh in if this is the correct place for it.

Ideally, one of the registers changes when attaching the keyboard and
you can use that instead. Can you dump the oxpec register map and
check if something changes predictably when you plug in the keyboard?

Moreover, I would like to see more devices supported when this patch
merges, as a large segment of onexplayer devices are either 2 in 1s or
tablets. At least the X1s / X1 minis.

> Signed-off-by: Alexander Egorov <begeebe@gmail.com>
> ---
>  drivers/platform/x86/Kconfig |   7 ++-
>  drivers/platform/x86/oxpec.c | 110 +++++++++++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b521..3e30127 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1055,11 +1055,14 @@ config OXP_EC
>         depends on ACPI_EC
>         depends on ACPI_BATTERY
>         depends on HWMON
> +       depends on INPUT
> +       depends on USB
>         depends on X86
>         help
>                 Enables support for the platform EC of OneXPlayer and AOKZOE
> -               handheld devices. This includes fan speed, fan controls, and
> -               disabling the default TDP behavior of the device.
> +               handheld devices. This includes fan speed, fan controls, disabling
> +               the default TDP behavior of the device, and tablet mode reporting
> +               on supported detachable models.
>
>  source "drivers/platform/x86/tuxedo/Kconfig"
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 99c0dfc..e64ae54 100644
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
> @@ -55,6 +57,14 @@ enum oxp_board {
>  static enum oxp_board board;
>  static struct device *oxp_dev;
>
> +struct oxp_platform_data {
> +       struct input_dev *tablet_mode_input;
> +       struct notifier_block usb_notifier;
> +};

This driver does not use a platform struct for now. If it is revised
to do so it will then. Use globals for now instead of defining
oxp_platform_data.

> +
> +#define OXP_SUPER_X_KEYBOARD_VID       0x1a86
> +#define OXP_SUPER_X_KEYBOARD_PID       0x1305
> +

Make sure this is the intuitive place for them. If 0x1a86 is a VID
used by other onexplayer devices, use a generic name for it. Add the
X1 / X1 mini keyboards. Unfortunately, I do not have my X1 with me
until the middle of august so I cannot help here.

>  /* Fan reading and PWM */
>  #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
>  #define OXP_2_SENSOR_FAN_REG           0x58 /* Fan reading is 2 registers long */
> @@ -292,6 +302,94 @@ static const struct dmi_system_id dmi_table[] = {
>         {},
>  };
>
> +static bool oxp_is_super_x_keyboard(const struct usb_device *udev)
> +{
> +       return le16_to_cpu(udev->descriptor.idVendor) == OXP_SUPER_X_KEYBOARD_VID &&
> +              le16_to_cpu(udev->descriptor.idProduct) == OXP_SUPER_X_KEYBOARD_PID;
> +}

Spurious function, inline.

> +
> +static void oxp_report_keyboard_attached(struct oxp_platform_data *data,
> +                                        bool attached)
> +{
> +       /* SW_TABLET_MODE is set when the detachable keyboard is absent. */
> +       input_report_switch(data->tablet_mode_input, SW_TABLET_MODE, !attached);
> +       input_sync(data->tablet_mode_input);
> +}

Same, inline.

> +
> +static int oxp_find_super_x_keyboard(struct usb_device *udev, void *data)
> +{
> +       bool *attached = data;
> +
> +       if (oxp_is_super_x_keyboard(udev))
> +               *attached = true;
> +
> +       return 0;
> +}

Same, inline.

> +
> +static int oxp_usb_notify(struct notifier_block *nb,
> +                         unsigned long action, void *notify_data)
> +{
> +       struct oxp_platform_data *data =
> +               container_of(nb, struct oxp_platform_data, usb_notifier);
> +       struct usb_device *udev = notify_data;
> +
> +       if (!oxp_is_super_x_keyboard(udev))
> +               return NOTIFY_DONE;
> +
> +       switch (action) {
> +       case USB_DEVICE_ADD:
> +               oxp_report_keyboard_attached(data, true);
> +               break;
> +       case USB_DEVICE_REMOVE:
> +               oxp_report_keyboard_attached(data, false);
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
> +static void oxp_unregister_usb_notifier(void *notify_block)
> +{
> +       usb_unregister_notify(notify_block);
> +}

The two functions above are the only ones you really need. Inline
everything into them.

> +
> +static int oxp_register_super_x_tablet_switch(struct device *dev,
> +                                             struct oxp_platform_data *data)
> +{
> +       bool keyboard_attached = false;
> +       struct input_dev *input;
> +       int ret;
> +
> +       input = devm_input_allocate_device(dev);
> +       if (!input)
> +               return -ENOMEM;
> +
> +       input->name = "OneXPlayer Super X Tablet Mode Switch";
> +       input->phys = "oxp-platform/input0";
> +       input->id.bustype = BUS_HOST;
> +       input_set_capability(input, EV_SW, SW_TABLET_MODE);
> +
> +       ret = input_register_device(input);
> +       if (ret)
> +               return ret;
> +
> +       data->tablet_mode_input = input;
> +       data->usb_notifier.notifier_call = oxp_usb_notify;
> +       usb_register_notify(&data->usb_notifier);
> +
> +       ret = devm_add_action_or_reset(dev, oxp_unregister_usb_notifier,
> +                                      &data->usb_notifier);
> +       if (ret)
> +               return ret;
> +
> +       usb_for_each_dev(&keyboard_attached, oxp_find_super_x_keyboard);
> +       oxp_report_keyboard_attached(data, keyboard_attached);
> +
> +       return 0;
> +}

Inline this function into probe.

> +
>  /* Helper functions to handle EC read/write */
>  static int read_from_ec(u8 reg, int size, long *val)
>  {
> @@ -954,6 +1052,18 @@ static int oxp_platform_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> +       if (dmi_match(DMI_BOARD_NAME, "ONEXPLAYER SUPER X")) {
> +               struct oxp_platform_data *data;

Replace the dmi match with a board switch. Match capable boards (X1,
X1 Mini, defer G1 due to its weird layout). If we aliased X1 / X1 Mini
board ids with other devices without a folio, create a patch preceding
this one where you separate them.

As a hint for the future, GPT models really like to write a lot of
unnecessary code and introduce helper functions but this hinders the
upstreaming process. Try to work with the model to minimize the diff
before submitting (as you saw here, there are many extra function
definitions)

Best,
Antheas

> +
> +               data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +               if (!data)
> +                       return -ENOMEM;
> +
> +               ret = oxp_register_super_x_tablet_switch(dev, data);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.55.0
>
>

