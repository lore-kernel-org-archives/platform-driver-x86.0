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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DFFC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 10:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8919861205
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 10:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbhDGKZf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 06:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57074 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351043AbhDGKZJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 06:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617791099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C++Fo8gmgIGyadAhuofxEIH//23vDVDnU8OUVQxcKM8=;
        b=CKAB8+xCthxyw68psjrgN58EYU/dS69mwvgGRL+I++hpgKcKH00WuI7rGH26ZLSHgK2+tK
        TqvQyHqxmFIsgygTMNZw91s9GPUGTjXFu8BMYt7NknF+i5GV1WchhJrQxDMz7OSMjmJs9/
        nyVgauXl3hFHfmixXD1yfCUTGjb3Adw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-TP_A-OdJN4eVJbsiIN9Zgw-1; Wed, 07 Apr 2021 06:24:58 -0400
X-MC-Unique: TP_A-OdJN4eVJbsiIN9Zgw-1
Received: by mail-ej1-f69.google.com with SMTP id gn30so6698220ejc.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 03:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C++Fo8gmgIGyadAhuofxEIH//23vDVDnU8OUVQxcKM8=;
        b=HZHQd+70GmZgbj8/AIqEU1yTJtlvAlXx20XBBSCLidPx3r+VASrdV98Nas+aIK4oQV
         SJFqJa/rbHogOzLZ7tkKT8uSM0t2hvTIByq2BihCqUVnpsXNH8ws45JJGwWhsBxmxQ6b
         3bV3nJwMRc5491+MVjVF/3Ynzhwe3T+W4Cf9mpX0DIpFVDRFJ4+AA3jwHil/qlFMNQkQ
         3b+Z0tOMR9xU38Nbm7kOg4ZNUD6VrTf1bUcHKcjFgf+Ca7MdKlycIDgWb9xYXXl67W6F
         Fs51pl9ULTI3Wf+j+p0lpHSg1s4N3pjyeYSxmy55UyLNx/pXBOgePDV+c6nDDxh08Et0
         YfAQ==
X-Gm-Message-State: AOAM530NeNagsc5y+XgxaUTsUf9aL31LtCeNqPfF/cKnCWVMALGyCf0r
        cwC0BTDzJqguGoJXEzaNDSuHy6DWH3WGadvtsq3piLOBaE5lxfpTcOTCU6EkXSsOyy4pmpBDQbA
        S5eEfDbZ5E2zZBmqWwXoeEpsoQp0MHkIKMQ==
X-Received: by 2002:a17:907:1184:: with SMTP id uz4mr2787612ejb.465.1617791096958;
        Wed, 07 Apr 2021 03:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCxfzHVZ+6EHE4CkY+pZr+CfoUlOdX29u/6eE8j0kWO737WFE2OfD/gbflNHuhLVYy7UMkSQ==
X-Received: by 2002:a17:907:1184:: with SMTP id uz4mr2787590ejb.465.1617791096706;
        Wed, 07 Apr 2021 03:24:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lt22sm8698032ejb.115.2021.04.07.03.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 03:24:56 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com, linrunner@gmx.net
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
Date:   Wed, 7 Apr 2021 12:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nicola,

Thank you for your patch series.

I'm not sure what to do with these. I have a couple of concerns here:

1. These features are useful, but not super useful and as such I wonder
how often they are used and this how well tested the firmware is wrt these.
I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you
comment on if it is ok from a firmware pov to try and use the following
battery related ACPI methods on all thinkpads? :

#define GET_DISCHARGE	"BDSG"
#define SET_DISCHARGE	"BDSS"
#define GET_INHIBIT	"PSSG"
#define SET_INHIBIT	"BICS"


2. If we add support for this to the kernel we should probably
first agree on standardized power-supply class property names for
these, rather then coming up with our own names. ATM we register
2 names for the charge start threshold, the one which the thinkpad_acpi
code invented and the standardized name which was later added.

I've added Sebastian, the power-supply class / driver maintainer to
the Cc. for this. Sebastian Nicolo wants to add support for 2 new
features as power-supply properties:

--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
...
+Battery forced discharging
+--------------------------
+
+sysfs attribute:
+/sys/class/power_supply/BATx/force_discharge
+
+Setting this attribute to 1 forces the battery to discharge while AC is attached.
+Setting it to 0 terminates forced discharging.
+
+Battery charge inhibiting
+--------------------------
+
+sysfs attribute:
+/sys/class/power_supply/BATx/inhibit_discharge
+
+Setting this attribute to 1 stops charging of the battery as a manual override
+over the threshold attributes. Setting it to 0 terminates the override.

Sebastian, I believe that this should be changes to instead be documented
in: Documentation/ABI/testing/sysfs-class-power
and besides the rename I was wondering if you have any remarks on the proposed
API before Nicolo sends out a v2 ?

Regards,

Hans


