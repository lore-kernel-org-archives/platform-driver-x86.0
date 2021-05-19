Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F70C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 17:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C07846135C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 17:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236556AbhESRHd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 13:07:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45739 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240245AbhESRHd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 13:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621443972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=anf1cCahAwudTGmz5fx75Zsc1ruMQc+IfVpU98/hYJg=;
        b=Ij+Z28RJUUDYMnKyKtjL+R8t87Anxtgu66tX+d0YzP9dmfzoB1Dswat6KUuwdU7MmAX0lU
        KR+C54pwoV/1+HHNLG5kA36ifm95fTcbJENlj064xtagrCX4tg8nCXXnHPBI4HcQsydfNt
        CWIdAai3jNbraIeAuUz5vYOf5JREEDg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-KMOrPFGXNoOjYTauUn6GXw-1; Wed, 19 May 2021 13:06:09 -0400
X-MC-Unique: KMOrPFGXNoOjYTauUn6GXw-1
Received: by mail-ed1-f71.google.com with SMTP id u6-20020aa7d0c60000b029038d7337e633so1899609edo.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 10:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=anf1cCahAwudTGmz5fx75Zsc1ruMQc+IfVpU98/hYJg=;
        b=qm4xc0iq+4oTu2UYuLN8puvd4iPo6a0YwRw2311PQn9l5L9ycyN2zt+9oJ348A9ZzS
         HcLrfqbaoqRgeU4KN1TANyPoxhhQlqPEet1XX0JA0AhGFRtvfzVffQeGmffJgrjn5UTz
         h0QEbS++4X4+0YSC2y5hjyyZGI5UPa/sL1W9+q3tANPL3aWaOb+IVTAlANFlZBmUHlOh
         FMVfwlBppzo4/CXW5fjn+iIpHYTYrzgb3GZT8m1BdN6370DCowpPv1ZF4OHAsi/WCHdH
         ZJ+hs0I10VNhVJX9Yz666jKyPNV3/krROAb3QWwUaPCCSecO2fpjDOJuoOaGKjvSm/nS
         fFYA==
X-Gm-Message-State: AOAM530/qpejVCLeeYsGz6e7e2Xmr9ssHXLeszmW3UylpODJLp5NBano
        w20djDvlK1UL0zrD454/TXfeZBFBnymEP59cbBwXOv2PfLZGEeWQqd6zAeZaS9uJe16EkLHZoRV
        0v2huCzbDku6tNoRFpJovEg1csLJ1WbKppw==
X-Received: by 2002:a17:907:1b1e:: with SMTP id mp30mr169471ejc.532.1621443968197;
        Wed, 19 May 2021 10:06:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR+DXaifREt+egnC0cMgD7/wMVwzo0yfhUFfpzBymwFHGvKIKGOW5iA0fz7sHKRT6f46K1mw==
X-Received: by 2002:a17:907:1b1e:: with SMTP id mp30mr169433ejc.532.1621443967808;
        Wed, 19 May 2021 10:06:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d11sm170793ejr.58.2021.05.19.10.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 10:06:07 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI interface support
 on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        divya.bharathi@dell.com, prasanth.ksr@dell.com
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
Date:   Wed, 19 May 2021 19:06:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210509015708.112766-3-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/9/21 3:57 AM, Mark Pearson wrote:
> For Lenovo platforms that support a WMI interface to the BIOS add
> support, using the firmware-attributes class, to allow users to access
> and modify various BIOS related settings.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in V2:
>  - Improved error handling
>  - updated to use kobj's better (thanks Hans for pointers). Makes code
>    simpler and cleaner
>  - Removed some dead code from previous implementation that I'd missed
>  - Moved think-lmi.h into platform/x86 directory
>  - Use firmware_attributes_class helper
>  - Corrected some bad indexing when storing an attribute
>  - improved encoding options to limit selection
>  - Added details on encoding and kbdlang to
>    sysfs-class-firmware-attributes documentation

Thank you, overall this looks pretty good, a small review remarks inline.

> 
>  .../testing/sysfs-class-firmware-attributes   |  13 +-
>  drivers/platform/x86/Kconfig                  |  12 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/think-lmi.c              | 890 ++++++++++++++++++
>  drivers/platform/x86/think-lmi.h              |  73 ++
>  5 files changed, 988 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/think-lmi.c
>  create mode 100644 drivers/platform/x86/think-lmi.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 8ea59fea4..31d1becfa 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -185,6 +185,17 @@ Description:
>  					A write only value that when used in tandem with
>  					current_password will reset a system or admin password.
>  
> +		encoding:
> +					For platforms that require it (currently Lenovo) the
> +					encoding method that is used. This can be either "ascii"
> +					or "scancode". Default is set to "ascii"
> +
> +		kbdlang:
> +					For platforms that require it (currently Lenovo only) the
> +					keyboard language method that is used. This is generally a
> +					two char code (e.g. "us", "fr", "gr") and may vary per platform.
> +					Default is set to "us"
> +

