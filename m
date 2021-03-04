Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8774DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 17:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED5164E45
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 17:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238987AbhCDRIg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 12:08:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35421 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238965AbhCDRI0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 12:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614877620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w3SRZFmaZTdJZ1g9PtwUsRSNItO7wlVncrlvUrcgNDw=;
        b=fTX//GR0DaZIVywHGVg+mzPiZ8WD8aUjFFbpTTnU3viVJ6rEZahCqH93vWc/WBqSdgAqUW
        iX7P8UEnXWEYu2ln9bnAVwp9aZHcs/u/JzQp0At03Qd+UYsRUrQIG3Ql900U0k18ipZZTj
        hHgxbHMCwmylKAJ2rUqwg7duriQtyBQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-5bdHdtIhM-O0C3ZGKNPLuQ-1; Thu, 04 Mar 2021 12:06:49 -0500
X-MC-Unique: 5bdHdtIhM-O0C3ZGKNPLuQ-1
Received: by mail-ed1-f71.google.com with SMTP id t27so12112524edi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 09:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w3SRZFmaZTdJZ1g9PtwUsRSNItO7wlVncrlvUrcgNDw=;
        b=cqheMUhu9ej5xQY364IQNRQm4LXZeL1A2g4Dnc/SKWsFnK3yFMqGIusxbKNFsrVlVs
         c00eg09OKEevCkCxQ+/Y5ypIJvmaUw3biQLbMORLGa9Q7NA3Up3WYJehBc+W4ueJ9t+U
         9ulYqQ8sADnJxqqzAUqepc0ABL7XGeyV1oVhyozlvEUf68loiR80oJKp7+cOu1O5R4La
         PI8IlAfQoBQyBMPQki/ul+XcQWHBkdZt7iXeqejbFzAP1OOzVma0QD0V41BiAsqDmCqn
         mfQelqArxaXxIVAd/D25UbKSDF/qp9JaFZJjFRqtBt4PhPfyvtAA/00YgUZz6KDUeOBA
         Fieg==
X-Gm-Message-State: AOAM531fPK2XtSi2HvEtAyWE9sgrizY9RBwz7QOIJ/QIXqb29sjG0SSC
        esahXDLcthx5l3Dij4FcUaVD2Ip3+PNHqg3ck/7i52EbXuTCEwg/gD8kg9dDdk4SeFG1cFBxgVH
        6JB0N+4DUGZWcCnajW73sGbl53YY6jDWM/g==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr5369203ejb.510.1614877607877;
        Thu, 04 Mar 2021 09:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2Nqg4XXLQ5zD6z5rIIKVPjiC5djrTp5xRC6zyb6deTJciuNxZSw+S/9nZ6c0ji7VsK5v8Ag==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr5369167ejb.510.1614877607596;
        Thu, 04 Mar 2021 09:06:47 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e8sm20404486edq.77.2021.03.04.09.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 09:06:46 -0800 (PST)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [V1,1/1] platform/x86: add support for Advantech software defined
 button
To:     Andrea.Ho@advantech.com.tw, platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Mark Gross <mgross@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20210302064428.15403-1-Andrea.Ho@advantech.com.tw>
Message-ID: <3fb120be-2d0d-c82f-55b8-5335e1e66bda@redhat.com>
Date:   Thu, 4 Mar 2021 18:06:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302064428.15403-1-Andrea.Ho@advantech.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andrea,

On 3/2/21 7:44 AM, Andrea.Ho@advantech.com.tw wrote:
> From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
> 
> Advantech sw_button is a ACPI event trigger button.
> 
> With this driver, we can report KEY_EVENT on the
> Advantech Tabletop Network Appliances products and it has been
> tested in FWA1112VC.
> 
> Add the software define button support to report EV_REP key_event
> (BTN_TRIGGER_HAPPY) by pressing button that cloud be get on user
> interface and trigger the customized actions.
> 
> Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>

Thank you for your patch.

I've not done a full review but there are a few things which
I've noticed from a quick look which need fixing:

1. BTN_TRIGGER_HAPPY is a evdev key-code define which is meant to
be used on gaming-devices with tons of buttons. This is not a good
key-code to use for this. I'm going to assume that the user can
assign some custom action to this button. In that case it would be
good to use KEY_PROG1 as code.


2. You have made this an acpi_driver, but those really only
should be used in special cases and the ACPI subsys maintainer
(Rafael, added to the Cc.) has indicated that this really should
just be a platform driver.  The ACPI subsystem will instantiate
platform-devices for most devices described in the ACPI tables.
So you should not only have a "AHC0310:00" acpi_device under:
/sys/bus/acpi/devices

