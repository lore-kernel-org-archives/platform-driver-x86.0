Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B54C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Jan 2021 13:18:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92C3122525
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Jan 2021 13:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbhAENSQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Jan 2021 08:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57686 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727796AbhAENSP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Jan 2021 08:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609852608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LtvpE51PJaJIshJkk/nmlb3ypMZHhp2FfVBDGEueVK0=;
        b=O0/ymIGCLFtmV8BOWfUH6ZI9QCpobDhBxB5C63hjdsD3N6143etsLFHY4mm6rOwtuo4uSS
        a9wW/aSFJeS4Fcx6TvBf4idr5ccexdymIeN6t1ZMsoTGrNkqsA6VMNKLwTVcrOFItYuDOe
        8/icGCgdYl/Yaf9dBKGfCPSYqZbLxDc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-GyTm_zMzN26N--fojYQdoA-1; Tue, 05 Jan 2021 08:16:47 -0500
X-MC-Unique: GyTm_zMzN26N--fojYQdoA-1
Received: by mail-ej1-f72.google.com with SMTP id he8so4290665ejc.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Jan 2021 05:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LtvpE51PJaJIshJkk/nmlb3ypMZHhp2FfVBDGEueVK0=;
        b=ctS0I6SHp7XSkv1GrxeDpdjdLRrqGRvacv+P9bspyY/XIRihssyeDJyyDUkCfG5mQd
         CBAsOQ9YfFplG3t1vVq1s8623KHQAh7pziU230T3lCk85oNe8dM+QqpoljowSxSzhKni
         mz8sg+Mh3XKGDclI3jBX1X7DOqjPjjAyOLSXiEv9i6BSy+Fs4p8Pj24cTY+1JYZva0gT
         y5TsOdpLnV/sidFfU27UcNLQ9nwCx+6Er8IdQR6EZgFdD8bL4a1uvslpQ34VT7fztAxi
         BIp+NcP1y/+PXv7U7JfGTtHb/j6oVpdLMYiRTX4lrCn3b28lQBfom/RvljRC0193jTkT
         l4sw==
X-Gm-Message-State: AOAM530xyEDPBvh1fweUK7rNteqcRU/StCCzmTpC9WQr57gXbsdG+CQz
        Hf6EzmjdsXqTp18kVStbgkewZPxxsia3bjNPEi3bz2gZfGRJ+mfRGvWanf7/wrFvnZJ2iPvuqe4
        ydIveTOyf+0oAmrt7Q3w/sDdiOJRtD840LA==
X-Received: by 2002:a17:906:351a:: with SMTP id r26mr67935437eja.204.1609852605859;
        Tue, 05 Jan 2021 05:16:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR8665AcodeuSJbYBLUiasXhwrRCFhXP5UBpYr9ukaXtBLdpvwkT7bCIIXAfTHAulHtc13TA==
X-Received: by 2002:a17:906:351a:: with SMTP id r26mr67935430eja.204.1609852605708;
        Tue, 05 Jan 2021 05:16:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id e1sm24929834edk.51.2021.01.05.05.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 05:16:45 -0800 (PST)
Subject: Re: [PATCH v2 1/2] ACPI: platform-profile: Introduce object pointers
 to callbacks
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210105131447.38036-1-jiaxun.yang@flygoat.com>
 <20210105131447.38036-2-jiaxun.yang@flygoat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <683c8358-fd71-cd27-8e39-19fdf3e1f71f@redhat.com>
Date:   Tue, 5 Jan 2021 14:16:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210105131447.38036-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/5/21 2:14 PM, Jiaxun Yang wrote:
> Add a object pointer to handler callbacks to avoid having
> global variables everywhere.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/acpi/platform_profile.c  | 4 ++--
>  include/linux/platform_profile.h | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
> index 91be50a32cc8..bb4d7b0fe2ac 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -64,7 +64,7 @@ static ssize_t platform_profile_show(struct device *dev,
>  		return -ENODEV;
>  	}
>  
> -	err = cur_profile->profile_get(&profile);
> +	err = cur_profile->profile_get(cur_profile, &profile);
>  	mutex_unlock(&profile_lock);
>  	if (err)
>  		return err;
> @@ -104,7 +104,7 @@ static ssize_t platform_profile_store(struct device *dev,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	err = cur_profile->profile_set(i);
> +	err = cur_profile->profile_set(cur_profile, i);
>  	mutex_unlock(&profile_lock);
>  	if (err)
>  		return err;
> diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
> index 3623d7108421..43f4583b5259 100644
> --- a/include/linux/platform_profile.h
> +++ b/include/linux/platform_profile.h
> @@ -28,8 +28,10 @@ enum platform_profile_option {
>  
>  struct platform_profile_handler {
>  	unsigned long choices[BITS_TO_LONGS(PLATFORM_PROFILE_LAST)];
> -	int (*profile_get)(enum platform_profile_option *profile);
> -	int (*profile_set)(enum platform_profile_option profile);
> +	int (*profile_get)(struct platform_profile_handler *pprof,
> +				enum platform_profile_option *profile);
> +	int (*profile_set)(struct platform_profile_handler *pprof,
> +				enum platform_profile_option profile);
>  };
>  
>  int platform_profile_register(const struct platform_profile_handler *pprof);
> 

