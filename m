Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EA7CDB47E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 13:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjJRNhF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 09:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjJRNhE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 09:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF3783
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697636180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CFxEek66TmBnU4D7aOn3ltdI8hm4v3qdqYtDHMh4z5Q=;
        b=Qxeestu/7mCudOXi4f7/HChXwx5KfAdCDXUGXJiYqxfDlnaOFDaCClUx7ucropC/pyEQ/0
        v3p7eRr3qjpyflEdQ2BLyhV3Cxk/qIcxTzGr6syMED7i9aV/W+ROnsBOqhm12P4ohHb4Cl
        QvUglwrXxTsF06vhJokyvaKnxcnddlM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-ugQULVT9NaSg4xJ4yOgFxQ-1; Wed, 18 Oct 2023 09:36:07 -0400
X-MC-Unique: ugQULVT9NaSg4xJ4yOgFxQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ae0bf9c0b4so518771166b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697636164; x=1698240964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFxEek66TmBnU4D7aOn3ltdI8hm4v3qdqYtDHMh4z5Q=;
        b=eJeSDstaz44MOB2oB+R5ngxXeYLIqWE5/F3eNz/tkUzkvW7bJeXqkschbw8DMd7Vh7
         V3zsGsr/NFLzy2K53Aw5ecvEpIr7xrDbgFDOaQVq2veHP4w/TBF+doJnMS8uM7qL+qd8
         A1FMddUe6S8b23c71zXr2oKGHbpBnDEmb7vw5aWWUGv3ze+akYLaNLwW35Et2javDiXl
         pcSUgVQMBsm0Lds7MO0D/L62RazDD9fgrUTNxcTRFeysTsGZZ6zysswf7/yJMgrGqI+N
         pBOuvrzUqx7WAV1zensbnR/bJKKmW0oX2j5N6Unri4PQxM3SBliSQdwWgH7HaGvNe5a7
         Vn5A==
X-Gm-Message-State: AOJu0YxcrCdJtDtGxhcwjLBkr/zzHPMnZnE1QS8W1cS5PAYu/1G5GWgI
        wbq9VITxY0XePz7kGipn4s6UJbZET0w1T0+rRqW+LvkL5K1W5X8N5kyRHzDwbnIOEZ1CCVRKaXt
        2VbzCRTetRsROpb9jd7/xL31d4pTnOZYCZg==
X-Received: by 2002:a17:906:6a1f:b0:9be:6410:b3c0 with SMTP id qw31-20020a1709066a1f00b009be6410b3c0mr4829379ejc.33.1697636164606;
        Wed, 18 Oct 2023 06:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4MXXgSxqfNU4AL1K5JcgU2UMbkRPpnZwqRG2IYnnUht3uoeIS7WTwywbb6MhvSErUKvEorQ==
X-Received: by 2002:a17:906:6a1f:b0:9be:6410:b3c0 with SMTP id qw31-20020a1709066a1f00b009be6410b3c0mr4829364ejc.33.1697636164277;
        Wed, 18 Oct 2023 06:36:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j8-20020a1709064b4800b009a1a653770bsm1681253ejv.87.2023.10.18.06.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 06:36:03 -0700 (PDT)
Message-ID: <c71ac711-087c-019a-0c3e-49f6a52ab2e7@redhat.com>
Date:   Wed, 18 Oct 2023 15:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] apple-gmux: Hard Code max brightness for MMIO gmux
Content-Language: en-US, nl
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Garg <gargaditya08@live.com>,
        Aun-Ali Zaidi <admin@kodeit.net>,
        Kerem Karabay <kekrby@gmail.com>,
        Karsten Leipold <poldi@dfn.de>
References: <20231017111444.19304-2-orlandoch.dev@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231017111444.19304-2-orlandoch.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/17/23 13:14, Orlando Chamberlain wrote:
> The data in the max brightness port for iMacs with MMIO gmux incorrectly
> reports 0x03ff, but it should be 0xffff. As all other MMIO gmux models
> have 0xffff, hard code this for all MMIO gmux's so they all have the
> proper brightness range accessible.
> 
> Reported-by: Karsten Leipold <poldi@dfn.de>
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I have added the following Fixes: tag while merging this:

Fixes: 0c18184de990 ("platform/x86: apple-gmux: support MMIO gmux on T2 Macs")

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/apple-gmux.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index cadbb557a108..1417e230edbd 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -105,6 +105,8 @@ struct apple_gmux_config {
>  #define GMUX_BRIGHTNESS_MASK		0x00ffffff
>  #define GMUX_MAX_BRIGHTNESS		GMUX_BRIGHTNESS_MASK
>  
> +# define MMIO_GMUX_MAX_BRIGHTNESS	0xffff
> +
>  static u8 gmux_pio_read8(struct apple_gmux_data *gmux_data, int port)
>  {
>  	return inb(gmux_data->iostart + port);
> @@ -857,7 +859,17 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_PLATFORM;
> -	props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
> +
> +	/*
> +	 * All MMIO gmux's have 0xffff as max brightness, but some iMacs incorrectly
> +	 * report 0x03ff, despite the firmware being happy to set 0xffff as the brightness
> +	 * at boot. Force 0xffff for all MMIO gmux's so they all have the correct brightness
> +	 * range.
> +	 */
> +	if (type == APPLE_GMUX_TYPE_MMIO)
> +		props.max_brightness = MMIO_GMUX_MAX_BRIGHTNESS;
> +	else
> +		props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
>  
>  #if IS_REACHABLE(CONFIG_ACPI_VIDEO)
>  	register_bdev = acpi_video_get_backlight_type() == acpi_backlight_apple_gmux;

