Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAF0C4346E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFD1923772
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxNJmf/U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgIXId0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44672 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726849AbgIXId0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600936404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ic8cVSgWec/vfFgLd6yS6p5abFqW8v5XYvgrmRJDwbc=;
        b=CxNJmf/UDmJoMznrf2H+ymaGYA4uxTq+2h5dPTn/pDIuNCZYlgUsYoqM6i1swrvNdex5Mt
        rUitxRS3HLaZsz1R/1vuFMJvSZEHxdArWVv9XY0UlRHebnw9XbLObnUz6TXEv1B16Hw/O5
        HnPQQ4A7A/o3ueMHvJEYe8C29FyiAzo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-MqV1e14zPFWGHfSrcjzcEg-1; Thu, 24 Sep 2020 04:33:23 -0400
X-MC-Unique: MqV1e14zPFWGHfSrcjzcEg-1
Received: by mail-ej1-f71.google.com with SMTP id m24so1020807ejr.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 01:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ic8cVSgWec/vfFgLd6yS6p5abFqW8v5XYvgrmRJDwbc=;
        b=bJMyJJOliuBmVmga8a12OyyLoqhnHMpG9gK5He0Oyf9eqs0WE48/I1OjfWN0a6OgPK
         hnJaE85pXRyxAU06Lvlfb6g2oZkW9zL9wr7OJ7IyNkN2xnSbKGn0IAYb9ZMqirC820Pf
         flzVmkO0wvay8inR2dbEz85dCWADbR7YBuchmsGlLo+FdBZTt+MUGaxalLcH1E0Qco0j
         VjkCZgH6dsApDe6n1WG+t3Yn/dEGkxZOTukhQ7CJ2ZsuUmzWE/uxzvGDyWXZNxgOPVuw
         7MXmef5XqhB8iIfclOfqwrz+g/Z196kswqNibnYYbc28vq1TiMxQMJ5Oc2FIlWcAZ0/f
         Lkkw==
X-Gm-Message-State: AOAM530fuutYrzuAZhr4/C1UelMc5LOsWYSp0moqr8jljqNAu+/f11ML
        GYqZSLRBnI2Mpsmm49kZtK/gCtR+uZxKH1yRpGuWyy16XMMuS2MyYhK9ug9gFJ9Q2uiU1rPUxHm
        FHQ+0ZNEm5+PbrxMVtx/fR8HxU3w5DcF5qw==
X-Received: by 2002:a17:906:eb11:: with SMTP id mb17mr3381681ejb.255.1600936401810;
        Thu, 24 Sep 2020 01:33:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMdrypK7ody5eTZmaZlahavyO7kJWixDfiTCY7vjPJC4aCgonE8cNQLBvfBy7wIz69+0xUvg==
X-Received: by 2002:a17:906:eb11:: with SMTP id mb17mr3381668ejb.255.1600936401601;
        Thu, 24 Sep 2020 01:33:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f13sm1873686edn.73.2020.09.24.01.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:33:21 -0700 (PDT)
Subject: Re: [PATCH platform-next 2/5] platform/x86: mlx-platform: Fix
 extended topology configuration for power supply units
To:     Vadim Pasternak <vadimp@nvidia.com>, andy.shevchenko@gmail.com,
        dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20200923172053.26296-1-vadimp@nvidia.com>
 <20200923172053.26296-3-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <742fd7ab-5412-2203-7a2d-3276abdb9444@redhat.com>
Date:   Thu, 24 Sep 2020 10:33:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923172053.26296-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/20 7:20 PM, Vadim Pasternak wrote:
> Fix topology configuration for power supply units in structure
> 'mlxplat_mlxcpld_ext_pwr_items_data', due to hardware change.
> 
> Note: no need to backport the fix, since there is no such hardware yet
> (equipped with four power) at the filed.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>   drivers/platform/x86/mlx-platform.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index e57d2471dfcb..04a745095c37 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -171,7 +171,6 @@
>   #define MLXPLAT_CPLD_NR_NONE			-1
>   #define MLXPLAT_CPLD_PSU_DEFAULT_NR		10
>   #define MLXPLAT_CPLD_PSU_MSNXXXX_NR		4
> -#define MLXPLAT_CPLD_PSU_MSNXXXX_NR2		3
>   #define MLXPLAT_CPLD_FAN1_DEFAULT_NR		11
>   #define MLXPLAT_CPLD_FAN2_DEFAULT_NR		12
>   #define MLXPLAT_CPLD_FAN3_DEFAULT_NR		13
> @@ -338,6 +337,15 @@ static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
>   	},
>   };
>   
> +static struct i2c_board_info mlxplat_mlxcpld_ext_pwr[] = {
> +	{
> +		I2C_BOARD_INFO("dps460", 0x5b),
> +	},
> +	{
> +		I2C_BOARD_INFO("dps460", 0x5a),
> +	},
> +};
> +
>   static struct i2c_board_info mlxplat_mlxcpld_fan[] = {
>   	{
>   		I2C_BOARD_INFO("24c32", 0x50),
> @@ -910,15 +918,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_ext_pwr_items_data[] = {
>   		.label = "pwr3",
>   		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>   		.mask = BIT(2),
> -		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[0],
> -		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR2,
> +		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[0],
> +		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
>   	},
>   	{
>   		.label = "pwr4",
>   		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
>   		.mask = BIT(3),
> -		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[1],
> -		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR2,
> +		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[1],
> +		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
>   	},
>   };
>   
> 

