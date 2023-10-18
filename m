Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8422ACDB483
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 13:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjJRNd1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 09:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbjJRNd0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 09:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8255BA
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697635956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h1y+Lbjba0uPhpStIL3iIJrOQN2PixRm2K4anBzJjcY=;
        b=A8MpXubJ6hZ19wkmLHNDdMBPW64P+n0DlbFIFTtYUd1pnRsmcHjJodgber5nmocOdmlxVX
        PW0yo8aLT1c6A/EZj/brl1zg7o3RIMkH18Q6QEhNBaLBcX2OQ1DfSfKfylHaZxb/uvZ2LU
        DWYrftGxX5/w/eSzEadptfkt6bQc43k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-vYhYj0i0MvmHfVdaDIvZEQ-1; Wed, 18 Oct 2023 09:32:15 -0400
X-MC-Unique: vYhYj0i0MvmHfVdaDIvZEQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae686dafedso501032666b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697635934; x=1698240734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1y+Lbjba0uPhpStIL3iIJrOQN2PixRm2K4anBzJjcY=;
        b=s2QLGnqcHrflfUcQWjfR5rR3ZzNxAJOlZQOy5je9QHXRjv7f+QIE1yWK3rUFq/TrsJ
         fE+cMo0Ule9IfjQ/dkWgp1LDpZgKgyIQJod3n1gJxQRF9/+2qZGeEnoXn/yLtqDwWOpX
         dTaY2zY1BVRt0EL3EX1BVUx5GHz97uUJI8GiA9Fl4Cr9zSnDu3j0ZhDeFN2ylWGxehTb
         ivUbootE0InVgjn0i6AAkunbFkO4r/D3bm7W03+bqMbPZAVUzyeFmYe1sAsBUtceAEU0
         JQxhdSGgIHR9Ej9XZWAHT5NuHZnOLz/48Sd1hieqm81Ly6BFmRQKkrmAdmUZaPrxPU9Z
         UZhg==
X-Gm-Message-State: AOJu0Ywssgm1HhMiHUDZ2AWxgzyx7j0/8y4axVaA5VMS1W/K6zd/+FCl
        dKiKkeL9BJEMHmz7X5BcFWmx4b2iQjCeMW1LbX0KOi9wl92tkeb9gKIlRm1D08K2IgbHCRQZLfP
        JUptefIyrdZqNvAM5yplu271VVjSAYPs/pg==
X-Received: by 2002:a17:907:e94:b0:9b2:df16:851d with SMTP id ho20-20020a1709070e9400b009b2df16851dmr4365539ejc.57.1697635933847;
        Wed, 18 Oct 2023 06:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH18mFmch1lYXp4g0X+gAssWRNeJUjZzrtjpyVVD5oGhpJ+O6KHlNN4MAH6Vp3mXSq+C3I8AA==
X-Received: by 2002:a17:907:e94:b0:9b2:df16:851d with SMTP id ho20-20020a1709070e9400b009b2df16851dmr4365517ejc.57.1697635933504;
        Wed, 18 Oct 2023 06:32:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c30-20020a1709063f1e00b0099bd1ce18fesm1726852ejj.10.2023.10.18.06.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 06:32:11 -0700 (PDT)
Message-ID: <d86cbcd0-e41b-81d7-2708-231f128f134a@redhat.com>
Date:   Wed, 18 Oct 2023 15:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/surface: platform_profile: Propagate error if
 profile registration fails
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, luzmaximilian@gmail.com
Cc:     ilpo.jarvinen@linux.intel.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231014235449.288702-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231014235449.288702-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/15/23 01:54, Armin Wolf wrote:
> If platform_profile_register() fails, the driver does not propagate
> the error, but instead probes successfully. This means when the driver
> unbinds, the a warning might be issued by platform_profile_remove().
> 
> Fix this by propagating the error back to the caller of
> surface_platform_profile_probe().
> 
> Compile-tested only.
> 
> Fixes: b78b4982d763 ("platform/surface: Add platform profile driver")
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
>  drivers/platform/surface/surface_platform_profile.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
> index f433a13c3689..a5a3941b3f43 100644
> --- a/drivers/platform/surface/surface_platform_profile.c
> +++ b/drivers/platform/surface/surface_platform_profile.c
> @@ -159,8 +159,7 @@ static int surface_platform_profile_probe(struct ssam_device *sdev)
>  	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, tpd->handler.choices);
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE, tpd->handler.choices);
> 
> -	platform_profile_register(&tpd->handler);
> -	return 0;
> +	return platform_profile_register(&tpd->handler);
>  }
> 
>  static void surface_platform_profile_remove(struct ssam_device *sdev)
> --
> 2.39.2
> 