I should have caught this during my review of v1, these are Lenovo specific, so please prefix
them with lenovo_ (the same is already done for dell specific sysfs attributes) and move them
to a separate "Lenovo specific class extensions" part of the doc.

>  		Note, password management is session specific. If Admin password is set,
>  		same password must be written into current_password file (required for
>  		password-validation) and must be cleared once the session is over.
> @@ -197,7 +208,7 @@ Description:
>  		Drivers may emit a CHANGE uevent when a password is set or unset
>  		userspace may check it again.
>  
> -		On Dell systems, if Admin password is set, then all BIOS attributes
> +		On Dell and Lenovo systems, if Admin password is set, then all BIOS attributes
>  		require password validation.
>  
>  What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b0e1e5f65..0511c54fc 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -639,6 +639,18 @@ config THINKPAD_ACPI_HOTKEY_POLL
>  	  If you are not sure, say Y here.  The driver enables polling only if
>  	  it is strictly necessary to do so.
>  
> +config THINKPAD_LMI
> +	tristate "Lenovo WMI-based systems management driver"
> +	default m

default n (or no default at all) please.

> +	depends on ACPI_WMI
> +	select FW_ATTR_CLASS
> +	help
> +	  This driver allows changing BIOS settings on Lenovo machines whose
> +	  BIOS support the WMI interface.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called think-lmi.
> +
>  config INTEL_ATOMISP2_LED
>  	tristate "Intel AtomISP2 camera LED driver"
>  	depends on GPIOLIB && LEDS_GPIO
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 147573f69..cab19672e 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>  obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
>  obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
> +obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  
>  # Intel
>  obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> new file mode 100644
> index 000000000..2fa989e98
> --- /dev/null
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -0,0 +1,890 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * think-lmi.c - Think LMI BIOS configuration driver
> + *
> + * Copyright(C) 2019-2021 Lenovo
> + *
> + *  Original code from Thinkpad-wmi project https://github.com/iksaif/thinkpad-wmi
> + *  Copyright(C) 2017 Corentin Chary <corentin.chary@gmail.com>
> + *  Distributed under the GPL-2.0 license
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/fs.h>
> +#include <linux/wmi.h>
> +#include "firmware_attributes_class.h"
> +#include "think-lmi.h"
> +
> +/*
> + * Name:
> + *  Lenovo_BiosSetting
> + * Description:
> + *  Get item name and settings for current LMI instance.
> + * Type:
> + *  Query
> + * Returns:
> + *  "Item,Value"
> + * Example:
> + *  "WakeOnLAN,Enable"
> + */
> +#define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
> +
> +/*
> + * Name:
> + *  Lenovo_SetBiosSetting
> + * Description:
> + *  Change the BIOS setting to the desired value using the Lenovo_SetBiosSetting
> + *  class. To save the settings, use the Lenovo_SaveBiosSetting class.
> + *  BIOS settings and values are case sensitive.
> + *  After making changes to the BIOS settings, you must reboot the computer
> + *  before the changes will take effect.
> + * Type:
> + *  Method
> + * Arguments:
> + *  "Item,Value,Password,Encoding,KbdLang;"
> + * Example:
> + *  "WakeOnLAN,Disable,pswd,ascii,us;"
> + */
> +#define LENOVO_SET_BIOS_SETTINGS_GUID "98479A64-33F5-4E33-A707-8E251EBBC3A1"
> +
> +/*
> + * Name:
> + *  Lenovo_SaveBiosSettings
> + * Description:
> + *  Save any pending changes in settings.
> + * Type:
> + *  Method
> + * Arguments:
> + *  "Password,Encoding,KbdLang;"
> + * Example:
> + * "pswd,ascii,us;"
> + */
> +#define LENOVO_SAVE_BIOS_SETTINGS_GUID "6A4B54EF-A5ED-4D33-9455-B0D9B48DF4B3"
> +
> +/*
> + * Name:
> + *  Lenovo_BiosPasswordSettings
> + * Description:
> + *  Return BIOS Password settings
> + * Type:
> + *  Query
> + * Returns:
> + *  PasswordMode, PasswordState, MinLength, MaxLength,
> + *  SupportedEncoding, SupportedKeyboard
> + */
> +#define LENOVO_BIOS_PASSWORD_SETTINGS_GUID "8ADB159E-1E32-455C-BC93-308A7ED98246"
> +
> +/*
> + * Name:
> + *  Lenovo_SetBiosPassword
> + * Description:
> + *  Change a specific password.
> + *  - BIOS settings cannot be changed at the same boot as power-on
> + *    passwords (POP) and hard disk passwords (HDP). If you want to change
> + *    BIOS settings and POP or HDP, you must reboot the system after changing
> + *    one of them.
> + *  - A password cannot be set using this method when one does not already
> + *    exist. Passwords can only be updated or cleared.
> + * Type:
> + *  Method
> + * Arguments:
> + *  "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
> + * Example:
> + *  "pop,oldpop,newpop,ascii,us;”
> + */
> +#define LENOVO_SET_BIOS_PASSWORD_GUID "2651D9FD-911C-4B69-B94E-D0DED5963BD7"
> +
> +/*
> + * Name:
> + *  Lenovo_GetBiosSelections
> + * Description:
> + *  Return a list of valid settings for a given item.
> + * Type:
> + *  Method
> + * Arguments:
> + *  "Item"
> + * Returns:
> + *  "Value1,Value2,Value3,..."
> + * Example:
> + *  -> "FlashOverLAN"
> + *  <- "Enabled,Disabled"
> + */
> +#define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
> +
> +#define TLMI_POP_PWD (1 << 0)
> +#define TLMI_PAP_PWD (1 << 1)
> +
> +static const char * const encoding_options[] = {
> +	[TLMI_ENCODING_ASCII] = "ascii",
> +	[TLMI_ENCODING_SCANCODE] = "scancode",
> +};
> +static struct think_lmi tlmi_priv;
> +struct class *fw_attr_class;
> +
> +/* ------ Utility functions ------------*/
> +/* Convert BIOS WMI error string to suitable error code */
> +static int tlmi_errstr_to_err(const char *errstr)
> +{
> +	if (!strcmp(errstr, "Success"))
> +		/* Operation completed successfully */
> +		return 0;
> +	if (!strcmp(errstr, "Not Supported"))
> +		/* The feature is not supported on this system */
> +		return -EOPNOTSUPP;
> +	if (!strcmp(errstr, "Invalid"))
> +		/* The item or value provided is not valid parameter */
> +		return -EINVAL;
> +	if (!strcmp(errstr, "Access Denied"))
> +		/*
> +		 * The change could not be made due to an authentication problem.
> +		 * If a supervisor password exists, the correct supervisor password
> +		 * must be provided.
> +		 */
> +		return -EPERM;
> +	if (!strcmp(errstr, "System Busy"))
> +		/*
> +		 * BIOS changes have already been made that need to be committed.
> +		 238G* Reboot the system and try again.
> +		 */
> +		return -EBUSY;
> +
> +	pr_debug("Unknown error string: '%s'", errstr);
> +	return -EINVAL;
> +}
> +
> +/* Extract error string from WMI return buffer */
> +static int tlmi_extract_error(const struct acpi_buffer *output)
> +{
> +	const union acpi_object *obj;
> +	int ret;
> +
> +	obj = output->pointer;
> +	if (!obj || obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
> +		kfree(obj);
> +		return -EIO;
> +	}
> +
> +	ret = tlmi_errstr_to_err(obj->string.pointer);
> +	kfree(obj);
> +	return ret;
> +}
> +
> +/* Utility function to execute WMI call to BIOS */
> +static int tlmi_simple_call(const char *guid, const char *arg)
> +{
> +	const struct acpi_buffer input = { strlen(arg), (char *)arg };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	int i, err;
> +
> +	/*
> +	 * duplicated call required to match bios workaround for behavior
> +	 * seen when WMI accessed via scripting on other OS
> +	 */
> +	for (i = 0; i < 2; i++) {
> +		/* (re)initialize output buffer to default state */
> +		output.length = ACPI_ALLOCATE_BUFFER;
> +		output.pointer = NULL;
> +
> +		status = wmi_evaluate_method(guid, 0, 0, &input, &output);
> +		if (ACPI_FAILURE(status)) {
> +			kfree(output.pointer);
> +			return -EIO;
> +		}
> +		err = tlmi_extract_error(&output);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +/* Extract output string from WMI return buffer */
> +static int tlmi_extract_output_string(const struct acpi_buffer *output,
> +					char **string)
> +{
> +	const union acpi_object *obj;
> +
> +	obj = output->pointer;
> +	if (!obj || obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
> +		kfree(obj);
> +		return -EIO;
> +	}
> +
> +	*string = kstrdup(obj->string.pointer, GFP_KERNEL);
> +	kfree(obj);
> +	return *string ? 0 : -ENOMEM;
> +}
> +
> +/* ------ Core interface functions ------------*/
> +
> +/* Get password settings from BIOS */
> +static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	const union acpi_object *obj;
> +	acpi_status status;
> +
> +	if (!tlmi_priv.can_get_password_settings)
> +		return -EOPNOTSUPP;
> +
> +	status = wmi_query_block(LENOVO_BIOS_PASSWORD_SETTINGS_GUID, 0,
> +				 &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_BUFFER || !obj->buffer.pointer) {
> +		kfree(obj);
> +		return -EIO;
> +	}
> +	/*
> +	 * The size of thinkpad_wmi_pcfg on ThinkStation is larger than ThinkPad.
> +	 * To make the driver compatible on different brands, we permit it to get
> +	 * the data in below case.
> +	 */
> +	if (obj->buffer.length < sizeof(struct tlmi_pwdcfg)) {
> +		pr_warn("Unknown pwdcfg buffer length %d\n", obj->buffer.length);
> +		kfree(obj);
> +		return -EIO;
> +	}
> +	memcpy(pwdcfg, obj->buffer.pointer, sizeof(struct tlmi_pwdcfg));
> +	kfree(obj);
> +	return 0;
> +}
> +
> +static int tlmi_save_bios_settings(const char *password)
> +{
> +	return tlmi_simple_call(LENOVO_SAVE_BIOS_SETTINGS_GUID,
> +				password);
> +}
> +
> +static int tlmi_setting(int item, char **value, const char *guid_string)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +
> +	status = wmi_query_block(guid_string, item, &output);
> +	if (ACPI_FAILURE(status)) {
> +		kfree(output.pointer);
> +		return -EIO;
> +	}
> +
> +	return tlmi_extract_output_string(&output, value);
> +}
> +
> +static int tlmi_get_bios_selections(const char *item, char **value)
> +{
> +	const struct acpi_buffer input = { strlen(item), (char *)item };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +
> +	status = wmi_evaluate_method(LENOVO_GET_BIOS_SELECTIONS_GUID,
> +				     0, 0, &input, &output);
> +
> +	if (ACPI_FAILURE(status)) {
> +		kfree(output.pointer);
> +		return -EIO;
> +	}
> +
> +	return tlmi_extract_output_string(&output, value);
> +}
> +
> +/* ---- Authentication sysfs --------------------------------------------------------- */
> +static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					  char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +
> +	if (setting->valid)
> +		return sysfs_emit(buf, "1\n");
> +	else
> +		return sysfs_emit(buf, "0\n");

