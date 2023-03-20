Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF7BC7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 10:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjCTKef (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 06:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjCTKeH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 06:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C73F86BE
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 03:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9j1tZlrjGVpFay8GqDUlBfl9N7iMb64uZJQ31+qiy4M=;
        b=FZJoz942bjyKwYGgfEQwGVLYSIUD5SzrRvBE/LKQ/kY2tvBVHH/8JIyCcu93eOOF+SnY9A
        wEM77w2Kpto8m4PnTHyLJhtET8fu1a31UtdFtPrs/JtyPZEk/SnsPOCH45t9u5RnsAOOIA
        3Rgbmv32xfx1WAB1AAUKtH30udXZszU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-fCBECVIvP928rnxDEmTNaw-1; Mon, 20 Mar 2023 06:33:08 -0400
X-MC-Unique: fCBECVIvP928rnxDEmTNaw-1
Received: by mail-ed1-f71.google.com with SMTP id j21-20020a508a95000000b004fd82403c91so16639678edj.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 03:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9j1tZlrjGVpFay8GqDUlBfl9N7iMb64uZJQ31+qiy4M=;
        b=aTO3CpGZvwGc3bPeogztbP6R+T/Lyf/1ESTmmb9qixwsaBwvgcSZrr7xUV/HnjKheN
         tteu4VhdLH2Mk5ZtshhKKRwlXHEofN7gFj1Pt5NlhcUQ/2kSWs4cLtUZm0oIhwB7VYxp
         RNo2jf4AMyDWA7xEbej7FrM9oP/sbVUgCWUkihWyUQYjMqZm1NI0pkONhcqKEerjeiow
         1qz/dCx7Dvr1EfvWkwTkcTiDaZqRGUwpLBBRmXBqB6mITaNtr7833D2yLomGxrAYs7Mt
         P/cbAiFuHjkTizwMJMqQn19XYl0DVR3PpEzS1tSyoWsz3mxliNMNPTNswQnSYIUQOD3E
         zKRQ==
X-Gm-Message-State: AO0yUKXtmm71Z0E6r9FfcdD4H0JEg5gG2JS9KEPVbgzDq+RWNtHCladM
        qs7nE2M95Ka5jF2FRpP7JKaMy5K/Saci0BxOm6UleTJwNJmyB5mBdTI2iAC0sk+hvtXkmM7WhWh
        vGqXmoVRz2dkMwh3F21ijUowTOz/vuuCedg==
X-Received: by 2002:a17:906:185b:b0:931:4b0b:73e3 with SMTP id w27-20020a170906185b00b009314b0b73e3mr9410109eje.65.1679308387054;
        Mon, 20 Mar 2023 03:33:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set+sGoGYGtQ82gGOl/6rG2ufutdZdQ3DoxNT0cg8G5tz1D9dt9R9bGN4hVIxxjoCpOwQl1ethA==
X-Received: by 2002:a17:906:185b:b0:931:4b0b:73e3 with SMTP id w27-20020a170906185b00b009314b0b73e3mr9410097eje.65.1679308386885;
        Mon, 20 Mar 2023 03:33:06 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gx24-20020a170906f1d800b0092d16623eeasm4244327ejb.138.2023.03.20.03.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:33:06 -0700 (PDT)
Message-ID: <8b58fbc5-93c6-9cbe-edda-e804c398ba52@redhat.com>
Date:   Mon, 20 Mar 2023 11:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH linux-next v2 2/3] drivers/platform/x86/intel/tpmi: revise
 the comment of intel_vsec_add_aux
Content-Language: en-US
To:     Dongliang Mu <dzm91@hust.edu.cn>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
 <20230309040107.534716-3-dzm91@hust.edu.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309040107.534716-3-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/23 05:01, Dongliang Mu wrote:
> intel_vsec_add_aux() is resource managed including res and
> feature_vsec_dev memory.
> 
> Fix this by revising the comment of intel_vsec_add_aux since res variable
> will also be freed in the intel_vsec_add_aux.
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

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
>  drivers/platform/x86/intel/tpmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
> index 882fe5e4763f..036d0e0dba19 100644
> --- a/drivers/platform/x86/intel/tpmi.c
> +++ b/drivers/platform/x86/intel/tpmi.c
> @@ -239,8 +239,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  	/*
>  	 * intel_vsec_add_aux() is resource managed, no explicit
>  	 * delete is required on error or on module unload.
> -	 * feature_vsec_dev memory is also freed as part of device
> -	 * delete.
> +	 * feature_vsec_dev and res memory are also freed as part of
> +	 * device deletion.
>  	 */
>  	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
>  				  feature_vsec_dev, feature_id_name);

