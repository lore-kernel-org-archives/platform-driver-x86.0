From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] platform/x86: Toshiba WMI Hotkey Driver
Date: Sat, 19 Sep 2015 09:48:48 -0700
Message-ID: <CAKdAkRR5n1eUFeHY=5E-RBj6wTyOSmkU_zYzKw+PBzcGFsMD-w@mail.gmail.com>
References: <1441819810-11762-1-git-send-email-coproscefalo@gmail.com>
	<1441819810-11762-3-git-send-email-coproscefalo@gmail.com>
	<20150918215920.GM66179@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36577 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754814AbbISQst (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Sep 2015 12:48:49 -0400
In-Reply-To: <20150918215920.GM66179@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Fri, Sep 18, 2015 at 2:59 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Sep 09, 2015 at 11:30:10AM -0600, Azael Avalos wrote:
>> Toshiba laptops that feature WMI events for hotkeys were left unsupported
>> by the toshiba_acpi driver, however, commit a88bc06e5aec ("toshiba_acpi:
>> Avoid registering input device on WMI event laptops") added hardware
>> support for such laptops, but the hotkeys are not handled there.
>>
>> This driver adds support for hotkey monitoring on certain Toshiba laptops
>> that manage the hotkeys via WMI events instead of the Toshiba
>> Configuration Interface (TCI).
>>
>> The toshiba_acpi driver and this one can co-exist, as this only takes
>> care of hotkeys, while the propper takes care of hardware related stuff.
>>
>> Currently the driver is under the EXPERIMENTAL flag, as the keymap
>> and the notify function are incomplete (due to lack of hardware to test).
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>
> +Dmitry - Are you interested in being Cc'd on new users of input outside
> drivers/input ?

Yes, please.

>
>> ---
>>  MAINTAINERS                        |   6 ++
>>  drivers/platform/x86/Kconfig       |  18 +++++
>>  drivers/platform/x86/Makefile      |   1 +
>>  drivers/platform/x86/toshiba-wmi.c | 138 +++++++++++++++++++++++++++++++++++++
>>  4 files changed, 163 insertions(+)
>>  create mode 100644 drivers/platform/x86/toshiba-wmi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 884d398..07f4446 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -10318,6 +10318,12 @@ L:   platform-driver-x86@vger.kernel.org
>>  S:   Maintained
>>  F:   drivers/platform/x86/toshiba_haps.c
>>
>> +TOSHIBA WMI HOTKEYS DRIVER
>> +M:   Azael Avalos <coproscefalo@gmail.com>
>> +L:   platform-driver-x86@vger.kernel.org
>> +S:   Maintained
>> +F:   drivers/platform/x86/toshiba-wmi.c
>> +
>>  TOSHIBA SMM DRIVER
>>  M:   Jonathan Buzzard <jonathan@buzzard.org.uk>
>>  W:   http://www.buzzard.org.uk/toshiba/
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index c69bb70..9ae1e89 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -700,6 +700,24 @@ config TOSHIBA_HAPS
>>         If you have a recent Toshiba laptop with a built-in accelerometer
>>         device, say Y.
>>
>> +config TOSHIBA_WMI
>> +     tristate "Toshiba WMI Hotkeys Driver (EXPERIMENTAL)"
>> +     default n
>> +     depends on ACPI_WMI
>> +     depends on INPUT
>> +     select INPUT_SPARSEKMAP
>> +     ---help---
>> +       This driver adds hotkey monitoring support to some Toshiba models
>> +       that manage the hotkeys via WMI events.
>> +
>> +       WARNING: This driver is incomplete as it lacks a propper keymap and the

s/propper/proper/

>> +       *notify function only prints the ACPI event type value. Be warned that
>> +       you will need to provide some information if you have a Toshiba model
>> +       with WMI event hotkeys and want to help with the develpment of this
>> +       driver.
>> +
>> +       If you have a WMI-based hotkeys Toshiba laptop, say Y or M here.
>> +
>>  config ACPI_CMPC
>>       tristate "CMPC Laptop Extras"
>>       depends on X86 && ACPI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index ada5128..8f077cb 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -40,6 +40,7 @@ obj-$(CONFIG_ACPI_TOSHIBA)  += toshiba_acpi.o
>>
>>  obj-$(CONFIG_TOSHIBA_BT_RFKILL)      += toshiba_bluetooth.o
>>  obj-$(CONFIG_TOSHIBA_HAPS)   += toshiba_haps.o
>> +obj-$(CONFIG_TOSHIBA_HAPS)   += toshiba-wmi.o
>>  obj-$(CONFIG_INTEL_SCU_IPC)  += intel_scu_ipc.o
>>  obj-$(CONFIG_INTEL_SCU_IPC_UTIL) += intel_scu_ipcutil.o
>>  obj-$(CONFIG_INTEL_MFLD_THERMAL) += intel_mid_thermal.o
>> diff --git a/drivers/platform/x86/toshiba-wmi.c b/drivers/platform/x86/toshiba-wmi.c
>> new file mode 100644
>> index 0000000..8cf62a1
>> --- /dev/null
>> +++ b/drivers/platform/x86/toshiba-wmi.c
>> @@ -0,0 +1,138 @@
>> +/*
>> + * toshiba_wmi.c - Toshiba WMI Hotkey Driver
>> + *
>> + * Copyright (C) 2015 Azael Avalos <coproscefalo@gmail.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/types.h>
>> +#include <linux/acpi.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +
>> +MODULE_AUTHOR("Azael Avalos");
>> +MODULE_DESCRIPTION("Toshiba WMI Hotkey Driver");
>> +MODULE_LICENSE("GPL");
>> +
>> +#define TOSHIBA_WMI_EVENT_GUID       "59142400-C6A3-40FA-BADB-8A2652834100"
>> +
>> +MODULE_ALIAS("wmi:"TOSHIBA_WMI_EVENT_GUID);
>> +
>> +struct input_dev *toshiba_wmi_input_dev;

static?

Thanks.

-- 
Dmitry
