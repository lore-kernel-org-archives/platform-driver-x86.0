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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49144C64E7C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 16:45:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1E1621527
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 16:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fW5TFU9h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732072AbgKYQpZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Nov 2020 11:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52184 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732077AbgKYQpY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 11:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606322722;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7TkL5toGwFJ+8TE2mt9YMIFpWd/B1OjLBR935HQEb8E=;
        b=fW5TFU9h7PMEyS4ToaQ/YQsoKVGFzF01FzdYflrv66iY5305REbXOIqEHTpFvhIgL2wt0a
        27s4jH9G5X88XUzVYJDRgvoh+oQ4SOMLEDD8X63YF1a60IlfXZZYP0tp5f2i0jMJa7D5E9
        FdaSskqKqdBPoW7nwlT3rKdr9+vlQEQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-Y87zmm9MO1KR7CmDsYt3Ig-1; Wed, 25 Nov 2020 11:45:20 -0500
X-MC-Unique: Y87zmm9MO1KR7CmDsYt3Ig-1
Received: by mail-ed1-f70.google.com with SMTP id l12so1273915edw.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 08:45:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7TkL5toGwFJ+8TE2mt9YMIFpWd/B1OjLBR935HQEb8E=;
        b=ozN11R2KDqfih3sDJVMV2oHuyhWRX7qjCJp5uVAsI6fKUEGmcstmehFnQHaqAVJ2D5
         n4xVs297pNC8qykQXfj3nHV5wBJ98Tx0P0hp5/zMVTcO/Qn4nmStgPLBRqzODHmtpRxo
         sQidcRiPdTlUcEc872G6t4iOjxu5XzKivfXqkIN0Cdq8HLq7v1voDxxb0P9Tns5qmDTr
         mMk3p275aPhDoX6amrljQ0+LX1/NVR31flDNP6fr6I5KXzT5Fcms/EvWOzydJEqIqTcr
         5aPWsH6FHPM0bdZEOYSCfCA98kUpxYVhctQng0WC8t9A3NziCnbmpplOicC0+nbFruNR
         BchQ==
X-Gm-Message-State: AOAM530MjmWiuBbEvO8q5B071e9z8j5GDJeCWlqh/pSQH4kt0bEeCLnG
        9J5akVSHvuGPn3WKjWA730vC4AT+AGNj3xSrKknK4E9JR39bGbrtVyHR4VnFu/DZhdln+oBubg+
        SbtiEHZ2hntzrQ9GM/SGVfGypule5Nrlg0Q==
X-Received: by 2002:a17:906:2e0f:: with SMTP id n15mr3885257eji.486.1606322718997;
        Wed, 25 Nov 2020 08:45:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyX5FmqRudcT5XnGslhZxhOP5KVv/KYgBinsjvUYJhI2Y/8/5K7z+6o+4RuXsb2ASylM2RqpA==
X-Received: by 2002:a17:906:2e0f:: with SMTP id n15mr3885233eji.486.1606322718737;
        Wed, 25 Nov 2020 08:45:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k12sm1516296ejz.48.2020.11.25.08.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 08:45:17 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add palm sensor support
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        hadess@hadess.net, bberg@redhat.com, njoshi1@lenovo.com
References: <markpearson@lenovo.com>
 <20201124181154.547518-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1a2f69bf-5750-9e78-ad3e-8a48fa9a57ae@redhat.com>
