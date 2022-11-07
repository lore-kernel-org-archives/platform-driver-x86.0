Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66CAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 12:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbiKGM5L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 07:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbiKGM5K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 07:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C021BEAC
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 04:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667825771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rHtgFX/B8XH3LTgcp/LhB7WPFD9d+PyceMtR9H35JPs=;
        b=F3hSRk58B2vQzEJvkpd1hh+q/GeXIU/PxCZwqMTS852c/TjCP/29uRoSg0Ba0aF0XJvwv1
        vmf34YZSDrs3FJMa5YXXsgaqOFmdDzrxlqd/mGF+0vpjEh1e8w6exqWQId19bVS1MvH5F5
        Mx78uHYWJhCsRw8v0deTgcS0GMyLYlg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-mksYlSD9MmmKzqiQGNiSmw-1; Mon, 07 Nov 2022 07:56:10 -0500
X-MC-Unique: mksYlSD9MmmKzqiQGNiSmw-1
Received: by mail-ej1-f71.google.com with SMTP id oz34-20020a1709077da200b007adc8d68e90so6338157ejc.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 04:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHtgFX/B8XH3LTgcp/LhB7WPFD9d+PyceMtR9H35JPs=;
        b=jlVvxCDchBxBgVICtttIdtr09GtHVzsdl9oZMWpHneX/5X7xJGHMP5AQvU/feAGVC1
         t+6XXglrIFWJ49286MOdx56pZGoSUegmSp2IC9wbv+jLQGN+WcI/SSIPv478PZaO3K0z
         DtUGm+e7sLJIsDeW+JfD3zmHlk9/IZ1pD4e4dmtholMYdsXm45v4PscO3WCem+EzWsum
         XM2qp0FxSbwr90nJSrSsUrhcRa3S4y7h9eZc5Mz8PDdX4DHyp2le6M69BJh8mNo1aaSO
         Gk4qBoXG8KkrqRcZugWOVlpt45aTVaJnRWLxbStwazC00rv8rMIQujQk+yi3Y0datK+n
         7uWA==
X-Gm-Message-State: ACrzQf2H5TAPqCMzyKCBlBsdN5onwesAH0cDWlYWeVmz579PZ34GPnzZ
        RJuTMbs7+BHHeaLllOvryQk8cf8qnDFcadninSU2IPYsssczJN+MmjFmD3gtVcCIyPv0t6gGHkx
        dPq/VpH0LuUXkGIPtxf8pw9krU5Sgb0dhOw==
X-Received: by 2002:a17:907:d10:b0:79a:a1fe:8be5 with SMTP id gn16-20020a1709070d1000b0079aa1fe8be5mr48171232ejc.125.1667825769204;
        Mon, 07 Nov 2022 04:56:09 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7wtrW2YeWpnGVAVLtlufEtogz3R4cc9ySPpXR06CSqITL7+vZA00ORTLFGUt23KAW9Mhz8rg==
X-Received: by 2002:a17:907:d10:b0:79a:a1fe:8be5 with SMTP id gn16-20020a1709070d1000b0079aa1fe8be5mr48171189ejc.125.1667825768586;
        Mon, 07 Nov 2022 04:56:08 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id fd25-20020a056402389900b0045b910b0542sm4172540edb.15.2022.11.07.04.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:56:07 -0800 (PST)
Message-ID: <c83ba53b-30ea-caef-1419-4a3edc623bc3@redhat.com>
Date:   Mon, 7 Nov 2022 13:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86/intel: fix repeated words in comments
Content-Language: en-US
To:     Jilin Yuan <yuanjilin@cdjrlc.com>, irenic.rajneesh@gmail.com,
        david.e.box@intel.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019125355.50674-1-yuanjilin@cdjrlc.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221019125355.50674-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/19/22 14:53, Jilin Yuan wrote:
> Delete the redundant word 'toZ'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

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
>  drivers/platform/x86/intel/pmc/core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index 7a059e02c265..4c7e77f1ccac 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -264,7 +264,7 @@ struct pmc_bit_map {
>   * @slp_s0_offset:	PWRMBASE offset to read SLP_S0 residency
>   * @ltr_ignore_offset:	PWRMBASE offset to read/write LTR ignore bit
>   * @regmap_length:	Length of memory to map from PWRMBASE address to access
> - * @ppfear0_offset:	PWRMBASE offset to to read PPFEAR*
> + * @ppfear0_offset:	PWRMBASE offset to read PPFEAR*
>   * @ppfear_buckets:	Number of 8 bits blocks to read all IP blocks from
>   *			PPFEAR
>   * @pm_cfg_offset:	PWRMBASE offset to PM_CFG register

