Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F31C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 13:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 551B523444
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 13:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgLGNzL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 08:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46520 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725779AbgLGNzJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 08:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607349222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z0LkzQwUfy3VSXbaI0zGos8FMVr/WHmEntut1gHn3+k=;
        b=FwEn1tS0f1hfI8htmFG8+qiX4WmOzQjioopkl7lwE7Sv3VjSp5M2o5MChHtAM41qZoU/of
        Moutn6m015HVWXjtvWwA32PBwxI0n8FM7PMeNFFNNIwEu/LVp5wS792LRb5yVPOKAz2xx+
        zn0te5beBW9XBJECmbGaNAdSaVPAV4w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-VO-9b5bvNeCNF9nqJCc_uA-1; Mon, 07 Dec 2020 08:53:40 -0500
X-MC-Unique: VO-9b5bvNeCNF9nqJCc_uA-1
Received: by mail-ed1-f70.google.com with SMTP id u17so1041887edi.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 05:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z0LkzQwUfy3VSXbaI0zGos8FMVr/WHmEntut1gHn3+k=;
        b=OB3AE2OB2c7fhvCzZezi88a63p3BZ9Bd9lg+fT7K/0PVu75gfsM75aLMoXtQkdppoS
         dNjiLmbwAh47D0tmoDpcrypRfTPJbOLclrjWayLMnhhifBC5T86E/7VTeiZQMaHMjnIx
         Rt1yQfbuIfaov4G6JKcuDq4JepW5fvc5i9iXq3mo5WqYfn5yRddB4WJk5IWOwSDClfT3
         UfORhfPGrMi7Iqi7k+3v81C+ZdPaz9kxFofDwu/JA8I6FrBqAAi+jX3w5kyoc80af0bF
         O+nyWdXK9DLjkxH58n9KLxkhSigw1qARcgJ0sLa9uOuep9b/b3u64qy8T5Rik3xiBxkD
         OCKA==
X-Gm-Message-State: AOAM530UeTJywkfFPNUWyd5sgkNvswcZnpVp8DkagJXTIQDnMOIgiRN1
        yt3meti16PoYvWEHspe4crWxH5wCvUfAvYFAmBcvDUNJSuNoW32HZYDLx+6hJIczdrsua5eh56X
        KODp1OU4qtNmYJaZhJchGzfB5FQ7VRGo3lA==
X-Received: by 2002:a17:906:3949:: with SMTP id g9mr1614656eje.493.1607349219540;
        Mon, 07 Dec 2020 05:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznKUtld+R2eani16aYv7FkTYc+IAEjmmDGmWJ4/zXLR1uBNDrcK65++w70LLXnxfSN1v5fTw==
X-Received: by 2002:a17:906:3949:: with SMTP id g9mr1614646eje.493.1607349219349;
        Mon, 07 Dec 2020 05:53:39 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id p22sm12230242ejx.59.2020.12.07.05.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 05:53:38 -0800 (PST)
Subject: Re: [PATCH] platform/x86: mlx-platform: remove an unused variable
To:     Arnd Bergmann <arnd@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Mark Gross <mgross@linux.intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Shych <michaelsh@mellanox.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20201203223105.1195709-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <64393b7e-ba81-1545-dfe8-bc3567dd534b@redhat.com>
Date:   Mon, 7 Dec 2020 14:53:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203223105.1195709-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/3/20 11:30 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The only reference to the mlxplat_mlxcpld_psu[] array got removed,
> so there is now a warning from clang:
> 
> drivers/platform/x86/mlx-platform.c:322:30: error: variable 'mlxplat_mlxcpld_psu' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
> static struct i2c_board_info mlxplat_mlxcpld_psu[] = {
> 
> Remove the array as well and adapt the ARRAY_SIZE() call
> accordingly.
> 
> Fixes: 912b341585e3 ("platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x platform configuration")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you for your patch.

Note that there are 4 more cases where the foo1 and foo2 in:
.data = foo1 and .count = ARRAY_SIZE(foo2) are not the same.

There are 2 cases where .count is set to ARRAY_SIZE(mlxplat_mlxcpld_pwr)
instead of to ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data)

and there are 2 cases where .count is set to ARRAY_SIZE(mlxplat_mlxcpld_fan)
instead of to ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data)

If one of the MLX people can provide a patch fixing this then that
would be great.

###

I've applied this patch to my review-hans  branch:
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
>  drivers/platform/x86/mlx-platform.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 598f44558764..6a634b72bfc2 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -319,15 +319,6 @@ static struct i2c_mux_reg_platform_data mlxplat_extended_mux_data[] = {
>  };
>  
>  /* Platform hotplug devices */
> -static struct i2c_board_info mlxplat_mlxcpld_psu[] = {
> -	{
> -		I2C_BOARD_INFO("24c02", 0x51),
> -	},
> -	{
> -		I2C_BOARD_INFO("24c02", 0x50),
> -	},
> -};
> -
>  static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
>  	{
>  		I2C_BOARD_INFO("dps460", 0x59),
> @@ -456,7 +447,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_psu),
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> @@ -495,7 +486,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
>  		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
>  		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>  		.mask = MLXPLAT_CPLD_PSU_MASK,
> -		.count = ARRAY_SIZE(mlxplat_mlxcpld_psu),
> +		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
>  		.inversed = 1,
>  		.health = false,
>  	},
> 