Date:   Wed, 25 Nov 2020 17:45:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124181154.547518-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/20 7:11 PM, Mark Pearson wrote:
> Add support to thinkpad_acpi for returning the status of the palm
> sensor.
> 
> This patch builds on the work done previously for the input device
> implementation (which was not needed). Both lap and palm sensor are using
> sysfs and they are combined into the proxsensor block.
> 
> Note: On some platforms, because of an issue in the HW implementation,
> the palm sensor presence may be incorrectly advertised as always
> enabled even if a palm sensor is not present. The palm sensor is
> intended for WWAN transmission power control and should be available
> and correct on all WWAN enabled systems. It is not recommended to use
> this interface for other use cases.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

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

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 162 +++++++++++++++++----------
>  1 file changed, 103 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e3810675090a..6a4c54db38fb 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4021,6 +4021,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
>  }
>  
>  static void thermal_dump_all_sensors(void);
> +static void palmsensor_refresh(void);
>  
>  static bool hotkey_notify_6xxx(const u32 hkey,
>  				 bool *send_acpi_ev,
> @@ -4087,8 +4088,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  
>  	case TP_HKEY_EV_PALM_DETECTED:
>  	case TP_HKEY_EV_PALM_UNDETECTED:
> -		/* palm detected hovering the keyboard, forward to user-space
> -		 * via netlink for consumption */
> +		/* palm detected  - pass on to event handler */
> +		palmsensor_refresh();
>  		return true;
>  
>  	default:
> @@ -9828,102 +9829,146 @@ static struct ibm_struct lcdshadow_driver_data = {
>  };
>  
>  /*************************************************************************
> - * DYTC subdriver, for the Lenovo lapmode feature
> + * Thinkpad sensor interfaces
>   */
>  
>  #define DYTC_CMD_GET          2 /* To get current IC function and mode */
>  #define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
>  
> -static bool dytc_lapmode;
> +#define PALMSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
> +#define PALMSENSOR_ON_BIT      1 /* psensor status */
>  
> -static void dytc_lapmode_notify_change(void)
> -{
> -	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> -}
> +static bool has_palmsensor;
> +static bool has_lapsensor;
> +static bool palm_state;
> +static bool lap_state;
>  
> -static int dytc_command(int command, int *output)
> +static int lapsensor_get(bool *present, bool *state)
>  {
>  	acpi_handle dytc_handle;
> +	int output;
>  
> -	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
> -		/* Platform doesn't support DYTC */
> +	*present = false;
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle)))
>  		return -ENODEV;
> -	}
> -	if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
> +	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", DYTC_CMD_GET))
>  		return -EIO;
> +
> +	*present = true; /*If we get his far, we have lapmode support*/
> +	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
>  	return 0;
>  }
>  
> -static int dytc_lapmode_get(bool *state)
> +static int palmsensor_get(bool *present, bool *state)
>  {
> -	int output, err;
> +	acpi_handle psensor_handle;
> +	int output;
>  
> -	err = dytc_command(DYTC_CMD_GET, &output);
> -	if (err)
> -		return err;
> -	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
> +	*present = false;
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
> +		return -ENODEV;
> +	if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
> +		return -EIO;
> +
> +	*present = output & BIT(PALMSENSOR_PRESENT_BIT) ? true : false;
> +	*state = output & BIT(PALMSENSOR_ON_BIT) ? true : false;
>  	return 0;
>  }
>  
> -static void dytc_lapmode_refresh(void)
> +static void lapsensor_refresh(void)
>  {
> -	bool new_state;
> +	bool state;
>  	int err;
>  
> -	err = dytc_lapmode_get(&new_state);
> -	if (err || (new_state == dytc_lapmode))
> -		return;
> +	if (has_lapsensor) {
> +		err = lapsensor_get(&has_lapsensor, &state);
> +		if (err)
> +			return;
> +		if (lap_state != state) {
> +			lap_state = state;
> +			sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> +		}
> +	}
> +}
>  
> -	dytc_lapmode = new_state;
> -	dytc_lapmode_notify_change();
> +static void palmsensor_refresh(void)
> +{
> +	bool state;
> +	int err;
> +
> +	if (has_palmsensor) {
> +		err = palmsensor_get(&has_palmsensor, &state);
> +		if (err)
> +			return;
> +		if (palm_state != state) {
> +			palm_state = state;
> +			sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "palmsensor");
> +		}
> +	}
>  }
>  
> -/* sysfs lapmode entry */
>  static ssize_t dytc_lapmode_show(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf)
>  {
> -	return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
> +	if (has_lapsensor)
> +		return sysfs_emit(buf, "%d\n", lap_state);
> +	return sysfs_emit(buf, "\n");
>  }
> -
>  static DEVICE_ATTR_RO(dytc_lapmode);
>  
> -static struct attribute *dytc_attributes[] = {
> -	&dev_attr_dytc_lapmode.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group dytc_attr_group = {
> -	.attrs = dytc_attributes,
> -};
> +static ssize_t palmsensor_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	if (has_palmsensor)
> +		return sysfs_emit(buf, "%d\n", palm_state);
> +	return sysfs_emit(buf, "\n");
> +}
> +static DEVICE_ATTR_RO(palmsensor);
>  
> -static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
> +static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>  {
> -	int err;
> +	int palm_err, lap_err, err;
>  
> -	err = dytc_lapmode_get(&dytc_lapmode);
> -	/* If support isn't available (ENODEV) then don't return an error
> -	 * but just don't create the sysfs group
> +	palm_err = palmsensor_get(&has_palmsensor, &palm_state);
> +	lap_err = lapsensor_get(&has_lapsensor, &lap_state);
> +	/*
> +	 * If support isn't available (ENODEV) for both devices then quit, but
> +	 * don't return an error.
>  	 */
> -	if (err == -ENODEV)
> +	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
>  		return 0;
> -	/* For all other errors we can flag the failure */
> -	if (err)
> -		return err;
> -
> -	/* Platform supports this feature - create the group */
> -	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> -	return err;
> +	/* Otherwise, if there was an error return it */
> +	if (palm_err && (palm_err != ENODEV))
> +		return palm_err;
> +	if (lap_err && (lap_err != ENODEV))
> +		return lap_err;
> +
> +	if (has_palmsensor) {
> +		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_palmsensor.attr);
> +		if (err)
> +			return err;
> +	}
> +	if (has_lapsensor) {
> +		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_dytc_lapmode.attr);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
>  }
>  
> -static void dytc_exit(void)
> +static void proxsensor_exit(void)
>  {
> -	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	if (has_lapsensor)
> +		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_dytc_lapmode.attr);
> +	if (has_palmsensor)
> +		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_palmsensor.attr);
>  }
>  
> -static struct ibm_struct dytc_driver_data = {
> -	.name = "dytc",
> -	.exit = dytc_exit,
> +static struct ibm_struct proxsensor_driver_data = {
> +	.name = "proximity-sensor",
> +	.exit = proxsensor_exit,
>  };
>  
>  /****************************************************************************
> @@ -9975,8 +10020,7 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>  	}
>  
>  	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
> -		dytc_lapmode_refresh();
> -
> +		lapsensor_refresh();
>  }
>  
>  static void hotkey_driver_event(const unsigned int scancode)
> @@ -10416,8 +10460,8 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>  		.data = &lcdshadow_driver_data,
>  	},
>  	{
> -		.init = tpacpi_dytc_init,
> -		.data = &dytc_driver_data,
> +		.init = tpacpi_proxsensor_init,
> +		.data = &proxsensor_driver_data,
>  	},
>  };
>  
> 

