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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E98BC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A4F461073
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhDOJLE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 05:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57251 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231482AbhDOJLD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 05:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618477840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GSwuZsGNywb7nFboWHr9wsySL+erig9+bW1yurVKQrI=;
        b=aYeyrMjWBaNJUXZZ2LmK4xqOq2kHh37Pf731o5AsA106R78Fp4+Ts8o3HATVUw3VIVo0/O
        DaoHM6Qv7dwMRd7h04jAVHrpC0p8Xm1wbLZAf5PYTXii7olDyHFNPVWf52jR2rrGY3/05G
        mrcMpbmryMBLnHK6SgdKxJyHcTUTKlk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-8yZSE9vAMhO35j7abFurRg-1; Thu, 15 Apr 2021 05:10:39 -0400
X-MC-Unique: 8yZSE9vAMhO35j7abFurRg-1
Received: by mail-ej1-f71.google.com with SMTP id bx15-20020a170906a1cfb029037415131f28so706368ejb.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 02:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GSwuZsGNywb7nFboWHr9wsySL+erig9+bW1yurVKQrI=;
        b=G30qmLU5BjYfsRWCqCI4+ukIbLauyYExago1+ZTNqnSxnbAk48BpetKQIwiEduRnLa
         6wYp8FJ3cv5+++VT91J4Uw7NKCAwhSee5yTIooaUWp8DfuZuB6FaLOx0z8Ja+96EkyNo
         oXEx+euQfTI/91CiH13Dc+F2/Vab8IEo+O3GQo+QaDSX4cr40hAsJvClmmL0RsY8PAUj
         GmbLKj/DC459tihW473hRNdz5H+0SK4wRXATjL4WRRGQWXejTr0DV6TPxgfUZpUxpknn
         x6uSY9D2zEPqZzDZBh9eNLYgme+r8Z1vGQEz6mHi7s2nZJ9GyfWowxBLwMcxxcxHc4Dq
         mQcA==
X-Gm-Message-State: AOAM530TrvtZHzIKB6/fjt9sAzsZl2PM/veZFGKKjMs0Sp3PAy/ddxJl
        X1j3ERazpjqWmSHuY64xF188qxN3axwVBMDJyT5gO4ROrtB1WsM91YZYrIravJB00kvAAzrjrkk
        L4IDKbCcn67qvvl8beZBMPsAMxhgOdpKgb1H5bb2XsKz+ZXG+5R7UfFvSVP3gDZrMwm1MwjE5Fy
        ThLtardN8Mpg==
X-Received: by 2002:aa7:c913:: with SMTP id b19mr2958444edt.170.1618477837834;
        Thu, 15 Apr 2021 02:10:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaAKdXv7mpOH/dBvCfUPqdsMnG2GFk6p5unm6d+fGqGHpeV7D2JNz7vjXBvR/oqFpNqpKzxw==
