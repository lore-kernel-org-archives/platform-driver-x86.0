Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83925C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 21:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbiKJVHr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 16:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbiKJVHo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 16:07:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C6B5654F
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668114402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R4TGKeMnEv31xPKczYfKOippJw82dvGW/S5AmEWifME=;
        b=ZxSR5mrTH7AUyNTils9nOX+y8gILvj0jvYU8HxnJ5rKVLOwTnHVo/BWU63wt2YH/X63mTs
        5bZs4sQWhIBCCvkHEbBbKtW6O1laq+vsZTDf8CwF7CQxU1zAgIjoUMucoSln/lj/buJTQK
        WosH2kuqFSaiCmb4Ymyz6G90aFzq5UA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-zqrwYxxWOqOLuJI-caqXAg-1; Thu, 10 Nov 2022 16:06:41 -0500
X-MC-Unique: zqrwYxxWOqOLuJI-caqXAg-1
Received: by mail-ed1-f69.google.com with SMTP id l18-20020a056402255200b004633509768bso2280331edb.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4TGKeMnEv31xPKczYfKOippJw82dvGW/S5AmEWifME=;
        b=pQsiq4UH+BorHKd55OjB/bm4B3wmI/ynYiUc22Q+tx5+kDOfbyw2Q4aD3izOUvpOSC
         rIzP6KVfM3uhiAnGCPnldnSF1NZPtLWGcN6jjW7zbywvQdIwQGkxAblT3MkSuLTAQ1g3
         G8s21YazWn/k91y9K8jiWYYwi5xyN/bAhGfWC987jDMEekEq8PowdfXEx/GFowVrYm57
         JMfRJB/oggwosn2JSX/cLo4DxuRHlJxV+RhNHXoUQXZBUjUM85otuTiceTPs4qqGV+Lo
         uZg/bBMwcqk3PJAIfBGH9T833N+CFGYoP7WKJF7oz5+0rtTUE4VhQEqq78idl0/ImW/2
         fiKw==
X-Gm-Message-State: ACrzQf369S/da/eAxnPaqFUiuwxwqRcG1eY80FqLgsmIAemEhBaBNYNH
        9dJWDQvYzO+nvhvznCKKkU3aysKqbWFVtrO7WjfuQpHiv3G+F8jwHOoGsOGHncsbmrh/yyEBOQD
        xBZJCst5YgGAqf9cqF070SfEulNtBxUBjcQ==
X-Received: by 2002:a05:6402:298d:b0:461:9513:5081 with SMTP id eq13-20020a056402298d00b0046195135081mr3545852edb.106.1668114400132;
        Thu, 10 Nov 2022 13:06:40 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7PRff9VEziFrK4YiBV839Tq5PmH0l4Xgj8GL6gRlSdLWFUeKMLPE8kTCDj57d/NuN8NCq5tA==
X-Received: by 2002:a05:6402:298d:b0:461:9513:5081 with SMTP id eq13-20020a056402298d00b0046195135081mr3545833edb.106.1668114399968;
        Thu, 10 Nov 2022 13:06:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b8-20020a0564021f0800b004611f5efea8sm298654edb.17.2022.11.10.13.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 13:06:39 -0800 (PST)
Message-ID: <7b455034-da93-3392-223c-76e6a592ae74@redhat.com>
Date:   Thu, 10 Nov 2022 22:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 03/14] platform/x86/intel/ifs: Remove image loading
 during init
Content-Language: en-US, nl
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, ashok.raj@intel.com,
        tony.luck@intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        ravi.v.shankar@intel.com, thiago.macieira@intel.com,
        athenas.jimenez.gonzalez@intel.com, sohil.mehta@intel.com
References: <20221021203413.1220137-1-jithu.joseph@intel.com>
 <20221107225323.2733518-1-jithu.joseph@intel.com>
 <20221107225323.2733518-4-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221107225323.2733518-4-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/22 23:53, Jithu Joseph wrote:
> IFS test image is unnecessarily loaded during driver initialization.
> Drop image loading during ifs_init() and improve module load time.
> With this change, user has to load one when starting the tests.
> 
> As a consequence, make ifs_sem static as it is only used within sysfs.c
> 
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel/ifs/ifs.h   | 2 --
>  drivers/platform/x86/intel/ifs/core.c  | 6 +-----
>  drivers/platform/x86/intel/ifs/sysfs.c | 2 +-
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index 73c8e91cf144..3ff1d9aaeaa9 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -229,6 +229,4 @@ void ifs_load_firmware(struct device *dev);
>  int do_core_test(int cpu, struct device *dev);
>  const struct attribute_group **ifs_get_groups(void);
>  
> -extern struct semaphore ifs_sem;
> -
>  #endif
> diff --git a/drivers/platform/x86/intel/ifs/core.c b/drivers/platform/x86/intel/ifs/core.c
> index 27204e3d674d..5fb7f655c291 100644
> --- a/drivers/platform/x86/intel/ifs/core.c
> +++ b/drivers/platform/x86/intel/ifs/core.c
> @@ -51,12 +51,8 @@ static int __init ifs_init(void)
>  	ifs_device.misc.groups = ifs_get_groups();
>  
>  	if ((msrval & BIT(ifs_device.data.integrity_cap_bit)) &&
> -	    !misc_register(&ifs_device.misc)) {
> -		down(&ifs_sem);
> -		ifs_load_firmware(ifs_device.misc.this_device);
> -		up(&ifs_sem);
> +	    !misc_register(&ifs_device.misc))
>  		return 0;
> -	}
>  
>  	return -ENODEV;
>  }
> diff --git a/drivers/platform/x86/intel/ifs/sysfs.c b/drivers/platform/x86/intel/ifs/sysfs.c
> index 37d8380d6fa8..65dd6fea5342 100644
> --- a/drivers/platform/x86/intel/ifs/sysfs.c
> +++ b/drivers/platform/x86/intel/ifs/sysfs.c
> @@ -13,7 +13,7 @@
>   * Protects against simultaneous tests on multiple cores, or
>   * reloading can file while a test is in progress
>   */
> -DEFINE_SEMAPHORE(ifs_sem);
> +static DEFINE_SEMAPHORE(ifs_sem);
>  
>  /*
>   * The sysfs interface to check additional details of last test

