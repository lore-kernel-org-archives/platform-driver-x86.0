Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D90C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 12:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiISM4c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiISM4b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 08:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C0E2DF1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663592189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KBjmtOJBVrvCkDxZNegQRrlno9ip0hHfVuVwFPIj78k=;
        b=L6Z5PH5nnIRX2esfLBpfBEqGz1t9CmdpwMfkA82Lu/JW3rPnthtDiQqW/z/VFwIF1Mpjj+
        bmwt34EcS6QdIT3IRlDIfiZAYdMiIEy1eM6CZf05Bd0jne3AgbxBmOV2Hndlbv5afXGsKo
        NA66z1bqrEvfE5XWp6ykx6GqOUaJ8Rw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-lC-iPmAhMZW-UtsyRkw_7g-1; Mon, 19 Sep 2022 08:56:26 -0400
X-MC-Unique: lC-iPmAhMZW-UtsyRkw_7g-1
Received: by mail-ed1-f69.google.com with SMTP id m13-20020a056402510d00b004519332f0b1so16580323edd.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KBjmtOJBVrvCkDxZNegQRrlno9ip0hHfVuVwFPIj78k=;
        b=w44mA6QdcTq2eRGHpts8j3ebZHYbl3yJv2LPVMAScog+EAl98bheiuoMbcfcuIh0vG
         xEktZLb9Hseql2fguu+XsMPbs9ZOwL+E8nyFv3KKoO6aKXEut5eVvr6qzzYU2NHfD0vS
         SN2gA79hnaP3bW2Szw2QaaQCWTS6l9Pxh6v2C2RPHPxt2cYikbj5wduc0f4b8y1uaug8
         gIvBl6bMNSxGvTVlIfULXQamA8D/64/eoQ8BNix2qk4LVJcwQHhSF9WjNqJoqAP4oc8O
         dpMnbvBfdqdl/Kw4yrQLNBDIEMPJEKElXDnTcGhYzii5J+MbAPkZgpuzkMmTXOlHhU2q
         f1Mg==
X-Gm-Message-State: ACrzQf14lboQfbHKaxUn8EDFomDnAfuWsw3XmvqrdZL9A96+fcVtmd1Q
        HQckHtj5eb+hDSFRXUBTl6HGsU6pUZXhFa35cXMgXu192Nci5mKhDrQktAm+SjSW+DWnJXXVJTw
        gwr9GkT0PgCeti+S1mAjCWgTSVvkUHKIF2Q==
X-Received: by 2002:a17:907:7fac:b0:780:ec98:af85 with SMTP id qk44-20020a1709077fac00b00780ec98af85mr7737544ejc.641.1663592185339;
        Mon, 19 Sep 2022 05:56:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EC97w2aNxIRzaoRnpvQieGkNUwuQejTM0orqeHPsjccPsu2mOGsAfu35iwEAr6AXJ3eAmLA==
X-Received: by 2002:a17:907:7fac:b0:780:ec98:af85 with SMTP id qk44-20020a1709077fac00b00780ec98af85mr7737525ejc.641.1663592185160;
        Mon, 19 Sep 2022 05:56:25 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g17-20020a17090604d100b00773f3ccd989sm939584eja.68.2022.09.19.05.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 05:56:24 -0700 (PDT)
Message-ID: <13edebe5-2bb6-2de5-8352-a4737c9465d5@redhat.com>
Date:   Mon, 19 Sep 2022 13:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drivers/platform: toshiba_acpi: Remove duplicate include
Content-Language: en-US
To:     Yihao Han <hanyihao@vivo.com>,
        Azael Avalos <coproscefalo@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220919111519.19491-1-hanyihao@vivo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220919111519.19491-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/19/22 12:15, Yihao Han wrote:
> Remove duplicate include in toshiba_acpi.c
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>

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
>  drivers/platform/x86/toshiba_acpi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 43cc25351aea..b62a08ec5f45 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -39,7 +39,6 @@
>  #include <linux/workqueue.h>
>  #include <linux/i8042.h>
>  #include <linux/acpi.h>
> -#include <linux/dmi.h>
>  #include <linux/uaccess.h>
>  #include <linux/miscdevice.h>
>  #include <linux/rfkill.h>

