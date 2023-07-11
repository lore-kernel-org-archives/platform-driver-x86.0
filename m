Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBF6EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 10:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjGKKPJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjGKKPI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 06:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC27139
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 03:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689070459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vrp7jBvZMTad3e0ypLAUKMOFKMx4NxE5sMXy0mC4lrA=;
        b=Ztofd6+POHTKQkZ+dhz8UDY9x7Bo77MtFdoWvqxfEHkxVNlpzdISvBdKJ8SULbVcWHRx4c
        uexzPWMDJi9tJOM0BHyVBIzFiW3WA8+r4eVWtBcQupmz6qmiJW35HG954FZcn+MNYXb0YV
        JsXp0SxxHqI01n6xMQ+Lw0FeKciQp4o=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-wVrAgVfYPJOSWV2GZtL3cg-1; Tue, 11 Jul 2023 06:14:18 -0400
X-MC-Unique: wVrAgVfYPJOSWV2GZtL3cg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fb76659d37so4785581e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 03:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689070456; x=1691662456;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vrp7jBvZMTad3e0ypLAUKMOFKMx4NxE5sMXy0mC4lrA=;
        b=j5tHCoeNbFfBkQryo8mHkz9QZJy8ohjBTTCJj++GXw/+CNOohsMMaY8NqYFlEyi8ko
         rPT4adNFwi8/Ftk4YAnrl0zIpv7+eu/hXoV8wv8fApd3MjfpNZxeWR+EOZpT6AAZ//08
         9RdjyuDzLeMEYukaBk6l9cqB/gxki1yYhJprmqKwchrQTiMfcr6W0BRo8RZrSbLxtzF8
         g2Goys++VhDMV3EFJPLFBrHt4ftsIC5JblVzkS8WM/XKLCXxMdh+mZ2cdiWZBi96Lkdk
         PL6rPSrKH/8pCboiOg4k9u1QcDyVARsEHzMPBjLqew8FPnckOYoTb7fbpvR6mX3OVYeP
         XnAg==
X-Gm-Message-State: ABy/qLZ/LelitegF36MG2hg+ibgEM+8VcowakRV/uDqq547t7cGMsJww
        rw5gmqD6VNd/rnbm/5F5rpK7xuRk8p0EKf2eCIYIjYakAQ1J/DU8LsW092sbiZj+vGGYU4ubnQw
        4Fi7MS8zXqdHawN8DBbhLWu5FZ3MtFftHmoKCfep2dw==
X-Received: by 2002:a05:6512:ac6:b0:4f8:714e:27a8 with SMTP id n6-20020a0565120ac600b004f8714e27a8mr14388572lfu.0.1689070456571;
        Tue, 11 Jul 2023 03:14:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFMhhrzhg90Yeyhl8FZawNmGTNaMb4PEIcTejJScUcp9Zb61c5cekmCiMJFVHxXzvI0pH6jTA==
X-Received: by 2002:a05:6512:ac6:b0:4f8:714e:27a8 with SMTP id n6-20020a0565120ac600b004f8714e27a8mr14388546lfu.0.1689070456181;
        Tue, 11 Jul 2023 03:14:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n12-20020aa7c68c000000b0051bf17d7710sm1013569edq.57.2023.07.11.03.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:14:15 -0700 (PDT)
Message-ID: <e1c30d28-97d3-3f4c-d870-08cf5922f417@redhat.com>
Date:   Tue, 11 Jul 2023 12:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Archos
 101 Cesium Educ tablet
Content-Language: en-US, nl
To:     Thomas GENTY <tomlohave@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20230707141425.21473-1-tomlohave@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230707141425.21473-1-tomlohave@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/7/23 16:14, Thomas GENTY wrote:
> Add info for the Archos 101 Cesium Educ tablet
> It was tested using gslx680_ts_acpi module
> PR at https://github.com/onitake/gsl-firmware/pull/210 for the firmware
> 
> Signed-off-by: Thomas GENTY <tomlohave@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Note I do wonder if this tablet can benefit from then following change on top when used with the kernel's builtin silead driver:

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index a5b687eed8f3..5f9ce4960861 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -32,6 +32,7 @@ static const struct property_entry archos_101_cesium_educ_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
 	{ }
 };

I expect this will make the windows logo beneath the touchscreen send meta/super key events when pressed (you can check this with e.g. evtest).

Can you please give this a go ?

Regards,

Hans




> ---
>  drivers/platform/x86/touchscreen_dmi.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 68e66b60445c..a5b687eed8f3 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -26,6 +26,21 @@ struct ts_dmi_data {
>  
>  /* NOTE: Please keep all entries sorted alphabetically */
>  
> +static const struct property_entry archos_101_cesium_educ_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1280),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1850),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data archos_101_cesium_educ_data = {
> +	.acpi_name      = "MSSL1680:00",
> +	.properties     = archos_101_cesium_educ_props,
> +};
> +
>  static const struct property_entry chuwi_hi8_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1665),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> @@ -1047,6 +1062,13 @@ static const struct ts_dmi_data vinga_twizzle_j116_data = {
>  
>  /* NOTE: Please keep this table sorted alphabetically */
>  const struct dmi_system_id touchscreen_dmi_table[] = {
> +	{
> +		/* Archos 101 Cesium Educ */
> +		.driver_data = (void *)&archos_101_cesium_educ_data,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 Cesium Educ"),
> +		},
> +	},
>  	{
>  		/* Chuwi Hi8 */
>  		.driver_data = (void *)&chuwi_hi8_data,

