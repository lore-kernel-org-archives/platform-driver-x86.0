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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2969FC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 08:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B1CE60EBD
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 08:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbhHBI72 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 Aug 2021 04:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28609 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232732AbhHBI72 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Aug 2021 04:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627894758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jrqx4S7Gd1xvHEqPlsOzF8jnGb1l9VGrqBw+Dg7YdvU=;
        b=LkUkfplsNTk1KvweeIIo+nsU74q3euGDA61bnYmO5VW8PQiOD5n983/zh16s3JBPAh8pLk
        DUFcrHd54Eh+nG3e/oI5x1AVqNXw9vozlvwQ4sQl3RcADr/OZBJuMiKIak/QLAFJfdL6jJ
        EW9vZaTWTmW9QiOXGVVaHb6qq90aZA8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-xjfXrTAeO5GAxCW15yF1og-1; Mon, 02 Aug 2021 04:59:16 -0400
X-MC-Unique: xjfXrTAeO5GAxCW15yF1og-1
Received: by mail-ed1-f70.google.com with SMTP id eg53-20020a05640228b5b02903bd6e6f620cso1034263edb.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Aug 2021 01:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jrqx4S7Gd1xvHEqPlsOzF8jnGb1l9VGrqBw+Dg7YdvU=;
        b=eqdBF6QGxwifVLhUamo0Z9qtKLPQdKnqlH356yygGmJ0JfdNEBhHJI6IynuK79kOmu
         tbR25/SAM0vhdD2w0Hbxnma46ditNMbfSSxZkRDnlCs9U2fbdUwbhkOiZrJf/ovTimEE
         FXcurNvIUNzxNP+G/GUcIOUD8GQUmIRFYJRHY/rZoOd5GLUTmigI52RHY3Vp83pYIC+L
         37DuFoiMdOhsrN0rFRYMSTT7M2ghFt1Q3Zt05RXWHMBG4VL0x/oRtJ3r//4Dw2/d/r2O
         dM8YADpHtZe9zKTYRIk+tz4a1yQBAR1TKWm/eMwc+9huWhVj1pCTJjugfoaOkG1Ono5f
         EzaQ==
X-Gm-Message-State: AOAM531mq1gtIgsCd2WyreYdffjuJxnAdz+PTqZse2VPOIkLAfv4Rn/M
        CCyrXJw8U/7/9hUuL5Smqj1w5DFpyZd8+Z+ChpD8dkT83fXT5VsLnm2GyuyNpeRd4v0s2tYnam0
        Z5kIOEuRqvdeo2aEo+9KGgxiNFHekI6KGow==
X-Received: by 2002:a17:907:1c08:: with SMTP id nc8mr14696827ejc.514.1627894755646;
        Mon, 02 Aug 2021 01:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTCHEs6k7HgVimgKldizu9aJFH+8lF00SXmPqNT4aMZtjant8iPJj96xi3oEOo+kIc2u/o1g==
X-Received: by 2002:a17:907:1c08:: with SMTP id nc8mr14696812ejc.514.1627894755345;
        Mon, 02 Aug 2021 01:59:15 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id q23sm756729ejc.0.2021.08.02.01.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 01:59:15 -0700 (PDT)
Subject: Re: [PATCH V3 1/1] platform/x86: Add BIOS Dynamic SAR driver for
 Intel M.2 Modem
To:     Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210602050149.6230-1-s.shravan@intel.com>
 <20210602050149.6230-2-s.shravan@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <76868eb4-02c4-93dc-8cb7-2257be8ade8d@redhat.com>
Date:   Mon, 2 Aug 2021 10:59:14 +0200
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

Thank you for the new version.

On 6/2/21 7:01 AM, Shravan S wrote:
> BIOS SAR (Specific Absorption Rate) driver for RF power regulation on Intel M.2 Modem.
> Limits the exposure of human body to RF frequencies.
> Uses ACPI to communicate to BIOS to retrieve SAR information data.
> Uses Sysfs to communicate this data to userspace via read and notify.
> Userspace will further use MBIM interface to enable data communication to modem.