X-Received: by 2002:aa7:c913:: with SMTP id b19mr2958420edt.170.1618477837624;
        Thu, 15 Apr 2021 02:10:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q16sm1874205edv.61.2021.04.15.02.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 02:10:37 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add labels to the first 2
 temperature sensors
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Mark Pearson <markpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20210413072112.183550-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4b2690f8-c54a-d4be-60cc-336a10cd9bda@redhat.com>
Date:   Thu, 15 Apr 2021 11:10:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413072112.183550-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/13/21 9:21 AM, Hans de Goede wrote:
> On EC version 3, the first 2 temperature sensors are always CPU and GPU
> add labels for these.
> 
> This changes e.g. the "sensors" command output on a X1C8 from:
> 
> thinkpad-isa-0000
> Adapter: ISA adapter
> fan1:        2694 RPM
> temp1:        +42.0°C
> temp2:            N/A
> temp3:        +33.0°C
> temp4:         +0.0°C
> temp5:        +35.0°C
> temp6:        +42.0°C
> temp7:        +42.0°C
> temp8:            N/A
> 
> into:
> 
> thinkpad-isa-0000
> Adapter: ISA adapter
> fan1:        2694 RPM
> CPU:          +42.0°C
> GPU:              N/A
> temp3:        +33.0°C
> temp4:         +0.0°C
> temp5:        +35.0°C
> temp6:        +42.0°C
> temp7:        +42.0°C
> temp8:            N/A
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Since there have been no remarks (other then Andy's ABI question) on this and a new-merge window is approaching I've merged this into for-next now.

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 72 ++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index ec98089d98c9..dd60c9397d35 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6296,6 +6296,8 @@ struct ibm_thermal_sensors_struct {
>  };
>  
>  static enum thermal_access_mode thermal_read_mode;
> +static const struct attribute_group *thermal_attr_group;
> +static bool thermal_use_labels;
>  
>  /* idx is zero-based */
>  static int thermal_get_sensor(int idx, s32 *value)
> @@ -6478,6 +6480,28 @@ static const struct attribute_group thermal_temp_input8_group = {
>  #undef THERMAL_SENSOR_ATTR_TEMP
>  #undef THERMAL_ATTRS
>  
> +static ssize_t temp1_label_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "CPU\n");
> +}
> +static DEVICE_ATTR_RO(temp1_label);
> +
> +static ssize_t temp2_label_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "GPU\n");
> +}
> +static DEVICE_ATTR_RO(temp2_label);
> +
> +static struct attribute *temp_label_attributes[] = {
> +	&dev_attr_temp1_label.attr,
> +	&dev_attr_temp2_label.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group temp_label_attr_group = {
> +	.attrs = temp_label_attributes,
> +};
> +
>  /* --------------------------------------------------------------------- */
>  
>  static int __init thermal_init(struct ibm_init_struct *iibm)
> @@ -6533,12 +6557,14 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>  				thermal_read_mode = TPACPI_THERMAL_NONE;
>  			}
>  		} else {
> -			if (ver >= 3)
> +			if (ver >= 3) {
>  				thermal_read_mode = TPACPI_THERMAL_TPEC_8;
> -			else
> +				thermal_use_labels = true;
> +			} else {
>  				thermal_read_mode =
>  					(ta2 != 0) ?
>  					TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
> +			}
>  		}
>  	} else if (acpi_tmp7) {
>  		if (tpacpi_is_ibm() &&
> @@ -6560,44 +6586,40 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>  
>  	switch (thermal_read_mode) {
>  	case TPACPI_THERMAL_TPEC_16:
> -		res = sysfs_create_group(&tpacpi_hwmon->kobj,
> -				&thermal_temp_input16_group);
> -		if (res)
> -			return res;
> +		thermal_attr_group = &thermal_temp_input16_group;
>  		break;
>  	case TPACPI_THERMAL_TPEC_8:
>  	case TPACPI_THERMAL_ACPI_TMP07:
>  	case TPACPI_THERMAL_ACPI_UPDT:
> -		res = sysfs_create_group(&tpacpi_hwmon->kobj,
> -				&thermal_temp_input8_group);
> -		if (res)
> -			return res;
> +		thermal_attr_group = &thermal_temp_input8_group;
>  		break;
>  	case TPACPI_THERMAL_NONE:
>  	default:
>  		return 1;
>  	}
>  
> +	res = sysfs_create_group(&tpacpi_hwmon->kobj, thermal_attr_group);
> +	if (res)
> +		return res;
> +
> +	if (thermal_use_labels) {
> +		res = sysfs_create_group(&tpacpi_hwmon->kobj, &temp_label_attr_group);
> +		if (res) {
> +			sysfs_remove_group(&tpacpi_hwmon->kobj, thermal_attr_group);
> +			return res;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
>  static void thermal_exit(void)
>  {
> -	switch (thermal_read_mode) {
> -	case TPACPI_THERMAL_TPEC_16:
> -		sysfs_remove_group(&tpacpi_hwmon->kobj,
> -				   &thermal_temp_input16_group);
> -		break;
> -	case TPACPI_THERMAL_TPEC_8:
> -	case TPACPI_THERMAL_ACPI_TMP07:
> -	case TPACPI_THERMAL_ACPI_UPDT:
> -		sysfs_remove_group(&tpacpi_hwmon->kobj,
> -				   &thermal_temp_input8_group);
> -		break;
> -	case TPACPI_THERMAL_NONE:
> -	default:
> -		break;
> -	}
> +	if (thermal_attr_group)
> +		sysfs_remove_group(&tpacpi_hwmon->kobj, thermal_attr_group);
> +
> +	if (thermal_use_labels)
> +		sysfs_remove_group(&tpacpi_hwmon->kobj, &temp_label_attr_group);
>  }
>  
>  static int thermal_read(struct seq_file *m)
> 

