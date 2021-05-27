Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A0FC47089
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 940EE613DD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 09:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbhE0JZK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 05:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59360 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235559AbhE0JZK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 05:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622107416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u/jxxyRApH7aRU/uOFFHnJ9R4si2NeFb5W7OXIxVnqE=;
        b=cbio2MJR7okKw156jUcFZWXio2e9VcSXoQX7fFxWX09jW90f+WdJSjFVh13DcdHtrTvz9Z
        dRk8oc6RD1uIL3y8WB1gCr3MZWmLRzKlzQBn2rJ6uLZt5631XoeYh90PwoutvHIHnN4QAz
        NbCedrlURzOAeMK3mBBoVS8HOwCvuQo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-TQcjSCXDME-U7PlTeE2qYQ-1; Thu, 27 May 2021 05:23:34 -0400
X-MC-Unique: TQcjSCXDME-U7PlTeE2qYQ-1
Received: by mail-ej1-f69.google.com with SMTP id dt6-20020a170906b786b02903dc2a6918d6so1424001ejb.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 02:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u/jxxyRApH7aRU/uOFFHnJ9R4si2NeFb5W7OXIxVnqE=;
        b=ptiDR60M6TYlwgcr2KPsZ8ruJxZuDBtZZop5A+OQ8FCKCnxMfv2P2KE23MHGSKDe4G
         0NRIa34gPZjvTaKdVw4+ow6p7aITtUuB/Nf+WukfPr0qDL0M6/nYpVDJuphFvxI8ITwG
         CLP5/w4N+tgI+YOmYgEECdEbEXygIT51ug8IfseqYKDkssxaxlzU3lJ/QVv+x1bEivrR
         8fnj4dvfL6i0a5iqc8Byvm7ZcHeBTAR9UxwlWesB1HEDyWeFmR35lziR0NW7nCQAGF4W
         oO72vMUB/fDd4RSIz/KF84Z5cWtK0rNFwoloZXLjR2h7E73EDZ9j+DOxPgYFsVz4Qy7N
         SpVA==
X-Gm-Message-State: AOAM532LzUjNmwTJhOgLAzBB1QQrE7WQY22hzhwKAHPjqdRp+RcxSsiH
        VUMfCd+mJjsm/E7d2Z4psjtfxY+hKatzv4U6+s0j8mVCGE96iXICMUoN8G7O7nB9fcFZwVglWzg
        GkzPlLAYuGPJZrAUWgIRVXjbYgy07qlvOBA==
X-Received: by 2002:a17:906:5210:: with SMTP id g16mr2848884ejm.116.1622107413388;
        Thu, 27 May 2021 02:23:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcjpCut/sI96DejpRN+VAuRaAHUFFepAK5jt0WONw18JAs+EBp7IO2oczxNea4slk7KA0wjg==
X-Received: by 2002:a17:906:5210:: with SMTP id g16mr2848872ejm.116.1622107413249;
        Thu, 27 May 2021 02:23:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f18sm705138ejz.119.2021.05.27.02.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 02:23:32 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add X1 Carbon Gen 9 second
 fan support
To:     Til Jasper Ullrich <tju@tju.me>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     Mark Gross <mgross@linux.intel.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210525150950.14805-1-tju@tju.me>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7a568685-9849-7642-c193-14e3bfc8cf77@redhat.com>
Date:   Thu, 27 May 2021 11:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525150950.14805-1-tju@tju.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/25/21 5:09 PM, Til Jasper Ullrich wrote:
> The X1 Carbon Gen 9 uses two fans instead of one like the previous
> generation. This adds support for the second fan. It has been tested
> on my X1 Carbon Gen 9 (20XXS00100) and works fine.
> 
> Signed-off-by: Til Jasper Ullrich <tju@tju.me>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll also cherry-pick this into the fixes branch so that it will
be included in my next pdx86/fixes pull-req for 5.13.

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
> index dd60c9397d35..edd71e744d27 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8853,6 +8853,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
>  	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
>  	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
> +	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
>  };
> 
>  static int __init fan_init(struct ibm_init_struct *iibm)
> --
> 2.31.1
> 

