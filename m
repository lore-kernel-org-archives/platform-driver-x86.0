Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D478C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 11:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6923664F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 11:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbhCDLwR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 06:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39307 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236821AbhCDLwO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 06:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614858648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=99MUBK1PvmbjadqNyXoXltNHyy9tKF3v5o2dtu4z4Lg=;
        b=AoXX3K4uddLaiwg+8poSJA/bxjCq8IICaHhh0IsGmmcvoTsMz/t27z7DznLYjy6uZvkY6O
        sROe9hKu23E2DqKOwPOmxBTs7Ak8BTLb1JQliHkUoe3DQOTYipocBF2E3VKoDmBJFWWbrY
        jJ0T6EL2NQoVKp3IcQialGkGOS3C6/Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-G9d5MeUKOf-nPd5XQAcOpA-1; Thu, 04 Mar 2021 06:50:45 -0500
X-MC-Unique: G9d5MeUKOf-nPd5XQAcOpA-1
Received: by mail-ej1-f72.google.com with SMTP id di5so3490033ejc.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 03:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=99MUBK1PvmbjadqNyXoXltNHyy9tKF3v5o2dtu4z4Lg=;
        b=TtCx7QgXVekbAZrTve17kPv7Q9sUv4s4KRYqgVgFieKl8ZSKH7vZzWqwqlJEORM7MU
         tHvpgPRDgY/A47caCQXAkTZnzvuSsASX0PoQfY4S3ON+6yjQlIUtLG4iyAAj8knXJSYW
         uSKydCbyPaHCC33uJwpOhAbQTVeO+DdAwNYiw89wbHj3ggYnrIt6hiU2m2ao6AHXj6ep
         Cn9lFgbtJIMVBUNtGDp+NYj+ERLNfAjauCGjTwSWnxArylVW2+kId4aFAE3CWT35OOVD
         EWDRT3c9B3GPLJiMi9b9S/C3bSP5y7Fgq1+mnIT1dcSYOXjuthc70qRG0Zbpbd/7ZTtZ
         HDlA==
X-Gm-Message-State: AOAM531E95aHx3zTW6aHzNGXcG+3Dc4sRH33ZuSKqt1ahqiVgZQLPqpP
        rkWQdg99Kqrf7Q51HwE7V8cOVy5R/w7SNkna+Do+21uwHOauxJrW/2vxXBU1gRFYZadIjiymXb9
        EL/FW9BYVjRkB3iv82qh7vNTam+hdFlhWEA==
X-Received: by 2002:a17:906:39a:: with SMTP id b26mr3876991eja.158.1614858643826;
        Thu, 04 Mar 2021 03:50:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfPEbs7ly83kta4b31zv6GGKKL5nQTg/yi2k8E3urFCl9bzq2wVpVHXZGvfGATJ5Hiw1Syfg==
X-Received: by 2002:a17:906:39a:: with SMTP id b26mr3876983eja.158.1614858643718;
        Thu, 04 Mar 2021 03:50:43 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t17sm6439035edr.36.2021.03.04.03.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 03:50:43 -0800 (PST)
Subject: Re: [PATCH] platform/x86: fix typo in Kconfig
To:     =?UTF-8?Q?Petr_Van=c4=9bk?= <arkamar@atlas.cz>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <YCw6zavnfeHRGWgr@arkam>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b808963a-e02b-866d-cf53-e181451b65aa@redhat.com>
Date:   Thu, 4 Mar 2021 12:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCw6zavnfeHRGWgr@arkam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/16/21 10:36 PM, Petr Vaněk wrote:
> uses by -> used by
> 
> Signed-off-by: Petr Vaněk <arkamar@atlas.cz>

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
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 91e6176cdfbd..94f2f05bc133 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1372,7 +1372,7 @@ config INTEL_PMT_CLASS
>  	tristate "Intel Platform Monitoring Technology (PMT) Class driver"
>  	help
>  	  The Intel Platform Monitoring Technology (PMT) class driver provides
> -	  the basic sysfs interface and file hierarchy uses by PMT devices.
> +	  the basic sysfs interface and file hierarchy used by PMT devices.
>  
>  	  For more information, see:
>  	  <file:Documentation/ABI/testing/sysfs-class-intel_pmt>
> 

