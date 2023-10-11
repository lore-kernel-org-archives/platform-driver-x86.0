Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1312CD6E55
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 09:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbjJKJZy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 05:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjJKJZn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 05:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015F6A7
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697016299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uPzSn9vWUnaVXWODF2M9d9VKpxpX+zUA3E9w940+qqs=;
        b=Ut3VJ9S732US2xhbM63ca0knNiGuyJTyR1HO8CnF4RjbqWyy84AoFoS9SKTkHqVjmUUJ2F
        SGOEcalKNKmLA6PkQ+tKrglbmF1VAQWZhHJGpfsLb7R0YrYKOvQPESTiKUDmfRBBd32ES9
        /SQ4dihFKEFGFv14od0Er2PkQ8xWCJo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-c5omvKvSPoOml5I6h7R_xw-1; Wed, 11 Oct 2023 05:24:55 -0400
X-MC-Unique: c5omvKvSPoOml5I6h7R_xw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9adad8f306fso495809866b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697016294; x=1697621094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPzSn9vWUnaVXWODF2M9d9VKpxpX+zUA3E9w940+qqs=;
        b=QsMqn5ZqGTzKAmnfyBLcqaaem6lff5CBIKFnwIiiPf2ujfJhPKX/Z/NhwBjZuZVW1L
         /YBLQKzwo8wE9xgfNdj+S8Z7TKADWncqvbjcpoHwI/Nw5wc+8N55VcYD0SglbXJ33jD9
         xuY21rWKHk0NvkRsgHPJbsuSWM4CnozvXydi2g4NZJ1mauxuRHKqbgecbECF4MTCEx1g
         jdn7fqCRgfU4elEutgtks0q1g9b/B1wEH4ZUBp26A3rXjlmvij6ziMFd0Bf0Brda4Njf
         huqeQLHt1ocz74V44ZDTbxRYs184C4lEMmVsd+3ITL5+miwwM7hNPlo6MZnGlwJU6edf
         g4Hg==
X-Gm-Message-State: AOJu0YwGbMsQR7D8g3YHVslKunHcxuEcw9eadt9Yan123fFxsRiKvb26
        I9JluAmaU8cZhzgZSvoiofEWiwpRId28GFW6aL5atWkwZCzCMJ/u2v29sfz/KRUAfoFwBFm9mS3
        tMNHmyD5XZZuW0bVXLwErjlCTPLQzbfQeAA==
X-Received: by 2002:a17:906:3ca1:b0:9b7:37de:6009 with SMTP id b1-20020a1709063ca100b009b737de6009mr16799533ejh.3.1697016294356;
        Wed, 11 Oct 2023 02:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHEzAlF5ztKmPbqb8Vn9ObdjP3Pt9FndCDWt0Qvblb1kl6soDHXxru4h911Wj1TWMzGAdqkA==
X-Received: by 2002:a17:906:3ca1:b0:9b7:37de:6009 with SMTP id b1-20020a1709063ca100b009b737de6009mr16799514ejh.3.1697016293958;
        Wed, 11 Oct 2023 02:24:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u16-20020a1709064ad000b009ae54585aebsm9387446ejt.89.2023.10.11.02.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:24:53 -0700 (PDT)
Message-ID: <4301d3af-4cb6-dd2e-4fbd-8c8ee96b7400@redhat.com>
Date:   Wed, 11 Oct 2023 11:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/6] platform/x86: wmi: Update MAINTAINERS entry
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231007233933.72121-1-W_Armin@gmx.de>
 <20231007233933.72121-2-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231007233933.72121-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/8/23 01:39, Armin Wolf wrote:
> Since 2011, the WMI subsystem is marked as orphaned,
> which means that a important part of platform support
> for modern notebooks and even desktops is receiving
> not enough maintenance.
> So i decided to take over the maintenance of the WMI
> subsystem.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..ba309dea6e4e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -378,8 +378,9 @@ F:	drivers/acpi/viot.c
>  F:	include/linux/acpi_viot.h
> 
>  ACPI WMI DRIVER
> +M:	Armin Wolf <W_Armin@gmx.de>
>  L:	platform-driver-x86@vger.kernel.org
> -S:	Orphan
> +S:	Maintained
>  F:	Documentation/driver-api/wmi.rst
>  F:	Documentation/wmi/
>  F:	drivers/platform/x86/wmi.c
> --
> 2.39.2
> 

