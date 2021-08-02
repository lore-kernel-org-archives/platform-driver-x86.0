Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CE4C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 10:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33C4460F41
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 10:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbhHBKJX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 Aug 2021 06:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36962 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231669AbhHBKJW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Aug 2021 06:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627898952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7YRGRCRW9t/kN9f0PC0qxIjp3wIGiC179axANu3Azw=;
        b=PV2+qBpGUtF/PZvnmcti2BWrz9XZW9I1ImPugzxWIwORi1+QaCB1GgRr8BOB84oeb/g905
        sQQaoZcgJO2qBkVa9r98Jfpe1a71b8zU3jW/gHCvzAmCKELJrHGBHQEkhLZItXptNqqPY3
        qO0fA0uskIvComRkJEEA3+HVOXc7X8w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-oa1fZDK7N1SjhG3kWk0voA-1; Mon, 02 Aug 2021 06:09:11 -0400
X-MC-Unique: oa1fZDK7N1SjhG3kWk0voA-1
Received: by mail-ed1-f70.google.com with SMTP id p2-20020a50c9420000b02903a12bbba1ebso8422977edh.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Aug 2021 03:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G7YRGRCRW9t/kN9f0PC0qxIjp3wIGiC179axANu3Azw=;
        b=E5R4ndmKEDqlZXP2v7u0jlYgrQi8iEo3g7zL3jlx21Xz/mbifte8S2A6Wi0UtKplJD
         +Q6R2nSCq3y7dY1lYubGI3c8URvorkkYftfIfroW7BflAuehm37favKwhbf9Z9VXj1Kc
         7JHIBuozN3ZrzncE7z4EcwyI43EO0jNHASppTRY5GIP1J7XxQ+/RiXnuz5u4H1B4vPQF
         J3YsoAZhhe4Rmein3kbAVTmKLWciLNRDiPTOhR5onWOCguSV1JHsk0AZpBvyTtsbtEdc
         BAgiMMe4mVjPqsOktOHqkqx/6HKm7SSc8sJm+1WprTKOF1nF4pBdoC05qpWiF03ue1uH
         LB1Q==
X-Gm-Message-State: AOAM530iqOPNKXAfKPyC7qSwSOSYKN3ImTGuLHn+kSvZwd9j18XKGISF
        VFjQwSMBrtLIhITQ/bBOb4axYhzRPo4PDOWY2/VslL18N7oaJjwYyESrtjpor797Mx2WhKx3p9w
        MPD7a7HVuQMcP9C48C1FRf1gkWFZ5NLI56g==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr14585989ejc.384.1627898950288;
        Mon, 02 Aug 2021 03:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUvPRryTwfj8PO1V9w24N6b15JqhG479Unv19Wnr3z1hs6IAIij+HSaDOHlRm7wAmogIOlrw==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr14585958ejc.384.1627898949781;
        Mon, 02 Aug 2021 03:09:09 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id v17sm5604740edc.47.2021.08.02.03.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 03:09:09 -0700 (PDT)
Subject: Re: [PATCH V3 1/1] platform/x86: Add BIOS Dynamic SAR driver for
 Intel M.2 Modem
To:     Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210602050149.6230-1-s.shravan@intel.com>
 <20210602050149.6230-2-s.shravan@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e5b5083-41b2-b442-8a21-2ced9550505d@redhat.com>
Date:   Mon, 2 Aug 2021 12:09:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210602050149.6230-2-s.shravan@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I accidentaly hit send before finishing my review, so it is continued here.

