Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE29DC433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:10:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 875FA61132
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhDOJLV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 05:11:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45279 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229494AbhDOJLV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 05:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618477858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HQ9IpsN9CYDunNHAYsi0CM0cb5vQOFFiotjNzj6zJMs=;
        b=K4bsyyiRyC8vpnb25/yH7xNzzMakSQor8vlgG/NiGlZBrGKkeK5ep42Hlem2YFsuSdr2mO
        6hnEXaa/gFB/0qZgDfaNLeHyKV1loqLRLFJOyiuR1M+unZOg1YeaRW/PY9NuoO7AQHBKhU
        D8AB0lfQHQdt7OemLwKNwiLlHgiYIzQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-2agSqdOkMO2oKvHy3OxJjA-1; Thu, 15 Apr 2021 05:10:55 -0400
X-MC-Unique: 2agSqdOkMO2oKvHy3OxJjA-1
Received: by mail-ej1-f70.google.com with SMTP id i10-20020a1709067a4ab029037c5dba8400so704185ejo.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 02:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HQ9IpsN9CYDunNHAYsi0CM0cb5vQOFFiotjNzj6zJMs=;
        b=etNGNnqcKIbwRcYqTJY+rgEU7f/Skcch1xRO5wliM5HW5XEnPEqdFpLRRNaJRZuHDW
         3rwVPc+qDwe86k30V7Hmj3WFPtRiXNXWadKbavxsiX3CJKqt+Tg4LR1YokLJAw7pMVt3
         kpkJabhrqV+rihJub9FVCJs0coDPPo6IkKJoi5aqRoHPeslg2/zh9XxjRLyF9hy+rCX6
         C/nxFP0SXBG/C1Q4GPyeAdhta6wB9rdz7FavToe1XLhELqPBgGsIa3lGuUNtIb+qvZ5g
         i8ekE20+8oK9kRdpOHrLBsKzUDRMUI0uMW1K2EhlmV9CG3vwNsg2BLwO2l5W60VSv1Lq
         NuCg==
X-Gm-Message-State: AOAM532WEGhjzHNeSizZIcZZgnVndXX80Pq7VY8u7TEQYck1eVz2GgeL
        xl5STgjmDU/ItmECYT0QDVFjgWOYw9f3cQBIdGQU2i8mtreZYXYm0pEcyRiBLVHNzJsvAy1+mWv
        88WXZEi4n4oOwXbTICmc3EnhjwgPbrUusMgBxkvC2jD31wE5btJkih43h+euSvH7u5s12eze5k3
        xtETRQitQLHw==
X-Received: by 2002:a17:906:c34d:: with SMTP id ci13mr2285528ejb.430.1618477854436;
        Thu, 15 Apr 2021 02:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9vyfqKMSgH9KYOBEBKBrFVL15j74qkK89LvtrfjkuenpOYLOhLug49eFK1prO6mJdV86tvw==
X-Received: by 2002:a17:906:c34d:: with SMTP id ci13mr2285510ejb.430.1618477854255;
        Thu, 15 Apr 2021 02:10:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id li16sm1434031ejb.101.2021.04.15.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 02:10:53 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add X570 AORUS ELITE
To:     Julian Labus <julian@labus-online.de>,
        platform-driver-x86@vger.kernel.org
References: <20210415074526.1782-1-julian@labus-online.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5c5e6515-ea30-9ab4-5b83-2787785082a2@redhat.com>
Date:   Thu, 15 Apr 2021 11:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415074526.1782-1-julian@labus-online.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/15/21 9:45 AM, Julian Labus wrote:
> Add the X570 AORUS ELITE to gigabyte_wmi_known_working_platforms
> 
> Signed-off-by: Julian Labus <julian@labus-online.de>

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
> 
> I read on phoronix.com that a driver for Gigabyte WMI will be added.
> I gave it a try on my Gigabyte X570 AORUS ELITE with force_load=1 and
> it seem to work fine. lm_sensors shows 6 sensors with reasonable values.
> 
> gigabyte_wmi-virtual-0
> Adapter: Virtual device
> temp1:        +26.0°C  
> temp2:        +30.0°C  
> temp3:        +27.0°C  
> temp4:        +34.0°C  
> temp5:        +29.0°C  
> temp6:        +43.0°C  
> 
> The patch was created against the for-next branch of platform-drivers-x86.git
> 
>  drivers/platform/x86/gigabyte-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index bb1b0b205fa7..e127a2077bbc 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -146,6 +146,10 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
>  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "Z390 I AORUS PRO WIFI-CF"),
>  	}},
> +	{ .matches = {
> +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 AORUS ELITE"),
> +	}},
>  	{ .matches = {
>  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
>  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 I AORUS PRO WIFI"),
> 

