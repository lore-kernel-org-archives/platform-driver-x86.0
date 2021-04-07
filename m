Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50B9C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D6B461369
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242710AbhDGLSp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:18:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53662 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230395AbhDGLSo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 07:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617794315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QgxYUwsN5lDcY4QsH4nkn1LOGt4KZ45ujkAqYaez+JM=;
        b=I5bGkNXmXnY82yHLvCXTPEMd33aAEK/5oFDuDfSPJJYMVbAgfzShIAOalbVb/6gG72NOD+
        4BkBPjY4Sji/kR7955l+lVHiPu+pd1W2aNkekTgbFHzrbtMrRPTgyYBiOOyQxxuXeJua/c
        TL/ni7CL9eZtb4c2yw+7ihnyskWjPLE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-FDEsTI7DMbWY9Tvy97pPKQ-1; Wed, 07 Apr 2021 07:18:23 -0400
X-MC-Unique: FDEsTI7DMbWY9Tvy97pPKQ-1
Received: by mail-ej1-f72.google.com with SMTP id gn30so6749404ejc.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 04:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QgxYUwsN5lDcY4QsH4nkn1LOGt4KZ45ujkAqYaez+JM=;
        b=kf+okH3KNzP3yKHlJG+sXbmsFwfgffWpAHdd/Mc7PlOwtJlkheM9ajkXI38CyWT2D/
         Q8nl+sXBlaIb8iQ/ni+aSVlpHZ7p35VzZT5Be6phCPt015bv3T+4Dwy2NIzD9SNWeKap
         UuLh4KugvtzJCdTyh0nbnCYhsXgnaaHmBNCQk/j3ESFIm9jiDnTMaLdhzdvqeVhlFcPQ
         KqbebOnW4U7Omxf4xLxvqlAGMU3QMB1+UeQQJy+MJ7oogggIwpAPx4liG0T+Q1O/8V/N
         bJd0X3YEImhI+My6Sx+Syxl3g2Bym6Ya7jhLZCdzuUCMkNwCcc4AFmWY8+gvPp/cNg1q
         AuAg==
X-Gm-Message-State: AOAM533VWvBWf+z/BfRE9HRz1D7BEriAPtdFS4iVEL9S5xxA9AqvPBBK
        1tL2ZKNwOcweMoS51dduvCqIUfL55pCCJMULdREf8CJcncD0OQ2AUTsCkYbruj3qIVzx1Bvo96+
        /mFzqHo0jISn5JC27K8nCD1kh/PZmHSO6nA==
X-Received: by 2002:a05:6402:438f:: with SMTP id o15mr3753017edc.123.1617794302247;
        Wed, 07 Apr 2021 04:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwslg/803QCIxVH2dTBLnhOsJYdwsy4ygUWj3yiwLyfQKfbrQd8pHxvJVPM7cPgpmB7FqaiPg==
X-Received: by 2002:a05:6402:438f:: with SMTP id o15mr3752998edc.123.1617794302086;
        Wed, 07 Apr 2021 04:18:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f15sm1096297edx.87.2021.04.07.04.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:18:21 -0700 (PDT)
Subject: Re: [PATCH v3] platform/x86: add support for Advantech software
 defined button