On 6/2/21 7:01 AM, Shravan S wrote:
> BIOS SAR (Specific Absorption Rate) driver for RF power regulation on Intel M.2 Modem.
> Limits the exposure of human body to RF frequencies.
> Uses ACPI to communicate to BIOS to retrieve SAR information data.
> Uses Sysfs to communicate this data to userspace via read and notify.
> Userspace will further use MBIM interface to enable data communication to modem.
> 
> Signed-off-by: Shravan S <s.shravan@intel.com>
> ---
> V3 :
> * Changes to the remove netlink and introduce sysfs to communicate to Userspace via notify
> * Handled review comments by changing ioctl calls to sysfs
> * "sar" name change for platform_device_id to "intc1092"
> * sar_init and sar_exit is modified as per review to minimal initialization
> * logging reduction and cleanup based on reviews.
> 
> ---
>  .../networking/device_drivers/wwan/index.rst  |   9 +-
>  .../device_drivers/wwan/intc_sar.rst          |  60 ++++
>  drivers/platform/x86/Kconfig                  |  12 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-sar.c              | 326 ++++++++++++++++++
>  include/linux/platform_data/x86/intel-sar.h   |  89 +++++
>  6 files changed, 493 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/networking/device_drivers/wwan/intc_sar.rst
>  create mode 100644 drivers/platform/x86/intel-sar.c
>  create mode 100644 include/linux/platform_data/x86/intel-sar.h
> 
> diff --git a/Documentation/networking/device_drivers/wwan/index.rst b/Documentation/networking/device_drivers/wwan/index.rst
> index 1cb8c7371401..93dfd89f76e8 100644
> --- a/Documentation/networking/device_drivers/wwan/index.rst
> +++ b/Documentation/networking/device_drivers/wwan/index.rst
> @@ -1,14 +1,15 @@
> -.. SPDX-License-Identifier: GPL-2.0-only
> +.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  
> -WWAN Device Drivers
> -===================
> +Classic WAN Device Drivers
> +==========================
>  
>  Contents:
>  
>  .. toctree::
>     :maxdepth: 2
>  
> -   iosm
> +   z8530book
> +   intc_sar
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/networking/device_drivers/wwan/intc_sar.rst b/Documentation/networking/device_drivers/wwan/intc_sar.rst
> new file mode 100644
> index 000000000000..7319d6e593ed
> --- /dev/null
> +++ b/Documentation/networking/device_drivers/wwan/intc_sar.rst
> @@ -0,0 +1,60 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +.. Copyright (C) 2020-21 Intel Corporation
> +
> +.. _INTEL_SAR_driver_doc:
> +
> +===========================================
> +BIOS Dynamic SAR driver for Intel M.2 Modem
> +===========================================
> +SAR (Specific Absorption Rate) driver is a host driver implemented for Linux
> +or chrome platform to limit the exposure of human body to RF frequency by
> +informing the Intel M.2 modem to regulate the RF power based on SAR data
> +obtained from the sensors captured in the BIOS.
> +
> +Basic usage
> +===========
> +ACPI interface exposes this data from the BIOS to SAR driver. The front end
> +application in userspace ( eg: Modem Manager) will interact with SAR driver 
> +to obtain information like the device mode (Example: tablets, laptops, etx),
> +Antenna index, baseband index, SAR table index and use available communication
> +like MBIM interface to enable data communication to modem for power regulation.
> +
> +Applications to carry out below required actions for establishing connection
> +with driver for data communication with the SAR driver:
> +- open the sysfs file for communication
> +- read the data to get the information
> +- get notification from sysfs if data is changed
> +- write into sysfs to change regulatory mode.
> +
> +Management application development
> +==================================
> +The driver and userspace interfaces are described below.
> +
> +sysfs channel for communication to userspace
> +--------------------------------------------
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_reg
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The driver exposes an sysfs entry in the kernel which is used for sending and
> +receiving regulatory information. The regulatory modes are depending on network.
> +FCC(0), CE(1), ISED(2)
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_reg write()
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The regulatory modes should not exceed the allowed reguulatory worldwide.
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_reg read()
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The application can read the current regulatory mode that is set in the
> +driver.
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The driver exposes an sysfs entry in the kernel which is used for receiving
> +information sent by BIOS.
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_data read()
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The SAR index, Band index and Antenna index along with the device modes are
> +obtained from this sysfs.
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7d385c3b2239..f3abf935a976 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1306,6 +1306,18 @@ config INTEL_TELEMETRY
>  	  directly via debugfs files. Various tools may use
>  	  this interface for SoC state monitoring.
>  
> +config INTEL_SAR
> +	tristate "Intel Specific Absorption Rate Driver"
> +	depends on ACPI
> +	help
> +	  This driver limit the exposure of human body to RF frequency by informing
> +	  the Intel M.2 modem to regulate the RF power based on SAR data obtained
> +	  from the sensors captured in the BIOS. ACPI interface exposes this data
> +	  from the BIOS to SAR driver. The front end application in userspace
> +	  will interact with SAR driver to obtain information like the device mode,
> +	  Antenna index, baseband index, SAR table index and use available communication
> +	  like MBIM interface to enable data communication to modem for RF power regulation.
> +
>  endif # X86_PLATFORM_DEVICES
>  
>  config PMC_ATOM
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..3610ab7a12df 100644
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
> index 000000000000..9906eb4d79a7
> --- /dev/null
> +++ b/drivers/platform/x86/intel-sar.c
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel Corporation - ACPI for Specific Absorption Rate
> + * Copyright (c) 2021, Intel Corporation.
> + */
> +
> +#include <asm/errno.h>
> +#include <linux/acpi.h>
> +#include <linux/kobject.h>
> +#include <linux/platform_data/x86/intel-sar.h>
> +#include <linux/platform_device.h>
> +#include <linux/sysfs.h>
> +
> +/**
> + * get_int_value - Retrieve Integer values from ACPI Object
> + * Value of the integer from the object of ACPI is obtained.
> + * @obj: acpi_object pointer which has the integer value
> + * @out: output pointer will get integer value
> + * returns 0 on success
> + */
> +static int get_int_value(union acpi_object *obj, int *out)
> +{
> +	if (obj && obj->type == ACPI_TYPE_INTEGER) {
> +		*out = (int)obj->integer.value;
> +		return 0;
> +	} else {
> +		return -EFAULT;

EFAULT must only be used when a userspace call passes an
invalid address to the kernel. All other uses of EFAULT are
wrong. Please use a different error here. Typically -EIO is
used when parsing firmware provided data and the contents
is not what we expect.

> +	}
> +}
> +
> +/**
> + * update_sar_data - sar data is updated based on reg_value
> + * sar_data is updated based on regulatory value
> + * context->reg_value will never exceed MAX_REGULATORY
> + * @context: context pointer used for data
> + */
> +static void update_sar_data(struct wwan_sar_context *context)
> +{
> +	struct wwan_device_mode_configuration *config =
> +	&context->config_data[context->reg_value];

Weird indentation please indent the value being assinged with a tab.

> +
> +	if (config->device_mode_info &&
> +	    context->sar_data.device_mode <= config->total_dev_mode) {

device_mode_info is an array with total_dev_mode entries this means
that device_mode == config->total_dev_mode will cause data to be
read beyond the end of the array, so the check should use "<"
instead of "<=".

> +		struct wwan_device_mode_info *dev_mode =
> +		&config->device_mode_info[context->sar_data.device_mode];

Weird indentation please indent the value being assinged with a tab and
always put a newline between the variable declerations and the regular statements
following them.

> +		context->sar_data.antennatable_index = dev_mode->antennatable_index;
> +		context->sar_data.bandtable_index = dev_mode->bandtable_index;
> +		context->sar_data.sartable_index = dev_mode->sartable_index;
> +	}
> +}
> +
> +/**
> + * parse_package - parse package for SAR
> + * @context: context pointer used for data
> + * @item : acpi_object ptr
> + * returns if success or error
> + */
> +static acpi_status parse_package(struct wwan_sar_context *context, union acpi_object *item)
> +{
> +	int value = 0, itr = 0, reg = 0;
> +	union acpi_object *num;
> +	struct wwan_device_mode_configuration *data;
> +
> +	num = &item->package.elements[0];
> +	if (get_int_value(num, &value) == 0) {
> +		if (value >= 0 && value < MAX_REGULATORY)
> +			reg = value;
> +		else
> +			return AE_ERROR;
> +	}

There is no error handling here for if get_int_value() fails, is that intentional?

> +	data = &context->config_data[reg];
> +	if (data->total_dev_mode > MAX_DEV_MODES)
> +		return AE_ERROR;
> +	data->device_mode_info =
> +	kmalloc_array(data->total_dev_mode, sizeof(struct wwan_device_mode_info), GFP_KERNEL);
> +	if (!data->device_mode_info) {
> +		pr_err("Cannot allocate memory in kernel\n");
> +		return AE_ERROR;
> +	}
> +	for (itr = 0; itr < data->total_dev_mode; itr++) {
> +		if (itr + 1 == item->package.count)
> +			break;
> +		num = &item->package.elements[itr + 1];
> +		if (num->type != ACPI_TYPE_PACKAGE)
> +			continue;

Why is this a continue;

> +		if (num->package.count < TOTAL_DATA)
> +			break;

And this a break ?

And shouldn't an error be logged in either of these cases ?

> +		if (get_int_value(&num->package.elements[0], &value) == 0)
> +			data->device_mode_info[itr].device_mode = value;
> +		if (get_int_value(&num->package.elements[1], &value) == 0)
> +			data->device_mode_info[itr].bandtable_index = value;
> +		if (get_int_value(&num->package.elements[2], &value) == 0)
> +			data->device_mode_info[itr].antennatable_index = value;
> +		if (get_int_value(&num->package.elements[3], &value) == 0)
> +			data->device_mode_info[itr].sartable_index = value;

Missing error handling for get_int_value failing (4 times).

> +	}
> +	return AE_OK;
> +}
> +
> +/**
> + * sar_module_probe - Extraction of information from BIOS via DSM calls
> + * Retrieve all values related to device mode, SAR Table index,
> + * Antenna Table index, Band Table index
> + * @device: ACPI device for which to retrieve the data
> + * Returns AE_OK on success
> + */

