Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0A1C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 09:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 937EC61163
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 09:15:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhJVJSQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 05:18:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26160 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232575AbhJVJSP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 05:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634894158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UQGDJah/KreCof6wR/rgfBuc6vkWJYHgPEBv9eX/JPc=;
        b=d1kwAftVlLQUzoNasjzT4JCiDV7LTR2SpM2RPIxBpSu+jMXYEjVUR6n1kkRwL3qiDOYFMW
        RC0iRW5vyfDYcjlIkr0y3lfwF242ulfpo5ASvqDatwhOIyFtFUO41loeAVTooYAU/InMNW
        bGi47YA8iS+i27R3UhJAYwzS/CANcwo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-p6l9VtpnObuuAoHdA9pZQQ-1; Fri, 22 Oct 2021 05:15:56 -0400
X-MC-Unique: p6l9VtpnObuuAoHdA9pZQQ-1
Received: by mail-ed1-f72.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso3104370edv.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Oct 2021 02:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UQGDJah/KreCof6wR/rgfBuc6vkWJYHgPEBv9eX/JPc=;
        b=tAhrSOrcaonrowfIbMoFrETT2OB7Wt0zqRraoPRXAl77lJWc51lzW2KV2seD/GnBeG
         WozvaJ7990ySF40Pwn/lFabh0RoW44/mXEdBE+3MkCZB09Fh5apE81UtinIj8z5SLWPi
         J7HRPBof8NJeYhfrk6Vf3tWJ6lBlLX61F6TmaE3Wx0N0dYP4V8gYzKrA4hPra8eAoSeH
         sIzoUVUt9EkQZs6NFAbFpr/lK8ZBslhiZuFDea9cAvgpPHobAq9FsxIVDFvKU2mazW84
         hAkGvh4J0byoxL6RKR1QFfDiSatwDskI/lccgia9zsxHe9nQedUZhQNjn1PYon8IApsh
         hfSA==
X-Gm-Message-State: AOAM533kSxBkzrrWp07BURNla55t1Z3H+IaciLaxSwQvtjxEu4nmNHBf
        oWxCrH9XwyLfqEtaVJNa7f04f4ZPbjiaWxngR+RZu2WZN//rHvAahjnmN/no194S3+aNzsViLYY
        ve1j8UySUoI5yQm4Lt1D1fD0ZtTEpLBktNQ==
X-Received: by 2002:a17:906:3842:: with SMTP id w2mr14414243ejc.28.1634894154920;
        Fri, 22 Oct 2021 02:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfQltY1u0ItXDgZL8i6ARy0Vt6IVTLGAMHyDBta8ooLrUu+EKZ/xwgXevj9QBKoe2HYJE57A==
X-Received: by 2002:a17:906:3842:: with SMTP id w2mr14414225ejc.28.1634894154746;
        Fri, 22 Oct 2021 02:15:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id mp5sm1775558ejc.68.2021.10.22.02.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 02:14:57 -0700 (PDT)
Message-ID: <39927c6d-8c55-5667-4aa0-31d746df90cc@redhat.com>
Date:   Fri, 22 Oct 2021 11:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: lg-laptop: replace snprintf in show
 functions with sysfs_emit
Content-Language: en-US
To:     cgel.zte@gmail.com, matan@svgalib.org
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ye Guojin <ye.guojin@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20211022090722.1065457-1-ye.guojin@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211022090722.1065457-1-ye.guojin@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/22/21 11:07, cgel.zte@gmail.com wrote:
> From: Ye Guojin <ye.guojin@zte.com.cn>
> 
> coccicheck complains about the use of snprintf() in sysfs show
> functions:
> WARNING  use scnprintf or sprintf
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>

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
>  drivers/platform/x86/lg-laptop.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index 7e9351c36389..ae9293024c77 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -330,7 +330,7 @@ static ssize_t fan_mode_show(struct device *dev,
>  	status = r->integer.value & 0x01;
>  	kfree(r);
>  
> -	return snprintf(buffer, PAGE_SIZE, "%d\n", status);
> +	return sysfs_emit(buffer, "%d\n", status);
>  }
>  
>  static ssize_t usb_charge_store(struct device *dev,
> @@ -372,7 +372,7 @@ static ssize_t usb_charge_show(struct device *dev,
>  
>  	kfree(r);
>  
> -	return snprintf(buffer, PAGE_SIZE, "%d\n", status);
> +	return sysfs_emit(buffer, "%d\n", status);
>  }
>  
>  static ssize_t reader_mode_store(struct device *dev,
> @@ -414,7 +414,7 @@ static ssize_t reader_mode_show(struct device *dev,
>  
>  	kfree(r);
>  
> -	return snprintf(buffer, PAGE_SIZE, "%d\n", status);
> +	return sysfs_emit(buffer, "%d\n", status);
>  }
>  
>  static ssize_t fn_lock_store(struct device *dev,
> @@ -455,7 +455,7 @@ static ssize_t fn_lock_show(struct device *dev,
>  	status = !!r->buffer.pointer[0];
>  	kfree(r);
>  
> -	return snprintf(buffer, PAGE_SIZE, "%d\n", status);
> +	return sysfs_emit(buffer, "%d\n", status);
>  }
>  
>  static ssize_t battery_care_limit_store(struct device *dev,
> @@ -520,7 +520,7 @@ static ssize_t battery_care_limit_show(struct device *dev,
>  	if (status != 80 && status != 100)
>  		status = 0;
>  
> -	return snprintf(buffer, PAGE_SIZE, "%d\n", status);
> +	return sysfs_emit(buffer, "%d\n", status);
>  }
>  
>  static DEVICE_ATTR_RW(fan_mode);
> 

