Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924CCC3A5A7
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 15:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiLHPMT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiLHPMO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 10:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4821498EB2
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670512275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pMbXWoFnDtz3F9v1T4KHhPMeZKRZpcYXC2eRIPU5qHU=;
        b=TlR2Q32neTdDaHVOZTxrTh7IJwqAqTQEu0DVyPJDcKV0fxvNiFRg+SZ/pF8dVZCLSslU+T
        xxKtgeV7fXOVYg37vPnz0S2Gb7J8LOOgBvCQJEE7r5vxmpp/gM7vrfCJyoIJSo3i8tfy7N
        LXPj0KFXvDYgtZOgSmURs12cIiX197o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-b_tQsneYN7-7wGudR0CIRA-1; Thu, 08 Dec 2022 10:11:14 -0500
X-MC-Unique: b_tQsneYN7-7wGudR0CIRA-1
Received: by mail-ed1-f72.google.com with SMTP id y18-20020a056402359200b004635f8b1bfbso1083113edc.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 07:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMbXWoFnDtz3F9v1T4KHhPMeZKRZpcYXC2eRIPU5qHU=;
        b=4ZoHwijCoavRkcc1aEFLEKYQ7OtZ1vRDBLHpsLRioTNKsYgcZBnV5WTy6aRPegmk7R
         tKoeenDu5OCKTcK4WCspGnFrI36U1CBqASpc7wZ+VAeG+q5JUcC5FJkLthkOy67QcvCm
         25+medYt6cUK9EnMzSB84aS98uRDPpTaVvmuOaGd0H4iDak1ZiOttQgYYXU583PA3LgE
         /yi0XL/9MR3qN9pCluzodtUTZi3ciA9OBJM5qd6sv3TsBkPRhxQErVdh7+Bo2JCTeTKy
         YetLYAUOknSd5LfRWkKUAqNEYQ/TwJqQzUcPaJZ1+rZO7xgzT+1isVzNn/q07pUTn2Fs
         f63A==
X-Gm-Message-State: ANoB5pkOD3jpdbt6C3aXcPNV4tOuWtD9utJoSD6JMYsZk2ta5yOYpz3r
        TWFOt+2N9IIX2p8JFiN17ljmGazLYBAJ3rXaKO46+GJe6Cn9dehZHnLEhED82RAMWyrg44isQS9
        uQ77yJD0wWmSKPq7QbARRvqjzUdnrq1zzUA==
X-Received: by 2002:a17:906:c44c:b0:7c1:ee:5bca with SMTP id ck12-20020a170906c44c00b007c100ee5bcamr2099576ejb.73.1670512273091;
        Thu, 08 Dec 2022 07:11:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4bKe6itUe3bMslsx0HruxeBA9+AiLMj78SBwSgJAqWLvd3MQSlPIuBpzsQDQ0Wzqy31fAHYQ==
X-Received: by 2002:a17:906:c44c:b0:7c1:ee:5bca with SMTP id ck12-20020a170906c44c00b007c100ee5bcamr2099565ejb.73.1670512272851;
        Thu, 08 Dec 2022 07:11:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906314a00b007bfc5cbaee8sm9916265eje.17.2022.12.08.07.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 07:11:12 -0800 (PST)
Message-ID: <696fd8c2-5458-96c9-e78d-ffd14dd68510@redhat.com>
Date:   Thu, 8 Dec 2022 16:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Advantech MICA-071
 extra button
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221127221928.123660-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221127221928.123660-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/27/22 23:19, Hans de Goede wrote:
> The Advantech MICA-071 is a standard Windows tablet, but it has an extra
> "quick launch" button which is not described in the ACPI tables in anyway.
> 
> Use the x86-android-tablets infra to create a gpio-button device for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets.c | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 916e37a4f85e..5a7adcc76b1e 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -265,6 +265,56 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
>  	},
>  };
>  
> +/*
> + * Advantech MICA-071
> + * This is a standard Windows tablet, but it has an extra "quick launch" button
> + * which is not described in the ACPI tables in anyway.
> + * Use the x86-android-tablets infra to create a gpio-button device for this.
> + */
> +static struct gpio_keys_button advantech_mica_071_button = {
> +	.code = KEY_PROG1,
> +	/* .gpio gets filled in by advantech_mica_071_init() */
> +	.active_low = true,
> +	.desc = "prog1_key",
> +	.type = EV_KEY,
> +	.wakeup = false,
> +	.debounce_interval = 50,
> +};
> +
> +static const struct gpio_keys_platform_data advantech_mica_071_button_pdata __initconst = {
> +	.buttons = &advantech_mica_071_button,
> +	.nbuttons = 1,
> +	.name = "prog1_key",
> +};
> +
> +static const struct platform_device_info advantech_mica_071_pdevs[] __initconst = {
> +	{
> +		.name = "gpio-keys",
> +		.id = PLATFORM_DEVID_AUTO,
> +		.data = &advantech_mica_071_button_pdata,
> +		.size_data = sizeof(advantech_mica_071_button_pdata),
> +	},
> +};
> +
> +static int __init advantech_mica_071_init(void)
> +{
> +	struct gpio_desc *gpiod;
> +	int ret;
> +
> +	ret = x86_android_tablet_get_gpiod("INT33FC:00", 2, &gpiod);
> +	if (ret < 0)
> +		return ret;
> +	advantech_mica_071_button.gpio = desc_to_gpio(gpiod);
> +
> +	return 0;
> +}
> +
> +static const struct x86_dev_info advantech_mica_071_info __initconst = {
> +	.pdev_info = advantech_mica_071_pdevs,
> +	.pdev_count = ARRAY_SIZE(advantech_mica_071_pdevs),
> +	.init = advantech_mica_071_init,
> +};
> +
>  /* Asus ME176C and TF103C tablets shared data */
>  static struct gpio_keys_button asus_me176c_tf103c_lid = {
>  	.code = SW_LID,
> @@ -1379,6 +1429,14 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
>  };
>  
>  static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
> +	{
> +		/* Advantech MICA-071 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
> +		},
> +		.driver_data = (void *)&advantech_mica_071_info,
> +	},
>  	{
>  		/* Asus MeMO Pad 7 ME176C */
>  		.matches = {