This comment no longer matches what this function actually does.

> +static acpi_status sar_module_probe(struct platform_device *device)

And the function name no longer makes sense too.

> +{
> +	acpi_status status = AE_OK;
> +	union acpi_object *out;
> +	u32 rev = 0;
> +	int value = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
> +
> +	pr_alert("%s Triggered\n", __func__);

Please drop this debug statement.

Also you must never use pr_alert. The ALERT log level has higher
prio then the CRIT level which has higher priority then the standard
ERROR level. IOW you are using a log level here which is reserved
for things like the computer pretty much literary being on fire.


> +	out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +				COMMAND_ID_DEV_MODE, NULL);
> +	if (get_int_value(out, &value) == 0) {
> +		context->sar_data.device_mode = value;
> +	} else {
> +		pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_DEV_MODE);
> +		ACPI_FREE(out);
> +		return AE_ERROR;
> +	}
> +	ACPI_FREE(out);

Please refactor this so that there is only one ACPI_FREE(out) call.

> +	dev_set_drvdata(&device->dev, context);

This setting of drvdata here is bogus, you just retrieved it above,
please drop this line.

> +	sysfs_notify(context->sar_kobject, NULL, SYSFS_DATANAME);
> +	return status;

You never change status, please drop status and just call:

	return AE_OK;

