Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E81C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 09:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90A712339D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 09:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbhAMJ11 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 04:27:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27926 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726709AbhAMJ10 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 04:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610529960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vhGBheygAegbfi9rXHPYkyAW71b1XQ8FOLJsWiApa9k=;
        b=NHoaDFHQAZVPxAeGifRajypNVCFEHqKac10WsgsNR08D9+ahHZzRTts3ba1eB4gporlftP
        YxOCcNFpKGw3JuJxzGxCHjpC7EY0SKktOtlhiGl0D1TxLbpHSC9BM0zlQCpG081tCKz8zz
        IOdqYbp9QXxXl36EmqXsln72hG1n9r0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-RQqEa_rDN6yM2S_xi_ZP6Q-1; Wed, 13 Jan 2021 04:25:58 -0500
X-MC-Unique: RQqEa_rDN6yM2S_xi_ZP6Q-1
Received: by mail-ej1-f72.google.com with SMTP id u15so653197ejg.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jan 2021 01:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vhGBheygAegbfi9rXHPYkyAW71b1XQ8FOLJsWiApa9k=;
        b=XKO+sj9EGiLhY4OXejkAfaJuxKZbCpwpw/kqxzUzpD+2N7rmv6RNzQbfdM4tKjLOaR
         sG3pwIc7FR1B//63OjLKCOKhUbyQkvWZyRXfWCAg+VgL2qpt20qLCEwQTRTT7mSwAGvg
         oVUhixrusQ3tJM10XsL98Y6GR07zTn6wrrmkiHC6GJKlLrhdV959R+1WN7zuN0w/2YxW
         OEjAnKg4GPFSUXzGIqcXcNmrY6pBsHDQeH8XJeSr/ICGRybP5w86oS7KZhukNstaI1Tn
         HrdBTmviwsh8qkjUH8wamUpXXmkh7vVCgTvNe6ROivNNk0WL2Ak2imWMMftBrQsgBh5C
         /FWA==
X-Gm-Message-State: AOAM530AOZi7kp/cRE3rPQlvE380rLwyXqhwjNUDiCXGL2YyUJoNZfuf
        Wen3Pq8FB+cCgjx4vULam7suT3xLHNQrbuhe0PZJcZ24WoUjdNllTkEtgkBXmqY5qbqF/DEgzCG
        PLqJNNz8jEgeACevCSZrn5EvjWP6tdTWiEw==
X-Received: by 2002:a50:d60f:: with SMTP id x15mr1023696edi.224.1610529957615;
        Wed, 13 Jan 2021 01:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxppPFuiEj429kT4UmRf8AVmVPxSIzK+1V4paib69p0+KuGMTPwkvEoW4ilQaa533kik78OkQ==
X-Received: by 2002:a50:d60f:: with SMTP id x15mr1023686edi.224.1610529957437;
        Wed, 13 Jan 2021 01:25:57 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id m24sm465153ejo.52.2021.01.13.01.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 01:25:56 -0800 (PST)
Subject: Re: [PATCH][next] platform/surface: fix potential integer overflow on
 shift of a int
To:     Colin King <colin.king@canonical.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210111144648.20498-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e4092c8d-8857-ad95-065b-f72e774dfbb6@redhat.com>
Date:   Wed, 13 Jan 2021 10:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111144648.20498-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/21 3:46 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
> arithmetic and then passed as a 64 bit function argument. In the case where
> func is 32 or more this can lead to an oveflow.  Avoid this by shifting
> using the BIT_ULL macro instead.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: fc00bc8ac1da ("platform/surface: Add Surface ACPI Notify driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

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
>  drivers/platform/surface/surface_acpi_notify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
> index 8cd67a669c86..ef9c1f8e8336 100644
> --- a/drivers/platform/surface/surface_acpi_notify.c
> +++ b/drivers/platform/surface/surface_acpi_notify.c
> @@ -188,7 +188,7 @@ static int san_acpi_notify_event(struct device *dev, u64 func,
>  	union acpi_object *obj;
>  	int status = 0;
>  
> -	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, 1 << func))
> +	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, BIT_ULL(func)))
>  		return 0;
>  
>  	dev_dbg(dev, "notify event %#04llx\n", func);
> 

