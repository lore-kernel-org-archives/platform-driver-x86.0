From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86: peaq-wmi: Add new peaq-wmi driver
Date: Tue, 9 May 2017 20:33:13 +0200
Message-ID: <4a3f31f9-39d9-efef-342c-30f1aeb7035c@redhat.com>
References: <20170509075431.17864-1-hdegoede@redhat.com>
 <20170509160055.GA17858@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40272 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753940AbdEISdR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 14:33:17 -0400
In-Reply-To: <20170509160055.GA17858@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 05/09/2017 06:00 PM, Darren Hart wrote:
> On Tue, May 09, 2017 at 09:54:31AM +0200, Hans de Goede wrote:
>> PEAQ is a new European OEM, I've bought one of their 2-in-1 x86
>> devices, which is actually quite a nice device. Under Windows it has
>> Dolby software for "better" sound and you can select different equalizer
>> presets using a special button.
>>
>> This WMI interface for this button is not really nice, as it does not do
>> notifies (it really does not I tripple checked), but since I had already
>> figured out the entire WMI interface for this I decided to go the full
>> mile anyways and also implent a WMI based input driver for this using
>> input_polldev since, well, we need to poll.
>>
>> This commit adds support for this button making it report KEY_SOUND input
>> events. KEY_SOUND is already used in various places to switch sound into
>> theatre mode and things like that so it seems appropriate here.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> +Dmitry (in case he wants to add a Reviewed-by, left all context below)
>
> Queued to testing, thanks Hans.

I just noticed that this is causing dmesg spew about the driver not
passing enough arguments to the WMBC method (it only consumes 2,
but apparently its signature says it takes 3). So I need to do a v3
fixing this, please drop this from your testing branch for now.

Regards,

Hans



