Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7955CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 16:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbiLHQJG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 11:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiLHQJF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 11:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18302E012
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670515679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nlsYGkc0CMR12o/ECV5C5ZdADL5vOxF17xBChMXabTs=;
        b=isf7RcRIySrLmlSGeBzlh8aUP1SYFUf4cR9c3REitPRtDe+NUM4ZH4N5qp+7autXRFdqZY
        FfsmtGGs8HLg1R6NqTVVVUIG3KR0gKSYWAagu2R5WqXKzrO+MTchz0oChDfg9ICPb7bX2r
        uggWOeRRFFLN6AFJAW+MBmiu6sYhBHs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-csG2zLHmOtyx_KECyCwELw-1; Thu, 08 Dec 2022 11:07:58 -0500
X-MC-Unique: csG2zLHmOtyx_KECyCwELw-1
Received: by mail-ed1-f71.google.com with SMTP id y20-20020a056402271400b0046c9a6ec30fso1173906edd.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 08:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlsYGkc0CMR12o/ECV5C5ZdADL5vOxF17xBChMXabTs=;
        b=CqXgf14dMpGKC6rwUQC4HACdo5IXabzguDAW0hYxSWxY47MxkGGwjWc26ET+bn+Tm1
         p5nuiF9eVSi0k4vvyZ3U9yNgXLqjFx1xvUF/hyrdTA5bddapkHZDdDLXDLfioQgrNhnF
         PxmwKAKH6SqiIeGbica7EUSE5Haq+alZXWa4BaTifGF3gYs/FvNYQZaBUkZAqyZPgPmA
         4ZMy/1A4hWycmAawy5If7IcY8+zwmkFyIHN95+wC32B66YmN4jtyRoS6V7m6Hwqum35Y
         f99EyoL2AwDsMZR6MmGZlxyad8JJgCnH+T4zCfV7F1ycBgs3LO4hNCkT3am2pVy2slq8
         Pkew==
X-Gm-Message-State: ANoB5pkBNni7pma1yZZ37NBbFHBtcmqLaljmq2QCgcZ5yNIT70MUVg/D
        HGkH2bbIb8scSQlxdOZYZtynThb2ezNX0R/8g8kL6WeogsNZJ+tmkatIKXMXuVbPKvz043wr4BL
        3FPWbmqoOuNZebhbfvrLUzsIc+AvR0veTOA==
X-Received: by 2002:a17:907:1256:b0:7c1:1adc:46fd with SMTP id wc22-20020a170907125600b007c11adc46fdmr1927680ejb.34.1670515676489;
        Thu, 08 Dec 2022 08:07:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dV3rX6uhyn/a444iQ3gOPin7ZA0gZYGEOBZrd22MyTmlGgrDMZgU4oMr2x8sG+lT/2xxINg==
X-Received: by 2002:a17:907:1256:b0:7c1:1adc:46fd with SMTP id wc22-20020a170907125600b007c11adc46fdmr1927666ejb.34.1670515676258;
        Thu, 08 Dec 2022 08:07:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906329300b007af75e6b6fesm9975218ejw.147.2022.12.08.08.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 08:07:55 -0800 (PST)
Message-ID: <034a882b-e6fc-b20a-25fb-8aaa02f1b1bc@redhat.com>
Date:   Thu, 8 Dec 2022 17:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_platform/x86=3a_dell=3a_use_sysfs=5femi?=
 =?UTF-8?B?dCgpIHRvIGluc3RlYWQgb2bCoHNjbnByaW50Zigp?=
Content-Language: en-US, nl
To:     ye.xingchen@zte.com.cn
Cc:     markgross@kernel.org, pobrn@protonmail.com,
        dell.client.kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <202212021721543696124@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202212021721543696124@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/2/22 10:21, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

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
>  drivers/platform/x86/dell/alienware-wmi.c | 41 +++++++++--------------
>  1 file changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index a34e07ef2c79..a9477e5432e4 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -398,10 +398,10 @@ static ssize_t show_control_state(struct device *dev,
>  				  struct device_attribute *attr, char *buf)
>  {
>  	if (lighting_control_state == LEGACY_BOOTING)
> -		return scnprintf(buf, PAGE_SIZE, "[booting] running suspend\n");
> +		return sysfs_emit(buf, "[booting] running suspend\n");
>  	else if (lighting_control_state == LEGACY_SUSPEND)
> -		return scnprintf(buf, PAGE_SIZE, "booting running [suspend]\n");
> -	return scnprintf(buf, PAGE_SIZE, "booting [running] suspend\n");
> +		return sysfs_emit(buf, "booting running [suspend]\n");
> +	return sysfs_emit(buf, "booting [running] suspend\n");
>  }
> 
>  static ssize_t store_control_state(struct device *dev,
> @@ -547,14 +547,12 @@ static ssize_t show_hdmi_cable(struct device *dev,
>  				   (u32 *) &out_data);
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 0)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "[unconnected] connected unknown\n");
> +			return sysfs_emit(buf, "[unconnected] connected unknown\n");
>  		else if (out_data == 1)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "unconnected [connected] unknown\n");
> +			return sysfs_emit(buf, "unconnected [connected] unknown\n");
>  	}
>  	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", status);
> -	return scnprintf(buf, PAGE_SIZE, "unconnected connected [unknown]\n");
> +	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>  }
> 
>  static ssize_t show_hdmi_source(struct device *dev,
> @@ -571,14 +569,12 @@ static ssize_t show_hdmi_source(struct device *dev,
> 
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 1)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "[input] gpu unknown\n");
> +			return sysfs_emit(buf, "[input] gpu unknown\n");
>  		else if (out_data == 2)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "input [gpu] unknown\n");
> +			return sysfs_emit(buf, "input [gpu] unknown\n");
>  	}
>  	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
> -	return scnprintf(buf, PAGE_SIZE, "input gpu [unknown]\n");
> +	return sysfs_emit(buf, "input gpu [unknown]\n");
>  }
> 
>  static ssize_t toggle_hdmi_source(struct device *dev,
> @@ -652,14 +648,12 @@ static ssize_t show_amplifier_status(struct device *dev,
>  				   (u32 *) &out_data);
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 0)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "[unconnected] connected unknown\n");
> +			return sysfs_emit(buf, "[unconnected] connected unknown\n");
>  		else if (out_data == 1)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "unconnected [connected] unknown\n");
> +			return sysfs_emit(buf, "unconnected [connected] unknown\n");
>  	}
>  	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", status);
> -	return scnprintf(buf, PAGE_SIZE, "unconnected connected [unknown]\n");
> +	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>  }
> 
>  static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
> @@ -706,17 +700,14 @@ static ssize_t show_deepsleep_status(struct device *dev,
>  					(u32 *) &out_data);
>  	if (ACPI_SUCCESS(status)) {
>  		if (out_data == 0)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "[disabled] s5 s5_s4\n");
> +			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
>  		else if (out_data == 1)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "disabled [s5] s5_s4\n");
> +			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
>  		else if (out_data == 2)
> -			return scnprintf(buf, PAGE_SIZE,
> -					 "disabled s5 [s5_s4]\n");
> +			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
>  	}
>  	pr_err("alienware-wmi: unknown deep sleep status: %d\n", status);
> -	return scnprintf(buf, PAGE_SIZE, "disabled s5 s5_s4 [unknown]\n");
> +	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
>  }
> 
>  static ssize_t toggle_deepsleep(struct device *dev,

