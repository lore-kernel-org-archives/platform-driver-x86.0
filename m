Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03286C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 09:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE43F6056B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 09:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbhKAJzo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 05:55:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235039AbhKAJxl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 05:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635760267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RVmTahPp05ug2rZV/FDS9rid3xaGB6x17QO5vyS0nII=;
        b=EgUm7Ad4hKBF1eMvGcFR1fUgPrMpsMovQlaVlMVPs31dsOVbOe1iC5binw/mZKjgzEMczI
        LCebxS+M3fzzrjMS1XQWGQkCKa41A6/sWCFq+5o0YiRg8OQGhv9+WdyXA+RYKk5E5hot7E
        FfsNHZXq6LqJE5NVRFSJwJQkqng17h0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-2nmaCvBcN3u8pqd0WvfZBQ-1; Mon, 01 Nov 2021 05:51:06 -0400
X-MC-Unique: 2nmaCvBcN3u8pqd0WvfZBQ-1
Received: by mail-ed1-f70.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso14976457edj.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Nov 2021 02:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RVmTahPp05ug2rZV/FDS9rid3xaGB6x17QO5vyS0nII=;
        b=67jMwTJL++URxon0q5/FQzM2FfbbpKAglASR40JwfPh2Ha+Js6DpfPTzWXes/9rOEo
         rrwrUgo7RXxRvPwcloPgLJjGMk5egSWz5/DtNxrYiHl/q7RDSMm2uj+OY9GhWRRHFVlL
         E07weUL06Xde7evkWtvujIGq3LByBYc1qI/VJkCWrCSQx776P23aDA81jZsQyXICmr/K
         jvuV8sk4ScVS/34eXjSmq2hY0QtdheZB+0NQSd0oZuE4n63FU8c7LuTNzq9u3HbkVN/i
         oX1Ac3GoymadFOShDyDfrgVN7AGKTOwNey0kVrvrsrb3M0zd+i+VoleWgE5H6oJLdqRT
         bOqw==
X-Gm-Message-State: AOAM5307mBSqpwp04FSpkqX/JehedrCb4X/WoXoMHPlVl2o0phccutDb
        90dVM0KsmeVBnLLVyGq53etAUuBXiA3oHjtgSaTQqaitCNiLLySseIX4qMUu5NePLUqeSzcCVnA
        j6aAVlzC8L86hiF/dCAqrbpMxyi6yqexgKw==
X-Received: by 2002:a17:906:a896:: with SMTP id ha22mr13873569ejb.439.1635760265538;
        Mon, 01 Nov 2021 02:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztTnQHGkL0HOnaZ10lApuJ48JJ1vkr9CkU3eOMwbbUYq0fnGxqJGNwsqXZVbtGVoMfQR/wxw==
X-Received: by 2002:a17:906:a896:: with SMTP id ha22mr13873542ejb.439.1635760265330;
        Mon, 01 Nov 2021 02:51:05 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id h7sm8500814edt.37.2021.11.01.02.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:51:04 -0700 (PDT)
Message-ID: <26f900e5-39f5-62c6-6acf-1e058a21cd3c@redhat.com>
Date:   Mon, 1 Nov 2021 10:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] platform/x86: system76_acpi: Fix input device error
 handling
Content-Language: en-US
To:     Tim Crawford <tcrawford@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
References: <20211030154213.2515-1-tcrawford@system76.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211030154213.2515-1-tcrawford@system76.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/30/21 17:42, Tim Crawford wrote:
> Users on darp6 that do not have Open EC firmware have reported crashes
> on boot. Correct the error handling for the input device to fix it.
> 
> Managed devices do not need to be explicitly unregistered or freed, as
> this is handled by devres. Drop the call to input_free_device.
> 
> Fixes: 0de30fc684b ("platform/x86: system76_acpi: Replace Fn+F2 function for OLED models")
> 
> Signed-off-by: Tim Crawford <tcrawford@system76.com>

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
>  drivers/platform/x86/system76_acpi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index b3c8178420b1..8b292ee95a14 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -739,7 +739,6 @@ static int system76_add(struct acpi_device *acpi_dev)
>  error:
>  	kfree(data->ntmp);
>  	kfree(data->nfan);
> -	input_free_device(data->input);
>  	return err;
>  }
>  
> 