>
>> ---
>> Changes in v2:
>> -Drop unneeded #include <linux/input.h>
>> -Add and use PEAQ_POLL_IGNORE_MS and PEAQ_POLL_MAX_MS defines
>> -Make globals static
>> -Call input_sync between reporting the button down and up
>> -Ignore events for at least 1 poll after an event even if the user has set
>>  poll_interval > PEAQ_POLL_IGNORE_MS
>> ---
>>  drivers/platform/x86/Kconfig    |  7 +++
>>  drivers/platform/x86/Makefile   |  1 +
>>  drivers/platform/x86/peaq-wmi.c | 97 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 105 insertions(+)
>>  create mode 100644 drivers/platform/x86/peaq-wmi.c
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index be2ffbd6eb6c..2bac2b2644f9 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -660,6 +660,13 @@ config MSI_WMI
>>  	 To compile this driver as a module, choose M here: the module will
>>  	 be called msi-wmi.
>>
>> +config PEAQ_WMI
>> +	tristate "PEAQ 2-in-1 WMI hotkey driver"
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	help
>> +	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
>> +
>>  config TOPSTAR_LAPTOP
>>  	tristate "Topstar Laptop Extras"
>>  	depends on ACPI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index de4ffb594ba5..02487f95dd27 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -34,6 +34,7 @@ obj-$(CONFIG_PANASONIC_LAPTOP)	+= panasonic-laptop.o
>>  obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
>>  obj-$(CONFIG_ACPI_WMI)		+= wmi.o
>>  obj-$(CONFIG_MSI_WMI)		+= msi-wmi.o
>> +obj-$(CONFIG_PEAQ_WMI)		+= peaq-wmi.o
>>  obj-$(CONFIG_SURFACE3_WMI)	+= surface3-wmi.o
>>  obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>>
>> diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
>> new file mode 100644
>> index 000000000000..47b36b2fa895
>> --- /dev/null
>> +++ b/drivers/platform/x86/peaq-wmi.c
>> @@ -0,0 +1,97 @@
>> +/*
>> + * PEAQ 2-in-1 WMI hotkey driver
>> + * Copyright (C) 2017 Hans de Goede <hdegoede@redhat.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/input-polldev.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +
>> +#define PEAQ_DOLBY_BUTTON_GUID		"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
>> +#define PEAQ_DOLBY_BUTTON_METHOD_ID	5
>> +#define PEAQ_POLL_INTERVAL_MS		250
>> +#define PEAQ_POLL_IGNORE_MS		500
>> +#define PEAQ_POLL_MAX_MS		1000
>> +
>> +MODULE_ALIAS("wmi:"PEAQ_DOLBY_BUTTON_GUID);
>> +
>> +static struct input_polled_dev *peaq_poll_dev;
>> +static unsigned int peaq_ignore_events_counter;
>> +
>> +/*
>> + * The Dolby button (yes really a Dolby button) causes an ACPI variable to get
>> + * set on both press and release. The WMI method checks and clears that flag.
>> + * So for a press + release we will get back One from the WMI method either once
>> + * (if polling after the release) or twice (polling between press and release).
>> + * We ignore events for 0.5s after the first event to avoid reporting 2 presses.
>> + */
>> +static void peaq_wmi_poll(struct input_polled_dev *dev)
>> +{
>> +	union acpi_object obj;
>> +	struct acpi_buffer buffer = { sizeof(obj), &obj };
>> +	acpi_status status;
>> +
>> +	status = wmi_evaluate_method(PEAQ_DOLBY_BUTTON_GUID, 1,
>> +				     PEAQ_DOLBY_BUTTON_METHOD_ID,
>> +				     NULL, &buffer);
>> +	if (ACPI_FAILURE(status))
>> +		return;
>> +
>> +	if (obj.type != ACPI_TYPE_INTEGER) {
>> +		dev_err(&peaq_poll_dev->input->dev,
>> +			"Error WMBC did not return an integer\n");
>> +		return;
>> +	}
>> +
>> +	if (peaq_ignore_events_counter && --peaq_ignore_events_counter > 0)
>> +		return;
>> +
>> +	if (obj.integer.value) {
>> +		input_event(peaq_poll_dev->input, EV_KEY, KEY_SOUND, 1);
>> +		input_sync(peaq_poll_dev->input);
>> +		input_event(peaq_poll_dev->input, EV_KEY, KEY_SOUND, 0);
>> +		input_sync(peaq_poll_dev->input);
>> +		peaq_ignore_events_counter = max(1u,
>> +			PEAQ_POLL_IGNORE_MS / peaq_poll_dev->poll_interval);
>> +	}
>> +}
>> +
>> +static int __init peaq_wmi_init(void)
>> +{
>> +	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>> +		return -ENODEV;
>> +
>> +	peaq_poll_dev = input_allocate_polled_device();
>> +	if (!peaq_poll_dev)
>> +		return -ENOMEM;
>> +
>> +	peaq_poll_dev->poll = peaq_wmi_poll;
>> +	peaq_poll_dev->poll_interval = PEAQ_POLL_INTERVAL_MS;
>> +	peaq_poll_dev->poll_interval_max = PEAQ_POLL_MAX_MS;
>> +	peaq_poll_dev->input->name = "PEAQ WMI hotkeys";
>> +	peaq_poll_dev->input->phys = "wmi/input0";
>> +	peaq_poll_dev->input->id.bustype = BUS_HOST;
>> +	input_set_capability(peaq_poll_dev->input, EV_KEY, KEY_SOUND);
>> +
>> +	return input_register_polled_device(peaq_poll_dev);
>> +}
>> +
>> +static void __exit peaq_wmi_exit(void)
>> +{
>> +	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>> +		return;
>> +
>> +	input_unregister_polled_device(peaq_poll_dev);
>> +}
>> +
>> +module_init(peaq_wmi_init);
>> +module_exit(peaq_wmi_exit);
>> +
>> +MODULE_DESCRIPTION("PEAQ 2-in-1 WMI hotkey driver");
>> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.12.2
>>
>>
>