To:     YingChieh Ho <andrea.cs97g@nctu.edu.tw>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     voyandrea@gmail.com, Andrea.Ho@advantech.com.tw
References: <20210319034427.23222-1-andrea.cs97g@nctu.edu.tw>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6b7ecc50-1dba-1435-53e8-3297addb517e@redhat.com>
Date:   Wed, 7 Apr 2021 13:18:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319034427.23222-1-andrea.cs97g@nctu.edu.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/19/21 4:44 AM, YingChieh Ho wrote:
> From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
> 
> Advantech sw_button is a ACPI event trigger button.
> 
> With this driver, we can report KEY_EVENT on the
> Advantech Tabletop Network Appliances products and it has been
> tested in FWA1112VC.
> 
> Add the software define button support to report EV_REP key_event
> (KEY_PROG1) by pressing button that cloud be get on user
> interface and trigger the customized actions.
> 
> Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>
> v3:
>         - refined struct and functions of the driver
>         - drop acpi_device and use adv_swbutton as driver name
>         - remove all unnecessary defines
> 
> v2:
>         - change evdev key-code from BTN_TRIGGER_HAPPY to KEY_PROG1
>         - to rewrite the driver to be a regular platform_driver
>         - use specific names instead of generic names,
>           "Software Button" to "Advantech Software Button",
>           "button" to "adv_swbutton"
>         - remove unused defines or use-once defines
> 	  ACPI_BUTTON_FILE_INFO, ACPI_BUTTON_FILE_STATE,
> 	  ACPI_BUTTON_TYPE_UNKNOWN, ACPI_SWBTN_NAME
> ---
>  MAINTAINERS                         |   5 ++
>  drivers/platform/x86/Kconfig        |  11 +++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/adv_swbutton.c | 127 ++++++++++++++++++++++++++++
>  4 files changed, 146 insertions(+)
>  create mode 100644 drivers/platform/x86/adv_swbutton.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68f21d46614c..e35c48e411b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -562,6 +562,11 @@ S:	Maintained
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
> index 0581a54cf562..b1340135c5e9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -180,6 +180,17 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> +config ADV_SWBUTTON
> +    tristate "Advantech ACPI Software Button Driver"
> +    depends on ACPI
> +    help
> +      Say Y here to enable support for Advantech software defined
> +      button feature. More information can be fount at
> +      <http://www.advantech.com.tw/products/>
> +
> +      To compile this driver as a module, choose M here. The module will
> +      be called adv_swbutton.
> +
>  config APPLE_GMUX
>  	tristate "Apple Gmux Driver"
>  	depends on ACPI && PCI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 2b85852a1a87..76a321fc58ba 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -22,6 +22,9 @@ obj-$(CONFIG_ACERHDF)		+= acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>  
> +# Advantech
> +obj-$(CONFIG_ADV_SWBUTTON)  += adv_swbutton.o
> +
>  # Apple
>  obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
>  
> diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
> new file mode 100644
> index 000000000000..8618dcbbd811
> --- /dev/null
> +++ b/drivers/platform/x86/adv_swbutton.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  adv_swbutton.c - Software Button Interface Driver.
> + *
> + *  (C) Copyright 2020 Advantech Corporation, Inc
> + *
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/input.h>
> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +
> +#define ACPI_BUTTON_HID_SWBTN               "AHC0310"
> +
> +#define ACPI_BUTTON_NOTIFY_SWBTN_RELEASE    0x86
> +#define ACPI_BUTTON_NOTIFY_SWBTN_PRESSED    0x85
> +
> +#define _COMPONENT                          ACPI_BUTTON_COMPONENT
> +
> +struct adv_swbutton {
> +	struct input_dev *input;
> +	char phys[32];
> +};
> +
> +/*-------------------------------------------------------------------------
> + *                               Driver Interface
> + *--------------------------------------------------------------------------
> + */
> +static void adv_swbutton_notify(acpi_handle handle, u32 event, void *context)
> +{
> +	struct platform_device *device = context;
> +	struct adv_swbutton *button = dev_get_drvdata(&device->dev);
> +
> +	switch (event) {
> +	case ACPI_BUTTON_NOTIFY_SWBTN_RELEASE:
> +		input_report_key(button->input, KEY_PROG1, 0);
> +		input_sync(button->input);
> +	break;
> +	case ACPI_BUTTON_NOTIFY_SWBTN_PRESSED:
> +		input_report_key(button->input, KEY_PROG1, 1);
> +		input_sync(button->input);
> +	break;
> +	default:
> +		dev_dbg(&device->dev, "Unsupported event [0x%x]\n", event);
> +	}
> +}
> +
> +static int adv_swbutton_probe(struct platform_device *device)
> +{
> +	struct adv_swbutton *button;
> +	struct input_dev *input;
> +	acpi_handle handle = ACPI_HANDLE(&device->dev);
> +	acpi_status status;
> +
> +	int error;
> +
> +	button = devm_kzalloc(&device->dev, sizeof(*button), GFP_KERNEL);
> +	if (!button)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&device->dev, button);
> +
> +	input = devm_input_allocate_device(&device->dev);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	button->input = input;
> +

While prepping v3 you seem to have accidentally dropped the:

	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", ACPI_BUTTON_HID_SWBTN);

Line from v2 here. I've fixed this up locally together with
some whitespace fixes and I've merged this now:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> +	input->name = "Advantech Software Button";
> +	input->phys = button->phys;
> +	input->id.bustype = BUS_HOST;
> +	input->dev.parent = &device->dev;
> +
> +	set_bit(EV_KEY, input->evbit);
> +	set_bit(EV_REP, input->evbit);
> +
> +	input_set_capability(input, EV_KEY, KEY_PROG1);
> +	error = input_register_device(input);
> +	if (error)
> +		return error;
> +
> +	device_init_wakeup(&device->dev, true);
> +
> +	status = acpi_install_notify_handler(handle,
> +					     ACPI_DEVICE_NOTIFY,
> +					     adv_swbutton_notify,
> +					     device);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&device->dev, "Error installing notify handler\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int adv_swbutton_remove(struct platform_device *device)
> +{
> +	acpi_handle handle = ACPI_HANDLE(&device->dev);
> +
> +	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY,
> +				   adv_swbutton_notify);
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id button_device_ids[] = {
> +	{ACPI_BUTTON_HID_SWBTN, 0},
> +	{"", 0},
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, button_device_ids);
> +
> +static struct platform_driver adv_swbutton_driver = {
> +	.driver = {
> +		.name = "adv_swbutton",
> +		.acpi_match_table = button_device_ids,
> +	},
> +	.probe = adv_swbutton_probe,
> +	.remove = adv_swbutton_remove,
> +};
> +
> +module_platform_driver(adv_swbutton_driver);
> +
> +MODULE_AUTHOR("Andrea Ho");
> +MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
> +MODULE_LICENSE("GPL v2");
> 

