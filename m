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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA435C433E1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B50B4619CE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhCWUK7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 16:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45361 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230173AbhCWUKm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 16:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616530242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O+OqqfO7CDyfJMoaVJ0IR/xIV9jxR6//T/Ib7eDY5S8=;
        b=ge//JV9Yz6bMuDsSeVbakhFRWZ/DCHAMyep/2mSsyDeAReuqFB7gsbF8ra/sKGg8a+HntB
        vSYpzpsW4p+47OJPRLZfcKAlt8k7HKG4tVOpxsYxYwnAglC3uJGlqMR4Lv3Sy4H5Vgu2wm
        MHxYmN6O+6ln4gyeZKLWty8pIfE4/yY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-T8Og162QOUSJsiK9DyPSnA-1; Tue, 23 Mar 2021 16:10:40 -0400
X-MC-Unique: T8Og162QOUSJsiK9DyPSnA-1
Received: by mail-ej1-f69.google.com with SMTP id mj6so1569573ejb.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 13:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O+OqqfO7CDyfJMoaVJ0IR/xIV9jxR6//T/Ib7eDY5S8=;
        b=BSWQwERPgKVLV8mGLmOryWPnksoEO95qNBeiuLCJ0C0gopPWLtRhaMP+e9uj0cwr4h
         /7JnCfAbUIiMLhsnwdtvI5aUzzPoFTxHLrQvZTR8PvZnKMYEImTGbMwZznYDcXZANE73
         8bZeLUEAen4y4QZLIyBgBdmGw5hZQuG7xx1YS5E5ru29ldcAr83EWHklanGirhB4A0G3
         smAavKpZeXJ+vUyDXsb8tQf4ZDR9G8SrtE17beHqeywKui9fzNBbMm3c2AVeXKpZDoLp
         0/j0BvdaJz9oq4i/5nW/RV1ca5eOJtCXI9+wHRJRFUPW1rlE90tYjrkgcRES0q7ej09d
         8jZw==
X-Gm-Message-State: AOAM532wk0uo7AuW1m0emWlbgxpybQkm7RZLxKI4WC40CV0uC0+x5ENo
        67PAPQ9chpCd7+MAEeOfLkGhBtvO2dQzqrbaL/PI6jXrAAC8PMAE7AMhyH0NWEPnUZ+0F7j6K4s
        gyAA/BG177ztx8tYpga7ftPKTG/5YIhe9C0vFPOBZr7NN3y5ffoQ55cuvJsgRHhr+KYr7xNsF96
        mdG4sXZEq6yA==
X-Received: by 2002:a17:907:7699:: with SMTP id jv25mr6300509ejc.363.1616530239125;
        Tue, 23 Mar 2021 13:10:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1pAKJSdPo+K7mA7K3Baq95dGN0ab0qqCbOVK0PObLxRflyvHnqxYYcAmFwY8GurecFxVxrQ==
X-Received: by 2002:a17:907:7699:: with SMTP id jv25mr6300489ejc.363.1616530238921;
        Tue, 23 Mar 2021 13:10:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a17sm11743282ejf.20.2021.03.23.13.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 13:10:38 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Correct minor typo
To:     Esteve Varela Colominas <esteve.varela@gmail.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20210321183512.14551-1-esteve.varela@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <da4f4acf-7d15-aaff-ef67-6c65410518a3@redhat.com>
Date:   Tue, 23 Mar 2021 21:10:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210321183512.14551-1-esteve.varela@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/21 7:35 PM, Esteve Varela Colominas wrote:
> Signed-off-by: Esteve Varela Colominas <esteve.varela@gmail.com>

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
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 09362dd74..f3f7ae6f6 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4086,7 +4086,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  		return true;
>  
>  	case TP_HKEY_EV_KEY_FN_ESC:
> -		/* Get the media key status to foce the status LED to update */
> +		/* Get the media key status to force the status LED to update */
>  		acpi_evalf(hkey_handle, NULL, "GMKS", "v");
>  		*send_acpi_ev = false;
>  		*ignore_acpi_ev = true;
> 

