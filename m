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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1FBC64E75
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 14:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75BBA20679
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 14:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZyRZS4P1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390791AbgKZOY4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Nov 2020 09:24:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48277 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390200AbgKZOY4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Nov 2020 09:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606400694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BbHoCyvudt62ZkkISRhenW8Ojg8BXwiU9Z0Idwssffg=;
        b=ZyRZS4P15aeD8wzbMXSHugjzLLtupARuKxX7X9TeChxpuoFPI/7PCs+5laFFYfdQ3iQLeN
        NFc2rmLUJzHxfWOvkzll+IhMoCdCxQKV2GzpbFGYf5que8ok1PpRvhSXoIoWr6X2uO8D47
        LMYJMZa+ndRB9zDXvm66VFTly3rv8UU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-SE768DxDPdCqVjf-Q9yMDg-1; Thu, 26 Nov 2020 09:24:52 -0500
X-MC-Unique: SE768DxDPdCqVjf-Q9yMDg-1
Received: by mail-ed1-f71.google.com with SMTP id dj19so1153975edb.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2020 06:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BbHoCyvudt62ZkkISRhenW8Ojg8BXwiU9Z0Idwssffg=;
        b=Xl/521lqVY9FyaYly24HlREZEwN8trnl2T/PHAjmZCdIU5hKbXiHKHDaWBddwUh++Z
         XBPyf4SKFr7ByzUhf/E+7QnlYmhSUAhfoVKUkNNeJC6ST9DGiJ6rJjnIBu6263La+Hq4
         v2Lwk/nBFbYpp0Vz0OcFOY5bEzsNUMgt0XFO8QdSqCspEcYuh98Hk1QUY8rgVvC53KoT
         NZQ+6XsJciYduosv/0p0K2Uwy61rN3OmRNC8IF2YFjiOWOkGik2ifN+ym3FPKnScGPQ3
         Ov73F4nSb1IaSVmgQDbDnzZswICZWRkdO9PFvDGc9YpqFWQ4+DVgF5hHMuKTrtUXIUyX
         a10w==
X-Gm-Message-State: AOAM533RR861hPFXJFmCH3vzMEwya9Tk9goTboFdBhwEYI9OvC8A1mxl
        YAPfH1fRWb35hmURlaJSbPbUT24VpITbvr4zPCN6VQVsjn9As9ScnzdZ3LD1QQJI8gOZV5dh9dX
        kaM9mNQPhBmCM+MHl3wMDceIMftAUiZuYVg==
X-Received: by 2002:a17:906:3b5b:: with SMTP id h27mr2835136ejf.450.1606400691780;
        Thu, 26 Nov 2020 06:24:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwujo+TSYRx3Wxrd8lMKSCm/JrLVj3wVB3r8fXh8O49dG945RciIJn0TxlJz4kZtMwU8JXZPg==
X-Received: by 2002:a17:906:3b5b:: with SMTP id h27mr2835128ejf.450.1606400691586;
        Thu, 26 Nov 2020 06:24:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id lm11sm2340921ejb.52.2020.11.26.06.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 06:24:50 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Whitelist P15 firmware for
 dual fan control
To:     tamiko-ibm-acpi-devel@43-1.org,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Mark Gross <mgross@linux.intel.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Matthias Maier <tamiko@43-1.org>
References: <20201126000416.2459645-1-tamiko-ibm-acpi-devel@43-1.org>
 <20201126000416.2459645-2-tamiko-ibm-acpi-devel@43-1.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a3c31b49-0cd5-9383-9ad6-e65d0f9834aa@redhat.com>
Date:   Thu, 26 Nov 2020 15:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126000416.2459645-2-tamiko-ibm-acpi-devel@43-1.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/26/20 1:04 AM, tamiko-ibm-acpi-devel@43-1.org wrote:
> From: Matthias Maier <tamiko@43-1.org>
> 
> This commit enables dual fan control for the following new Lenovo
> models: P15, P15v.
> 
> Signed-off-by: Matthias Maier <tamiko@43-1.org>

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
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5ad06fd98515..26b1502f9bbe 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8786,6 +8786,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
>  	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
> +	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
>  };
>  
>  static int __init fan_init(struct ibm_init_struct *iibm)
> 

