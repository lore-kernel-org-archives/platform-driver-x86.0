Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B878EC07E96
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 16:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92F9E613C1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 16:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhGOQXE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Jul 2021 12:23:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48738 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229518AbhGOQXE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jul 2021 12:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626366010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hzlpw0JKCKwUikDIdI9wPRhoQh7Rv8vhx6DXy1RhvM8=;
        b=IgSmlaIDD/6I2N6cEHQ9N8qXbouI5WFVaJKymTLbhKtVLhXBMxKLldkHmjkefN/jGjZTiV
        +VhbyNtWkEfH8dnQ0h/ZXurn/V0Ygyf2CSPItbiPGI5EWw7Z6wh57rdtLutLEdkl+XgRcX
        ocmJMjSnmd4P6Y2YpFnkwFnpPpLelFU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-8c-HYxBAM_mV-pUZNQiu8w-1; Thu, 15 Jul 2021 12:20:09 -0400
X-MC-Unique: 8c-HYxBAM_mV-pUZNQiu8w-1
Received: by mail-ej1-f70.google.com with SMTP id de27-20020a1709069bdbb02904dedfc43879so2399279ejc.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jul 2021 09:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hzlpw0JKCKwUikDIdI9wPRhoQh7Rv8vhx6DXy1RhvM8=;
        b=LbcNMTrMB2QAGAqbTty+KjQM6vmxiDuXZYUD0K3jyNy0Te6F00zYxnye61xB5rA5h6
         1ODbb6EC2oFGmxkA1vpxJtZ5mGnPQ0wKCtV4aMN2tVcl0OLJ3A/p2D4qs5gSv8fTYG5w
         G6oiQfb6uTJ58M2yR8tI8hhUOFnoKSnW63MbjZdV7AxkurECVDevRxDCH523G3gwbo2B
         LeitGFwIIDGFbB9wGEXLapk4VeaDm+NRBLTtIaUm9dC7B0umozlO2t/NIDx1TrN0+TaL
         RlVUEEbuvd4nzHRsW8UVmlmbEZF16/BDboMyLSj/PMHJmfVgYYI7kYZ812cDJ6irC2fg
         YYEw==
X-Gm-Message-State: AOAM530E53RZwWxTMCR16vA0SqAtFb3BSsZTEK5RGpuYv0G28xdvJNpk
        cprZ5al9PVYcvgUJoVXDA4bYQR7Y604HcKLNIW5scFw9ZOHqYcAAI52A2xrHDfskQN75AY/v+E6
        UsKTDMk2cDxD/65BQHI5Izz8Y9Zx9xmnhqw==
X-Received: by 2002:a17:906:fa8e:: with SMTP id lt14mr6364219ejb.21.1626366007726;
        Thu, 15 Jul 2021 09:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEvPt+T9a7mePGC/Cn7BBS/urEjPbhl5tvQqHj6DPocX3d/Ae+6JwlgJu0obEodfUEINH6ig==
X-Received: by 2002:a17:906:fa8e:: with SMTP id lt14mr6364170ejb.21.1626366007338;
        Thu, 15 Jul 2021 09:20:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id kf3sm795263ejc.118.2021.07.15.09.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 09:20:06 -0700 (PDT)
