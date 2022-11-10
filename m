Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65A7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 21:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiKJVUV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 16:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiKJVUT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 16:20:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A64CF6
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668115156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RaDM9AF34T4yePmDmSyJsFxr2n24Jtip0IViwoic0/w=;
        b=FlMWecpOqfZO2lABX/Lt4QVKK/SIRWw+JeEuZewepJlxzfegAwBuZRQK7nwnWdp8lv750I
        ErQpzkF02BNcb0zx6jvD8dAdPgcIXJW/KDQxgG6JhtTOnOy/Oe6uBnnYtVcTaQYuhLMmpR
        X/PKIHXci8GZhkI0+8c8LrUt4awz3r8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-dFxe8dTeOBi7XLsxeE5X1A-1; Thu, 10 Nov 2022 16:19:15 -0500
X-MC-Unique: dFxe8dTeOBi7XLsxeE5X1A-1
Received: by mail-ed1-f70.google.com with SMTP id l18-20020a056402255200b004633509768bso2296298edb.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaDM9AF34T4yePmDmSyJsFxr2n24Jtip0IViwoic0/w=;
        b=xRfnEU07q02p59+j7pJ+TOs2TVzrPq581X9nZuzeGjyRH6h+N3CFpgtKYzRmnLBS8j
         tEaVbOANpX1jwSnGqnyP3jdmHI+R/4ETSpXF498wTGLA7eLNvSkjbGKQYKXWwO/3wt88
         1iRJm6su9humx9qWEYBNH62d7LrLSpj44uh+KAJ01eAkBdoWCwP0UcSHBXpyH7jcjvQr
         DOUViFfZFpep73vV17PKfxqS0EZ6MpudFq9/jVjvAKD9xiiV1ZGTYcZHS8VbjQ3cQppf
         jNFOTEOtTKo1wQrznz2KlVvfCWUF1SHyM9WFlQyfhwmTJtfq24HJcJoLNUX4WU410kSd
         ZGUg==
X-Gm-Message-State: ACrzQf0l/mgldorhjEawptGZE/DEnN9UH3zTTba3NmzuOj3VwhU/5eYM
        OA/EpvzDVHCVqCNAwvqGEVSNyr2pzlcxaOVMhhqJp5vCTaFnKODHBirPUHBbOvOn3INunQ3WIun
        /k4oED/e+2ifV1/NHllHPjWJH4TWklU8kFw==
X-Received: by 2002:a05:6402:545:b0:460:8384:e263 with SMTP id i5-20020a056402054500b004608384e263mr3472064edx.230.1668115154518;
        Thu, 10 Nov 2022 13:19:14 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5TrfOU8xnS5qiH0IQ6ZsFuGN1gd1cTF742kGeaSBVauzyQN5NZpKi56ioRPBX0xA2mgumlTg==
X-Received: by 2002:a05:6402:545:b0:460:8384:e263 with SMTP id i5-20020a056402054500b004608384e263mr3472056edx.230.1668115154339;
        Thu, 10 Nov 2022 13:19:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id rl24-20020a170907217800b00770880dfc4fsm158693ejb.29.2022.11.10.13.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 13:19:13 -0800 (PST)
Message-ID: <2446cc07-dc2b-d010-a8b4-93d867e8a6f3@redhat.com>
Date:   Thu, 10 Nov 2022 22:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 11/14] platform/x86/intel/ifs: Remove reload sysfs
 entry
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
 <20221107225323.2733518-12-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221107225323.2733518-12-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/22 23:53, Jithu Joseph wrote:
> Reload sysfs entry will be replaced by current_batch, drop it.
> 
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/ifs/sysfs.c | 29 --------------------------
>  1 file changed, 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/sysfs.c b/drivers/platform/x86/intel/ifs/sysfs.c
> index 65dd6fea5342..e077910c5d28 100644
> --- a/drivers/platform/x86/intel/ifs/sysfs.c
> +++ b/drivers/platform/x86/intel/ifs/sysfs.c
> @@ -87,34 +87,6 @@ static ssize_t run_test_store(struct device *dev,
>  
>  static DEVICE_ATTR_WO(run_test);
>  
> -/*
> - * Reload the IFS image. When user wants to install new IFS image
> - */
> -static ssize_t reload_store(struct device *dev,
> -			    struct device_attribute *attr,
> -			    const char *buf, size_t count)
> -{
> -	struct ifs_data *ifsd = ifs_get_data(dev);
> -	bool res;
> -
> -
> -	if (kstrtobool(buf, &res))
> -		return -EINVAL;
> -	if (!res)
> -		return count;
> -
> -	if (down_interruptible(&ifs_sem))
> -		return -EINTR;
> -
> -	ifs_load_firmware(dev);
> -
> -	up(&ifs_sem);
> -
> -	return ifsd->loaded ? count : -ENODEV;
> -}
> -
> -static DEVICE_ATTR_WO(reload);
> -
>  /*
>   * Display currently loaded IFS image version.
>   */
> @@ -136,7 +108,6 @@ static struct attribute *plat_ifs_attrs[] = {
>  	&dev_attr_details.attr,
>  	&dev_attr_status.attr,
>  	&dev_attr_run_test.attr,
> -	&dev_attr_reload.attr,
>  	&dev_attr_image_version.attr,
>  	NULL
>  };

