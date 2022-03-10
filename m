Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A846CC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 16:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244221AbiCJQYu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 11:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243930AbiCJQYo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 11:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3C88194AA3
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646929341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fp0mk3rYAtIXdsAQnr/qEO23/c/Up/5gPdqVWQP3YIs=;
        b=XgV1e31b921h+RUzdtZUtCDwmn0kCYbGGNSXCRrVw/xQqR0Cem2pbxWccOqsCvxRSESnrA
        d48uuitnnt8i4/OUCxr8dd0+6gF0UT+tSvxVu41F5yxyHQXmlDQWJYiteFkiLdGD+sXcQU
        RgmatfhSA4Z4IFD4V2EjcfDlFbOhRpc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-LDvg18mBO62L5HgQ6hQeZA-1; Thu, 10 Mar 2022 11:22:20 -0500
X-MC-Unique: LDvg18mBO62L5HgQ6hQeZA-1
Received: by mail-ed1-f72.google.com with SMTP id u28-20020a50d51c000000b004159ffb8f24so3395078edi.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 08:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fp0mk3rYAtIXdsAQnr/qEO23/c/Up/5gPdqVWQP3YIs=;
        b=R5t0UtW5hhZ8SW/lzPtB4sHplduw7MslOnDlDiYMUngE661n/Itam61PvXi5/oyHoz
         8HuYiSLzAvsw/qHZ6m8dMs+5OBGg1vlYwX/GKzKmdRgINda7ie1Riw90X0l+lQXGIPTh
         gGXBBlHV35uTnSSYj5ZcCnI4wVwfZb+XdhRVnZtTGVwQybzqX4+6eFrAhFExb2VjMOul
         UxPx43ukwDVNYTpf6fV3h9heFUVPVLKPhSwlTfwi/R1pvKL9qzxd7IMPJi+zZpJzOMJj
         FEEdAAhQqTDy+C94Ld3K1RoORmL1oUGjkIkTgPRX5raXjJpkw3sgO2/Ko9nmKsuKjmMT
         2fMg==
X-Gm-Message-State: AOAM532FcDg8pMs4yoh6P5UeCLiKYGR03UZ48Ea3AT/raDSs+IYpuHxq
        T4G2dOs50tXPB2XqGKd9/7/9LH6xJZbU6pYOZwKWw0OQkEP75Ht5kg7GkU+ipyxFWXBQEVDIJBy
        WRdWftzbNBx/qAToxwwg/oVb3RkmfItU0IA==
X-Received: by 2002:a05:6402:1e8b:b0:3da:58e6:9a09 with SMTP id f11-20020a0564021e8b00b003da58e69a09mr5016928edf.155.1646929339277;
        Thu, 10 Mar 2022 08:22:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0ZiP25dlQ+7gpi13teOQ4wgTPllfSkhgRlANTM9345OmzXJMBfHsTldr+3G/ZIm29MXjEyw==
X-Received: by 2002:a05:6402:1e8b:b0:3da:58e6:9a09 with SMTP id f11-20020a0564021e8b00b003da58e69a09mr5016911edf.155.1646929339017;
        Thu, 10 Mar 2022 08:22:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id f7-20020a17090631c700b006b293ddbca1sm1935258ejf.35.2022.03.10.08.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 08:22:18 -0800 (PST)
Message-ID: <61705187-a0a5-f76c-a006-93494def255d@redhat.com>
Date:   Thu, 10 Mar 2022 17:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] x86/platform/uv: Update NMI Handler for UV5
Content-Language: en-US
To:     Mike Travis <mike.travis@hpe.com>, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steve Wahl <steve.wahl@hpe.com>, x86@kernel.org
Cc:     Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20220308010537.70150-1-mike.travis@hpe.com>
 <20220308010537.70150-3-mike.travis@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220308010537.70150-3-mike.travis@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/8/22 02:05, Mike Travis wrote:
