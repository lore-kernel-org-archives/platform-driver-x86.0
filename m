Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C365C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 10:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9B362076E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 10:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6/rsIQ8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgJ2KEn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Oct 2020 06:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54767 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725789AbgJ2KEn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Oct 2020 06:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603965881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Wsea6lI7KZlbuttRrb54ASLPe+z2GQfiPXTwSVGoos=;
        b=K6/rsIQ8uLJz7oey68fSHdrDgqnT+H13svv2rmaGk3N3myxbV/V8C6b2DtvZ4wPPnXpjEM
        YeYF4Fo/empy8j5KYekave1pVmBuLzqQyrVOymJwuGOFsCOL4oz0UiyGQbZyDfYH6WsivD
        JREgiY5gIgDomQBLnkVv14PZtc3yrQc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-92b9E4IbPGicTYdV0ZLOMQ-1; Thu, 29 Oct 2020 06:04:39 -0400
X-MC-Unique: 92b9E4IbPGicTYdV0ZLOMQ-1
Received: by mail-ed1-f69.google.com with SMTP id a73so958609edf.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2020 03:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Wsea6lI7KZlbuttRrb54ASLPe+z2GQfiPXTwSVGoos=;
        b=LHG1GpcoBpT/hB0QRfwQyWP5Q3+5bZUSVe9BxDA0VrKnYaGRpv1x6z0KaBzPLp33VY
         K5o4Ym7Isn7XsRL9I8xMavwRiFj4XbwigykGb8cEiMjNBFksFd8qofu/wVa9PuPaI+4U
         X8h0ms3aTt2RXsq9LcxpOCnJP1qSmUnLuLIq9vfHQx5mabWb4yIGj9nbvPUsQNvDjeO7
         J/U0SETGvonBTe+LCpNYyLIYgpxBLo+QYR62vidRXQf1pHQAdUSM+Eqr7PRJ+J6ZlFJe
         HDBxJ8xf5/vldbd8clQ5ivDhaPiNernyqBXmot7qUcyoMrKsxVaf0HzTcZRdN5g5lzae
         qLBQ==
X-Gm-Message-State: AOAM533IpKEEcnfuXkQs/bzQwPW5DXV+f3EZI3UPnueR5lDJBNzZ6lop
        Nix2SBn9E1oeakr1skE+mDvfnNyNkgo+MHeFYsNXKsCXAIFj66WCr3v3T+KoBCx8gSWMGWZ1bEv
        Uwg3/zY+eOr/Cr2GNglo3umK+hTcyZQt9uw==
X-Received: by 2002:a17:906:3799:: with SMTP id n25mr3179387ejc.6.1603965878211;
        Thu, 29 Oct 2020 03:04:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2v/rHZRlH+fM+PZr3VrbNZQ1O0RHqSbvBNqxokz7pgCJmvesDdNrMzFHhZ+G3yp0yAaDk+w==
X-Received: by 2002:a17:906:3799:: with SMTP id n25mr3179375ejc.6.1603965878044;
        Thu, 29 Oct 2020 03:04:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id q19sm1218091ejz.90.2020.10.29.03.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 03:04:37 -0700 (PDT)
Subject: Re: [PATCH] power: supply: olpc_battery: remove unnecessary
 CONFIG_PM_SLEEP
To:     Coiby Xu <coiby.xu@gmail.com>, Ingo Molnar <mingo@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Andy Shevchenko <andy@infradead.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:X86 PLATFORM DRIVERS - ARCH" 
        <platform-driver-x86@vger.kernel.org>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>
References: <20201029074100.225806-1-coiby.xu@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5350ef53-cf70-c4b6-cdf8-5738e9d4b10a@redhat.com>
Date:   Thu, 29 Oct 2020 11:04:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029074100.225806-1-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 8:41 AM, Coiby Xu wrote:
> SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

No it does not, when CONFIG_PM_SLEEP is not set then the
SET_SYSTEM_SLEEP_PM_OPS macro which SIMPLE_DEV_PM_OPS uses
is a no-op, so nothing will reference xo15_sci_resume leading to
a compiler warning when CONFIG_PM_SLEEP is not set.

You could drop the ifdef and add __maybe_unused to the definition
of xo15_sci_resume, but that feels like needless churn, best to
just keep this as is IMHO.

Also s/CONFIG_PM_CONFIG/CONFIG_PM_SLEEP/ in the commit message.

Regards,

Hans


> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  arch/x86/platform/olpc/olpc-xo15-sci.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/x86/platform/olpc/olpc-xo15-sci.c b/arch/x86/platform/olpc/olpc-xo15-sci.c
> index 85f4638764d6..716eefd735a4 100644
> --- a/arch/x86/platform/olpc/olpc-xo15-sci.c
> +++ b/arch/x86/platform/olpc/olpc-xo15-sci.c
> @@ -192,7 +192,6 @@ static int xo15_sci_remove(struct acpi_device *device)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int xo15_sci_resume(struct device *dev)
>  {
>  	/* Enable all EC events */
> @@ -204,7 +203,6 @@ static int xo15_sci_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static SIMPLE_DEV_PM_OPS(xo15_sci_pm, NULL, xo15_sci_resume);
>  
> 

