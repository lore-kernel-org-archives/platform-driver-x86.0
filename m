Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422E7C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiG1Sbg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiG1Sbg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 91E826D9D7
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659033092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QhY3ObgcFzWk2BFvDLXSaBECfSBu+CBG1/43F5hyd8c=;
        b=djhr3VsZ6dgNbhiq3Wi48RujcZCxk/tXyFociEheOJ0YG8WX8jhaBvfzw6hYqPZeNQhSDq
        aHeWms6qNYeM38mbsux2npe02yAI9VWJTyTrv4fRrNqlIH9DUhJILRBBRz4byP3VXOHijJ
        sAeI4LnkzUXgeTNAoV9eTXQmPIH7IZw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-khF0i_HFPkuux2x3BTGD_w-1; Thu, 28 Jul 2022 14:31:31 -0400
X-MC-Unique: khF0i_HFPkuux2x3BTGD_w-1
Received: by mail-ej1-f72.google.com with SMTP id hs16-20020a1709073e9000b0072b73a28465so915587ejc.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QhY3ObgcFzWk2BFvDLXSaBECfSBu+CBG1/43F5hyd8c=;
        b=Jcw+XqQYQrr8xZR7G3KhHt/6bUV/F/0mc+TyMNObaiOHpW4qnzZ5bQ36DyU4ICvNXX
         v/2aRnUV8MloYLa+iBBrDuqEbs/4twDVgoonv7zBQWm+L5y2a+abE/CdywIWoYqQ5vqJ
         MGNX1/P7QF8Ox20MpJ81itcI9gQL59Tv/tnjYbEZDwork7GBN0VI+ILuCsUj+d0H7TT0
         ECZZFreW01U9HdJQaB/ucF1Hppe22OvtcG3iMPf7xyPmwDV9rolRbwJx7/1iwdRoW8uF
         ZYzj7Qu8zIcMpKJAhoyXULse5VVinjnH3qXNAP3y5a4XUx28C/RrIlnCzCYtsNkMDqCw
         OH9Q==
X-Gm-Message-State: AJIora/gpv8rEEKp+faK6r2RbBaSrwKZGVIxDkZQ4ITpN4cUPG5yFHTJ
        vI53p2HjiDxu5U3IBWstun9ITfQjoP9fDfrR1mBNqFxxIPWMYBn5FUGOqg65HVdfwlQdW3KUqNe
        g2y5t7Nwi5FtwUMz4tMCRTHfPKW3AzJrHmg==
X-Received: by 2002:a17:907:94ca:b0:72b:8f3e:3be0 with SMTP id dn10-20020a17090794ca00b0072b8f3e3be0mr179599ejc.462.1659033089654;
        Thu, 28 Jul 2022 11:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJB235TPpQNv9e8JQkKUJNSfFDNzHYjRTJcGk43W5BxEYszUWsouNlsn/D31SmMM4cdvfKvw==
X-Received: by 2002:a17:907:94ca:b0:72b:8f3e:3be0 with SMTP id dn10-20020a17090794ca00b0072b8f3e3be0mr179588ejc.462.1659033089441;
        Thu, 28 Jul 2022 11:31:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7d54a000000b0043aa5c2ce17sm1113285edr.35.2022.07.28.11.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 11:31:28 -0700 (PDT)
Message-ID: <cc4f32fe-c28d-afb6-c97f-fb600c210059@redhat.com>
Date:   Thu, 28 Jul 2022 20:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Lex 3I380NX industrial PC to
 critclk_systems DMI table
Content-Language: en-US
To:     Paul Spooren <paul.spooren@rhebo.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Michael_Sch=c3=b6ne?= <michael.schoene@rhebo.com>
References: <20220719124830.2320-1-paul.spooren@rhebo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220719124830.2320-1-paul.spooren@rhebo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/19/22 14:48, Paul Spooren wrote:
> The Lex 3I380NX industrial PC has 4 ethernet controllers on board
> which need pmc_plt_clk0 - 3 to function, add it to the critclk_systems
> DMI table, so that drivers/clk/x86/clk-pmc-atom.c will mark the clocks
> as CLK_CRITICAL and they will not get turned off.
> 
> This commit is nearly redundant to 3d0818f5eba8 ("platform/x86:
> pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table")
> but for the 3I380NX device.
> 
> The original vendor firmware is only available using the WaybackMachine:
> http://www.lex.com.tw/products/3I380NX.html
> 
> Signed-off-by: Michael Schöne <michael.schoene@rhebo.com>
> Signed-off-by: Paul Spooren <paul.spooren@rhebo.com>

Thank you for the patch.

The last week I have received 2 different patches adding
a total of 3 new "Lex BayTrail" entries to critclk_systems[]
on top of the existing 2.

Looking at: https://www.lex.com.tw/products/embedded-ipc-board/
we can see that Lex BayTrail makes many embedded boards with
multiple ethernet boards and none of their products are battery
powered so we don't need to worry (too much) about power consumption
when suspended.

So instead of adding 3 new entries I've written a patch to
simply disable the turning off of the clocks on all
systems which have "Lex BayTrail" as their DMI sys_vendor:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-hans&id=f046d13750b759f090cae13e47cab06b023a700b

I've added a Reported-by tag to give you credit for the work
you have done on this.

I will send this alternative fix to Linus as part of
the other pdx86 patches for 5.21.

Regards,

Hans




> ---
>  drivers/platform/x86/pmc_atom.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index b8b1ed1406de..15973a400e43 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -397,6 +397,15 @@ static const struct dmi_system_id critclk_systems[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
>  		},
>  	},
> +	{
> +		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
> +		.ident = "Lex 3I380NX",
> +		.callback = dmi_callback,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "3I380NX"),
> +		},
> +	},
>  	{
>  		/* pmc_plt_clk* - are used for ethernet controllers */
>  		.ident = "Lex 2I385SW",