Subject: Re: [PATCH V2 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
To:     Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210510074016.31627-1-s.shravan@intel.com>
 <20210510074016.31627-2-s.shravan@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f353c576-7960-d211-245f-0e735f95a39f@redhat.com>
Date:   Thu, 15 Jul 2021 18:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210510074016.31627-2-s.shravan@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shravan,

Here is a first set of review remarks, note this is just from
a very quick glance, so these are just some initial remarks.
I will do a more thorough review after you post a v3 addressing these
initial remarks.

First of all the subject of the patch (first line of the commit msg)
should be:

"platform/x86: Add BIOS Dynamic SAR driver for Intel M.2 Modem"

And then after that you should have a proper commit msg describing
what this driver is and why it is necessary.

And you commit msg must end with this line:

Signed-off-by: Shravan S <s.shravan@intel.com>

See: https://elinux.org/Developer_Certificate_Of_Origin

On 5/10/21 9:40 AM, Shravan S wrote:
> V2 :
> * Changes to the remove netlink and introduce sysfs to communicate to Userspace via notify
> * Handled review comments by changing ioctl calls to sysfs
> * "sar" name change for platform_device_id to "intc1092"
> * sar_init and sar_exit is modified as per review to minimal initialization
> * Inclusion of debug only enabling of device mode change parameters

Having a changelog is good, but you need to put it below the
"Signed-off-by: Shravan S <s.shravan@intel.com>" line like this:

Signed-off-by: Shravan S <s.shravan@intel.com
---
V2 :
* Changes to the remove netlink and introduce ...


> ---
>  drivers/platform/x86/Kconfig                |  12 +
>  drivers/platform/x86/Makefile               |   1 +
>  drivers/platform/x86/intel-sar.c            | 550 ++++++++++++++++++++
>  include/linux/platform_data/x86/intel-sar.h |  91 ++++
>  4 files changed, 654 insertions(+)
>  create mode 100644 drivers/platform/x86/intel-sar.c
>  create mode 100644 include/linux/platform_data/x86/intel-sar.h
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 60592fb88e7a..6dfa89310677 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1313,6 +1313,18 @@ config INTEL_TELEMETRY
>  	  directly via debugfs files. Various tools may use
>  	  this interface for SoC state monitoring.
>  
> +config INTEL_SAR
> +	tristate "Intel Specific Absorption Rate Driver"
> +	depends on ACPI
> +	help
> +	  This driver limit the exposure of human body to RF frequency by informing
> +	  the Intel M.2 modem to regulate the RF power based on SAR data obtained
> +	  from the sensorscaptured in the BIOS. ACPI interface exposes this data

missing space between sensors and captured.
> +	  from the BIOS to SAR driver. The front end application in userspace
> +	  will interact with SAR driver to obtain information like the device mode,
> +	  Antenna index,baseband index, SAR table index and use available communication

missing space after the first comma (',')

> +	  like MBIM interface to enable data communication to modem for RF power regulation.

Maybe this would be a good start of the commit msg?


> +
>  endif # X86_PLATFORM_DEVICES
>  
>  config PMC_ATOM
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index dcc8cdb95b4d..548ff663c4af 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)		+= intel-smartconnect.o
>  obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)	+= intel_speed_select_if/
>  obj-$(CONFIG_INTEL_TURBO_MAX_3)			+= intel_turbo_max_3.o
>  obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
> +obj-$(CONFIG_INTEL_SAR)				+= intel-sar.o
>  
>  # Intel PMIC / PMC / P-Unit devices
>  obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
> diff --git a/drivers/platform/x86/intel-sar.c b/drivers/platform/x86/intel-sar.c
> new file mode 100644
> index 000000000000..fa16ae59851b
> --- /dev/null
> +++ b/drivers/platform/x86/intel-sar.c
> @@ -0,0 +1,550 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel Corporation - ACPI for Specific Absorption Rate
> + * Copyright (c) 2021, Intel Corporation.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <uapi/linux/errno.h>

You should never use uapi headers in kernel code

> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +#include <linux/platform_data/x86/intel-sar.h>

please sort all the includes alphabetically.

> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Platform device driver for INTEL MODEM BIOS SAR");
> +MODULE_AUTHOR("Shravan S <s.shravan@intel.com>");

PLease move these 3 MODULE_... lines to the end of the file.

> +
> +static struct WWAN_SAR_CONTEXT *context;

You are binding to a platform_dev, so no global context
pointer please. Instead please use platform_set_drvdata() /
platform_get_drvdata() and the option to pass a data
pointer to other callbacks.


> +static int sar_add(struct platform_device *device);
> +static int sar_remove(struct platform_device *device);
> +static void sar_shutdown(struct platform_device *device);
> +static void sar_notify(acpi_handle handle, u32 event, void *data);

Please move the definition of these functions to above their
first use and drop these forward declarations.