> Update NMI handler to interface with UV5 hardware. This involves
> changing the EVENT_OCCURRED MMR used by the hardware and removes
> the check for the newer NMI function supported by UV BIOS.
> 
> Signed-off-by: Mike Travis <mike.travis@hpe.com>
> Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
> ---
>  arch/x86/platform/uv/uv_nmi.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
> index 926a4e006e5a..38f4beae9fab 100644
> --- a/arch/x86/platform/uv/uv_nmi.c
> +++ b/arch/x86/platform/uv/uv_nmi.c
> @@ -245,7 +245,7 @@ static inline bool uv_nmi_action_is(const char *action)
>  static void uv_nmi_setup_mmrs(void)
>  {
>  	/* First determine arch specific MMRs to handshake with BIOS */
> -	if (UVH_EVENT_OCCURRED0_EXTIO_INT0_MASK) {
> +	if (UVH_EVENT_OCCURRED0_EXTIO_INT0_MASK) {	/* UV2,3,4 setup */
>  		uvh_nmi_mmrx = UVH_EVENT_OCCURRED0;
>  		uvh_nmi_mmrx_clear = UVH_EVENT_OCCURRED0_ALIAS;
>  		uvh_nmi_mmrx_shift = UVH_EVENT_OCCURRED0_EXTIO_INT0_SHFT;
> @@ -255,26 +255,26 @@ static void uv_nmi_setup_mmrs(void)
>  		uvh_nmi_mmrx_req = UVH_BIOS_KERNEL_MMR_ALIAS_2;
>  		uvh_nmi_mmrx_req_shift = 62;
>  
> -	} else if (UVH_EVENT_OCCURRED1_EXTIO_INT0_MASK) {
> +	} else if (UVH_EVENT_OCCURRED1_EXTIO_INT0_MASK) { /* UV5 setup */
>  		uvh_nmi_mmrx = UVH_EVENT_OCCURRED1;
>  		uvh_nmi_mmrx_clear = UVH_EVENT_OCCURRED1_ALIAS;
>  		uvh_nmi_mmrx_shift = UVH_EVENT_OCCURRED1_EXTIO_INT0_SHFT;
>  		uvh_nmi_mmrx_type = "OCRD1-EXTIO_INT0";
>  
> -		uvh_nmi_mmrx_supported = UVH_EXTIO_INT0_BROADCAST;
> -		uvh_nmi_mmrx_req = UVH_BIOS_KERNEL_MMR_ALIAS_2;
> -		uvh_nmi_mmrx_req_shift = 62;

The dropping of setting uvh_nmi_mmrx_req and uvh_nmi_mmrx_req_shift here
looks weird, this seems like it might break things.

A closer look shows that that is not the case because these 2 *global*
variables are only used inside this 1 function and the added if for
uvh_nmi_mmrx_req being set causes them to now no longer be used in
this code path.

And before this change these 2 global variables where always set to:
UVH_BIOS_KERNEL_MMR_ALIAS_2 resp 62. This is even mentioned in
a comment where they are declared.

IMHO this really should be replaced with a preparation patch
which just adds a #define for the 62 and uses UVH_BIOS_KERNEL_MMR_ALIAS_2
directly, which it seems they really should have been from the start...

> +		uvh_nmi_mmrx_supported = 1;

So now your abusing a value used to store a register address/offset
as bool as well, using a special value for it being a bool rather
then a register offset and just hoping that the offset never is 1.

This is not the way to write maintainable code if you need both
a variable to store a register address (*) and a bool, please
use 2 separate variables for this.

*) Note you don't seem to need a variable for the register
address, this seems to be another case where you should just be
better of directly using the UVH_EXTIO_INT0_BROADCAST #define,
you could even change things to a #define in the same preparation
patch.



> +		uvh_nmi_mmrx_req = 0;>  
>  	} else {
> -		pr_err("UV:%s:cannot find EVENT_OCCURRED*_EXTIO_INT0\n",
> -			__func__);
> +		pr_err("UV:%s:NMI support not available on this system\n", __func__);
>  		return;
>  	}
>  
> -	/* Then find out if new NMI is supported */
> -	if (likely(uv_read_local_mmr(uvh_nmi_mmrx_supported))) {
> -		uv_write_local_mmr(uvh_nmi_mmrx_req,
> -					1UL << uvh_nmi_mmrx_req_shift);
> +	/* Then find out if new NMI is supported (assumed on UV5) */
> +	if (likely(uvh_nmi_mmrx_supported == 1) ||
> +	   (uv_read_local_mmr(uvh_nmi_mmrx_supported) & 1UL << uvh_nmi_mmrx_req_shift)) {
> +		if (uvh_nmi_mmrx_req)
> +			uv_write_local_mmr(uvh_nmi_mmrx_req,
> +						1UL << uvh_nmi_mmrx_req_shift);

The whole switch of just assuming "new NMI" support in one case and
of no longer writing the mmr seems like something which should be
much more clearly described in the commit message.

>  		nmi_mmr = uvh_nmi_mmrx;
>  		nmi_mmr_clear = uvh_nmi_mmrx_clear;
>  		nmi_mmr_pending = 1UL << uvh_nmi_mmrx_shift;


Regards,

Hans

