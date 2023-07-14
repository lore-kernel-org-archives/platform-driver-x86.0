Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BC6EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 09:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbjGNJe3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235481AbjGNJeQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 05:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22314493
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689327134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5WIPITGie8aWJf1Y5BacRJ/+Iugz2cGX7LUF4Tt9Ync=;
        b=GQ7VeMNkdT2Ufpsg67vBtabJ6nFEE6cTGQEZXu4bGWv/sGBucjaSFCwgS/0daPWCfnLK6C
        ja/xjlVHLGgZqTb4fOJYnTEcUl4xB0AErdyvNhBttb7RikiGlv/dyTCAW2uJ7QhkDxBg6R
        4/e/Q/GRmq5hf2QbXSpwY8r9NnpO5oE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-bD1q7PbxNRO_VHf4pkNQOQ-1; Fri, 14 Jul 2023 05:32:13 -0400
X-MC-Unique: bD1q7PbxNRO_VHf4pkNQOQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993831c639aso95786766b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 02:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327132; x=1691919132;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WIPITGie8aWJf1Y5BacRJ/+Iugz2cGX7LUF4Tt9Ync=;
        b=ihmDOaDxW+CJ+qv2Fh09iZlc3zHpxR2T5XPN+mweDlKTPLsTCaL4r1kzjlcS7E5BGs
         m2xZa6Xi2jMd4OHxLKfcp+PhLKRhUwhLc0HVd/D2qGhdWFGwxBiYKzyvAAotyQ8MhB4C
         t2wXFqVlfEUtKVSzOpJ69CUBnx1myEK4vyu9Fh2WEiWdDz+wRcjVE3/uMBtLOVZM9q9/
         El+2UkD/nKWxLK51PibMPqOvKqbu4LwQ0XG3iumwGPid43lNZVK0HvoDitQeiks6ranS
         4hoeg2CtRQutPqyoFULFvFuQG35rJLeRy5k/aam6ovC1xYGLiBiK4lzvxwkrpgqDuVoo
         L4Wg==
X-Gm-Message-State: ABy/qLYjSOlU1yO4dQQ2/hYuaR17hIzkvhboQWJFCeGSlOZePShvo94Q
        JQvpKiENX7DzLTCMWBP9yhWVybv5XdAxLqjjwcS+Y6Vc1U4twItm1XzR0TzcBlR+k2ydvzInnIE
        vInlRFBMHazUtPeUJGeSLQfEBfqePh8xVkg==
X-Received: by 2002:a17:906:c205:b0:986:d833:3cf9 with SMTP id d5-20020a170906c20500b00986d8333cf9mr3142449ejz.39.1689327131886;
        Fri, 14 Jul 2023 02:32:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFmEDt/4c1NMUesEW9NfelUBJRI8PSNiNz8H3xzkFWj2xhgl6JGOGwsNAlRdaXJubE4jvMj0Q==
X-Received: by 2002:a17:906:c205:b0:986:d833:3cf9 with SMTP id d5-20020a170906c20500b00986d8333cf9mr3142439ejz.39.1689327131611;
        Fri, 14 Jul 2023 02:32:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm5150717ejb.36.2023.07.14.02.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 02:32:11 -0700 (PDT)
Message-ID: <9c0332e3-31af-3e02-1582-cf870af39987@redhat.com>
Date:   Fri, 14 Jul 2023 11:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] platform/x86: simatic-ipc: drop PCI runtime depends
 and header
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Mark Gross <markgross@kernel.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230706161040.21152-1-henning.schild@siemens.com>
 <20230706161040.21152-2-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230706161040.21152-2-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/6/23 18:10, Henning Schild wrote:
> We do not use PCI any longer since
> commit 446f0cf9e08b ("platform/x86: simatic-ipc: drop custom P2SB bar code")'
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Thank you. I've merged this into the new platform-drivers-x86-simatic-ipc
branch where I'm collecting all the pending platform/x86: simatic-ipc
work.

Regards,

Hans


> ---
>  drivers/platform/x86/Kconfig       | 1 -
>  drivers/platform/x86/simatic-ipc.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 49c2c4cd8d00..d9ba3cb9ac50 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1076,7 +1076,6 @@ config INTEL_SCU_IPC_UTIL
>  
>  config SIEMENS_SIMATIC_IPC
>  	tristate "Siemens Simatic IPC Class driver"
> -	depends on PCI
>  	help
>  	  This Simatic IPC class driver is the central of several drivers. It
>  	  is mainly used for system identification, after which drivers in other
> diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
> index c773995b230d..2523f6dc9db9 100644
> --- a/drivers/platform/x86/simatic-ipc.c
> +++ b/drivers/platform/x86/simatic-ipc.c
> @@ -15,7 +15,6 @@
>  #include <linux/dmi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/pci.h>
>  #include <linux/platform_data/x86/simatic-ipc.h>
>  #include <linux/platform_device.h>
>  