Maybe use:

	sysfs_emit(buf, "%d\n", settings->valid);

instead?


> +}
> +
> +static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
> +
> +static ssize_t current_password_store(struct kobject *kobj,
> +				      struct kobj_attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +	int length;
> +
> +	length = strlen(buf);
> +	if (buf[length-1] == '\n')
> +		length--;
> +
> +	if (length >= TLMI_PWD_MAXLEN)
> +		return -EINVAL;
> +
> +	memcpy(setting->password, buf, length);
> +	setting->password[length] = '\0';
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
> +
> +static ssize_t new_password_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +	char *p, *new_pwd;
> +	char *auth_str;
> +	int ret = 0, len;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (!tlmi_priv.can_set_bios_password)
> +		return -EOPNOTSUPP;
> +
> +	new_pwd = kstrdup(buf, GFP_KERNEL);
> +	if (!new_pwd)
> +		return -ENOMEM;
> +
> +	p = strchr(new_pwd, '\n');
> +	if (p)
> +		*p = '\0';
> +
> +	if (strlen(new_pwd) > setting->maxlen) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
> +	len = strlen(setting->password) + strlen(encoding_options[setting->encoding])
> +		+ strlen(setting->kbdlang) + 3 /* type */
> +		+ strlen(new_pwd) + 6 /* punctuation and terminator*/;
> +	auth_str = kzalloc(len, GFP_KERNEL);
> +	snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
> +		 setting->pwd_type, setting->password, new_pwd,
> +		 encoding_options[setting->encoding], setting->kbdlang);
> +	ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);

