Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D147C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Nov 2022 21:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiKHVga (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Nov 2022 16:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKHVg3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 16:36:29 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D4C22BF4
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 13:36:27 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id j15so23013993wrq.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Nov 2022 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=59vvWX8dFo36tAZ5KrDgEzkw/TB/OhmTTGdupIPuJ2g=;
        b=RaDwajFVxrZr4nK3nbkNeSzCwvuGmxNAj0CLaaDE2b/N3eIieWBxFKTZ80AIzGBUDU
         5HC8hpp62ikrzHlUkjIezXTtqMWZIC9zqPxp/WCqYHf9I0kE+19BpfYmyCRvkc5M1jin
         UCooz4bnNd2fltbCpWJOTuFckwyZ1/7PHGndL4s6QJkhT80EEDi+5W7Cvg1AJKoHkDlQ
         XcyHCw+9hSVUthWuBSW3a29TFC1B9fbyg5ElaGBpE/jOPzEr4yBysTA8kLoPNkn6uW39
         m+snPnixJsARLCGW65fvlinUO4R3ElsIR7Quh4VlUWfUi8GN6ZOtHPx+ozbjlndpjWH+
         MoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59vvWX8dFo36tAZ5KrDgEzkw/TB/OhmTTGdupIPuJ2g=;
        b=SmuWAv/EsSeO3P7nxI5m2BxarSce2HK7wye21NXiSUAgGEv9SukKN7n+wHI8ZjKM7a
         JxwR9UCt5J7iezR2okO1KD+7koldYJQleOBT2Uv9VvgJ6YOJeVzAelPJ5CV9+RgD4hwh
         59PjRY+4/r80TNwbCLE6RufTDGWxirigQLBr9k1mwtwFJNthFObPWo/vGQeZ/3nI5fsr
         ot1nTH5FwCcwSzUSce6aS4XrmdkBJAxNnRKLM88yQyI7YG/wn3QiQOuYzxtxbJYp8njp
         wL0VX1hlu5BYURLeG8roh5b0e/WGAtvMDlzljCuuF8Fi3Q2ga6r+gMMQYoF1a5OQiO6K
         J2ZA==
X-Gm-Message-State: ACrzQf2NG5sjmBhbfGkQxGzJJnOBYOxXoBmiW4eunsmv1RvRNOqkgJeO
        laUq3sDXAQD5l+ZSvR/CTDfrq0hyi32d8cxehQMsXGoC
X-Google-Smtp-Source: AMsMyM5gIvtRFvdV9b0ICMekxLCL+cyJYLwtCqSBJMelG/Hu8rDrL5u9LTspojbZnDzGie9e7BU8fahIcRmQeZeSqmE=
X-Received: by 2002:a5d:50cf:0:b0:236:86df:257f with SMTP id
 f15-20020a5d50cf000000b0023686df257fmr37348999wrt.374.1667943386286; Tue, 08
 Nov 2022 13:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-2-jorge.lopez2@hp.com>
 <66b3bfc0-d0b8-89f9-6a7c-f7f92fc85be0@redhat.com>
In-Reply-To: <66b3bfc0-d0b8-89f9-6a7c-f7f92fc85be0@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Tue, 8 Nov 2022 15:36:14 -0600
Message-ID: <CAOOmCE_0WJV0oj7BzxY0MgaZKPqaTa4YOABg-LkfJOiwGVccrw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] Moving existing HP drivers to a central location
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Thank you.   No worries.  Family and health comes first.   The review
can wait a few more days.

Jorge

