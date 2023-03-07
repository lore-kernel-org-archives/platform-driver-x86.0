Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B461EC678D4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Mar 2023 11:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjCGLJh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbjCGLJK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 06:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CA7769C1
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 03:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678187061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Poe0W4YrpQzicqm/R3D+1QXHWu8wsCUEGYygTlEe1/w=;
        b=PP+dMBBu5pu6ditUTF4JyrT1GTNrT0MCBlVGvBV2h5LQabrddjuK0cR/fsMGbGvhjGY7nC
        IUUIOb1LiSS6Oh/lhIZsZEZX6y09T28VlI9pAgd+Bki974yP31AIc15tzFGoObXJ1DQ7I2
        cc1tI0Qg11uGVqj5UfUGxii4N2tx+sI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-3cRKUN_2PkqzouFTBG_KDg-1; Tue, 07 Mar 2023 06:04:20 -0500
X-MC-Unique: 3cRKUN_2PkqzouFTBG_KDg-1
Received: by mail-ed1-f70.google.com with SMTP id da22-20020a056402177600b004c60694083eso18237902edb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 03:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Poe0W4YrpQzicqm/R3D+1QXHWu8wsCUEGYygTlEe1/w=;
        b=AyelMU8rh1nu072u4uZnrzAmsruTwRlC5mUcY5TDwVPGu/OQzFOtoy2ah1sHdUG6QF
         DsZcTZYDQXoYb9P7d087+YbThFlbAGdgyAGZz+CW4ViPrLbb5GdZTd3HMUMRed5Ujsy6
         BfuDQB4NPjr3kL5SM13JOLTgHHTt7b8fULO+WdOfJ8syelEy/19Tb5NNIWOwNi00JiBa
         ZtNnp2tP6WQ+TsaInljvfeh/QzcIF6ln/+8UwsUKlf/s3hsrbeSUzAJU9W3dIqp+KEqX
         BWlX7m3hawLdsR35jjH1muAh6ZGuCfFm40QrnFWxVhnXppyzg/4H7nFR6OdAcNpGCIDD
         zU+Q==
X-Gm-Message-State: AO0yUKUb3HuxuC5R/x+kTK5s72oqkABYD/bCb56V3R3WApfgPoYMFlid
        UVaYqSBMAZMI2AO/UPk/JPlWPx3EOZDW5etSJ8ZpCxaIqA0wtk8oflRUhqQJj3g5I+Fana8oYnQ
        xvCfVzD2qT2KYXJah7rvPTLp1H+Orf+cMMA==
X-Received: by 2002:aa7:df96:0:b0:4b1:b71d:cbfe with SMTP id b22-20020aa7df96000000b004b1b71dcbfemr13404781edy.2.1678187059413;
        Tue, 07 Mar 2023 03:04:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+e+PM+p0xi1LNYso82D/+tZKl9gd4y9h14Lk7yc4f8Art3FpluOw1S3eCH4HSQb8lL2HbvCg==
X-Received: by 2002:aa7:df96:0:b0:4b1:b71d:cbfe with SMTP id b22-20020aa7df96000000b004b1b71dcbfemr13404773edy.2.1678187059190;
        Tue, 07 Mar 2023 03:04:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hy26-20020a1709068a7a00b008d92897cc29sm5912061ejc.37.2023.03.07.03.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:04:18 -0800 (PST)
Message-ID: <01c0688d-b7f2-6108-a99e-19337cb3e04b@redhat.com>
Date:   Tue, 7 Mar 2023 12:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: int3472: Add GPIOs to Surface Go 3 Board
 data
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Cc:     luzmaximilian@gmail.com
References: <20230302102611.314341-1-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230302102611.314341-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/2/23 11:26, Daniel Scally wrote:
> Add the INT347E GPIO lookup table to the board data for the Surface
> Go 3. This is necessary to allow the ov7251 IR camera to probe
> properly on that platform.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/int3472/tps68470_board_data.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 309eab9c0558..322237e056f3 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -159,9 +159,10 @@ static const struct int3472_tps68470_board_data surface_go_tps68470_board_data =
>  static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:01",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> -	.n_gpiod_lookups = 1,
> +	.n_gpiod_lookups = 2,
>  	.tps68470_gpio_lookup_tables = {
> -		&surface_go_int347a_gpios
> +		&surface_go_int347a_gpios,
> +		&surface_go_int347e_gpios,
>  	},
>  };
>  