But also a "AHC0310:00" platform_device under:
/sys/bus/platform/devices

And that is the one which the driver should use, so please rewrite
your driver to be a regular platform_driver instead.

You can then use something like this to install the notifier
which you need:

        acpi_device = ACPI_COMPANION(&platform_device->dev);
        if (!acpi_device) {
                dev_err(&platform_device->dev, "ACPI companion is missing\n");
                return -ENODEV;
        }
	
        status = acpi_install_notify_handler(acpi_device->handle,
                                             ACPI_DEVICE_NOTIFY,
                                             my_notify_handler,
                                             my_data);
        if (ACPI_FAILURE(status)) {
                dev_err(&platform_device->dev, "Error installing notify handler\n");
                return -ENODEV;
        }

See for example drivers/platform/x86/wmi.c .


3. You have a lot of defines which you use only once, this does not help
to make the code to be more readable, please just write strings like
"Software Button" out where you need them. Especially since you will only
need this once when you move to a platform_driver.

4. Please use less generic names for things like the driver-name,
e.g. instead of "Software Button" use "Advantech Software Button" and
instead of "button" use "adv_swbutton".

5. There are also some completely unused defines like ACPI_BUTTON_FILE_INFO,
please remove these.

Regards,

Hans


> ---
>  MAINTAINERS                         |   5 +
>  drivers/platform/x86/Kconfig        |  11 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/adv_swbutton.c | 190 ++++++++++++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 drivers/platform/x86/adv_swbutton.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c71664ca8bfd..d8951050d273 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -571,6 +571,11 @@ S:	Maintained
>  F:	Documentation/scsi/advansys.rst
>  F:	drivers/scsi/advansys.c
>  
> +ADVANTECH SWBTN DRIVER
> +M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
> +S:	Maintained
> +F:	drivers/platform/x86/adv_swbutton.c
> +
>  ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
>  M:	Michael Hennerich <michael.hennerich@analog.com>
>  S:	Supported
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index ad4e630e73e2..b553f3ebb9a7 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -179,6 +179,17 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> +config ADV_SWBUTTON
> +    tristate "Advantech ACPI Software button Driver"
> +    depends on ACPI
> +    help
> +      Say Y here to enable support for Advantech software defined
> +      button feature. More information can be fount at
> +      <http://www.advantech.com.tw/products/>
> +
> +      To compile this driver as a module, choose M here. The module will
> +      be called adv_swbutton.
> +
>  config AMD_PMC
>  	tristate "AMD SoC PMC driver"
>  	depends on ACPI && PCI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 60d554073749..2faadc614cd2 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -21,6 +21,9 @@ obj-$(CONFIG_ACERHDF)		+= acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>  
> +# Advantech
> +obj-$(CONFIG_ADV_SWBUTTON)  += adv_swbutton.o
> +
>  # AMD
>  obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
>  
> diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
> new file mode 100644
> index 000000000000..09e5a83c61a9
> --- /dev/null
> +++ b/drivers/platform/x86/adv_swbutton.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  adv_swbutton.c - Software Button Interface Driver.
> + *
> + *  (C) Copyright 2020 Advantech Corporation, Inc
> + *
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/version.h>
> +#include <linux/types.h>
> +#include <linux/proc_fs.h>
> +#include <linux/seq_file.h>
> +#include <linux/input.h>
> +#include <linux/slab.h>
> +#include <linux/acpi.h>
> +#include <linux/ktime.h>
> +#include <linux/moduleparam.h>
> +#include <acpi/button.h>
> +#include <acpi/acpi_bus.h>
> +#include <acpi/acpi_drivers.h>
> +
> +#define ACPI_SWBTN_NAME                     "Software Button"
> +#define ACPI_BUTTON_CLASS                   "button"
> +
> +#define ACPI_BUTTON_SUBCLASS_SOFTWARE       "software"
> +#define ACPI_BUTTON_HID_SWBTN               "AHC0310"
> +#define ACPI_BUTTON_TYPE_SOFTWARE           0x07
> +
> +#define ACPI_BUTTON_FILE_INFO               "info"
> +#define ACPI_BUTTON_FILE_STATE              "state"
> +#define ACPI_BUTTON_TYPE_UNKNOWN            0x00
> +
> +#define ACPI_BUTTON_NOTIFY_SWBTN_RELEASE    0x86
> +#define ACPI_BUTTON_NOTIFY_SWBTN_PRESSED    0x85
> +
> +#define SOFTWARE_BUTTON                     BTN_TRIGGER_HAPPY
> +
> +#define _COMPONENT                          ACPI_BUTTON_COMPONENT
> +
> +struct acpi_button {
> +	unsigned int type;
> +	struct input_dev *input;
> +	char phys[32];
> +	bool pressed;
> +};
> +
> +/*-------------------------------------------------------------------------
> + *                               Driver Interface
> + *--------------------------------------------------------------------------
> + */
> +static void acpi_button_notify(struct acpi_device *device, u32 event)
> +{
> +	struct acpi_button *button = acpi_driver_data(device);
> +	struct input_dev *input;
> +
> +	int keycode, BTN_KEYCODE = SOFTWARE_BUTTON;
> +
> +	switch (event) {
> +	case ACPI_BUTTON_NOTIFY_SWBTN_RELEASE:
> +		input = button->input;
> +
> +		if (!button->pressed)
> +			return;
> +
> +		keycode = test_bit(BTN_KEYCODE, input->keybit) ?
> +				BTN_KEYCODE : KEY_UNKNOWN;
> +
> +		button->pressed = false;
> +
> +		input_report_key(input, keycode, 0);
> +		input_sync(input);
> +	break;
> +	case ACPI_BUTTON_NOTIFY_SWBTN_PRESSED:
> +		input = button->input;
> +		button->pressed = true;
> +
> +		keycode = test_bit(BTN_KEYCODE, input->keybit) ?
> +			    BTN_KEYCODE : KEY_UNKNOWN;
> +
> +		input_report_key(input, keycode, 1);
> +		input_sync(input);
> +	break;
> +	default:
> +		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
> +				  "Unsupported event [0x%x]\n", event));
> +	break;
> +	}
> +}
> +
> +static int acpi_button_add(struct acpi_device *device)
> +{
> +	struct acpi_button *button;
> +	struct input_dev *input;
> +	const char *hid = acpi_device_hid(device);
> +	char *name, *class;
> +	int error;
> +
> +	button = devm_kzalloc(&device->dev, sizeof(*button), GFP_KERNEL);
> +	if (!button)
> +		return -ENOMEM;
> +
> +	device->driver_data = button;
> +	input = devm_input_allocate_device(&device->dev);
> +	if (!input) {
> +		error =  -ENOMEM;
> +		goto err_free_mem;
> +	}
> +
> +	button->input = input;
> +
> +	name = acpi_device_name(device);
> +	class = acpi_device_class(device);
> +
> +	if (!strcmp(hid, ACPI_BUTTON_HID_SWBTN)) {
> +		button->type = ACPI_BUTTON_TYPE_SOFTWARE;
> +		button->pressed = false;
> +		strcpy(name, ACPI_SWBTN_NAME);
> +		sprintf(class, "%s/%s", ACPI_BUTTON_CLASS,
> +			ACPI_BUTTON_SUBCLASS_SOFTWARE);
> +	} else {
> +		return -ENODEV;
> +	}
> +
> +	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", hid);
> +
> +	input->name = name;
> +	input->phys = button->phys;
> +	input->id.bustype = BUS_HOST;
> +	input->id.product = button->type;
> +	input->dev.parent = &device->dev;
> +
> +	switch (button->type) {
> +	case ACPI_BUTTON_TYPE_SOFTWARE:
> +		set_bit(EV_KEY, input->evbit);
> +		set_bit(EV_REP, input->evbit);
> +
> +		input_set_capability(input, EV_KEY, SOFTWARE_BUTTON);
> +	break;
> +	}
> +
> +	input_set_drvdata(input, device);
> +	error = input_register_device(input);
> +	if (error)
> +		return error;
> +
> +	device_init_wakeup(&device->dev, true);
> +
> +	return 0;
> +
> +err_free_mem:
> +	devm_kfree(&device->dev, button);
> +	return error;
> +}
> +
> +static int acpi_button_remove(struct acpi_device *device)
> +{
> +	struct acpi_button *button = acpi_driver_data(device);
> +
> +	input_unregister_device(button->input);
> +	devm_kfree(&device->dev, button);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id button_device_ids[] = {
> +	{ACPI_BUTTON_HID_SWBTN, 0},
> +	{"", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, button_device_ids);
> +
> +static struct acpi_driver acpi_button_driver = {
> +	.name = ACPI_SWBTN_NAME,
> +	.class = ACPI_BUTTON_CLASS,
> +	.owner = THIS_MODULE,
> +	.ids = button_device_ids,
> +	.ops = {
> +		.add = acpi_button_add,
> +		.remove = acpi_button_remove,
> +		.notify = acpi_button_notify,
> +	},
> +};
> +
> +module_acpi_driver(acpi_button_driver);
> +
> +ACPI_MODULE_NAME("swbutton");
> +
> +MODULE_AUTHOR("Andrea Ho");
> +MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
> +MODULE_LICENSE("GPL v2");
> 