here.

> +}
> +
> +static const struct acpi_device_id sar_device_ids[] = {
> +	{ "INTC1092", 0},
> +	{ "", 0},
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, sar_device_ids);
> +
> +static const struct platform_device_id sar_device_table[] = {
> +	{"intc1092", 0},
> +	{},
> +};

This second device-id table is not nesessary, please drop it.

> +
> +static ssize_t intc_data_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	unsigned long ret = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(dev);
> +
> +	ret = sprintf(buf, "%d %d %d %d\n", context->sar_data.device_mode,
> +		      context->sar_data.bandtable_index,
> +		      context->sar_data.antennatable_index,
> +		      context->sar_data.sartable_index);
> +	return ret;
> +}

Use sysfs_emit here please, also make ret a ssize_t, or directly return the
sysfs_emit return value.

> +
> +static ssize_t intc_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	unsigned long ret = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(dev);
> +
> +	ret = sprintf(buf, "%d\n", context->reg_value);
> +	return ret;

Same.

> +}
> +
> +static ssize_t intc_reg_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	int value = 0, read = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(dev);
> +
> +	if (!count) {
> +		pr_err("%s count = %d", __func__, (int)count);
> +		return -EFAULT;
> +	}
> +	read = sscanf(buf, "%u", &value);
> +	if (read <= 0) {
> +		pr_alert("%s Not a integer", __func__);
> +		return -EFAULT;
> +	}

Use kstrtoul here please
 
