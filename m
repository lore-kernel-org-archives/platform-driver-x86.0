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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5DAC4346E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 951BF2137B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0cSEMZw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbgIXIhB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46103 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727235AbgIXIhB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600936619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ix1BcvqrcwBg5G1HnQZvF9gqZi/jYFx0GxvJ6H7MP0Y=;
        b=X0cSEMZw3P99to/f7+Dy4kgI6zVYrUrPAtCI+3HCE0hVD4OLkaV5VTnI9Z0RkYp5sU6GL2
        1X+XIkucLHDn3waPAu6PIy0s92PGekXmofrw3rcsBXeEudr3DTMEdqh5Zw1w0632iZz5RU
        o5PPatjiKDzEd3MXtKyNylNXMFJpUiU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-FZaPtVx1MQGlTdPS22QLvg-1; Thu, 24 Sep 2020 04:36:58 -0400
X-MC-Unique: FZaPtVx1MQGlTdPS22QLvg-1
Received: by mail-ed1-f69.google.com with SMTP id j1so905099edv.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 01:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ix1BcvqrcwBg5G1HnQZvF9gqZi/jYFx0GxvJ6H7MP0Y=;
        b=YQ0AUPM5VJlPVVEvm4wSNfkFFpL3tD2ldnrHMg23wGAzoNTy5p1kS2c5AuuwSDpz0I
         k2E9I5A10uFvKngR8WfasPiTPUK0yZR/Gq5O7brgL9l90Hc2ZxCM9q3TjxdPOxHR4FWc
         ozj1WSJe1gAq1jlkikooEx6poNr4TDtiNclghwX17fNh5dMJxISKILK2rJuFQlXEewg3
         HRqLy/TdaEbmckxJR9HgvI9u7OAIug57+MJslH7iBFAV9BUsvwsUZxRJuwnLaNC4xZfG
         gXtbubNnwfQMX+/IIT9iDfTI8R8aa2sJHGzchyE3zjOO9s3rphwOTzRLRnjyVVyNSIrl
         9loQ==
X-Gm-Message-State: AOAM532XY4Qi8ZkiDroAY4PThI2d94ISpkjgVlBTT8ZEeC3PnTTxx2Kx
        s1193x2HJ8g3NwcejI0N7RxFEz2vsfhGAGdzgGkgx5P9MkQhC9YHhpI2FBkHFKD7EljskBKwGsB
        TDXENBgk4utcOFykJHjitRiS2h7zP9NjkFw==
X-Received: by 2002:a17:906:4902:: with SMTP id b2mr3463569ejq.208.1600936616527;
        Thu, 24 Sep 2020 01:36:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDgj/CxDueMsDgBfE9ljuKTA/u7x08Fj/Ku4i5wl1rk2M0apAjNSCgL/AEFTLkxtPs9uE3Sg==
X-Received: by 2002:a17:906:4902:: with SMTP id b2mr3463561ejq.208.1600936616350;
        Thu, 24 Sep 2020 01:36:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id e25sm1908337edj.43.2020.09.24.01.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:36:55 -0700 (PDT)
Subject: Re: [PATCH platform-next 5/5] platform/x86: mlx-platform: Add
 capability field to platform FAN description
To:     Vadim Pasternak <vadimp@nvidia.com>, andy.shevchenko@gmail.com,
        dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20200923172053.26296-1-vadimp@nvidia.com>
 <20200923172053.26296-6-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c1a40c42-5a1d-f36c-bbc6-9b5b3f76f70d@redhat.com>
Date:   Thu, 24 Sep 2020 10:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923172053.26296-6-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/20 7:20 PM, Vadim Pasternak wrote:
> Set 'capability' field to FAN core platform data..
> The content of 'capability' register allows to set the mapping between
> the drawers and tachometers.
> The motivation is to avoid adding a new code in the future in order to
> distinct between the systems types supporting a different kinds of the
> FAN drawers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>   drivers/platform/x86/mlx-platform.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 04a745095c37..986ad3dda1c1 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -1939,6 +1939,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
>   static struct mlxreg_core_platform_data mlxplat_default_fan_data = {
>   		.data = mlxplat_mlxcpld_default_fan_data,
>   		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_data),
> +		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
>   };
>   
>   /* Watchdog type1: hardware implementation version1
> 

