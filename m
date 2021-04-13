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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EBDC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 08:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B49B61222
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 08:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242220AbhDMIPt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Apr 2021 04:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31716 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238999AbhDMIPq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Apr 2021 04:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618301726;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nTFiVrT0GgD5PF9g9cQQkkjhncBa1KbZqSegCvRQvn4=;
        b=ar0ktMVuWpiwvxzushO6MIOaH7s1FVMoTyfagDo7+VVnpBRZ7ColTNPR0MFwpCYubhP8Sm
        guSvdHTgDvp6SmaOMf7n2I+FvtUz+19901m9dY+MnJ7opkF3sj4GLEfUYqifX84A0hZ7Wn
        gDa4NUuiI8g6zLrwix12nl8LYThWxaM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-NWhDjqBiNYOHVUxo5RzwCw-1; Tue, 13 Apr 2021 04:15:24 -0400
X-MC-Unique: NWhDjqBiNYOHVUxo5RzwCw-1
Received: by mail-ej1-f69.google.com with SMTP id p11so4761138eju.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Apr 2021 01:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nTFiVrT0GgD5PF9g9cQQkkjhncBa1KbZqSegCvRQvn4=;
        b=P7xB5/lmPwDd8X8EsQIyCwMgXY66C2eJnXL1ODs3VkhoRG1uK6GBdVtf4ATlA0JDm9
         UT1jqfPifOzy1/UiLVuIRi7Zlq8PRXMw0en1zl7QItPIkO9KtH+IXDBjsaHD+6lh6y2t
         8bj1BAXwuwZGVZexcJ3imVWheGvhcKrzmK4raD7PSenFtehXV82E7cLYebWOE4F7xZJf
         Qe0WKFBI6r7X7jX2e8Lm0bicJs0+jRpPjKHAZVZ/5T0+I64Q9nkRhbfpJrcHwrvoF3Gw
         b2Cokd4QL7EWpqLsbJFvsu8ovOO2BjUuNnngE/qMXdTBS4Yheq68VytfjCxPWxwoDddE
         kASA==
X-Gm-Message-State: AOAM530Zhr6WATPdjP3dwUVv1HzuHZedCagsGf2aSJjHD+bHGIe9Pz7l
        8OVLNq6DiRqRhGg8eLl3Rs4VKWmZVXM6rNzyE/k2wwM2FhEU7Me1qdQebeJW9jeJj6jce+ndHtu
        iawh3XB96Y2TzE3RklaBY1D77WPcwUVXPCQ==
X-Received: by 2002:a05:6402:397:: with SMTP id o23mr19472031edv.337.1618301723431;
        Tue, 13 Apr 2021 01:15:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbPHudOXUmsNugaD59P5i3wwKB0R8vC8IfvhLAFrMijrE1tBnQX1luZYokPoXHvmhSv5ej6Q==
X-Received: by 2002:a05:6402:397:: with SMTP id o23mr19472018edv.337.1618301723306;
        Tue, 13 Apr 2021 01:15:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a24sm5082808ejr.58.2021.04.13.01.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:15:22 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: pmc_atom: Match all Beckhoff Automation
 baytrail boards with critclk_systems DMI table
To:     Steffen Dirkwinkel <linux-kernel-dev@beckhoff.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
References: <CAHp75VeTK9TstuRCqOkVit9U7sV7TA_xcTQ1yZPGfLdZSt7_Gg@mail.gmail.com>
 <20210412133006.397679-1-linux-kernel-dev@beckhoff.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <99cf068d-1ead-e3a2-124e-1db4025afdc4@redhat.com>
Date:   Tue, 13 Apr 2021 10:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412133006.397679-1-linux-kernel-dev@beckhoff.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/12/21 3:30 PM, Steffen Dirkwinkel wrote:
> From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> 
> pmc_plt_clk* clocks are used for ethernet controllers, so need to stay
> turned on. This adds the affected board family to critclk_systems DMI
> table, so the clocks are marked as CLK_CRITICAL and not turned off.
> 
> This replaces the previously listed boards with a match for the whole
> device family CBxx63. CBxx63 matches only baytrail devices.
> There are new affected boards that would otherwise need to be listed.
> There are unaffected boards in the family, but having the clocks
> turned on is not an issue.
> 
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>

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
>  drivers/platform/x86/pmc_atom.c | 28 ++--------------------------
>  1 file changed, 2 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index ca684ed760d1..a9d2a4b98e57 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -393,34 +393,10 @@ static const struct dmi_system_id critclk_systems[] = {
>  	},
>  	{
>  		/* pmc_plt_clk* - are used for ethernet controllers */
> -		.ident = "Beckhoff CB3163",
> +		.ident = "Beckhoff Baytrail",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
> -			DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
> -		},
> -	},
> -	{
> -		/* pmc_plt_clk* - are used for ethernet controllers */
> -		.ident = "Beckhoff CB4063",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
> -			DMI_MATCH(DMI_BOARD_NAME, "CB4063"),
> -		},
> -	},
> -	{
> -		/* pmc_plt_clk* - are used for ethernet controllers */
> -		.ident = "Beckhoff CB6263",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
> -			DMI_MATCH(DMI_BOARD_NAME, "CB6263"),
> -		},
> -	},
> -	{
> -		/* pmc_plt_clk* - are used for ethernet controllers */
> -		.ident = "Beckhoff CB6363",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
> -			DMI_MATCH(DMI_BOARD_NAME, "CB6363"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "CBxx63"),
>  		},
>  	},
>  	{
> 