> +	if (value >= 0 && value < MAX_REGULATORY) {


You should return  -EINVAL when value is outside of this
range. Using kstrotul makes sure that value is not negative, so then
you just have to do:

	if (value >= MAX_REGULATORY)
		return -EINVAL;



> +		context->reg_value = value;
> +		update_sar_data(context);
> +		dev_set_drvdata(dev, context);
> +		sysfs_notify(context->sar_kobject, NULL, SYSFS_DATANAME);

And then do these unconditional (ident them one tab level to the left).

> +	}
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RO(intc_data);
> +static DEVICE_ATTR_RW(intc_reg);
> +
> +static struct attribute *intcsar_attrs[] = {
> +	&dev_attr_intc_data.attr,
> +	&dev_attr_intc_reg.attr,
> +	NULL
> +};
> +
> +static struct attribute_group intcsar_group = {
> +	.attrs = intcsar_attrs,
> +};
> +
> +static void sar_notify(acpi_handle handle, u32 event, void *data)
> +{
> +	struct platform_device *device = data;
> +
> +	if (event == SAR_EVENT) {
> +		if (sar_module_probe(device) != AE_OK)
> +			pr_err("sar_module_probe error");
> +	}> +}
> +
> +static int sar_probe(struct platform_device *device)
> +{
> +	int result = 0;
> +	struct wwan_sar_context *context;
> +	union acpi_object *out, *item, req;
> +	acpi_status status = AE_OK;
> +	u32 rev = 0, reg = 0;
> +	int value = 0;
> +
> +	context = kmalloc(sizeof(*context), GFP_KERNEL);
> +	if (!context)
> +		return -ENOMEM;
> +	memset(context, 0, sizeof(struct wwan_sar_context));
> +	result = sysfs_create_group(&device->dev.kobj, &intcsar_group);
> +	if (result) {
> +		pr_err("sysfs creation failed\n");
> +		goto r_free;
> +	}

Your sysfs files may get accessed as soon as you've made this call
abd you've not fully initialized context yet, so the sysfs_create_group
should be done at the end of probe(), just before calling
acpi_install_notify_handler()

> +	context->sar_kobject = &device->dev.kobj;
> +	context->sar_device = device;
> +	dev_set_drvdata(&device->dev, context);
> +	if (guid_parse(SAR_DSM_UUID, &context->guid)) {
> +		pr_err("%s: UUID error\n", __func__);
> +		goto r_sys;
> +	}
> +	context->handle = ACPI_HANDLE(&device->dev);
> +	for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +		req.type = ACPI_TYPE_INTEGER;
> +		req.integer.value = reg;
> +		out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +					COMMAND_ID_CONFIG_TABLE, &req);
> +		if (!out) {
> +			pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_CONFIG_TABLE);
> +			continue;
> +		}
> +		if (out->type == ACPI_TYPE_PACKAGE && out->package.count >= 3) {
> +			item = &out->package.elements[0];
> +			if (get_int_value(item, &value) == 0)
> +				context->config_data[reg].version = value;

Error handling for get_int_value failing ?

> +			item = &out->package.elements[1];
> +			if (get_int_value(item, &value) == 0)
> +				context->config_data[reg].total_dev_mode = value;

Error handling for get_int_value failing ?

> +			if (context->config_data[reg].total_dev_mode <= 0 &&
> +			    context->config_data[reg].total_dev_mode >
> +				MAX_DEV_MODES) {

Instead of && you should use || in this check.

> +				pr_err("total_dev_mode is not within range : %d\n",
> +				       context->config_data[reg].total_dev_mode);
> +				ACPI_FREE(out);
> +				continue;
> +			}
> +			item = &out->package.elements[2];
> +			if (item->type == ACPI_TYPE_PACKAGE && item->package.count > 0)
> +				status = parse_package(context, item);

parse_package checks context->config_data[reg].total_dev_mode, where it reads reg from
the passed in item. What if this is a different reg then the one we are parsing?
Then context->config_data[reg].total_dev_mode will not be initialized yet. So I guess
that the reg read by parse_package() should always be the same as the reg value which we
passed to the DSM ?  If that is true then reg should be passed to parse_package here;
and parse_package should check that it matches.

Also you basically expect here that:

out->package.elements[0].type == ACPI_TYPE_INTEGER &&
out->package.elements[1].type == ACPI_TYPE_INTEGER &&
out->package.elements[2].type == ACPI_TYPE_PACKAGE

I believe the code would be simpler if you add this as extra conditions to the

		if (out->type == ACPI_TYPE_PACKAGE && out->package.count >= 3)

check.


> +			else
> +				status = AE_ERROR;
> +			if (status != AE_OK) {
> +				ACPI_FREE(out);
> +				continue;
> +			}
> +		}
> +		ACPI_FREE(out);
> +	}
> +	update_sar_data(context);
> +	if (sar_module_probe(device) != AE_OK) {
> +		pr_err("Failed sar_module_probe\n");
> +		goto r_sys;
> +	}
> +	if (acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
> +					sar_notify, (void *)device) != AE_OK) {
> +		pr_err("Failed acpi_install_notify_handler\n");
> +		goto r_sys;
> +	}
> +	return 0;
> +
> +r_sys:
> +	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
> +r_free:
> +	kfree(context);
> +	return -1;
> +}
> +
> +static int sar_remove(struct platform_device *device)
> +{
> +	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
> +	int reg = 0;
> +
> +	acpi_remove_notify_handler(ACPI_HANDLE(&device->dev),
> +				   ACPI_DEVICE_NOTIFY, sar_notify);
> +	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
> +	for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +		kfree(context->config_data[reg].device_mode_info);
> +		context->config_data[reg].device_mode_info = NULL;
> +	}
> +	kfree(context);
> +	return 0;
> +}
> +
> +MODULE_DEVICE_TABLE(platform, sar_device_table);
> +
> +static struct platform_driver sar_driver = {
> +	.probe = sar_probe,
> +	.remove = sar_remove,
> +	.driver = {
> +			.name = DRVNAME,
> +			.owner = THIS_MODULE,
> +			/* FOR ACPI HANDLING */
> +			.acpi_match_table = ACPI_PTR(sar_device_ids),
> +			},
> +	.id_table = sar_device_table,
> +};
> +
> +module_platform_driver(sar_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Platform device driver for INTEL MODEM BIOS SAR");
> +MODULE_AUTHOR("Shravan S <s.shravan@intel.com>");
> diff --git a/include/linux/platform_data/x86/intel-sar.h b/include/linux/platform_data/x86/intel-sar.h
> new file mode 100644
> index 000000000000..6e2ac93a3ebc
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel-sar.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Intel Corporation Header File for Specific Absorption Rate
> + * Copyright (c) 2021, Intel Corporation.
> + */
> +#ifndef INTEL_SAR_H
> +#define INTEL_SAR_H
> +
> +#define DRVNAME "intc_sar"
> +#define SYSFS_DATANAME "intc_data"
> +#define SAR_DSM_UUID "82737E72-3A33-4C45-A9C7-57C0411A5F13"
> +#define COMMAND_ID_DEV_MODE 1
> +#define COMMAND_ID_CONFIG_TABLE 2
> +#define COMMAND_TEST_SET 31
> +#define MAX_REGULATORY 3
> +#define SAR_EVENT 0x80
> +#define MAX_DEV_MODES 50
> +#define TOTAL_DATA 4
> +
> +/**
> + * Structure wwan_device_mode_info - device mode information
> + * Holds the data that needs to be passed to userspace.
> + * The data is updated from the BIOS sensor information.
> + * @device_mode: Specific mode of the device
> + * @bandtable_index: Index of RF band
> + * @antennatable_index: Index of antenna
> + * @sartable_index: Index of SAR
> + */
> +struct wwan_device_mode_info {
> +		int device_mode;
> +		int bandtable_index;
> +		int antennatable_index;
> +		int sartable_index;
> +};
> +
> +/**
> + * Structure wwan_device_mode_configuration - device configuration
> + * Holds the data that is configured and obtained on probe event.
> + * The data is updated from the BIOS sensor information.
> + * @version: Mode configuration version
> + * @total_dev_mode: Total number of device modes
> + * @device_mode_info: pointer to structure wwan_device_mode_info
> + */
> +struct wwan_device_mode_configuration {
> +		int version;
> +		int total_dev_mode;
> +		struct wwan_device_mode_info *device_mode_info;
> +};
> +
> +/**
> + * Structure wwan_supported_info - userspace datastore
> + * Holds the data that is obtained from userspace
> + * The data is updated from the userspace and send value back in the
> + * structure format that is mentioned here.
> + * @reg_mode_needed: regulatory mode set by user for tests
> + * @bios_table_revision: Version of SAR table
> + * @num_supported_modes: Total supported modes based on reg_mode
> + */
> +struct wwan_supported_info {
> +		int reg_mode_needed;
> +		int bios_table_revision;
> +		int num_supported_modes;
> +};
> +
> +/**
> + * Structure wwan_sar_context - context of SAR
> + * Holds the complete context as long as the driver is in existence
> + * The context holds instance of the data used for different cases.
> + * @guid: Group id
> + * @handle: store acpi handle
> + * @reg_value: regulatory value
> + * Regulatory 0: FCC, 1: CE, 2: ISED
> + * @sar_device: platform_device type
> + * @sar_kobject: kobject for sysfs
> + * @supported_data: wwan_supported_info struct
> + * @sar_data: wwan_device_mode_info struct
> + * @config_data: wwan_device_mode_configuration array struct
> + */
> +struct wwan_sar_context {
> +		guid_t guid;
> +		acpi_handle handle;
> +		int reg_value;
> +		struct platform_device *sar_device;
> +		struct kobject *sar_kobject;
> +		struct wwan_supported_info supported_data;
> +		struct wwan_device_mode_info sar_data;
> +		struct wwan_device_mode_configuration config_data[MAX_REGULATORY];
> +};
> +#endif /* INTEL_SAR_H */
> 


Regards,

Hans

