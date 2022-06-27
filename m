Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AD6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 14:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236899AbiF0OOO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 10:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236192AbiF0OOI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 10:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A03013EAF
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656339242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BkoEBjpf4dC4bT0CRNmuTuH6OiGtrElUnB+fgL5tv1w=;
        b=OOPVVSGSH9nPKeMgO1gGmu2SC/Y7lNW52Hgb1NELzl8j7PYJziILEmS8CWCLuWZejAMxzg
        K8rZ+qqitjzAORLx/bd0ffpznLNXwApWQod3p1KT90b2UNW1Urbc/s5AYNPIGbDhp4cuCL
        Z2CmpvxWZsmKQHmLEF+0Y6gZIM5sN3c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-aEA-CIOONy-d9TmQXZ3BTQ-1; Mon, 27 Jun 2022 10:13:39 -0400
X-MC-Unique: aEA-CIOONy-d9TmQXZ3BTQ-1
Received: by mail-ej1-f70.google.com with SMTP id sg40-20020a170907a42800b00722faf0aacbso2473038ejc.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BkoEBjpf4dC4bT0CRNmuTuH6OiGtrElUnB+fgL5tv1w=;
        b=pMjgY03ynDb+uxdIMi61qTDCd52+jRzLqssiIVAT9GuXk8OyUk7CPhBZ6tIlzqDZUi
         28QRdwQLnGbmPm7rQjzR/hgAHJDofPjC47fsr9F5XDPF/60X6pFR3jCw6MIx7kKYAIH6
         v1H3RPc1Rg6yc8QkFjNZ2GovQfeADGTFA/hPhEW8wdckDKuhwoTwd/yVPU0qXbADtnLw
         bWBv/wOzq0/NttCXxcS3gcUFxpr5Lh0rhO93aQSmI+lxL5wHi8HTSYSli58AVrOH/A5R
         5PXFUJJlOqphQZsk+xzMJOb1p8qcdrguQKVUIPvH8HZdxZJkFT+XZ/0UDgSlxl2WNGC4
         bgVg==
X-Gm-Message-State: AJIora+WUflZMf6F5RJwyMYubfCASruBZ8hlAJm4t36whjhzLxYy4Lg1
        h6lVKoGt3+C0myQLMiAOZG7OUy8+58qQmMT/QMyfNwzH0ENxu4jJhrAx3Ib5widmjMKVdVvgtfX
        yjZTr2ttuzgJNxK5+MJR5ssTT1dfE2XqOpg==
X-Received: by 2002:a05:6402:4306:b0:435:a1c9:4272 with SMTP id m6-20020a056402430600b00435a1c94272mr16803263edc.205.1656339210095;
        Mon, 27 Jun 2022 07:13:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snjn9bpUg4oijEdnTe3oP5NPYHb8Nds3ePqqDjTKjl4T/Mo8CV8fIE52bWqHFtj8OnWA76Rg==
X-Received: by 2002:a05:6402:4306:b0:435:a1c9:4272 with SMTP id m6-20020a056402430600b00435a1c94272mr16803241edc.205.1656339209911;
        Mon, 27 Jun 2022 07:13:29 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709062ec600b00711d88ae162sm5126405eji.24.2022.06.27.07.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:13:29 -0700 (PDT)
Message-ID: <c58d2426-85de-d968-3206-d8c334cf78b5@redhat.com>
Date:   Mon, 27 Jun 2022 16:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] platform: x86: ideapad-laptop: Add allow_v4_dytc module
 parameter
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220623115914.103001-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220623115914.103001-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/23/22 13:59, Hans de Goede wrote:
> Add an allow_v4_dytc module parameter to allow users to easily test if
> DYTC version 4 platform-profiles work on their laptop.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=213297
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this patch to my review-hans branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/ideapad-laptop.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 3ccb7b71dfb1..71f4b59eed4b 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -152,6 +152,10 @@ static bool no_bt_rfkill;
>  module_param(no_bt_rfkill, bool, 0444);
>  MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
>  
> +static bool allow_v4_dytc;
> +module_param(allow_v4_dytc, bool, 0444);
> +MODULE_PARM_DESC(allow_v4_dytc, "Enable DYTC version 4 platform-profile support.");
> +
>  /*
>   * ACPI Helpers
>   */
> @@ -901,13 +905,16 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  
>  	dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
>  
> -	if (dytc_version < 5) {
> -		if (dytc_version < 4 || !dmi_check_system(ideapad_dytc_v4_allow_table)) {
> -			dev_info(&priv->platform_device->dev,
> -				 "DYTC_VERSION is less than 4 or is not allowed: %d\n",
> -				 dytc_version);
> -			return -ENODEV;
> -		}
> +	if (dytc_version < 4) {
> +		dev_info(&priv->platform_device->dev, "DYTC_VERSION < 4 is not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	if (dytc_version < 5 &&
> +	    !(allow_v4_dytc || dmi_check_system(ideapad_dytc_v4_allow_table))) {
> +		dev_info(&priv->platform_device->dev,
> +			 "DYTC_VERSION 4 support may not work. Pass ideapad_laptop.allow_v4_dytc=Y on the kernel commandline to enable\n");
> +		return -ENODEV;
>  	}
>  
>  	priv->dytc = kzalloc(sizeof(*priv->dytc), GFP_KERNEL);

