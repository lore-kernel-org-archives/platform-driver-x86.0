Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF1DC4CC6E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 14:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 906B661C7E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 14:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbhF1OuT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 10:50:19 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44651 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236365AbhF1OsH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 10:48:07 -0400
Received: from [192.168.1.155] ([77.9.21.236]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQy0N-1ldD8X1GXX-00Nycp; Mon, 28 Jun 2021 16:45:30 +0200
Subject: Re: [PATCH V2 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
To:     Shravan S <s.shravan@intel.com>, hdegoede@redhat.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210510074016.31627-1-s.shravan@intel.com>
 <20210510074016.31627-2-s.shravan@intel.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <2b6ddfdc-d389-3d13-9895-b5d01f4ea2be@metux.net>
Date:   Mon, 28 Jun 2021 16:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210510074016.31627-2-s.shravan@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0d7VKRKZJdEoHYApmlhWHPH1EbVgQ89TiRoUKk6/u4N0HzXzVES
 o4INLYGWFJ6adwW6KrABKHNdVeHdGk2J6O7of9ygK6Q8aiCyr2IuL17PzGVXJvnd6ZTMIU9
 MNFwQNVjKEHo2d5TK8qxjq0XdUeynAQ31bhbZDWMOlcfhgBcMpplmLe7uZWHnkjyw4qjnDi
 8w4/QBZpdUNIfan0N8YuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E9fmbBwC/Dw=:XesBoL/0nPNIqzPJi9Emkb
 YnPbu0dEYwCgmrtlwk/a1zp6kN63ygy1YICPQzU8AYoD5yCl1z7AM4z5QL8PfqKV1Ci24JHUt
 O0M7aNLTqp57WLQf1kfcl+r9jSxgoIVgeB8WOl8M+ceqbzg29TFbLSuaP6Fp8cSHPMDmeJQeR
 fDJDYg8Nuj81hUvAmJRRBK+GQTQT4rM+J7ztyN2Hfia1DsmtvOOXtcodMaT/SwXY4V3h/SNvu
 49dR2YcL2TteM5lL4OJDb2Bkpuruk2U7M5/DmCcB9McgtPmykzJE1xLzTh+Tl9bfDopFnRZoV
 FCY3m38IwyPgcHPaG2HkxWc2qGrBlYvC3mI3cmLNscx7bRkUtxW8gXgfUyVOTaVA4fqHI68bb
 sbn4tx1l8pjE91SVwgUblyrxtjXXhY+Bd/aSAwGYiJI8tt+JzQyVSG8ET9aUWC6ObasBtolXZ
 GRfMGZlayo0SHenIV8Du4VKp6hZryQXrK5Cv+dP6z/NBMxX9Yo/ZqzxUDH46UfzGzNpUTBfWH
 bHTwvgiGcElePC3lX6HGi4=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10.05.21 09:40, Shravan S wrote:

Hi,

> +config INTEL_SAR
> +	tristate "Intel Specific Absorption Rate Driver"
> +	depends on ACPI

Do it really need to be Intel specific ?

By the way: where exactly is Intel specific hardware involved here ?
It doesn't seem to be specific to Intel's modems at all, but instead the
mainboards, which seem to come from somebody else.

> +static struct WWAN_SAR_CONTEXT *context;
> +static int sar_add(struct platform_device *device);
> +static int sar_remove(struct platform_device *device);
> +static void sar_shutdown(struct platform_device *device);
> +static void sar_notify(acpi_handle handle, u32 event, void *data);

Oh, no, please no global singletons here.
Should be per device instance.

> + * sar_send_notify - Send SAR data notification to userspace
> + * Send the sar data notification to the userspace and later sent to modem
> + * by the userspace application. The data sent is collected from the BIOS.
> + * This data is used by userspace for further handling of the modem output.
> + */
> +static void sar_send_notify(void)
> +{
> +		if (!context) {
> +			pr_alert("%s: context is null\n", __func__);

Please no such global pr_alert() calls. And how could such a situation
happen in the first place ?

> +			return;
> +		}
> +		pr_debug("%s: %d, %d, %d, %d\n", __func__, context->sar_data.device_mode,
> +			 context->sar_data.bandtable_index, context->sar_data.antennatable_index,
> +			 context->sar_data.sartable_index);

It's a device specific message, therefore should be dev_debug()

> +		sysfs_notify(context->sar_kobject, NULL, "intc_data");
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

This seems to belong into the device's release callback.

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
> +		}
> +}

If we really don't have such an helper yet, this belongs into generic
ACPI code.

> +/**
> + * update_sar_data - sar data is updated based on reg_value
> + * sar_data is updated based on regulatory value
> + */
> +static void update_sar_data(void)
> +{

Also should operate on a device instance, not global singleton.

> +		pr_debug("%s: Update SAR data\n", __func__);
> +		if (context->config_data[context->reg_value].device_mode_info &&
> +		    context->sar_data.device_mode <=
> +		    context->config_data[context->reg_value].total_dev_mode) {
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
> +		} else {
> +			pr_err("%s: sar data not assigned! Dev mode: %d, total_dev_mode: %d\n",
> +			       __func__, context->sar_data.device_mode,
> +			       context->config_data[context->reg_value].total_dev_mode);
> +		}
> +}

<snip>

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

No pr_alert() here. Device specific logging shall be done with dev_*()
functions.

> +		if (!device) {

How could that ever happen ?

> +			pr_err("%s: platform driver is null\n", __func__);
> +			return AE_ERROR;
> +		}
> +		if (!context) {

'context' should be per device instance, so we'd allocate it here, as
the device's private data.

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

Please no private #ifdef'd debug code. If you really wanna need to extra
debug code in here, look for some suitable generic CONFIG_* or add your
own driver specific one in Kconfig.

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

Device specific logging should use dev_*() functions.

> +		if (!device) {

How can that ever happen ?

> +			pr_err("%s: Device is null\n", __func__);
> +			return AE_ERROR;
> +		}
> +		if (!context->handle) {

How can that ever happen ?

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

Is this driver ever instantiated by another platform driver ?

<snip>

> +static struct kobj_attribute sar_attribute = __ATTR(intc_data, 0660, sar_show, NULL);
> +static struct kobj_attribute sar_attribute1 = __ATTR(intc_reg, 0660, sar_reg_show, sar_reg_store);

why not DEVICE_ATTR() ?

> +MODULE_DEVICE_TABLE(platform, sar_device_table);
> +
> +static struct platform_driver sar_driver = {
> +	.probe = sar_add,
> +	.remove = sar_remove,
> +	.shutdown = sar_shutdown,
> +	.driver = {
> +			.name = DRVNAME,
> +			.owner = THIS_MODULE,

is setting .owner still necessary ?

> +			/* FOR ACPI HANDLING */
> +			.acpi_match_table = ACPI_PTR(sar_device_ids),
> +			},
> +	.id_table = sar_device_table,
> +};
> +
> +static int sar_add(struct platform_device *device)

why isn't that called "sar_probe" ?

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

Are these attributes of the device or not ?

Either these belong to the device itself - then these shall be device
attributes - or its something more generic - then we shall have an own
subsys (maybe device class) for that.

> +		result = sysfs_create_file(context->sar_kobject, &sar_attribute.attr);
> +		if (result) {
> +			pr_err("Failed to create the intc_data file in /sys/kernel/intc_sar_object\n");

That's absolutely the wrong place for that. This directly is really just
for kernel *core* stuff, that has nothing to do with any hardware.

It more and more smells like we should have a subsys for this stuff.

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

Are you really sure it really needs the same logic on both remove and
shutdown ?

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

Doesn't seem that "sar_module_probe()" is an appropriate name.
And does it really need to reload everything on each acpi notify ?

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

use module_platform_driver() macro instead.


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

Do we really need that extra header file ?
I don't see any consumer outside the single-file driver.

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

I don't think we're using all-caps struct names in the kernel.

> +		int device_mode;

what exactly is the device_mode here ?

> +		int bandtable_index;
> +		int antennatable_index;
> +		int sartable_index;

how many bits to the table indices actually need ?

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

what is exactly shall "total_dev_mode" mean ?
if it's telling the number of entries in the array, name it so.

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

looks like this should be device's private data.


Finally, I still wonder how userland shall cope with that thing in a
sane way. Especially how shall it know which interface to tune ?



--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
