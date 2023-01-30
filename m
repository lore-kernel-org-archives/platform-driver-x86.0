Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E9CC54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 13:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbjA3Ndb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236024AbjA3Nda (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 08:33:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F29D14EBB
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675085561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gal5Vl1U+0iw7FF90tqtetQNW3p0utvBJZzG/wtOvPQ=;
        b=RsOps5fRBTW+7WREE395p9b6NpOdzp27LntPmJXdXwBP/sqlzM3vI7cf+hilG7WSOMEGda
        ZLvjIkY1U0q/HteM9ZO0l90ilFMu5U+3/BfNHg5NUnDN2kHvd1gu3iT15SczJ9d/7+pO3C
        doA4WiQUKZGum4SEuJeItp/rf6B5vlA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-t8uqTD1dNTqYV2U5qvXZJg-1; Mon, 30 Jan 2023 08:32:37 -0500
X-MC-Unique: t8uqTD1dNTqYV2U5qvXZJg-1
Received: by mail-ed1-f71.google.com with SMTP id y21-20020a056402359500b0049e171c4ad0so8136404edc.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gal5Vl1U+0iw7FF90tqtetQNW3p0utvBJZzG/wtOvPQ=;
        b=jQhS3t/17K5dAR656SAkZZxy168DiZfrCEnm58dGkpMfky03bOCSVzXPgeskEtpvjp
         x+3F6pYgnhBzKvQ1YVG14/nrKpIK2ghOn8mbBbeSI8/0g0RcTM29Lyykzqh7IXVyVWJt
         154Pp++yFUw/gWR8oWH2VShVsjzhDDYJPDPf2g6me1l04V5qKhztYLS6SfFHwvl/t5Qm
         97yLL3eTdQbxPwvP/hh5FUmOcZ5dipFsEJYd6NdlaRSxFXEDFdFvV4ZeeDjarkju1iSI
         wUKTUDi1hbcnvVurKNsuJ5UdO7eJCu65wCZsXgf5iIQ1qOwZljACpf313Y5vN2k7USNR
         V3hg==
X-Gm-Message-State: AO0yUKWkXojf807nfcu2wlq82F4eHgYfGdRvu8WKYx0aL0+Evqw7lIyo
        FmiQmRJHOu+Q4EIFeQdujDEXhSdd+IcJrDRUyrexHXd7pdHZaBKZxWTQnMWKTt3XHAw9ViNb9jr
        70VOXV7xMsjQe4NgWkeeAMmpOnBg77EyFpg==
X-Received: by 2002:a17:906:b55:b0:87b:db65:9f41 with SMTP id v21-20020a1709060b5500b0087bdb659f41mr12438791ejg.14.1675085556910;
        Mon, 30 Jan 2023 05:32:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8iMoMVTMrHfE5HZUwyFi5VhC62pFfPrU1YHYRXSjeYR5M5+UXfQnxAnnlMiSzQLfGZDV5Ffw==
X-Received: by 2002:a17:906:b55:b0:87b:db65:9f41 with SMTP id v21-20020a1709060b5500b0087bdb659f41mr12438785ejg.14.1675085556746;
        Mon, 30 Jan 2023 05:32:36 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709061e8600b0085e0882cd02sm6939805ejj.92.2023.01.30.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:32:36 -0800 (PST)
Message-ID: <dc3c697d-9c37-fc01-8b96-161b4c7ae24d@redhat.com>
Date:   Mon, 30 Jan 2023 14:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/5] platform/x86/amd/pmf: Updates to PMF driver
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/23 10:59, Shyam Sundar S K wrote:
> This patch series includes general updates and bug fixes to amd_pmf
> driver.

Thank you for your patch-series, I've applied the series to
the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

and this will be included in my next fixes pull-req to Linus.

Regards,

Hans


> 
> Shyam Sundar S K (5):
>   platform/x86/amd/pmf: Add helper routine to update SPS thermals
>   platform/x86/amd/pmf: Add helper routine to check pprof is balanced
>   platform/x86/amd/pmf: update to auto-mode limits only after AMT event
>   platform/x86/amd/pmf: Fix to update SPS default pprof thermals
>   platform/x86/amd/pmf: Fix to update SPS thermals when power supply
>     change
> 
>  drivers/platform/x86/amd/pmf/auto-mode.c |  9 +-------
>  drivers/platform/x86/amd/pmf/cnqf.c      | 14 +++++-------
>  drivers/platform/x86/amd/pmf/core.c      | 23 +++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h       |  3 +++
>  drivers/platform/x86/amd/pmf/sps.c       | 28 +++++++++++++++++++-----
>  5 files changed, 54 insertions(+), 23 deletions(-)
> 