> +
> +/**
> + * sar_send_notify - Send SAR data notification to userspace
> + * Send the sar data notification to the userspace and later sent to modem
> + * by the userspace application. The data sent is collected from the BIOS.
> + * This data is used by userspace for further handling of the modem output.
> + */
> +static void sar_send_notify(void)
> +{


You are using 2 tabs instead of 1 as indentation level here and everywhere
else, please fix this everywhere.

> +		if (!context) {
> +			pr_alert("%s: context is null\n", __func__);
> +			return;
> +		}

context should be passed to this function (see above) and then this check
can go away.

> +		pr_debug("%s: %d, %d, %d, %d\n", __func__, context->sar_data.device_mode,
> +			 context->sar_data.bandtable_index, context->sar_data.antennatable_index,
> +			 context->sar_data.sartable_index);

Use dev_dbg() please, also you have a lot of debugging prints in this
driver, are all these really necessary? Please use less debugging prints
if possible.

> +		sysfs_notify(context->sar_kobject, NULL, "intc_data");

So after removing the useless context check + the over-zealous debuging
this function is reduced to just this one line, please drop this
function and instead directly write this one line.

> +}
> +
> +/**
> + * clear_sar_dev_mode - Clear Device Mode by freeing the allocated data
> + * If the Device Mode Info is present and allocated, clear it. This is for
> + * dynamic allocated memory of device_mode_info
> + */
> +static void clear_sar_dev_mode(void)
> +{
> +		int reg = 0;
> +
> +		for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +			kfree(context->config_data[reg].device_mode_info);
> +			context->config_data[reg].device_mode_info = NULL;
> +		}
> +}

Please just move this code into sar_remove(), and drop this function.

