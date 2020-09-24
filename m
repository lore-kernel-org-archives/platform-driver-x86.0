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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBA5C4346E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58B00206FC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ChMzpcip"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgIXIdU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52611 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726849AbgIXIdT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600936398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0uREMMJg3OpqeRHYfXCwKns1Cwe3KVzVUKbDg59PLXE=;
        b=ChMzpcipmDKZb+f/QrYjtvNk+0wtJ4UqXSrRCjLVhVvOtjjnaqDKXSWceieBMl9cthXqlZ
        Bzl7EDQ4KCU+VIAUCUb0MxpzWIQx/9zw/uc3j1+IrexLa7IYctl3I9WOL62PfLDH/5zC6p
        d+DEF3UtUdUEGKlLmdjcLOalCuVRnQE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-1K1gm1UVNdGtdd2joBktxw-1; Thu, 24 Sep 2020 04:33:15 -0400
X-MC-Unique: 1K1gm1UVNdGtdd2joBktxw-1
Received: by mail-ej1-f71.google.com with SMTP id qn7so1016144ejb.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 01:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0uREMMJg3OpqeRHYfXCwKns1Cwe3KVzVUKbDg59PLXE=;
        b=FpvAxAaP3tyWwr+I13NfvWVBnxjdsjpkwHBLt6evP1Js7THr155nLxi8Lk3qiCe5f1
         9EsLA+ySKvW4Pvmip/m/w3lE37AmdaSHVhTbBsyqjyVu3fOumYtlyEsdxNPLCRxKf0Lp
         xeaHNQkrJp8PF+q4W0qjn4G+wkMzMG4mIjhcRUfLGGIpkOAwcVPq3n2Wy5UaD4vwclh4
         eIuUHKyJrIZdjCDExTlYJneNQ4V9wOMRSnrGohU/48QAOP0tGYPuDIl4AS7b8vT34pw5
         //pXih2uBD126rMnYmynsB3tYNxliIWu902wAzyMndomr8iznYTRGzcTsvMsHF3ULB/g
         pIEw==
X-Gm-Message-State: AOAM530ziM33jzH025e0Zdqj/AJxlfURA/ko9zHsihH/23veuuSDcVfW
        mY3tS3kru0FtmS5wTK2aiyKUUZQRQTB7qCpLz+AmalNH6be96d1hAn2jprbEI2SuzECiBOHckOb
        f9s5w2+qsR7BHKH4w6btU5hnBmNwFDTXFtQ==
X-Received: by 2002:aa7:dd8d:: with SMTP id g13mr3496594edv.324.1600936393658;
        Thu, 24 Sep 2020 01:33:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBDfLCZLG47/3xrjrLUppH7BUSm1loe08xWEkyqQAiesbEBS84IMb5JB3+9uzwEkrlcfuzQA==
X-Received: by 2002:aa7:dd8d:: with SMTP id g13mr3496577edv.324.1600936393455;
        Thu, 24 Sep 2020 01:33:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a26sm1777499ejk.66.2020.09.24.01.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:33:12 -0700 (PDT)
Subject: Re: [PATCH platform-next 1/5] platform/x86: mlx-platform: Remove PSU
 EEPROM configuration
To:     Vadim Pasternak <vadimp@nvidia.com>, andy.shevchenko@gmail.com,
        dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20200923172053.26296-1-vadimp@nvidia.com>
 <20200923172053.26296-2-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <06446a57-6c3a-0267-8c18-0e09acdb3252@redhat.com>
Date:   Thu, 24 Sep 2020 10:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923172053.26296-2-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/20 7:20 PM, Vadim Pasternak wrote:
> Remove PSU EEPROM configuration for systems class equipped with
> Mellanox chip Spectrume-2. Till now all the systems from this class
> used few types of power units, all equipped with EEPROM device with
> address space two bytes. Thus, all these devices have been handled by
> EEPROM driver "24c32".
> There is a new requirement is to support power unit replacement by "off
> the shelf" device, matching electrical required parameters. Such device
> could be equipped with different EEPROM type, which could be one byte
> address space addressing or even could be not equipped with EEPROM.
> In such case "24c32" will not work.
> 
> Fixes: 1bd42d94ccab ("platform/x86: mlx-platform: Add support for new 200G IB and Ethernet systems")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/mlx-platform.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 8cf8c1be2666..e57d2471dfcb 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -329,15 +329,6 @@ static struct i2c_board_info mlxplat_mlxcpld_psu[] = {
>   	},
>   };
>   
> -static struct i2c_board_info mlxplat_mlxcpld_ng_psu[] = {
> -	{
> -		I2C_BOARD_INFO("24c32", 0x51),
> -	},
> -	{
> -		I2C_BOARD_INFO("24c32", 0x50),
> -	},
> -};
> -
>   static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
>   	{
>   		I2C_BOARD_INFO("dps460", 0x59),
> @@ -762,15 +753,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_psu_items_data[] = {
>   		.label = "psu1",
>   		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>   		.mask = BIT(0),
> -		.hpdev.brdinfo = &mlxplat_mlxcpld_ng_psu[0],
> -		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
> +		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
>   	},
>   	{
>   		.label = "psu2",
>   		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
>   		.mask = BIT(1),
> -		.hpdev.brdinfo = &mlxplat_mlxcpld_ng_psu[1],
> -		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
> +		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
>   	},
>   };
>   
> 