So I guess on success any subsequent calls need to use the new password,
so the user is expected to write the new password to the current_password
file after changing the password this way?

I just checked the dell-wmi-sysman code and that does this:

        /* clear current_password here and use user input from wmi_priv.current_password */
        if (!ret)
                memset(current_password, 0, MAX_BUFF);

Where current_password points to either the user or admin cached password,
depending on which one is being changed.

So that seems to work the same way as what you are doing here (the user needs to
write the new password to current_password after changing it through the
new_password sysfs attribute). Can you add a patch to the patch-set documenting
this in Documentation/ABI/testing/sysfs-class-firmware-attributes ?

Also you may want to consider clearing out the old cached password on success
like the Dell code is doing.


> +	kfree(auth_str);
> +out:
> +	kfree(new_pwd);
> +	return ret ? ret : count;
> +}
> +
> +static struct kobj_attribute auth_new_password = __ATTR_WO(new_password);
> +
> +static ssize_t min_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +
> +	return sysfs_emit(buf, "%d\n", setting->minlen);
> +}
> +
> +static struct kobj_attribute auth_min_pass_length = __ATTR_RO(min_password_length);
> +
> +static ssize_t max_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +
> +	return sysfs_emit(buf, "%d\n", setting->maxlen);
> +}
> +static struct kobj_attribute auth_max_pass_length = __ATTR_RO(max_password_length);
> +
> +static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "password\n");
> +}
> +static struct kobj_attribute auth_mechanism = __ATTR_RO(mechanism);
> +
> +static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +
> +	return sysfs_emit(buf, "%s\n", encoding_options[setting->encoding]);
> +}
> +
> +static ssize_t encoding_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +	int i;
> +
> +	/* Scan for a matching profile */
> +	i = sysfs_match_string(encoding_options, buf);
> +	if (i < 0)
> +		return -EINVAL;
> +
> +	setting->encoding = i;
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_encoding = __ATTR_RW(encoding);
> +
> +static ssize_t kbdlang_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->kbdlang);
> +}
> +
> +static ssize_t kbdlang_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +	int length;
> +
> +	length = strlen(buf);
> +	if (buf[length-1] == '\n')
> +		length--;
> +	if (!length || (length >= TLMI_LANG_MAXLEN))
> +		return -EINVAL;
> +
> +	memcpy(setting->kbdlang, buf, length);
> +	setting->kbdlang[length] = '\0';
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_kbdlang = __ATTR_RW(kbdlang);
> +
> +{
> +	if (strcmp(kobj->name, "Admin") == 0)
> +		return sprintf(buf, "bios-admin\n");
> +	else if (strcmp(kobj->name, "System") == 0)
> +		return sprintf(buf, "power-on\n");
> +	return -EIO;
> +}