> +
> +/**
> + * get_int_value - Retrieve Integer values from ACPI Object
> + * Value of the integer from the object of ACPI is obtained.
> + * @obj: acpi_object pointer which gets the integer value
> + * @out: output pointer for integer
> + * returns 0 on success
> + */
> +static int get_int_value(union acpi_object *obj, int *out)
> +{
> +		if (obj && obj->type == ACPI_TYPE_INTEGER) {
> +			*out = (int)obj->integer.value;
> +			return 0;
> +		} else {
> +			return -1;

Please use -ESOME_ERRORCODE here.

> +		}
> +}
> +
> +/**
> + * update_sar_data - sar data is updated based on reg_value
> + * sar_data is updated based on regulatory value
> + */
> +static void update_sar_data(void)
> +{
> +		pr_debug("%s: Update SAR data\n", __func__);
> +		if (context->config_data[context->reg_value].device_mode_info &&
> +		    context->sar_data.device_mode <=
> +		    context->config_data[context->reg_value].total_dev_mode) {

Please use:

	struct WWAN_DEVICE_MODE_INFO *info;
	int idx = context->reg_value;

	/* FIXME what if idx > the length of the config_data array? Add check here */

	info = context->config_data[idx].device_mode_info;

	if (!info || context->sar_data.device_mode > context->config_data[idx].total_dev_mode) {
		dev_err(..., "sar data not assigned! ...);
		return;
	}

	// Do all the assigns here using the new idx helper and put one assignment
	// per line, the split up assingment code below is simply not readable at all.



> +			context->sar_data.antennatable_index =
> +			context->config_data[context->reg_value]
> +			.device_mode_info[context->sar_data.device_mode].antennatable_index;
> +			context->sar_data.bandtable_index =
> +			context->config_data[context->reg_value]
> +			.device_mode_info[context->sar_data.device_mode].bandtable_index;
> +			context->sar_data.sartable_index =
> +			context->config_data[context->reg_value]
> +			.device_mode_info[context->sar_data.device_mode].sartable_index;
> +			pr_debug("bandtable_index: %d\n", context->sar_data.bandtable_index);
> +			pr_debug("antennatable_index : %d\n", context->sar_data.antennatable_index);
> +			pr_debug("sartable_index: %d\n", context->sar_data.sartable_index);

Is this debugging really necessary?

> +		} else {
> +			pr_err("%s: sar data not assigned! Dev mode: %d, total_dev_mode: %d\n",
> +			       __func__, context->sar_data.device_mode,
> +			       context->config_data[context->reg_value].total_dev_mode);
> +		}
> +}
> +
> +/**
> + * parse_guid - parse guid based on DSM UUID
> + * returns if success or error
> + */
> +static acpi_status parse_guid(void)
> +{
> +		if (guid_parse(SAR_DSM_UUID, &context->guid)) {
> +			pr_err("%s: UUID error\n", __func__);
> +			return AE_ERROR;
> +		}
> +		context->parse = true;
> +		return AE_OK;
> +}

Please drop this weird helper and just do the parse once from
sar_add() and fail the probe if the parse fails, you can then also
drop the parse boolean value from the context.


> +
> +/**
> + * parse_package - parse package for SAR
> + * @item : acpi_object ptr
> + * returns if success or error
> + */
> +static acpi_status parse_package(union acpi_object *item)
> +{
> +		int value = 0, itr = 0, reg = 0;
> +		union acpi_object *num;
> +		struct WWAN_DEVICE_MODE_CONFIGURATION *data;
> +
> +		num = &item->package.elements[0];
> +		if (get_int_value(num, &value) == 0) {
> +			pr_debug("%s: Regulatory value : %d\n", __func__, value);
> +			if (value >= 0 && value < MAX_REGULATORY)
> +				reg = value;
> +			else
> +				return AE_ERROR;
> +		}
> +		data = &context->config_data[reg];
> +		if (data->total_dev_mode == 0) {
> +			pr_debug("Dev Mode count is zero, return\n");
> +			return AE_OK;
> +		}
> +		data->device_mode_info =
> +		kmalloc_array(data->total_dev_mode,
> +			      sizeof(struct WWAN_DEVICE_MODE_INFO), GFP_KERNEL);
> +		if (!data->device_mode_info) {
> +			pr_err("Cannot allocate memory in kernel\n");
> +			return AE_ERROR;
> +		}
> +		for (itr = 0; itr < data->total_dev_mode; itr++) {
> +			if (itr + 1 == item->package.count)
> +				break;
> +			num = &item->package.elements[itr + 1];
> +			if (num->type != ACPI_TYPE_PACKAGE)
> +				continue;
> +			if (get_int_value(&num->package.elements[0], &value) == 0) {
> +				pr_debug("%s: Device Mode for mode %d: %d\n", __func__,
> +					 itr, value);
> +				data->device_mode_info[itr].device_mode = value;
> +			}
> +			if (get_int_value(&num->package.elements[1], &value) == 0) {
> +				pr_debug("%s: band_index mode %d: %d\n", __func__,
> +					 itr, value);
> +				data->device_mode_info[itr].bandtable_index = value;
> +			}
> +			if (get_int_value(&num->package.elements[2], &value) == 0) {
> +				pr_debug("%s: antenna_index mode %d: %d\n", __func__,
> +					 itr, value);
> +				data->device_mode_info[itr].antennatable_index = value;
> +			}
> +			if (get_int_value(&num->package.elements[3], &value) == 0) {
> +				pr_debug("%s: sar_index for mode %d: %d\n", __func__,
> +					 itr, value);
> +				data->device_mode_info[itr].sartable_index = value;
> +			}
> +		}
> +		return AE_OK;
> +}
> +
> +/**
> + * sar_module_probe - Extraction of information from BIOS via DSM calls
> + * Retrieve all values related to device mode and SAR Table index,
> + * Antenna Table index, Band Table index
> + * @device: ACPI device for which to retrieve the data
> + * Returns AE_OK on success
> + */
> +static acpi_status sar_module_probe(struct platform_device *device)
> +{
> +		acpi_status status = AE_OK;
> +		union acpi_object *out, *item, req;
> +		u32 rev = 0, reg = 0;
> +		int value = 0;
> +
> +		pr_alert("%s Triggered\n", __func__);
> +		if (!device) {
> +			pr_err("%s: platform driver is null\n", __func__);
> +			return AE_ERROR;
> +		}
> +		if (!context) {
> +			pr_err("%s: context is null\n", __func__);
> +			return AE_ERROR;
> +		}
> +		pr_debug("ACPI_HANDLE : %p\n", ACPI_HANDLE(&device->dev));
> +		if (!(context->parse)) {
> +			status = parse_guid();
> +			if (status != AE_OK)
> +				return status;
> +		}
> +		context->handle = ACPI_HANDLE(&device->dev);
> +		out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +					COMMAND_ID_DEV_MODE, NULL);
> +		pr_debug("%s: acpi_evaluate_dsm completed %d\n", __func__, out->type);
> +		if (get_int_value(out, &value) == 0) {
> +			pr_debug("%s: Device Mode is : %d\n", __func__, value);
> +			context->sar_data.device_mode = value;
> +		} else {
> +			pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_DEV_MODE);
> +			return AE_ERROR;
> +		}
> +		ACPI_FREE(out);
> +		if (!(context->data_read)) {

Do we really need to do this from the ACPI notify callback? Can't this just be done
at sar_add() time once instead ?

> +			for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +				req.type = ACPI_TYPE_INTEGER;
> +				req.integer.value = reg;
> +				out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +							COMMAND_ID_CONFIG_TABLE, &req);
> +				if (!out) {
> +					pr_err("%s: Cmd:%d Failed\n", __func__,
> +					       COMMAND_ID_CONFIG_TABLE);
> +					continue;
> +				}
> +				pr_debug("%s: acpi_evaluate_dsm  for regulatory %d completed %d\n",
> +					 __func__, reg, out->type);
> +				if (out->type == ACPI_TYPE_PACKAGE) {
> +					pr_debug("%s: ACPI_TYPE_PACKAGE, count: %d, type: %d\n",
> +						 __func__, out->package.count, out->package.type);
> +					item = &out->package.elements[0];
> +					if (get_int_value(item, &value) == 0) {
> +						pr_debug("%s: version : %d\n", __func__, value);
> +						context->config_data[reg].version = value;
> +					}
> +					item = &out->package.elements[1];
> +					if (get_int_value(item, &value) == 0) {
> +						pr_debug("%s: No of Modes: %d\n", __func__, value);
> +						context->config_data[reg].total_dev_mode = value;
> +					}
> +					if (context->config_data[reg].total_dev_mode <= 0 &&
> +					    context->config_data[reg].total_dev_mode >
> +					    MAX_DEV_MODES) {
> +						pr_err("total_dev_mode is not within range : %d\n",
> +						       context->config_data[reg].total_dev_mode);
> +						ACPI_FREE(out);
> +						return AE_ERROR;
> +					}
> +					item = &out->package.elements[2];
> +					if (item)
> +						status = parse_package(item);
> +					else
> +						status = AE_ERROR;
> +					if (status != AE_OK) {
> +						ACPI_FREE(out);
> +						return status;
> +					}
> +				}
> +				ACPI_FREE(out);
> +			}
> +			update_sar_data();
> +			context->data_read = true;
> +		}
> +		sar_send_notify();
> +		return status;
> +}
> +
> +#ifdef DEBUG
> +/**
> + * sar_set_device_mode - To set the device mode as BIOS handling test
> + * Test Function call to BIOS for device mode handling of data sent via
> + * DSM calls.
> + * @device: ACPI device for which to retrieve the data
> + * @mode: Device Mode to be set
> + */
> +static acpi_status sar_set_device_mode(struct platform_device *device, int mode)
> +{
> +		union acpi_object *out, req;
> +		u32 rev = 0;
> +		int value = 0;
> +		acpi_status status = AE_OK;
> +
> +		pr_debug("%s Triggered : mode : %d\n", __func__, mode);
> +		if (!device) {
> +			pr_err("%s: Device is null\n", __func__);
> +			return AE_ERROR;
> +		}
> +		if (!context->handle) {
> +			pr_err("%s: Handle is null\n", __func__);
> +			return AE_ERROR;
> +		}
> +		if (!(context->parse)) {
> +			status = parse_guid();
> +			if (status != AE_OK)
> +				return status;
> +		}
> +
> +		req.type = ACPI_TYPE_INTEGER;
> +		req.integer.value = mode;
> +		out = acpi_evaluate_dsm(context->handle, &context->guid,
> +					rev, COMMAND_TEST_SET, &req);
> +		if (get_int_value(out, &value) != 0) {
> +			pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_DEV_MODE);
> +			return AE_ERROR;
> +		}
> +		pr_debug("%s: return value is : %d\n", __func__, value);
> +		ACPI_FREE(out);
> +		return status;
> +}
> +#endif
> +
> +static const struct acpi_device_id sar_device_ids[] = {
> +		{ "INTC1092", 0},
> +		{ "", 0},
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, sar_device_ids);
> +
> +static const struct platform_device_id sar_device_table[] = {
> +	{"intc1092", 0},
> +	{},
> +};
> +
> +static ssize_t sar_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +		unsigned long ret = 0;
> +
> +		pr_debug("%s triggered\n", __func__);
> +		if (!context) {
> +			pr_err("%s context is null", __func__);
> +			return -EFAULT;
> +		}
> +		ret = sprintf(buf, "%d %d %d %d\n", context->sar_data.device_mode,
> +			      context->sar_data.bandtable_index,
> +			      context->sar_data.antennatable_index,
> +			      context->sar_data.sartable_index);
> +		pr_debug("%s sent: %s\n", __func__, buf);
> +		return ret;
> +}
> +
> +static ssize_t sar_reg_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +		unsigned long ret = 0;
> +
> +		pr_debug("%s triggered\n", __func__);
> +		if (!context) {
> +			pr_err("%s context is null", __func__);
> +			return -EFAULT;
> +		}
> +		ret = sprintf(buf, "%d\n", context->reg_value);
> +		pr_debug("%s sent: %s\n", __func__, buf);
> +		return ret;
> +}
> +
> +static ssize_t sar_reg_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +		int value = 0, read = 0;
> +
> +		pr_debug("%s triggered\n", __func__);
> +		if (!count) {
> +			pr_err("%s count = %d", __func__, (int)count);
> +			return -EFAULT;
> +		}
> +		read = sscanf(buf, "%u", &value);
> +		pr_debug("%s received %s, integer value : %d", __func__, buf, value);
> +		if (read <= 0) {
> +			pr_alert("%s Not a integer", __func__);
> +			return -EFAULT;
> +		}
> +		if (value >= 0 && value < MAX_REGULATORY) {
> +			context->reg_value = value;
> +			update_sar_data();
> +			sar_send_notify();
> +		}
> +		return count;
> +}
> +
> +static struct kobj_attribute sar_attribute = __ATTR(intc_data, 0660, sar_show, NULL);
> +static struct kobj_attribute sar_attribute1 = __ATTR(intc_reg, 0660, sar_reg_show, sar_reg_store);
> +
> +#ifdef DEBUG
> +static ssize_t sar_dev_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +		unsigned long ret = 0;
> +
> +		pr_debug("%s triggered\n", __func__);
> +		if (!context) {
> +			pr_err("%s context is null\n", __func__);
> +			return -EFAULT;
> +		}
> +		ret = sprintf(buf, "%d\n", context->sar_data.device_mode);
> +		pr_debug("%s sent: %s\n", __func__, buf);
> +		return ret;
> +}
> +
> +static ssize_t sar_dev_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +		int value = 0, read = 0;
> +		acpi_status status = AE_OK;
> +
> +		pr_debug("%s triggered\n", __func__);
> +		if (!count) {
> +			pr_err("%s count = %d", __func__, (int)count);
> +			return -EFAULT;
> +		}
> +		read = sscanf(buf, "%u", &value);
> +		pr_debug("%s received %s, integer value : %d", __func__, buf, value);
> +		if (read <= 0) {
> +			pr_alert("%s Not a integer", __func__);
> +			return -EFAULT;
> +		}
> +		if (value < MAX_DEV_MODES) {
> +			status = sar_set_device_mode(context->sar_device, value);
> +			if (status != AE_OK) {
> +				pr_err("sar_set_device_mode failed\n");
> +				return -EINVAL;
> +			}
> +		}
> +		return count;
> +}
> +
> +static struct kobj_attribute sar_attribute2 = __ATTR(intc_dev, 0660, sar_dev_show, sar_dev_store);

