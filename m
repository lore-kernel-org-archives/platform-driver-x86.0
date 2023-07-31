Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B72C001DE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Jul 2023 14:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjGaOKO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Jul 2023 10:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjGaOKO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jul 2023 10:10:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7BBD3
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690812564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IPp29UYo0ZZddIYLEdBescKIwjWYQfioETTd4hLKE4c=;
        b=Xy64iBosaSu5c/aNQRgXiVNWQzo+AN5nRR0rbjG2vnWW3zYiZrlc9SYtNeAZB+nG43sgWC
        1VzOYq31JLwf6WGUK5XUrAz44ZUiulRd0wYGEHoefIKLeKH7v2tfYNbkBjEGzu+Aq8FXmw
        I9wCjUIDh4nmvdl/BKMfkCOwdcnehow=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-rWnRxNAQP0-weBE11nljRw-1; Mon, 31 Jul 2023 10:09:23 -0400
X-MC-Unique: rWnRxNAQP0-weBE11nljRw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99bcf6ae8e1so275684866b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 07:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812562; x=1691417362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPp29UYo0ZZddIYLEdBescKIwjWYQfioETTd4hLKE4c=;
        b=M3llZiErEFH1fXwymX8LTrUj8hGh+faMwY+u0Ln4+mGRoU05fi5JXpbvEpGnjpourt
         kRljfsUt0XNemkHiCEqr8tyRUnO/eLAOYOHg3H34VExl63CX84JWy1KwCI3z6nFN6pAb
         X+j0niCid337m9bEp9PaUnTAt6Cz+YXIajoLeLFs6rm50lnuKpL+JXbwYgIJJKTT9OkS
         wVNsSpHxIlAvHNU5Bs8DVPjHn1C1nJybxJqoMI8RHOT+bqlav21ln1v6DtTynRoIS4gg
         119M/L9UsPQPjGsvwJHb4Z4QNEYKYKw4ungSot1D5+W+9NCkxgewJh7VfWV3zd+YHH0k
         ktnw==
X-Gm-Message-State: ABy/qLYyiVH4LfCuT8sVyZ/P74Cm4IOX2Bvug0xoR59VIF8RatEAjN8C
        EfBdMIDpHSUoh3Jzfikh299gkMW1cKLuRxjlEMEh2aa0EImsA90lRF+U2MN/GJkHY+gW6p51L2h
        BYcKpsKOBDkMVtYf6Epa/bsJIS0FDyyW8wg==
X-Received: by 2002:a17:906:31c2:b0:99c:2289:63bc with SMTP id f2-20020a17090631c200b0099c228963bcmr606181ejf.74.1690812562137;
        Mon, 31 Jul 2023 07:09:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGgvsAduj5hcGrxn6IIMNMQ0lttvvuISFEQmMGpFG4MQZI4sH6v4L+gh/Aw3Nd7GZfzjF+ZUw==
X-Received: by 2002:a17:906:31c2:b0:99c:2289:63bc with SMTP id f2-20020a17090631c200b0099c228963bcmr606163ejf.74.1690812561854;
        Mon, 31 Jul 2023 07:09:21 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id qq5-20020a17090720c500b009882e53a42csm6189153ejb.81.2023.07.31.07.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 07:09:11 -0700 (PDT)
Message-ID: <102f30e6-f159-3983-825c-7cb819c201f0@redhat.com>
Date:   Mon, 31 Jul 2023 16:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH -next] platform/x86/amd/pmf: Fix unsigned comparison with
 less than zero
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>, Shyam-sundar.S-k@amd.com
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230727014315.51375-1-yang.lee@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230727014315.51375-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/27/23 03:43, Yang Li wrote:
> The return value from the call to amd_pmf_get_pprof_modes() is int.
> However, the return value is being assigned to an unsigned char
> variable 'mode', so making 'mode' an int.
> 
> silence the warning:
> ./drivers/platform/x86/amd/pmf/sps.c:183:5-9: WARNING: Unsigned expression compared with zero: mode < 0
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5995
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans

> ---
>  drivers/platform/x86/amd/pmf/sps.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index ab69d517a36a..a70e67749be3 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -176,7 +176,8 @@ int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>  
>  int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev)
>  {
> -	u8 mode, flag = 0;
> +	u8 flag = 0;
> +	int mode;
>  	int src;
>  
>  	mode = amd_pmf_get_pprof_modes(dev);