IMHO it would be nice to add a "const char *role" to struct tlmi_pwd_setting and
then change this to:

> +static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->role);
> +}

That would make this function consistent with the other password related functions.



> +static struct kobj_attribute auth_role = __ATTR_RO(role);
> +
> +static struct attribute *auth_attrs[] = {
> +	&auth_is_pass_set.attr,
> +	&auth_min_pass_length.attr,
> +	&auth_max_pass_length.attr,
> +	&auth_current_password.attr,
> +	&auth_new_password.attr,
> +	&auth_role.attr,
> +	&auth_mechanism.attr,
> +	&auth_encoding.attr,
> +	&auth_kbdlang.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group auth_attr_group = {
> +	.attrs = auth_attrs,
> +};
> +
> +/* ---- Attributes sysfs --------------------------------------------------------- */
> +static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr,
> +		char *buf)
> +{
> +	struct tlmi_attr_setting *setting = container_of(kobj, struct tlmi_attr_setting, kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->display_name);
> +}
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct tlmi_attr_setting *setting = container_of(kobj, struct tlmi_attr_setting, kobj);
> +	char *item;
> +	int ret;
> +
> +	ret = tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID);
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_emit(buf, "%s\n", item);
> +	kfree(item);
> +	return ret;
> +}
> +
> +static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct tlmi_attr_setting *setting = container_of(kobj, struct tlmi_attr_setting, kobj);
> +
> +	if (!tlmi_priv.can_get_bios_selections)
> +		return -EOPNOTSUPP;
> +
> +	return sysfs_emit(buf, "%s\n", setting->possible_values);
> +}
> +
> +static ssize_t current_value_store(struct kobject *kobj,
> +		struct kobj_attribute *attr,
> +		const char *buf, size_t count)
> +{
> +	struct tlmi_attr_setting *setting = container_of(kobj, struct tlmi_attr_setting, kobj);
> +	int alloc_len, auth_len = 0;
> +	int str_ix = 0;
> +	char *auth_str = NULL;
> +	char *set_str, *new_setting, *p;
> +	int ret;
> +
> +	if (!tlmi_priv.can_set_bios_settings)
> +		return -EOPNOTSUPP;
> +
> +	new_setting = kstrdup(buf, GFP_KERNEL);
> +	if (!new_setting)
> +		return -ENOMEM;
> +	p = strchr(new_setting, '\n');
> +	if (p)
> +		*p = '\0';
> +
> +	alloc_len = strlen(setting->display_name) + 3 + strlen(new_setting);
> +
> +	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
> +		auth_len += strlen(tlmi_priv.pwd_admin->password) + 1
> +			+ strlen(encoding_options[tlmi_priv.pwd_admin->encoding]) + 1
> +			+ strlen(tlmi_priv.pwd_admin->kbdlang) + 1 + 1;
> +		auth_str = kmalloc(auth_len, GFP_KERNEL);
> +		if (!auth_str) {
> +			ret = -ENOMEM;
> +			goto out;

You end-up kfree-ing set_str here without it being initialized (compiler warning?)
Please just initialize all 3 strings which you kfree at the end to NULL, I know
this is not necessary for at least the new_setting string but it makes it easier
for someone reading the code to verify that the kfree() does not happens on
an uninitialized pointer.

> +		}
> +
> +		sprintf(auth_str, "%s,%s,%s;",
> +				tlmi_priv.pwd_admin->password,
> +				encoding_options[tlmi_priv.pwd_admin->encoding],
> +				tlmi_priv.pwd_admin->kbdlang);
> +		alloc_len += auth_len;
> +	}
> +
> +	set_str = kmalloc(alloc_len, GFP_KERNEL);
> +	if (!set_str) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	str_ix += sprintf(set_str, "%s,%s", setting->display_name, new_setting);
> +
> +	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)