You cannot add/remove sysfs attributes based on #define DEBUG, these will become part
of your driver / userspace API and you cannot change that based on #ifdef DEBUG.
Instead please use debugfs for this, or maybe just completely drop it? 

> +#endif
> +
> +MODULE_DEVICE_TABLE(platform, sar_device_table);
> +
> +static struct platform_driver sar_driver = {
> +	.probe = sar_add,
> +	.remove = sar_remove,
> +	.shutdown = sar_shutdown,
> +	.driver = {
> +			.name = DRVNAME,
> +			.owner = THIS_MODULE,
> +			/* FOR ACPI HANDLING */
> +			.acpi_match_table = ACPI_PTR(sar_device_ids),
> +			},
> +	.id_table = sar_device_table,
> +};
> +
> +static int sar_add(struct platform_device *device)
> +{
> +		int result = 0;
> +
> +		pr_debug("%s Triggered\n", __func__);
> +		context = kmalloc(sizeof(*context), GFP_KERNEL);
> +		if (!context) {
> +			pr_err("Cannot allocate memory in kernel for WWAN_SAR_CONTEXT\n");
> +			return -1;
> +		}
> +		memset(context, 0, sizeof(struct WWAN_SAR_CONTEXT));
> +
> +		context->sar_kobject = kobject_create_and_add("intc_sar_object", kernel_kobj);
> +		if (!context->sar_kobject) {
> +			pr_err("Failed to create sar_kobject\n");
> +			goto r_free;
> +		}
> +
> +		result = sysfs_create_file(context->sar_kobject, &sar_attribute.attr);
> +		if (result) {
> +			pr_err("Failed to create the intc_data file in /sys/kernel/intc_sar_object\n");
> +			goto r_sys;
> +		}
> +
> +		result = sysfs_create_file(context->sar_kobject, &sar_attribute1.attr);
> +		if (result) {
> +			pr_err("Failed to create the intc_reg file in /sys/kernel/intc_sar_object\n");
> +			goto r_sys;
> +		}
> +#ifdef DEBUG
> +		result = sysfs_create_file(context->sar_kobject, &sar_attribute2.attr);
> +		if (result) {
> +			pr_err("Failed to create the intc_dev file in /sys/kernel/intc_sar_object\n");
> +			goto r_sys;
> +		}
> +#endif
> +		context->sar_device = device;
> +		if (sar_module_probe(device) != AE_OK) {
> +			pr_err("Failed sar_module_probe\n");
> +			goto r_sys;
> +		}
> +
> +		if (acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
> +						sar_notify, (void *)device) != AE_OK) {
> +			pr_err("Failed acpi_install_notify_handler\n");
> +			goto r_sys;
> +		}
> +		return 0;
> +
> +r_sys:
> +		kobject_put(context->sar_kobject);
> +r_free:
> +		kfree(context);
> +		return -1;
> +}
> +
> +static int sar_remove(struct platform_device *device)
> +{
> +		pr_debug("%s Triggered\n", __func__);
> +		acpi_remove_notify_handler(ACPI_HANDLE(&device->dev),
> +					   ACPI_DEVICE_NOTIFY, sar_notify);
> +		kobject_put(context->sar_kobject);
> +		clear_sar_dev_mode();
> +		kfree(context);
> +		return 0;
> +}
> +
> +static void sar_shutdown(struct platform_device *device)
> +{
> +		sar_remove(device);
> +		return;
> +}
> +
> +static void sar_notify(acpi_handle handle, u32 event, void *data)
> +{
> +		struct platform_device *device = data;
> +
> +		pr_debug("%s Triggered: event: %d\n", __func__, event);
> +		if (event == SAR_EVENT) {
> +			pr_debug("%s event matched\n", __func__);
> +			if (sar_module_probe(device) != AE_OK)
> +				pr_err("sar_module_probe error");
> +		}
> +}
> +
> +static int sar_init(void)
> +{
> +		int result = 0;
> +
> +		pr_alert("SAR Init Triggered\n");
> +		result = platform_driver_register(&sar_driver);
> +		if (result < 0)
> +			pr_err("Error registering driver\n");
> +		return result;
> +}
> +
> +static void sar_exit(void)
> +{
> +		pr_alert("SAR EXIT Triggered\n");
> +		platform_driver_unregister(&sar_driver);
> +		pr_debug("Kernel Module Removed Successfully.\n");
> +}
> +
> +module_init(sar_init);
> +module_exit(sar_exit);
> diff --git a/include/linux/platform_data/x86/intel-sar.h b/include/linux/platform_data/x86/intel-sar.h
> new file mode 100644
> index 000000000000..9ed653284fa5
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel-sar.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Intel Corporation Header File for Specific Absorption Rate
> + * Copyright (c) 2021, Intel Corporation.
> + */
> +#ifndef INTEL_SAR_H
> +#define INTEL_SAR_H
> +
> +#define DRVNAME "sar"
> +#define SAR_DSM_UUID "82737E72-3A33-4C45-A9C7-57C0411A5F13"
> +#define COMMAND_ID_DEV_MODE 1
> +#define COMMAND_ID_CONFIG_TABLE 2
> +#define COMMAND_TEST_SET 31
> +#define MAX_REGULATORY 3
> +#define SAR_EVENT 0x80
> +#define MAX_DEV_MODES 50
> +
> +/**
> + * Structure WWAN_DEVICE_MODE_INFO - device mode information
> + * Holds the data that needs to be passed to userspace.
> + * The data is updated from the BIOS sensor information.
> + * @device_mode: Specific mode of the device
> + * @bandtable_index: Index of RF band
> + * @antennatable_index: Index of antenna
> + * @sartable_index: Index of SAR
> + */
> +struct WWAN_DEVICE_MODE_INFO {
> +		int device_mode;
> +		int bandtable_index;
> +		int antennatable_index;
> +		int sartable_index;
> +};
> +
> +/**
> + * Structure WWAN_DEVICE_MODE_CONFIGURATION - device configuration
> + * Holds the data that is configured and obtained on probe event.
> + * The data is updated from the BIOS sensor information.
> + * @version: Mode configuration version
> + * @total_dev_mode: Total number of device modes
> + * @device_mode_info: pointer to structure WWAN_DEVICE_MODE_INFO
> + */
> +struct WWAN_DEVICE_MODE_CONFIGURATION {
> +		int version;
> +		int total_dev_mode;
> +		struct WWAN_DEVICE_MODE_INFO *device_mode_info;
> +};
> +
> +/**
> + * Structure WWAN_SUPPORTED_INFO - userspace datastore
> + * Holds the data that is obtained from userspace
> + * The data is updated from the userspace and send value back in the
> + * structure format that is mentioned here.
> + * @reg_mode_needed: regulatory mode set by user for tests
> + * @bios_table_revision: Version of SAR table
> + * @num_supported_modes: Total supported modes based on reg_mode
> + */
> +struct WWAN_SUPPORTED_INFO {
> +		int reg_mode_needed;
> +		int bios_table_revision;
> +		int num_supported_modes;
> +};
> +
> +/**
> + * Structure WWAN_SAR_CONTEXT - context of SAR
> + * Holds the complete context as long as the driver is in existence
> + * The context holds instance of the data used for different cases.
> + * @parse: identifies if dsm is parsed
> + * @data_read: identifies if data is already read from BIOS
> + * @guid: Group id
> + * @handle: store acpi handle
> + * @reg_value: regulatory value
> + * Regulatory 0: FCC, 1: CE, 2: ISED
> + * @sar_device: platform_device type
> + * @sar_kobject: kobject for sysfs
> + * @supported_data: WWAN_SUPPORTED_INFO struct
> + * @sar_data: WWAN_DEVICE_MODE_INFO struct
> + * @config_data: WWAN_DEVICE_MODE_CONFIGURATION array struct
> + */
> +struct WWAN_SAR_CONTEXT {
> +		bool parse;
> +		bool data_read;
> +		guid_t guid;
> +		acpi_handle handle;
> +		int reg_value;
> +		struct platform_device *sar_device;
> +		struct kobject *sar_kobject;
> +		struct WWAN_SUPPORTED_INFO supported_data;
> +		struct WWAN_DEVICE_MODE_INFO sar_data;
> +		struct WWAN_DEVICE_MODE_CONFIGURATION config_data[MAX_REGULATORY];
> +};
> +#endif /* INTEL_SAR_H */
> 


Regards,

Hans