On Mon, Nov 7, 2022 at 7:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Jorge,
>
> Sorry for the long silence, I have not done any pdx86 patch review
> the last 2 weeks due to personal circumstances.
>
> On 10/20/22 22:10, Jorge Lopez wrote:
> > The purpose of this patch is to provide a central location where all
> > HP related drivers are found. HP drivers will recide under
> > drivers/platform/x86/hp directory.
> >
> > Introduce changes to Kconfig file to list all HP driver under "HP X86
> > Platform Specific Device Drivers" menu option. Additional changes
> > include update MAINTAINERS file to indicate hp related drivers new
> > path.
> >
> > Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>
> Thank you for this patch. I've applied this to my review-hans branch now,
> since it is good to get the move done to avoid conflicts if any changes get
> submitted to the moved drivers later.
>
> I will try to review the rest of this series later this week (likely
> coming Wednesday).
>
> Note I've done a bunch of cleanups while applying this, see inline comments.
>
>
> >
> > ---
> > Based on the latest platform-drivers-x86.git/for-next
> > ---
> >  MAINTAINERS                                |  4 +-
> >  drivers/platform/x86/Kconfig               | 80 ++++++----------------
> >  drivers/platform/x86/Makefile              |  4 +-
> >  drivers/platform/x86/hp/Kconfig            | 65 ++++++++++++++++++
> >  drivers/platform/x86/hp/Makefile           | 10 +++
> >  drivers/platform/x86/{ => hp}/hp-wmi.c     |  0
> >  drivers/platform/x86/{ => hp}/hp_accel.c   |  0
> >  drivers/platform/x86/{ => hp}/tc1100-wmi.c |  0
> >  8 files changed, 98 insertions(+), 65 deletions(-)
> >  create mode 100644 drivers/platform/x86/hp/Kconfig
> >  create mode 100644 drivers/platform/x86/hp/Makefile
> >  rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
> >  rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
> >  rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5a918c703b63..48f6705c19f8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9289,7 +9289,7 @@ F:      drivers/net/wireless/intersil/hostap/
> >  HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
> >  L:   platform-driver-x86@vger.kernel.org
> >  S:   Orphan
> > -F:   drivers/platform/x86/tc1100-wmi.c
> > +F:   drivers/platform/x86/hp/tc1100-wmi.c
> >
> >  HPET:        High Precision Event Timers driver
> >  M:   Clemens Ladisch <clemens@ladisch.de>
> > @@ -11747,7 +11747,7 @@ M:    Eric Piel <eric.piel@tremplin-utc.net>
> >  S:   Maintained
> >  F:   Documentation/misc-devices/lis3lv02d.rst
> >  F:   drivers/misc/lis3lv02d/
> > -F:   drivers/platform/x86/hp_accel.c
> > +F:   drivers/platform/x86/hp/hp_accel.c
> >
> >  LIST KUNIT TEST
> >  M:   David Gow <davidgow@google.com>
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index f5312f51de19..731cf9945df5 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -81,7 +81,7 @@ config MXM_WMI
> >         tristate "WMI support for MXM Laptop Graphics"
> >         depends on ACPI_WMI
> >       help
> > -          MXM is a standard for laptop graphics cards, the WMI interface
> > +       MXM is a standard for laptop graphics cards, the WMI interface
> >         is required for switchable nvidia graphics machines
> >
> >  config PEAQ_WMI
>
> This...
>
> > @@ -163,18 +163,18 @@ config ACERHDF
> >         here.
> >
> >  config ACER_WIRELESS
> > -        tristate "Acer Wireless Radio Control Driver"
> > -        depends on ACPI
> > -        depends on INPUT
> > +     tristate "Acer Wireless Radio Control Driver"
> > +     depends on ACPI
> > +     depends on INPUT
> >       help
> > -          The Acer Wireless Radio Control handles the airplane mode hotkey
> > -          present on new Acer laptops.
> > +       The Acer Wireless Radio Control handles the airplane mode hotkey
> > +       present on new Acer laptops.
> >
> > -          Say Y or M here if you have an Acer notebook with an airplane mode
> > -          hotkey.
> > +       Say Y or M here if you have an Acer notebook with an airplane mode
> > +       hotkey.
> >
> > -          If you choose to compile this driver as a module the module will be
> > -          called acer-wireless.
> > +       If you choose to compile this driver as a module the module will be
> > +       called acer-wireless.
> >
> >  config ACER_WMI
> >       tristate "Acer WMI Laptop Extras"
>
> And this ...
>
> > @@ -400,17 +400,17 @@ config FUJITSU_TABLET
> >         depends on ACPI
> >         depends on INPUT
> >       help
> > -         This is a driver for tablets built by Fujitsu:
> > +      This is a driver for tablets built by Fujitsu:
> >
> > -           * Lifebook P1510/P1610/P1620/Txxxx
> > -           * Stylistic ST5xxx
> > -           * Possibly other Fujitsu tablet models
> > +        * Lifebook P1510/P1610/P1620/Txxxx
> > +        * Stylistic ST5xxx
> > +        * Possibly other Fujitsu tablet models
> >
> > -         It adds support for the panel buttons, docking station detection,
> > -         tablet/notebook mode detection for convertible and
> > -         orientation detection for docked slates.
> > +      It adds support for the panel buttons, docking station detection,
> > +      tablet/notebook mode detection for convertible and
> > +      orientation detection for docked slates.
> >
> > -         If you have a Fujitsu convertible or slate, say Y or M here.
> > +      If you have a Fujitsu convertible or slate, say Y or M here.
> >
> >  config GPD_POCKET_FAN
> >       tristate "GPD Pocket Fan Controller support"
>
> And this, are all unrelated whitespace changes which I have dropped.
>
> > @@ -424,24 +424,7 @@ config GPD_POCKET_FAN
> >         of the CPU temperature. Say Y or M if the kernel may be used on a
> >         GPD pocket.
> >
> > -config HP_ACCEL
> > -     tristate "HP laptop accelerometer"
> > -     depends on INPUT && ACPI
> > -     depends on SERIO_I8042
> > -     select SENSORS_LIS3LV02D
> > -     select NEW_LEDS
> > -     select LEDS_CLASS
> > -     help
> > -       This driver provides support for the "Mobile Data Protection System 3D"
> > -       or "3D DriveGuard" feature of HP laptops. On such systems the driver
> > -       should load automatically (via ACPI alias).
> > -
> > -       Support for a led indicating disk protection will be provided as
> > -       hp::hddprotect. For more information on the feature, refer to
> > -       Documentation/misc-devices/lis3lv02d.rst.
> > -
> > -       To compile this driver as a module, choose M here: the module will
> > -       be called hp_accel.
> > +source "drivers/platform/x86/hp/Kconfig"
> >
> >  config WIRELESS_HOTKEY
> >       tristate "Wireless hotkey button"
> > @@ -455,30 +438,6 @@ config WIRELESS_HOTKEY
> >        To compile this driver as a module, choose M here: the module will
> >        be called wireless-hotkey.
> >
> > -config HP_WMI
> > -     tristate "HP WMI extras"
> > -     depends on ACPI_WMI
> > -     depends on INPUT
> > -     depends on RFKILL || RFKILL = n
> > -     select INPUT_SPARSEKMAP
> > -     select ACPI_PLATFORM_PROFILE
> > -     select HWMON
> > -     help
> > -      Say Y here if you want to support WMI-based hotkeys on HP laptops and
> > -      to read data from WMI such as docking or ambient light sensor state.
> > -
> > -      To compile this driver as a module, choose M here: the module will
> > -      be called hp-wmi.
> > -
> > -config TC1100_WMI
> > -     tristate "HP Compaq TC1100 Tablet WMI Extras"
> > -     depends on !X86_64
> > -     depends on ACPI
> > -     depends on ACPI_WMI
> > -     help
> > -       This is a driver for the WMI extensions (wireless and bluetooth power
> > -       control) of the HP Compaq TC1100 tablet.
> > -
> >  config IBM_RTL
> >       tristate "Device driver to enable PRTL support"
> >       depends on PCI
> > @@ -1153,3 +1112,4 @@ config P2SB
> >         The main purpose of this library is to unhide P2SB device in case
> >         firmware kept it hidden on some platforms in order to access devices
> >         behind it.
> > +
>
> Another unrelated whitespace change, also dropped.
>
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index 5a428caa654a..415dc5576396 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -55,9 +55,7 @@ obj-$(CONFIG_FUJITSU_TABLET)        += fujitsu-tablet.o
> >  obj-$(CONFIG_GPD_POCKET_FAN) += gpd-pocket-fan.o
> >
> >  # Hewlett Packard
> > -obj-$(CONFIG_HP_ACCEL)               += hp_accel.o
> > -obj-$(CONFIG_HP_WMI)         += hp-wmi.o
> > -obj-$(CONFIG_TC1100_WMI)     += tc1100-wmi.o
> > +obj-y                                += hp/
>
> This should be:
>
> obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP) += hp/
>
> Fixed while applying
>
> >
> >  # Hewlett Packard Enterprise
> >  obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
> > diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
> > new file mode 100644
> > index 000000000000..426e3575ddc3
> > --- /dev/null
> > +++ b/drivers/platform/x86/hp/Kconfig
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# X86 Platform Specific Drivers
> > +#
> > +menuconfig X86_PLATFORM_DRIVERS_HP
> > +     bool "HP X86 Platform Specific Device Drivers"
> > +     default y
>
> This default y should not be here, drivers should normally not be enabled
> by default and since you have added default m to the other entries below
> (which is good), we need this one to not have a default so we don't end
> up unconditionally enabling the drivers.
>
> I've dropped the "default y" while applying this.
>
> > +     depends on X86_PLATFORM_DEVICES
> > +     help
> > +       Say Y here to get to see options for device drivers for various
> > +       HP x86 platforms, including vendor-specific laptop extension drivers.
> > +       This option alone does not add any kernel code.
> > +
> > +       If you say N, all options in this submenu will be skipped and disabled.
> > +
> > +if X86_PLATFORM_DRIVERS_HP
> > +
> > +config HP_ACCEL
> > +     tristate "HP laptop accelerometer"
> > +     default m
> > +     depends on INPUT && ACPI
> > +     depends on SERIO_I8042
> > +     select SENSORS_LIS3LV02D
> > +     select NEW_LEDS
> > +     select LEDS_CLASS
> > +     help
> > +       This driver provides support for the "Mobile Data Protection System 3D"
> > +       or "3D DriveGuard" feature of HP laptops. On such systems the driver
> > +       should load automatically (via ACPI alias).
> > +
> > +       Support for a led indicating disk protection will be provided as
> > +       hp::hddprotect. For more information on the feature, refer to
> > +       Documentation/misc-devices/lis3lv02d.rst.
> > +
> > +       To compile this driver as a module, choose M here: the module will
> > +       be called hp_accel.
> > +
> > +config HP_WMI
> > +     tristate "HP WMI extras"
> > +     default m
> > +     depends on ACPI_WMI
> > +     depends on INPUT
> > +     depends on RFKILL || RFKILL = n
> > +     select INPUT_SPARSEKMAP
> > +     select ACPI_PLATFORM_PROFILE
> > +     select HWMON
> > +     help
> > +      Say Y here if you want to support WMI-based hotkeys on HP laptops and
> > +      to read data from WMI such as docking or ambient light sensor state.
> > +
> > +      To compile this driver as a module, choose M here: the module will
> > +      be called hp-wmi.
> > +
> > +config TC1100_WMI
> > +     tristate "HP Compaq TC1100 Tablet WMI Extras"
> > +     default m
> > +     depends on !X86_64
> > +     depends on ACPI
> > +     depends on ACPI_WMI
> > +     help
> > +       This is a driver for the WMI extensions (wireless and bluetooth power
> > +       control) of the HP Compaq TC1100 tablet.
> > +
> > +
> > + endif # X86_PLATFORM_DRIVERS_HP
> > diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
> > new file mode 100644
> > index 000000000000..f651a405e876
> > --- /dev/null
> > +++ b/drivers/platform/x86/hp/Makefile
> > @@ -0,0 +1,10 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for linux/drivers/platform/x86/hp
> > +# x86 Platform-Specific Drivers
> > +#
> > +
> > +# Hewlett Packard
> > +obj-$(CONFIG_HP_ACCEL)               += hp_accel.o
> > +obj-$(CONFIG_HP_WMI)         += hp-wmi.o
> > +obj-$(CONFIG_TC1100_WMI)     += tc1100-wmi.o
> > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> > similarity index 100%
> > rename from drivers/platform/x86/hp-wmi.c
> > rename to drivers/platform/x86/hp/hp-wmi.c
> > diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
> > similarity index 100%
> > rename from drivers/platform/x86/hp_accel.c
> > rename to drivers/platform/x86/hp/hp_accel.c
> > diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/hp/tc1100-wmi.c
> > similarity index 100%
> > rename from drivers/platform/x86/tc1100-wmi.c
> > rename to drivers/platform/x86/hp/tc1100-wmi.c
>
>
> Regards,
>
> Hans
>
>