Maybe use:

	if (auth_str) 

here? This way if the condition of the above if block ever changes, you can't
end up passing a NULL auth_Str to the sprintf.

> +		sprintf(set_str + str_ix, ",%s", auth_str);
> +	else
> +		sprintf(set_str + str_ix, ";");
> +
> +	ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> +	if (ret)
> +		goto out;
> +
> +	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
> +		ret = tlmi_save_bios_settings(auth_str);
> +	else
> +		ret = tlmi_save_bios_settings("");
> +	if (ret)
> +		goto out;
> +
> +out:
> +	kfree(auth_str);
> +	kfree(set_str);
> +	kfree(new_setting);
> +	return ret ? ret : count;
> +}
> +
> +static struct kobj_attribute attr_displ_name =
> +		__ATTR_RO(display_name);
> +
> +static struct kobj_attribute attr_possible_values =
> +		__ATTR_RO(possible_values);
> +
> +static struct kobj_attribute attr_current_val =
> +		__ATTR_RW_MODE(current_value, 0600);
> +
> +static struct attribute *tlmi_attrs[] = {
> +	&attr_displ_name.attr,
> +	&attr_current_val.attr,
> +	&attr_possible_values.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tlmi_attr_group = {
> +	.attrs = tlmi_attrs,
> +};
> +
> +static ssize_t tlmi_attr_show(struct kobject *kobj, struct attribute *attr,
> +				    char *buf)
> +{
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->show)
> +		ret = kattr->show(kobj, kattr, buf);
> +	return ret;
> +}
> +
> +static ssize_t tlmi_attr_store(struct kobject *kobj, struct attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->store)
> +		ret = kattr->store(kobj, kattr, buf, count);
> +	return ret;
> +}
> +
> +static const struct sysfs_ops tlmi_kobj_sysfs_ops = {
> +	.show	= tlmi_attr_show,
> +	.store	= tlmi_attr_store,
> +};
> +
> +static struct kobj_type attr_name_ktype = {
> +	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
> +};

You need to re-add a release function here, sorry I was not clear
about that in my review of v1. Since you do a kobject_put and not a
direct kfree() on cleanup, you need to define a release function to
do the actual free once the refcount drops to 0.

And since you have 2 kind of structs embedding the kobjects you will
need 2 release functions:

static void tmli_attr_setting_release(struct kobject *kobj)
{
	struct tlmi_attr_setting *setting = container_of(kobj, struct tlmi_attr_setting, kobj);

	kfree(setting);
}

static void tmli_pwd_setting_release(struct kobject *kobj)
{
	struct tlmi_pwd_setting *pwd = container_of(kobj, struct tlmi_pwd_setting, kobj);

	kfree(pwd);
}

And then have 2 kobject-types:

static struct kobj_type tmli_attr_setting_ktype = {
	.release	= tmli_attr_setting_release,
	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
};

static struct kobj_type tmli_pwd_setting_ktype = {
	.release	= tmli_pwd_setting_release,
	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
};

And use the right type when creating the objects.



