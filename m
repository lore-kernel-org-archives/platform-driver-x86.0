Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40107C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 15:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349654AbhKYPlV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 10:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47296 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355787AbhKYPjV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 10:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637854570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eX6dSHlu3Ns8F5BZbs69kb/zi1atkpX8NZ3CQ8zoWh4=;
        b=VHzPw/cDCymXOWWcvEWQUCuJmnaTTzZTU6JMPbRXj9Vd2pwJFocA2zZWwUvjPswap5ncfO
        GIGrz1VUnn+ARudMEZSy0EoDIJrT8pkigYr4qDPWSQYblVZVQMLUAAIEaRvn/2dP47+dq/
        EIzSqjYJH9GKNLZOxxuFo6SUFJi4W9c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-1AIBT5SfNmaJbZq1hvkpzg-1; Thu, 25 Nov 2021 10:36:08 -0500
X-MC-Unique: 1AIBT5SfNmaJbZq1hvkpzg-1
Received: by mail-ed1-f71.google.com with SMTP id w18-20020a056402071200b003e61cbafdb4so5785668edx.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 07:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eX6dSHlu3Ns8F5BZbs69kb/zi1atkpX8NZ3CQ8zoWh4=;
        b=4yRa+AsJl3vi8eAU+vzJRBD8m+0ukyV4Aw+TjDRjz+iajilv7EMbQnTAFwbdZrt5uc
         8IlBhomOrZS49dRBjfOFUoFc2MT40xxTVcDz7Zq6/hZjuP+J7YCdN2TM+D8JhCqyfxob
         ffABLhRm7u4TPOHK/4ZYU40qnLGCOPm8J3WOLQHSpIMLlBf+SRdpL+s4XKkglL7bxX2G
         Vtyh/d/KQ71XelZVLLoeuvFmUnvrvoDOIfFogRYgprNj3xQmxEXOhUcQ6lIsx3s/ql4R
         JltS4rYTXW0Ebt0WBubEbP1YUxNU39ztglzPJPyNS99LKlna6xmIEY8ekVjcH49ia5YV
         5pjg==
X-Gm-Message-State: AOAM533NMqvGRGDgmYrBp0fR27fF4EvI2qnfUbWFU/B9nFr/+elGsDNh
        L2ZjjhQbRcYvHxBEO3N55RvOJXV8FVvydaZ6hmuEuBnz7vQWCVT+x6lm8gElOsmM9a5J8KDiXYV
        KVZuGz/9iKMSGP56UJJVFaJ+ByGcwXbUiNQ==
X-Received: by 2002:a05:6402:50cf:: with SMTP id h15mr39308770edb.90.1637854567542;
        Thu, 25 Nov 2021 07:36:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIcaSNOlMTT2I/ucmwCR5UkZ3asJaJo5x1mzxdh8r8ZE5v5cBBKVNJUksjqk0dqJgW3j+S9g==
X-Received: by 2002:a05:6402:50cf:: with SMTP id h15mr39308741edb.90.1637854567402;
        Thu, 25 Nov 2021 07:36:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id mc3sm1714623ejb.24.2021.11.25.07.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 07:36:07 -0800 (PST)
Message-ID: <dd605051-c32d-ef18-5af1-fd1012597e7b@redhat.com>
Date:   Thu, 25 Nov 2021 16:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH -next] asus-wmi: remove unneeded semicolon
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>, corentin.chary@gmail.com
Cc:     markgross@kernel.org, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1637719332-45224-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1637719332-45224-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/21 03:02, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/platform/x86/asus-wmi.c:2386:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

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
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ab0c087..6fa4b0b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2383,7 +2383,7 @@ static ssize_t fan_curve_enable_store(struct device *dev,
>  		break;
>  	default:
>  		return -EINVAL;
> -	};
> +	}
>  
>  	if (data->enabled) {
>  		err = fan_curve_write(asus, data);
> 

