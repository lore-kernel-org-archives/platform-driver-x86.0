Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11215C433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAEDF64F4D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237122AbhBDQZk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34703 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237997AbhBDQZ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 11:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612455839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6GH/RMJKdRcZGKhwAu0rb2nnGno2HqVqDDSYv114mE=;
        b=GzyRCjYBZPd+u5pTxpYEje19dUby8pmXjrcJ3lIJpiBh5K5aXYbfYjDIMrLCkF1uRDj6A3
        hUA9u+mBVKnABrGNfMLLY4tivq+Mj3vLXlhGOwr3UkZQEpxJqj/pvNGMaSXU0+QWitsJU9
        SdJD2yZAHGVyLXVP2O6xdjAZEPjoVL0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-ehxFv3pCOiCRn6fY6YM5cw-1; Thu, 04 Feb 2021 11:23:58 -0500
X-MC-Unique: ehxFv3pCOiCRn6fY6YM5cw-1
Received: by mail-ed1-f70.google.com with SMTP id t9so3249042edd.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 08:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c6GH/RMJKdRcZGKhwAu0rb2nnGno2HqVqDDSYv114mE=;
        b=odeaMbSPDldYj3V+eKb/p4xXXznIb1RIrVvPRci34skQoJy/JxajeUjigeTKlWh+Ra
         YmsYqsTBj3rEiTmF0Pk5o+0AHYGQQ1/e9Nd/SpcWpHV5UvK7reVEx1rbgtofg9h5xCJh
         EQ+Xec5RCYV4DOrKwDUiBfR3d06eK+ZnRdNh6VrYJO6F4Cq79bc4oC5yQ0xoEb0AovUz
         045cBfg2LGWXbWDb9aUk4MumsBXZKFC5HpOXdTzOGhGdNod/rHoOcXosfH3Dt1PVzyEN
         IhAhWjonIURWpX4B4SkzXRPuPPQ9olcO5JPp5z3VKvc50UOT4LT8zGyuZfPeqxTFXXA+
         SwsQ==
X-Gm-Message-State: AOAM532yt0n5TVTFY/hGBOqgMBJg2X5XS9oOp9ls7x/I10HKmQ4vSyM/
        2eBjRrMf46m3Rbka6syKW505Zt/CAMlVogzfzsTKXvUloRIAc9Cen9LagVrnk0isXhgFOfA4DZd
        rTLTV5wkZxxPchSmrEyHc4R+CQW36lvEybw==
X-Received: by 2002:aa7:c895:: with SMTP id p21mr8685878eds.165.1612455836908;
        Thu, 04 Feb 2021 08:23:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHPlvuWtARA8QC3sBbIxEUwAE4rKNgHRLSm7btlkrSyRCpbmm/Ppq4ovz2kAxFxU1YmQ/oDw==
X-Received: by 2002:aa7:c895:: with SMTP id p21mr8685862eds.165.1612455836732;
        Thu, 04 Feb 2021 08:23:56 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id p16sm2676349edw.44.2021.02.04.08.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 08:23:55 -0800 (PST)
Subject: Re: [PATCH] platform/x86: Kconfig: add missing selects for
 ideapad-laptop
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
References: <20210204142010.356675-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fee5187f-5438-88ff-0974-3a67be294a65@redhat.com>
Date:   Thu, 4 Feb 2021 17:23:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204142010.356675-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/21 3:20 PM, Barnabás Pőcze wrote:
> LED class support is needed by the ideapad-laptop module to compile after
> the referenced commit. Add missing NEW_LEDS and LEDS_CLASS to Kconfig.
> 
> Fixes: 503325f84bc0 ("platform/x86: ideapad-laptop: add keyboard backlight control support")
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

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


> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index cf76e724e8c3..89cc2936f2ef 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -452,6 +452,8 @@ config IDEAPAD_LAPTOP
>  	depends on ACPI_WMI || ACPI_WMI = n
>  	depends on ACPI_PLATFORM_PROFILE
>  	select INPUT_SPARSEKMAP
> +	select NEW_LEDS
> +	select LEDS_CLASS
>  	help
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
> 

