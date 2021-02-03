Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E85C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0611564F5D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbhBCLFY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:05:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233807AbhBCLFX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 06:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612350237;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eocxpT5m1+YajiYVpzIzTRFU0e+biEBsV6ill4OD5xQ=;
        b=Y3yVgqQqztyV74TfJoUrqcSA101d6a/n2MPkLiFNNBbH6WzEsCjiF2mv3vktO4PA+iy0xi
        KNyyKP34fs7n+ztADqSlfnRLNcQdh2nyTR2q4lPmy6eQKMSXiVjjYrcZJwv5Py1xJKDQLy
        ggnlguNKfY8BY8YK8/raB36RdKB0QbY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-BkEuOpGVMXSKLqE5izhiDQ-1; Wed, 03 Feb 2021 06:03:55 -0500
X-MC-Unique: BkEuOpGVMXSKLqE5izhiDQ-1
Received: by mail-ej1-f72.google.com with SMTP id dc21so11765811ejb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 03:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eocxpT5m1+YajiYVpzIzTRFU0e+biEBsV6ill4OD5xQ=;
        b=eTXU6iIAFpQskuXyCOi0ilI0tOUqBUufrcQFHoA3Y2ZMklUkfC1lNT1igP7hPcUXIR
         WkHhxPXhosZOguLml51sbbNy/npfnYctxVhyWng6JU99XSnk74OraX51EvM0A3POiIKX
         0oyeskQdDTS5RgIawf7BaklWSM68qaf9k6Tfw/kJszTzYMI5NCYgPETunE/YD4Y8+Pcg
         sP1PqLr1+JPelF665810YaOwR3uH4/jBpYb4aMVcr8NebQhpnNwyJd1G7VzKUaRlLQvZ
         KH2J7kAyhXQQGaHfQ6m0aMYUvgrvpF/uienQGUT934JTBFMZdrIje37o1LkVmloa4HVh
         c+EA==
X-Gm-Message-State: AOAM533W67lklYdJjtvvw4PJDGDIJvKHO/RGv03p3S6dwqN6qVdQihQR
        Mk2gwGBPhXKGE+WOT/xT7yf4bccP9y+CcuvjrdS0mFIaR/vHPYPCbdLXtMq13eSGaKmqB87OqrD
        Is9reR7T5jIT4FXA3aQ//QT/l0WdJdQP/MBj0GNmGPJ+xuSXXAS9XJfe7BgLga9Wkl06Dpedxtb
        9nqHW3LisAfw==
X-Received: by 2002:aa7:d754:: with SMTP id a20mr2303812eds.265.1612350234333;
        Wed, 03 Feb 2021 03:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzLGjMtPca4dIKwK8lmiiDVhugpfeIBc83E1iwwKkxE8DoVfi7hzgmxhy4YVVe4XRMTbRMDQ==
X-Received: by 2002:aa7:d754:: with SMTP id a20mr2303794eds.265.1612350234118;
        Wed, 03 Feb 2021 03:03:54 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id hh21sm845834ejb.13.2021.02.03.03.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 03:03:53 -0800 (PST)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Jumper
 EZpad 7 tablet
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20210128113653.5442-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <68eba4d9-4837-01d2-921a-4efda7f85e68@redhat.com>
Date:   Wed, 3 Feb 2021 12:03:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128113653.5442-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 1/28/21 12:36 PM, Hans de Goede wrote:
> Add touchscreen info for the Jumper EZpad 7 tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans branch now, so this should show
up in for-next soon-ish.

Regards,

Hans



> ---
>  drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index c4de932302d6..c44a6e8dceb8 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -382,6 +382,23 @@ static const struct ts_dmi_data jumper_ezpad_6_m4_data = {
>  	.properties	= jumper_ezpad_6_m4_props,
>  };
>  
> +static const struct property_entry jumper_ezpad_7_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 2044),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1526),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-jumper-ezpad-7.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,stuck-controller-bug"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data jumper_ezpad_7_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= jumper_ezpad_7_props,
> +};
> +
>  static const struct property_entry jumper_ezpad_mini3_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-min-x", 23),
>  	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
> @@ -1034,6 +1051,16 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "Jumper8.S106x"),
>  		},
>  	},
> +	{
> +		/* Jumper EZpad 7 */
> +		.driver_data = (void *)&jumper_ezpad_7_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Jumper"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "EZpad"),
> +			/* Jumper12x.WJ2012.bsBKRCP05 with the version dropped */
> +			DMI_MATCH(DMI_BIOS_VERSION, "Jumper12x.WJ2012.bsBKRCP"),
> +		},
> +	},
>  	{
>  		/* Jumper EZpad mini3 */
>  		.driver_data = (void *)&jumper_ezpad_mini3_data,
> 

