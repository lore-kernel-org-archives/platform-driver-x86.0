Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8357EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 14:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 596AB64F59
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 14:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhCDOhI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 09:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50043 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231970AbhCDOgu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 09:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614868525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wQdAv9dqu3ihNNDosTCrUef7IjrV7jjJSl91dhkxJnE=;
        b=aSXej+UZDBgG+00do4GqOcviAlrQl2p85uQ3jm5BOsOQ2VblYhmI+/1fQ/SwolVXjO8NiC
        2qmLLYX03prtUWGR4VIXeFUNYeodzmpy+3c4NYo0rjaEzvSB/Bo8guEzKPZ6JDwQW0N98C
        JD/UODyDpD9T8SLn92byzRrLY82upOM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-0Sxyy4l_NOmbTkyqucR1UQ-1; Thu, 04 Mar 2021 09:35:23 -0500
X-MC-Unique: 0Sxyy4l_NOmbTkyqucR1UQ-1
Received: by mail-ej1-f69.google.com with SMTP id v10so12188764ejh.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 06:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wQdAv9dqu3ihNNDosTCrUef7IjrV7jjJSl91dhkxJnE=;
        b=Vtw6il0mH0vg9lEcsyP2fhwDRAcCZtAAndh1NAi6Rg5nA3hUTnTrX0sRLRxl9j8GS4
         t0zB6jRCdJzFKDWx+9hKUUe0U4IQDYejvIYdBZ3Q9O2bqMvReW7fqZZmnFLHp9vFY4iA
         6zDvtosyWprsaxurir6ADySgESJdFFMytp9FVJ7iW4T9hB5KXrspSLoxXKxvrtiyAC7m
         biFKd+4yzI4ZBa2pFFk4E4cwLdlgbAE6akzZTy915iSWv5VzU/F9os2ztmqM2gyBPwnb
         WB/M7IB8Zg09GgqwE/6KLcJ+ADO0ePnlXacia0DIi7Wpfpa9abLvpnSqfy9e7jYRNayH
         k22Q==
X-Gm-Message-State: AOAM532qlxhEI7yxPumMxkBLwrOrepTiqVY8NxhJ8/erGRq6DyPsHQw/
        +cwqqWfhrSxSNLogYmTij+ULlYGEaaBUfQdaVpDn3NRPU6CwQpQAs76oVNUSHLn31/d5WDt07Pr
        NnH3tG6tl8p1ZdWgFC8glYY3t8WPJvpUsrw==
X-Received: by 2002:a17:906:1457:: with SMTP id q23mr4508712ejc.43.1614868521215;
        Thu, 04 Mar 2021 06:35:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/m/4pak71VMA+lhDsQUxoTU6Jn9KvocqxwMH+AgtYyMjtnCXrXhDbUsBh951EbKBIsrbWhA==
X-Received: by 2002:a17:906:1457:: with SMTP id q23mr4508682ejc.43.1614868520976;
        Thu, 04 Mar 2021 06:35:20 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n25sm2592851edq.55.2021.03.04.06.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 06:35:20 -0800 (PST)
Subject: Re: [PATCH] WMI: asus: Reduce G14 and G15 match to min product name
To:     Luke D Jones <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc:     corentin.chary@gmail.com, mgross@linux.intel.com,
        acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20210227102010.65429-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <94e01965-1511-c687-1c20-fe1f01041ac3@redhat.com>
Date:   Thu, 4 Mar 2021 15:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210227102010.65429-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/27/21 11:20 AM, Luke D Jones wrote:
> This patch reduces the product match for GA401 series laptops to
> the minimum string required.
> 
> The GA401 series of laptops has a lengthy list of product
> variations in the 2020 series and the 2021 series refresh
> is using the same base product ID of GA401.
> 
> The same is also true for the GA502 series, and the new GA503
> series which is added in this patch as a variant of the G15.

Thank you for your patch.

I msut say that I find it very strange that 2021 series laptops need
to use the Asus vendor specific WMI interface for backlight control.

I see that the GA401 GA502 and GA503 models are all models with
AMD 4000/5000 series CPUs + Nvidia 2060 series GPUs.
So I guess it may be possible that this is the right thing
to do, and I do realize that we are already doing this for the
listed models. But it seems weird.

Modern laptops almost always use the native backlight control
build into the drm/kms driver. And in some special cases
(hybrid GPU setups) they might use the good old ACPI-video
interface. But using vendor specific interfaces sounds very
wrong to me. That is something which was typically done on
pre Windows XP era hardware.

Have you tried passing acpi_backlight=video on the kernel commandline?

What is the output of ls /sys/class/backlight before and after this
patch?

What is the output of ls /sys/class/backlight when using
acpi_backlight=video on the kernel commandline?

If the ls output shows multiple interfaces have you tried using all
listed interfaces directly from sysfs / the commandline ?

(perhaps userspace is picking the wrong interface in the case there
are multiple interfaces?)

Note what you are doing now is the equivalent of passing
acpi_backlight=vendor, which again is a weird thing to do on
recent / new hardware.

Also your commit message seems to lack a lot of details like:

1. Do you own an effected or multiple affected models yourself on
which you tested this?

2. Was this tested by others on other models of these series?

3. I assume this was discussed with others in some mailinglist /
forum discussion please provide links to this discussion.

4. Has this been tested with with both the nouveau and the
nvidia binary driver or only with the nvidia binary driver ?

5. What were the symptoms / problems noticed before making this change
and how do things work after making the change?

Regards,

Hans





> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 57 ++++--------------------------
>  1 file changed, 6 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index d41d7ad14be0..f4db67c3eba2 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -427,73 +427,28 @@ static const struct dmi_system_id asus_quirks[] = {
>  	},
>  	{
>  		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA401IH",
> +		.ident = "ASUSTeK COMPUTER INC. GA401",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "GA401"),
>  		},
>  		.driver_data = &quirk_asus_vendor_backlight,
>  	},
>  	{
>  		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA401II",
> +		.ident = "ASUSTeK COMPUTER INC. GA502",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "GA502"),
>  		},
>  		.driver_data = &quirk_asus_vendor_backlight,
>  	},
>  	{
>  		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA401IU",
> +		.ident = "ASUSTeK COMPUTER INC. GA503",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
> -		},
> -		.driver_data = &quirk_asus_vendor_backlight,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA401IV",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
> -		},
> -		.driver_data = &quirk_asus_vendor_backlight,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA401IVC",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
> -		},
> -		.driver_data = &quirk_asus_vendor_backlight,
> -	},
> -		{
> -		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA502II",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
> -		},
> -		.driver_data = &quirk_asus_vendor_backlight,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA502IU",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
> -		},
> -		.driver_data = &quirk_asus_vendor_backlight,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "ASUSTeK COMPUTER INC. GA502IV",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
>  		},
>  		.driver_data = &quirk_asus_vendor_backlight,
>  	},
> 

