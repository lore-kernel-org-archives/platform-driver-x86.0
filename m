Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BD5C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB14420708
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WY6f04d9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732889AbgKXMVP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 07:21:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26796 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732607AbgKXMVP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 07:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606220472;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tzlQXonJLisR5ff46z/eLhOIrwpplE7mcfVt03TKN0M=;
        b=WY6f04d9HhIS3vxdJQartGQeLPF03jwzjHa6cy/yP1zvi4vqW0J+3PvD2TiPLxdismmQRj
        FPdnBbdokkxApryfjBIeIBnQ2ddgmB1tDz5hpeaNdbxKe+pVzpdTKV52UJFq7s9VITNPu0
        Y5LDJQ/lDwSQC814pSBDgMT7R0xcOz8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-v29ezSlvOCi3CAnCLG3Okg-1; Tue, 24 Nov 2020 07:21:10 -0500
X-MC-Unique: v29ezSlvOCi3CAnCLG3Okg-1
Received: by mail-ej1-f69.google.com with SMTP id gx12so6734746ejb.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 04:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tzlQXonJLisR5ff46z/eLhOIrwpplE7mcfVt03TKN0M=;
        b=BmQvpIYnbDPxBjmBgyWNOd+9CUMy2uBSpreS4gyAoomC1igfU8YaY6wdzVzIYs88VM
         xkyp13n9axBYq8JoY94/R6J5P9av7om8QzkpTIfgXu9VUXlFDNTA56uQuwAxDT8+AKlU
         KJLouk5ukcjQFJLjllTM0yJ3L7VCfUEUnXXheDZdmPpjSvUz+vdOEHOshjpIFGeOabWc
         H5sJgar4nCrYmNZkLJ5oywfD5ZCS0ccbKPyf9fviKabUvn17dWprqKQXpjp1TZOv+37m
         /IKpp9EJVCCRZr3BR/LDKU90VsosKzLWnVdVadu8H7YYjUCb5NGrQBAgi0B84j9S75G8
         L8+Q==
X-Gm-Message-State: AOAM5319rhBYC6Gl0MN+LVocrs75gDTUBZqDo6UcItss0HVuB64u2WEr
        U/8jtXMa+VmimSM3zyx4MmCjFuBbcfY/o4R7kSmAqI7Qlyd1cGJAunOj1bRf5dLY8RWV92Pr5yw
        2E+ijV4tjFkYK51ZoCppqffnrO47Qn5efIQ==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr3731807edr.371.1606220468811;
        Tue, 24 Nov 2020 04:21:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxopD6IpWUUvYW96oILpghqFppkks1pUDBF0YJfSd8ynrmt1EhyM9CGoCj+/V1Vzq8ehbPz1w==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr3731795edr.371.1606220468610;
        Tue, 24 Nov 2020 04:21:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id gl23sm6778294ejb.113.2020.11.24.04.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 04:21:07 -0800 (PST)
Subject: Re: [PATCH 1/2] platform/x86: system76_acpi: Add hwmon driver
To:     Jeremy Soller <jeremy@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     =?UTF-8?Q?Bj=c3=b6rn_Lindfors?= <productdev@system76.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e317de7e-3c4d-71e4-0456-e047783ea34b@redhat.com>
Date:   Tue, 24 Nov 2020 13:21:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jeremy,

On 9/3/20 10:47 PM, Jeremy Soller wrote:
> The hwmon driver provides a kernel interface for accessing fan duty
> cycle, fan speed, and temperature data as defined by firmware. Up to
> eight fans and eight temperature sensors are supported. The actual
> number is determined by querying the firmware.
> 
> Signed-off-by: Jeremy Soller <jeremy@system76.com>
> Cc: platform-driver-x86@vger.kernel.org

Quick self intro: I have take over drivers/platform/x86
maintainership from Andy; and I'm working my way through
the backlog of old patches in patchwork:
https://patchwork.kernel.org/project/platform-driver-x86/list/

