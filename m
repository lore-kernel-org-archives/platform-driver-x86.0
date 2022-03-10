Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4E1C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 16:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239365AbiCJQOA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 11:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237264AbiCJQN7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 11:13:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9DFC035867
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 08:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646928776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NNeYsGy5GEH7Mbra8ROUB5xsBSJSvMr9PkuEfPzANXY=;
        b=ij7ID/rbQEP1GlX8tt+BZWmDorqrk34+cqHiodoxFaZPm37h11dzy446W0uLyJ+7tDYKvN
        lA7zmyy/sM1Ax5MQAJnXcKutm4tF/ToItaWejfBRkxbPvRR/yH+JLErLo1BfKUy/UYQ8iV
        jTeS6Lvpi+DR1jDTPh4Fv/p4/qo2z5Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-iseEx0uLNKux800ZSYTTxQ-1; Thu, 10 Mar 2022 11:12:55 -0500
X-MC-Unique: iseEx0uLNKux800ZSYTTxQ-1
Received: by mail-ej1-f72.google.com with SMTP id ey18-20020a1709070b9200b006da9614af58so3375227ejc.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 08:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NNeYsGy5GEH7Mbra8ROUB5xsBSJSvMr9PkuEfPzANXY=;
        b=qmOlDZQNcej1RnCmEv09ksFEaaXRvPBuiMfx/y2egrwsgfK4dWqXY5MuNqPE3uUoV+
         b7l+lgqB4rH1ZUE1fCpfeq8n477pItdWcl0Gv6goBYHKtOLndyOntQgvrRQmYC5ijrMv
         OLytQ9+nWjC1UYNycT1YcroIeM6iFVlX7zWbLSFbYa54CeOnh2o7Ip3MAyf9icpcW/+Y
         CTm8iNb9HgLXrpDK4V1O98rAy3xRGPRyLPSIqe94HIJdJudb6sHVpCPlciqWaFnBgJci
         5SZaAYDCvhrYXgIepLudI09ptbDJHFB2V/jWYjbaiTGK6P3nH4S++oAqnjicmjdai6Hw
         T4lg==
X-Gm-Message-State: AOAM5315PVoSLEyGvptURXoOpCeXW5HAX6iGisPtXHttS78rrFoqJLUK
        LnMFSPTjoFSYwITVwaH8OkEHPiz9nJ80igdkag5Twz6k0kdXm0dspc3tXqjoqHkPEh7/Frz3pPD
        7XiRsaGWmxtdo4fWHsrQs32Ur+MW97rGVeA==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id x17-20020a170906299100b006cf6b24e92fmr4854752eje.748.1646928774016;
        Thu, 10 Mar 2022 08:12:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEBvACUyWY3XMB+zE7GVAa/esjBxPyDo1dWf95GVSSD81s8zhmS4RJG3YwDEPH6w7bYVgt3g==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id x17-20020a170906299100b006cf6b24e92fmr4854735eje.748.1646928773787;
        Thu, 10 Mar 2022 08:12:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id bo14-20020a170906d04e00b006ce98d9c3e3sm1949560ejb.194.2022.03.10.08.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 08:12:53 -0800 (PST)
Message-ID: <d93d7fe7-ab60-9202-9b35-e8c8371ddefd@redhat.com>
Date:   Thu, 10 Mar 2022 17:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/4] x86/platform/uv: Remove Obsolete Scratch5 NMI handler
Content-Language: en-US
To:     Mike Travis <mike.travis@hpe.com>, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steve Wahl <steve.wahl@hpe.com>, x86@kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20220308010537.70150-1-mike.travis@hpe.com>
 <20220308010537.70150-2-mike.travis@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220308010537.70150-2-mike.travis@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I just noticed this series only touches files under arch/x86,
so reviewing + merging this really is up to the x86 maintainers,
but I was already looking at it anyways so here is a review
from me too.

On 3/8/22 02:05, Mike Travis wrote:
> Removes obsolete scratch5 NMI handler only used in UV1 and early UV2
> systems.
> 
> Signed-off-by: Mike Travis <mike.travis@hpe.com>
> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
> ---
>  arch/x86/include/asm/uv/uv_hub.h | 6 ------
>  arch/x86/platform/uv/uv_nmi.c    | 5 +----
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/arch/x86/include/asm/uv/uv_hub.h b/arch/x86/include/asm/uv/uv_hub.h
> index d3e3197917be..958c18f94146 100644
> --- a/arch/x86/include/asm/uv/uv_hub.h
> +++ b/arch/x86/include/asm/uv/uv_hub.h
> @@ -729,12 +729,6 @@ extern void uv_nmi_setup_hubless(void);
>  #define UVH_TSC_SYNC_VALID	3	/* 0011 */
>  #define UVH_TSC_SYNC_UNKNOWN	0	/* 0000 */
>  
> -/* BMC sets a bit this MMR non-zero before sending an NMI */
> -#define UVH_NMI_MMR		UVH_BIOS_KERNEL_MMR
> -#define UVH_NMI_MMR_CLEAR	UVH_BIOS_KERNEL_MMR_ALIAS
> -#define UVH_NMI_MMR_SHIFT	63
> -#define UVH_NMI_MMR_TYPE	"SCRATCH5"
> -
>  struct uv_hub_nmi_s {
>  	raw_spinlock_t	nmi_lock;
>  	atomic_t	in_nmi;		/* flag this node in UV NMI IRQ */
> diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
> index 1e9ff28bc2e0..926a4e006e5a 100644
> --- a/arch/x86/platform/uv/uv_nmi.c
> +++ b/arch/x86/platform/uv/uv_nmi.c
> @@ -280,10 +280,7 @@ static void uv_nmi_setup_mmrs(void)
>  		nmi_mmr_pending = 1UL << uvh_nmi_mmrx_shift;
>  		pr_info("UV: SMI NMI support: %s\n", uvh_nmi_mmrx_type);
>  	} else {
> -		nmi_mmr = UVH_NMI_MMR;
> -		nmi_mmr_clear = UVH_NMI_MMR_CLEAR;
> -		nmi_mmr_pending = 1UL << UVH_NMI_MMR_SHIFT;
> -		pr_info("UV: SMI NMI support: %s\n", UVH_NMI_MMR_TYPE);
> +		pr_warn("UV: NMI handler not present or not supported\n");
>  	}
>  }
>  

This seems like a bad idea, just because HPE is no longer actively maintaining
these older UV versions does not mean that they are automatically without
users and we usually don't go around and start dropping support for hw
which is still in active use.

So NACK from me on this one.

Regards,

Hans

