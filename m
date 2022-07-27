Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1EAC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 20:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiG0UiM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 16:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiG0UiL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 16:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E97F140C3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658954289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Ztueye0w3RRPZufBaPt0YdeemJehnLS6UAf8aCcbgE=;
        b=JfdWGG/SYK4DHhvVJ/i9wNUmAFyrX+28rNekWXc4QF/3A1Q+5SjOmXQWg+E0GX1NqjHop0
        +wm0xvur8uJ41IDKa/WCmw14Nh8YMT4tpRW/2Vq2OfOTHz446qOYrbjE1J4FJYT0TW6fta
        FCWaIc0xam/yuVZ6Sprb1f1vuJTPtEI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-Kc5pa-SfMdemBYe5RTVGYg-1; Wed, 27 Jul 2022 16:38:07 -0400
X-MC-Unique: Kc5pa-SfMdemBYe5RTVGYg-1
Received: by mail-ed1-f70.google.com with SMTP id w15-20020a056402268f00b0043be4012ea9so7118634edd.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Ztueye0w3RRPZufBaPt0YdeemJehnLS6UAf8aCcbgE=;
        b=GkiaWdTSnnCyylfRrthJBjI+wAmy6vvP0K3sJIpbz5Ruzh8DLgWgp3YSVQ5Ze3VIeu
         +HeCYL7tsmo2HcWjcieVRXMKU13fuj6uRh3eAYfuczX2RWWXQ+UoLGxnncSTFyCjqqvQ
         Twq14Nu0j08B66nEzy7XUfpK92IPrkKZHFXiMRFFv1xkSKrF+dFSIwIRf2QCdwhCTkSV
         +Q3ljcCiKvhFlYsM4gD8+/TD0KSMfLLpIhNbeLXztXP3vKzCGhOlyxxjbP5wuG01n3zP
         b0mrtVESU5BWxUs/fGJ/deWY1qnWET1hlC/XRAPYQHX7R3H3FnWdGYOi16rPiu3tiU2Y
         qXHg==
X-Gm-Message-State: AJIora8T/TuJu9f012pfEAtiC6t3HccARwhwmZR8yyG+sn7fXQHs+aFP
        kO7W3tlpy2NlZkJ6h1WZhmJZNkXr3RfhbRZ1tPArGChraYCe6i4+gAAvONkNSIQKkyC7668jyLc
        2E5e0/hXqknLSw6IbRkoGXjHU0bW3kH+dUw==
X-Received: by 2002:a05:6402:42cb:b0:43b:e8eb:cbc1 with SMTP id i11-20020a05640242cb00b0043be8ebcbc1mr19597062edc.414.1658954286155;
        Wed, 27 Jul 2022 13:38:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWUQO9D3/pOqV+1XB5Ks9YZX15fANYQfZfXY8kSC3DqcwfSVIkUUwIJYEaCLb6KuhU0PKofA==
X-Received: by 2002:a05:6402:42cb:b0:43b:e8eb:cbc1 with SMTP id i11-20020a05640242cb00b0043be8ebcbc1mr19597043edc.414.1658954285714;
        Wed, 27 Jul 2022 13:38:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b21-20020a170906151500b007030c97ae62sm7976744ejd.191.2022.07.27.13.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:38:05 -0700 (PDT)
Message-ID: <85f3899f-bc7d-d851-aaf2-79bad9adc8fb@redhat.com>
Date:   Wed, 27 Jul 2022 22:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/15] ACPI: platform_profile: Add support for
 notification chains
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Allow other drivers to react to determine current active profile
> and react to platform profile changes.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

This new helper is not necessary, as mentioned in my review of 8/15,
its single caller, the code there can just use:

	current_profile = READ_ONCE(dev->current_profile);

Please drop this patch for the next version of the series.

Regards,

Hans


> ---
>  drivers/acpi/platform_profile.c  | 26 ++++++++++++++++++++++++++
>  include/linux/platform_profile.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
> index d418462ab791..7e12a1f30f06 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -49,6 +49,32 @@ static ssize_t platform_profile_choices_show(struct device *dev,
>  	return len;
>  }
>  
> +int platform_profile_get(enum platform_profile_option *profile)
> +{
> +	int err;
> +
> +	err = mutex_lock_interruptible(&profile_lock);
> +	if (err)
> +		return err;
> +
> +	if (!cur_profile) {
> +		mutex_unlock(&profile_lock);
> +		return -ENODEV;
> +	}
> +
> +	err = cur_profile->profile_get(cur_profile, profile);
> +	mutex_unlock(&profile_lock);
> +	if (err)
> +		return err;
> +
> +	/* Check that profile is valid index */
> +	if (WARN_ON((*profile < 0) || (*profile >= ARRAY_SIZE(profile_names))))
> +		return -EIO;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(platform_profile_get);
> +
>  static ssize_t platform_profile_show(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf)
> diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
> index e5cbb6841f3a..2395be670dfd 100644
> --- a/include/linux/platform_profile.h
> +++ b/include/linux/platform_profile.h
> @@ -37,5 +37,6 @@ struct platform_profile_handler {
>  int platform_profile_register(struct platform_profile_handler *pprof);
>  int platform_profile_remove(void);
>  void platform_profile_notify(void);
> +int platform_profile_get(enum platform_profile_option *profile);
>  
>  #endif  /*_PLATFORM_PROFILE_H_*/

