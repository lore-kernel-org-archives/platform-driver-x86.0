Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87B3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Oct 2021 12:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C81760F58
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Oct 2021 12:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhJ3MtI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Oct 2021 08:49:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55773 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230080AbhJ3MtI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Oct 2021 08:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635597997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5gZ+w7H78I/Fm90dhF4A5ZW38wDzmrhq5O8vH0x0oes=;
        b=K2rkDvqMu/BEs9/4XYYicehJvLNGQiZ7kOVYBONkAsSkwmpihZBRtUH+65RJPpxNiPyjIF
        n/DNBfYmT9JOFZKWZ4Zcsec3sOw1BHh863dJO8hbfdq3xjigxsEGa1qI8FIZFkAHvdcWfh
        gLH7VWpVi96NJewHp7CiKEPxZoQZT0s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-mYzImvaZMiqI-pt8LNkBWg-1; Sat, 30 Oct 2021 08:46:35 -0400
X-MC-Unique: mYzImvaZMiqI-pt8LNkBWg-1
Received: by mail-ed1-f72.google.com with SMTP id s18-20020a056402521200b003dd5902f4f3so11579782edd.23
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Oct 2021 05:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5gZ+w7H78I/Fm90dhF4A5ZW38wDzmrhq5O8vH0x0oes=;
        b=fVZKPk/WjFu68S/GVaFGC93pRhx9IyGv5LVAIRWdagFuyJH0UHp+iYpryFay8lWetw
         KO54wdQ4gpm/VYIX+gDR/zo4po1cl5lswhel4C4A3FxtpQnpLcjqSL80e3bUvIw/wa/W
         JY/cCFBFi9YHGIp0pw8lrBPc5mmFoUCa9BuWMg3ncLpdRmH01qawWlLT3Z/6noz25OCe
         /JOgGFrIPLQS46DcQEmxURjF3imab3CZMZBOKuKWY8saD65cT8YAueUrfdlS7rSnKh2L
         FnE9OM26wSHjQ3UWv1+yZ41buTHHjmsAfCDqXxVqD062pHfJlXlmDcAZU/sQ83H4T/lJ
         UO+g==
X-Gm-Message-State: AOAM530Nxq+81tgMa4tHrubp3gOES+L2wN/qaKxHq77XQSLvKe2RwEg/
        +7r+AX8LZO/XS4J3L4po3GNVXGMPEq7gw8VdP69b1IWvmRNkeF/DayxsWMHmnpgN1l4dLhSAxZc
        zCo1PXJH8P1R+IabNxu0S8KWR8uWLtwJoTQ==
X-Received: by 2002:a05:6402:28e:: with SMTP id l14mr9444183edv.162.1635597994529;
        Sat, 30 Oct 2021 05:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7mzssIqsGkGs7kkwKyNN72iORR/+zZ1Re+nY/NjytZFEuFdFnG6QDjjtG2xYAyxPA6IwWxQ==
X-Received: by 2002:a05:6402:28e:: with SMTP id l14mr9444170edv.162.1635597994378;
        Sat, 30 Oct 2021 05:46:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q17sm4157532ejp.106.2021.10.30.05.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Oct 2021 05:46:34 -0700 (PDT)
Message-ID: <26aeb4c1-85b8-98f0-de25-f069fa460e3b@redhat.com>
Date:   Sat, 30 Oct 2021 14:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: system76_acpi: Fix input device error
 handling
Content-Language: en-US
To:     Tim Crawford <tcrawford@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
References: <20211029150728.3480-1-tcrawford@system76.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211029150728.3480-1-tcrawford@system76.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Tim,

On 10/29/21 17:07, Tim Crawford wrote:
> Users on darp6 that do not have Open EC firmware have reported crashes
> on boot. Correct the error handling for the input device to fix it.
> 
> input_free_device only needs to be called if input_register_device
> failed, not in all error cases. Per devm_input_allocate_device
> documentation, managed devices do not need to be explicitly unregistered
> or freed, so do not add any other cleanup for the device.
> 
> Fixes: 0de30fc684b ("platform/x86: system76_acpi: Replace Fn+F2 function for OLED models")
> 
> Signed-off-by: Tim Crawford <tcrawford@system76.com>

Since the device is allocated with devm_input_allocate_device() you
also do not need to free it on input_register_device() error.

As long as your probe() method exits with an error then the
input_dev returned by devm_input_allocate_device() will be free-ed
on return from probe() and it will also be unregistered if it
was registered at the point of the error exit from probe().

(and like wise it will be automatically unregistered + free-ed
on remove() following a successful probe()).

So AFAICT all you need to do is drop the input_free_device()
call from the "error:" exit path.

Regards,

Hans


> ---
>  drivers/platform/x86/system76_acpi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index b3c8178420b1..73232a543540 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -715,8 +715,10 @@ static int system76_add(struct acpi_device *acpi_dev)
>  	input_set_capability(data->input, EV_KEY, KEY_SCREENLOCK);
>  
>  	err = input_register_device(data->input);
> -	if (err)
> -		goto error;
> +	if (err) {
> +		input_free_device(data->input);
> +		return err;
> +	}
>  
>  	err = system76_get_object(data, "NFAN", &data->nfan);
>  	if (err)
> @@ -739,7 +741,6 @@ static int system76_add(struct acpi_device *acpi_dev)
>  error:
>  	kfree(data->ntmp);
>  	kfree(data->nfan);
> -	input_free_device(data->input);
>  	return err;
>  }
>  
> 