Please limit the line length of the lines in your commit message to 75 chars.

I assume you are going to maintain this driver going forward? Please add an
entry to the MAINTAINERS file for the new driver.

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

Why are you adding "Classic " here?

>  
>  Contents:
>  
>  .. toctree::
>     :maxdepth: 2
>  
> -   iosm

Why are you removing iosm here ?

> +   z8530book
> +   intc_sar

Why are you adding z8530book here ?

Please limit the changes to this file to just adding the intc_sar line,
any other changes should be done in a separate patch.

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

Typo in reguulatory, also it is not clear to me what you are trying
to say here.

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

This whole sysfs API description is pretty vague, also since the main goal
of this file is documenting the sysfs ABI it should live under
Documentation/ABI/testing/sysfs-driver-intc_sar

Then you also don't need to modify
Documentation/networking/device_drivers/wwan/index.rst

Having the docs for a drivers/platform/x86 driver live under
Documentation/networking/ is also weird, putting this in
Documentation/ABI/testing/sysfs-driver-intc_sar also resolves this.

Note these files have a different format, see:
Documentation/ABI/testing/sysfs-class-firmware-attributes
for example.


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
> +	  from the sensors captured in the BIOS.

The driver itself does not limit the tx strength, it only provides information
which is used by other software to determine the max safe tx strength, please
update the description to reflect this.

Also please add some information when a user building their own kernels should
enable this.

Regards,

Hans


 ACPI interface exposes this data
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
> +
> +	if (config->device_mode_info &&
> +	    context->sar_data.device_mode <= config->total_dev_mode) {
> +		struct wwan_device_mode_info *dev_mode =
> +		&config->device_mode_info[context->sar_data.device_mode];
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
> +		if (num->package.count < TOTAL_DATA)
> +			break;
> +		if (get_int_value(&num->package.elements[0], &value) == 0)
> +			data->device_mode_info[itr].device_mode = value;
> +		if (get_int_value(&num->package.elements[1], &value) == 0)
> +			data->device_mode_info[itr].bandtable_index = value;
> +		if (get_int_value(&num->package.elements[2], &value) == 0)
> +			data->device_mode_info[itr].antennatable_index = value;
> +		if (get_int_value(&num->package.elements[3], &value) == 0)
> +			data->device_mode_info[itr].sartable_index = value;
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
> +static acpi_status sar_module_probe(struct platform_device *device)
> +{
> +	acpi_status status = AE_OK;
> +	union acpi_object *out;
> +	u32 rev = 0;
> +	int value = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
> +
> +	pr_alert("%s Triggered\n", __func__);
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
> +	dev_set_drvdata(&device->dev, context);
> +	sysfs_notify(context->sar_kobject, NULL, SYSFS_DATANAME);
> +	return status;
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
> +
> +static ssize_t intc_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	unsigned long ret = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(dev);
> +
> +	ret = sprintf(buf, "%d\n", context->reg_value);
> +	return ret;
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
> +	if (value >= 0 && value < MAX_REGULATORY) {
> +		context->reg_value = value;
> +		update_sar_data(context);
> +		dev_set_drvdata(dev, context);
> +		sysfs_notify(context->sar_kobject, NULL, SYSFS_DATANAME);
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
> +	}
> +}
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
> +			item = &out->package.elements[1];
> +			if (get_int_value(item, &value) == 0)
> +				context->config_data[reg].total_dev_mode = value;
> +			if (context->config_data[reg].total_dev_mode <= 0 &&
> +			    context->config_data[reg].total_dev_mode >
> +				MAX_DEV_MODES) {
> +				pr_err("total_dev_mode is not within range : %d\n",
> +				       context->config_data[reg].total_dev_mode);
> +				ACPI_FREE(out);
> +				continue;
> +			}
> +			item = &out->package.elements[2];
> +			if (item->type == ACPI_TYPE_PACKAGE && item->package.count > 0)
> +				status = parse_package(context, item);
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