On 3/17/21 3:01 PM, Nicolo' Piazzalunga wrote:
> Lenovo ThinkPad systems have a feature that lets you
> force the battery to discharge when AC is attached.
> 
> This patch implements that feature and exposes it via the generic
> ACPI battery driver in the generic location:
> 
> /sys/class/power_supply/BATx/force_discharge
> 
> Signed-off-by: Ognjen Galic <smclt30p@gmail.com>
> Signed-off-by: Thomas Koch <linrunner@gmx.net>
> Signed-off-by: Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 59 ++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 9c4df41687a3..6c7dca3a10d2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9317,6 +9317,8 @@ static struct ibm_struct mute_led_driver_data = {
>  #define SET_START	"BCCS"
>  #define GET_STOP	"BCSG"
>  #define SET_STOP	"BCSS"
> +#define GET_DISCHARGE	"BDSG"
> +#define SET_DISCHARGE	"BDSS"
>  
>  enum {
>  	BAT_ANY = 0,
> @@ -9333,6 +9335,7 @@ enum {
>  	/* This is used in the get/set helpers */
>  	THRESHOLD_START,
>  	THRESHOLD_STOP,
> +	FORCE_DISCHARGE
>  };
>  
>  struct tpacpi_battery_data {
> @@ -9340,6 +9343,7 @@ struct tpacpi_battery_data {
>  	int start_support;
>  	int charge_stop;
>  	int stop_support;
> +	int discharge_support;
>  };
>  
>  struct tpacpi_battery_driver_data {
> @@ -9397,6 +9401,12 @@ static int tpacpi_battery_get(int what, int battery, int *ret)
>  		if (*ret == 0)
>  			*ret = 100;
>  		return 0;
> +	case FORCE_DISCHARGE:
> +		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, ret, battery))
> +			return -ENODEV;
> +		/* The force discharge status is in bit 0 */
> +		*ret = *ret & 0x01;
> +		return 0;
>  	default:
>  		pr_crit("wrong parameter: %d", what);
>  		return -EINVAL;
> @@ -9425,6 +9435,16 @@ static int tpacpi_battery_set(int what, int battery, int value)
>  			return -ENODEV;
>  		}
>  		return 0;
> +	case FORCE_DISCHARGE:
> +		/* Force discharge is in bit 0,
> +		 * break on AC attach is in bit 1 (won't work on some ThinkPads),
> +		 * battery ID is in bits 8-9, 2 bits.
> +		 */
> +		if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_DISCHARGE, &ret, param)) {
> +			pr_err("failed to set force dischrage on %d", battery);
> +			return -ENODEV;
> +		}
> +		return 0;
>  	default:
>  		pr_crit("wrong parameter: %d", what);
>  		return -EINVAL;
> @@ -9443,6 +9463,8 @@ static int tpacpi_battery_probe(int battery)
>  	 * 2) Check for support
>  	 * 3) Get the current stop threshold
>  	 * 4) Check for support
> +	 * 5) Get the current force discharge status
> +	 * 6) Check for support
>  	 */
>  	if (acpi_has_method(hkey_handle, GET_START)) {
>  		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret, battery)) {
> @@ -9479,11 +9501,16 @@ static int tpacpi_battery_probe(int battery)
>  			return -ENODEV;
>  		}
>  	}
> -	pr_info("battery %d registered (start %d, stop %d)",
> +	if (acpi_has_method(hkey_handle, GET_DISCHARGE))
> +		if (!ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, &ret, battery)))
> +			/* Support is marked in bit 8 */
> +			battery_info.batteries[battery].discharge_support = ret & BIT(8);
> +
> +	pr_info("battery %d registered (start %d, stop %d, force: %d)",
>  			battery,
>  			battery_info.batteries[battery].charge_start,
> -			battery_info.batteries[battery].charge_stop);
> -
> +			battery_info.batteries[battery].charge_stop,
> +			battery_info.batteries[battery].discharge_support);
>  	return 0;
>  }
>  
> @@ -9569,6 +9596,15 @@ static ssize_t tpacpi_battery_store(int what,
>  		if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
>  			return -EINVAL;
>  		return count;
> +	case FORCE_DISCHARGE:
> +		if (!battery_info.batteries[battery].discharge_support)
> +			return -ENODEV;
> +		/* The only valid values are 1 and 0 */
> +		if (value != 0 && value != 1)
> +			return -EINVAL;
> +		if (tpacpi_battery_set(FORCE_DISCHARGE, battery, value))
> +			return -ENODEV;
> +		return count;
>  	default:
>  		pr_crit("Wrong parameter: %d", what);
>  		return -EINVAL;
> @@ -9617,6 +9653,13 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
>  	return tpacpi_battery_show(THRESHOLD_STOP, device, buf);
>  }
>  
> +static ssize_t force_discharge_show(struct device *device,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	return tpacpi_battery_show(FORCE_DISCHARGE, device, buf);
> +}
> +
>  static ssize_t charge_control_start_threshold_store(struct device *dev,
>  				struct device_attribute *attr,
>  				const char *buf, size_t count)
> @@ -9631,8 +9674,16 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
>  	return tpacpi_battery_store(THRESHOLD_STOP, dev, buf, count);
>  }
>  
> +static ssize_t force_discharge_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	return tpacpi_battery_store(FORCE_DISCHARGE, dev, buf, count);
> +}
> +
>  static DEVICE_ATTR_RW(charge_control_start_threshold);
>  static DEVICE_ATTR_RW(charge_control_end_threshold);
> +static DEVICE_ATTR_RW(force_discharge);
>  static struct device_attribute dev_attr_charge_start_threshold = __ATTR(
>  	charge_start_threshold,
>  	0644,
> @@ -9645,12 +9696,12 @@ static struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
>  	charge_control_end_threshold_show,
>  	charge_control_end_threshold_store
>  );
> -
>  static struct attribute *tpacpi_battery_attrs[] = {
>  	&dev_attr_charge_control_start_threshold.attr,
>  	&dev_attr_charge_control_end_threshold.attr,
>  	&dev_attr_charge_start_threshold.attr,
>  	&dev_attr_charge_stop_threshold.attr,
> +	&dev_attr_force_discharge.attr,
>  	NULL,
>  };
>  
> 