> +
> +/* ---- Initialisation --------------------------------------------------------- */
> +static void tlmi_release_attr(void)
> +{
> +	int i;
> +
> +	/* Attribute structures */
> +	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
> +
> +		if (tlmi_priv.setting[i]) {
> +			kfree(tlmi_priv.setting[i]->possible_values);
> +			sysfs_remove_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
> +			kobject_put(&tlmi_priv.setting[i]->kobj);
> +		}
> +	}
> +	kset_unregister(tlmi_priv.attribute_kset);
> +
> +	/* Authentication structures */
> +	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
> +	kobject_put(&tlmi_priv.pwd_admin->kobj);
> +	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
> +	kobject_put(&tlmi_priv.pwd_power->kobj);
> +	kset_unregister(tlmi_priv.authentication_kset);
> +}
> +
> +static int tlmi_sysfs_init(void)
> +{
> +	int i, ret;
> +
> +	ret = fw_attributes_class_register(&fw_attr_class);
> +	if (ret)
> +		return ret;
> +
> +	tlmi_priv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
> +			NULL, "%s", "thinklmi");
> +	if (IS_ERR(tlmi_priv.class_dev)) {
> +		ret = PTR_ERR(tlmi_priv.class_dev);
> +		goto fail_class_created;
> +	}
> +
> +	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
> +			&tlmi_priv.class_dev->kobj);
> +	if (!tlmi_priv.attribute_kset) {
> +		ret = -ENOMEM;
> +		goto fail_device_created;
> +	}
> +
> +	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
> +		/*Check if index is a valid setting - skip if it isn't */
> +		if (!tlmi_priv.setting[i])
> +			continue;
> +
> +		/* build attribute */
> +		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
> +		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &attr_name_ktype,
> +				NULL, "%s", tlmi_priv.setting[i]->display_name);
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		ret = sysfs_create_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
> +		if (ret)
> +			goto fail_create_attr;
> +	}
> +
> +	/* Create authentication entries */
> +	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
> +								&tlmi_priv.class_dev->kobj);
> +	if (!tlmi_priv.authentication_kset) {
> +		ret = -ENOMEM;
> +		goto fail_create_attr;
> +	}
> +	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
> +	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &attr_name_ktype,
> +			NULL, "%s", "Admin");
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	ret = sysfs_create_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
> +	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &attr_name_ktype,
> +			NULL, "%s", "System");
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	ret = sysfs_create_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	return ret;
> +
> +fail_create_attr:
> +	tlmi_release_attr();
> +fail_device_created:
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +fail_class_created:
> +	fw_attributes_class_remove();
> +	return ret;
> +}
> +
> +/* ---- Base Driver -------------------------------------------------------- */
> +static int tlmi_analyze(void)
> +{
> +	struct tlmi_pwdcfg pwdcfg;
> +	acpi_status status;
> +	int i = 0;
> +	int ret;
> +
> +	if (wmi_has_guid(LENOVO_SET_BIOS_SETTINGS_GUID) &&
> +	    wmi_has_guid(LENOVO_SAVE_BIOS_SETTINGS_GUID))
> +		tlmi_priv.can_set_bios_settings = true;
> +
> +	if (wmi_has_guid(LENOVO_GET_BIOS_SELECTIONS_GUID))
> +		tlmi_priv.can_get_bios_selections = true;
> +
> +	if (wmi_has_guid(LENOVO_SET_BIOS_PASSWORD_GUID))
> +		tlmi_priv.can_set_bios_password = true;
> +
> +	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
> +		tlmi_priv.can_get_password_settings = true;
> +
> +	/*
> +	 * Try to find the number of valid settings of this machine
> +	 * and use it to create sysfs attributes
> +	 */
> +	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
> +		char *item = NULL;
> +		int spleng = 0;
> +		int num = 0;
> +		char *p;
> +		struct tlmi_attr_setting *setting;
> +
> +		tlmi_priv.setting[i] = NULL;
> +		status = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
> +		if (ACPI_FAILURE(status))
> +			break;
> +		if (!item)
> +			break;
> +		if (!*item)
> +			continue;
> +
> +		/* It is not allowed to have '/' for file name. Convert it into '\'. */
> +		spleng = strlen(item);
> +		for (num = 0; num < spleng; num++) {
> +			if (item[num] == '/')
> +				item[num] = '\\';
> +		}
> +
> +		/* Remove the value part */
> +		p = strchr(item, ',');
> +		if (p)
> +			*p = '\0';
> +
> +		/* Create a setting entry */
> +		setting = kzalloc(sizeof(struct tlmi_attr_setting), GFP_KERNEL);
> +		if (!setting) {
> +			ret = -ENOMEM;
> +			goto fail_clear_attr;
> +		}
> +		setting->index = i;
> +		strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
> +		/* If BIOS selections supported, load those */
> +		if (tlmi_priv.can_get_bios_selections) {
> +			ret = tlmi_get_bios_selections(setting->display_name,
> +					&setting->possible_values);
> +			if (ret || !setting->possible_values)
> +				pr_info("Error retrieving possible values for %d : %s\n",
> +						i, setting->display_name);
> +		}
> +		tlmi_priv.setting[i] = setting;
> +		tlmi_priv.settings_count++;
> +		kfree(item);
> +	}
> +
> +	/* Create password setting structure */
> +	ret = tlmi_get_pwd_settings(&pwdcfg);
> +	if (ret)
> +		goto fail_clear_attr;
> +
> +	tlmi_priv.pwd_admin = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
> +	if (!tlmi_priv.pwd_admin) {
> +		ret = -ENOMEM;
> +		goto fail_clear_attr;
> +	}
> +	sprintf(tlmi_priv.pwd_admin->display_name, "admin");
> +	sprintf(tlmi_priv.pwd_admin->kbdlang, "us");
> +	tlmi_priv.pwd_admin->encoding = TLMI_ENCODING_ASCII;
> +	sprintf(tlmi_priv.pwd_admin->pwd_type, "pap");
> +	tlmi_priv.pwd_admin->minlen = pwdcfg.min_length;
> +	tlmi_priv.pwd_admin->maxlen = pwdcfg.max_length;
> +	if (pwdcfg.password_state & TLMI_PAP_PWD)
> +		tlmi_priv.pwd_admin->valid = true;
> +
> +	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
> +	if (!tlmi_priv.pwd_power) {
> +		ret = -ENOMEM;
> +		goto fail_clear_attr;
> +	}
> +	sprintf(tlmi_priv.pwd_power->display_name, "power-on");
> +	sprintf(tlmi_priv.pwd_power->kbdlang, "us");
> +	tlmi_priv.pwd_power->encoding = TLMI_ENCODING_ASCII;
> +	sprintf(tlmi_priv.pwd_admin->pwd_type, "pop");
> +	tlmi_priv.pwd_power->minlen = pwdcfg.min_length;
> +	tlmi_priv.pwd_power->maxlen = pwdcfg.max_length;
> +
> +	if (pwdcfg.password_state & TLMI_POP_PWD)
> +		tlmi_priv.pwd_power->valid = true;
> +
> +	return 0;
> +
> +fail_clear_attr:
> +	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i)
> +		kfree(tlmi_priv.setting[i]);
> +	return ret;
> +}
> +
> +static void tlmi_remove(struct wmi_device *wdev)
> +{
> +	tlmi_release_attr();
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +	fw_attributes_class_remove();
> +}
> +
> +static int tlmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	tlmi_analyze();
> +	return tlmi_sysfs_init();
> +}
> +
> +static const struct wmi_device_id tlmi_id_table[] = {
> +	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
> +	{ }
> +};
> +
> +static struct wmi_driver tlmi_driver = {
> +	.driver = {
> +		.name = "think-lmi",
> +	},
> +	.id_table = tlmi_id_table,
> +	.probe = tlmi_probe,
> +	.remove = tlmi_remove,
> +};
> +
> +MODULE_AUTHOR("Sugumaran L <slacshiminar@lenovo.com>");
> +MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> +MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
> +MODULE_DESCRIPTION("ThinkLMI Driver");
> +MODULE_LICENSE("GPL");
> +
> +module_wmi_driver(tlmi_driver);
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> new file mode 100644
> index 000000000..2c1484304
> --- /dev/null
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef _THINK_LMI_H_
> +#define _THINK_LMI_H_
> +
> +#define TLMI_SETTINGS_COUNT  256
> +#define TLMI_SETTINGS_MAXLEN 512
> +#define TLMI_PWD_MAXLEN      128
> +#define TLMI_PWDTYPE_MAXLEN   64
> +#define TLMI_ENC_MAXLEN       64
> +#define TLMI_LANG_MAXLEN       4
> +#define TLMI_PWDTYPE_LEN       4
> +/*
> + * Longest string should be in the set command: allow size of BIOS
> + * option and choice
> + */
> +#define TLMI_GETSET_MAXLEN (TLMI_SETTINGS_MAXLEN + TLMI_SETTINGS_MAXLEN)
> +
> +enum encoding_option {
> +	TLMI_ENCODING_ASCII,
> +	TLMI_ENCODING_SCANCODE,
> +};
> +
> +/* password configuration details */
> +struct tlmi_pwdcfg {
> +	uint32_t password_mode;
> +	uint32_t password_state;
> +	uint32_t min_length;
> +	uint32_t max_length;
> +	uint32_t supported_encodings;
> +	uint32_t supported_keyboard;
> +};
> +
> +/* password setting details */
> +struct tlmi_pwd_setting {
> +	struct kobject kobj;
> +	bool valid;
> +	char display_name[TLMI_PWDTYPE_MAXLEN];
> +	char password[TLMI_PWD_MAXLEN];
> +	char pwd_type[TLMI_PWDTYPE_LEN];

Note you can just make this a "const char *" and init it like this:

	pwd_type = "pop";

The "pop" string will be part of the const data section so its
address will still be valid after the function has exited.


> +	int minlen;
> +	int maxlen;
> +	enum encoding_option encoding;
> +	char kbdlang[TLMI_LANG_MAXLEN];
> +};
> +
> +/* Attribute setting details */
> +struct tlmi_attr_setting {
> +	struct kobject kobj;
> +	int index;
> +	char display_name[TLMI_SETTINGS_MAXLEN];
> +	char *possible_values;
> +};
> +
> +struct think_lmi {
> +	struct wmi_device *wmi_device;
> +
> +	int settings_count;
> +	bool can_set_bios_settings;
> +	bool can_get_bios_selections;
> +	bool can_set_bios_password;
> +	bool can_get_password_settings;
> +
> +	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
> +	struct device *class_dev;
> +	struct kset *attribute_kset;
> +	struct kset *authentication_kset;
> +	struct tlmi_pwd_setting *pwd_admin;
> +	struct tlmi_pwd_setting *pwd_power;
> +};
> +
> +#endif /* !_THINK_LMI_H_ */
> +
> 



Regards,

Hans