This patch has some initial review remarks from Barnabás Pőcze
which need addressing. Can you please send a v2 of this series
with Barnabás' remarks to patch 1/2 fixed ?

As I mentioned before switching to a sparse-keymap for 2/2
is not really necessary IMHO, but if you want to do it that
is fine.

Regards,

Hans





> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 40219bba6801..d2f9c3dcf4b9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1158,6 +1158,7 @@ config SONYPI_COMPAT
>  config SYSTEM76_ACPI
>  	tristate "System76 ACPI Driver"
>  	depends on ACPI
> +	depends on HWMON
>  	select NEW_LEDS
>  	select LEDS_CLASS
>  	select LEDS_TRIGGERS
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index c14fd22ba196..aef0ea34829d 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -10,6 +10,8 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> @@ -24,6 +26,9 @@ struct system76_data {
>  	enum led_brightness kb_brightness;
>  	enum led_brightness kb_toggle_brightness;
>  	int kb_color;
> +	struct device *therm;
> +	union acpi_object *nfan;
> +	union acpi_object *ntmp;
>  };
>  
>  static const struct acpi_device_id device_ids[] = {
> @@ -68,6 +73,54 @@ static int system76_get(struct system76_data *data, char *method)
>  		return -1;
>  }
>  
> +// Get a System76 ACPI device value by name with index
> +static int system76_get_index(struct system76_data *data, char *method, int index)
> +{
> +	union acpi_object obj;
> +	struct acpi_object_list obj_list;
> +	acpi_handle handle;
> +	acpi_status status;
> +	unsigned long long ret = 0;
> +
> +	obj.type = ACPI_TYPE_INTEGER;
> +	obj.integer.value = index;
> +	obj_list.count = 1;
> +	obj_list.pointer = &obj;
> +	handle = acpi_device_handle(data->acpi_dev);
> +	status = acpi_evaluate_integer(handle, method, &obj_list, &ret);
> +	if (ACPI_SUCCESS(status))
> +		return (int)ret;
> +	else
> +		return -1;
> +}
> +
> +// Get a System76 ACPI device object by name
> +static int system76_get_object(struct system76_data *data, char *method, union acpi_object **obj)
> +{
> +	acpi_handle handle;
> +	acpi_status status;
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +	handle = acpi_device_handle(data->acpi_dev);
> +	status = acpi_evaluate_object(handle, method, NULL, &buf);
> +	if (ACPI_SUCCESS(status)) {
> +		*obj = (union acpi_object *)buf.pointer;
> +		return 0;
> +	} else {
> +		return -1;
> +	}
> +}
> +
> +// Get a name from a System76 ACPI device object
> +static char *system76_name(union acpi_object *obj, int index)
> +{
> +	if (obj && obj->type == ACPI_TYPE_PACKAGE && index <= obj->package.count) {
> +		if (obj->package.elements[index].type == ACPI_TYPE_STRING)
> +			return obj->package.elements[index].string.pointer;
> +	}
> +	return NULL;
> +}
> +
>  // Set a System76 ACPI device value by name
>  static int system76_set(struct system76_data *data, char *method, int value)
>  {
> @@ -270,6 +323,120 @@ static void kb_led_hotkey_color(struct system76_data *data)
>  	kb_led_notify(data);
>  }
>  
> +static umode_t thermal_is_visible(
> +	const void *drvdata,
> +	enum hwmon_sensor_types type,
> +	u32 attr,
> +	int channel)
> +{
> +	const struct system76_data *data = drvdata;
> +
> +	if (type == hwmon_fan || type == hwmon_pwm) {
> +		if (system76_name(data->nfan, channel))
> +			return S_IRUGO;
> +	} else if (type == hwmon_temp) {
> +		if (system76_name(data->ntmp, channel))
> +			return S_IRUGO;
> +	}
> +	return 0;
> +}
> +
> +static int thermal_read(
> +	struct device *dev,
> +	enum hwmon_sensor_types type,
> +	u32 attr,
> +	int channel,
> +	long *val)
> +{
> +	struct system76_data *data = dev_get_drvdata(dev);
> +	int raw;
> +
> +	if (type == hwmon_fan && attr == hwmon_fan_input) {
> +		raw = system76_get_index(data, "GFAN", channel);
> +		if (raw >= 0) {
> +			*val = (long)((raw >> 8) & 0xFFFF);
> +			return 0;
> +		}
> +	} else if (type == hwmon_pwm && attr == hwmon_pwm_input) {
> +		raw = system76_get_index(data, "GFAN", channel);
> +		if (raw >= 0) {
> +			*val = (long)(raw & 0xFF);
> +			return 0;
> +		}
> +	} else if (type == hwmon_temp && attr == hwmon_temp_input) {
> +		raw = system76_get_index(data, "GTMP", channel);
> +		if (raw >= 0) {
> +			*val = (long)(raw * 1000);
> +			return 0;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
> +static int thermal_read_string(
> +	struct device *dev,
> +	enum hwmon_sensor_types type,
> +	u32 attr,
> +	int channel,
> +	const char **str)
> +{
> +	struct system76_data *data = dev_get_drvdata(dev);
> +
> +	if (type == hwmon_fan && attr == hwmon_fan_label) {
> +		*str = system76_name(data->nfan, channel);
> +		if (*str)
> +			return 0;
> +	} else if (type == hwmon_temp && attr == hwmon_temp_label) {
> +		*str = system76_name(data->ntmp, channel);
> +		if (*str)
> +			return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static const struct hwmon_ops thermal_ops = {
> +	.is_visible = thermal_is_visible,
> +	.read = thermal_read,
> +	.read_string = thermal_read_string,
> +};
> +
> +// Allocate up to 8 fans and temperatures
> +static const struct hwmon_channel_info *thermal_channel_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(pwm,
> +			HWMON_PWM_INPUT,
> +			HWMON_PWM_INPUT,
> +			HWMON_PWM_INPUT,
> +			HWMON_PWM_INPUT,
> +			HWMON_PWM_INPUT,
> +			HWMON_PWM_INPUT,
> +			HWMON_PWM_INPUT,
> +			HWMON_PWM_INPUT),
> +	HWMON_CHANNEL_INFO(temp,
> +			HWMON_T_INPUT | HWMON_T_LABEL,
> +			HWMON_T_INPUT | HWMON_T_LABEL,
> +			HWMON_T_INPUT | HWMON_T_LABEL,
> +			HWMON_T_INPUT | HWMON_T_LABEL,
> +			HWMON_T_INPUT | HWMON_T_LABEL,
> +			HWMON_T_INPUT | HWMON_T_LABEL,
> +			HWMON_T_INPUT | HWMON_T_LABEL,
> +			HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info thermal_chip_info = {
> +	.ops = &thermal_ops,
> +	.info = thermal_channel_info,
> +};
> +
>  // Handle ACPI notification
>  static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>  {
> @@ -346,6 +513,17 @@ static int system76_add(struct acpi_device *acpi_dev)
>  			return err;
>  	}
>  
> +	system76_get_object(data, "NFAN", &data->nfan);
> +	system76_get_object(data, "NTMP", &data->ntmp);
> +	data->therm = devm_hwmon_device_register_with_info(
> +		&acpi_dev->dev,
> +		"system76_acpi",
> +		data,
> +		&thermal_chip_info,
> +		NULL);
> +	if (IS_ERR(data->therm))
> +		return PTR_ERR(data->therm);
> +
>  	return 0;
>  }
>  
> @@ -362,6 +540,9 @@ static int system76_remove(struct acpi_device *acpi_dev)
>  
>  	devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
>  
> +	kfree(data->nfan);
> +	kfree(data->ntmp);
> +
>  	system76_get(data, "FINI");
>  
>  	return 0;
> 

