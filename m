Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93E0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 May 2022 13:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354299AbiELNfc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 May 2022 09:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242178AbiELNfb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 May 2022 09:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 003892380CD
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 May 2022 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652362530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gVkTRYA4OniXIKtkHTCZf9OueDxCgQDe7kIWG5+l6u8=;
        b=btU1sljQa0WbpivRVvzvtR2KX5eTz6CNZRkEUlwadbucnLeyFlWJw6u2Z/KsXOSguo2u0Q
        GDeXFOM5gpBjSDzu63qUxkeJrVwJwdjRD3BUYjA6gtvfJoiAWkd2o37geuIz1sYIIAB/JA
        8JuA9BT0EQQaMeQ87wnsmGd2miUxhXE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-TFSrH3bFMBKlRRH3EI446A-1; Thu, 12 May 2022 09:35:28 -0400
X-MC-Unique: TFSrH3bFMBKlRRH3EI446A-1
Received: by mail-ej1-f70.google.com with SMTP id qf19-20020a1709077f1300b006f439243355so2872191ejc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 May 2022 06:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gVkTRYA4OniXIKtkHTCZf9OueDxCgQDe7kIWG5+l6u8=;
        b=j9AyWV1k4RCpis878CetBKhM9p/RnIhXlq2F2CDL3yhcrJu1OFhZtjI06xsfd6A/iO
         a3jJM3qwCd1n1PadYkCn+M3NDVA7Jm2Nizx6xdOydDj7/qyEk/d+wCqyyzKWsGbiTXF3
         bmV6pj0aeIiI/1GGS0w8CbTM3h2ZmI2xiz7j4zXWcP8zp5nSUt86lmVsrFZKNXnnc/8c
         3FUYnCBO/LUsUReo01QTPA62+7CwmWO7itK5BBDLLW5/LiNHlSAPMkf2Uw4n0v5FM+Ig
         JP7xyWK1EcESbzLC5e8c9qYSUbI9j6YG2JxJ28c548xDMPpjbBvfWxAB3L/THrWONXUU
         EpJQ==
X-Gm-Message-State: AOAM530/L/2OvzkqMaRhWtwT1yCcJ+f9tSMcUApsUtXvDcJtl9bK6nQ6
        nHgPoOt3GUheSaJW/aYqBg5N6suVtuD1rtEg9NnlQs6j6NuV1RO0yDQ2O+Ww8mk19s0UwZcJKOo
        LPaQuTlO7rVFIpKqp5Svk7w2rq61Ptxyzsg==
X-Received: by 2002:a17:907:7618:b0:6f3:9722:3dd1 with SMTP id jx24-20020a170907761800b006f397223dd1mr30224010ejc.424.1652362527722;
        Thu, 12 May 2022 06:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXs2gE7P4Ktp+zpXTxUdNYtJEmQfCChmz7APM1EXPo3sKQW/KOBaoveJS7GvvgQ5J33aMKIA==
X-Received: by 2002:a17:907:7618:b0:6f3:9722:3dd1 with SMTP id jx24-20020a170907761800b006f397223dd1mr30223987ejc.424.1652362527521;
        Thu, 12 May 2022 06:35:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b0042a2ccdd2b8sm1566701edj.70.2022.05.12.06.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 06:35:27 -0700 (PDT)
Message-ID: <97a97e6a-9ecc-b22b-941c-7c537badaea9@redhat.com>
Date:   Thu, 12 May 2022 15:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] platform/mellanox: Remove unused variable.
Content-Language: en-US
To:     michaelsh@nvidia.com
Cc:     platform-driver-x86@vger.kernel.org, vadimp@nvidia.com
References: <20220511195043.54853-1-michaelsh@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220511195043.54853-1-michaelsh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/11/22 21:50, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Fix problem of set but unused variable.
> 
> Fixes: 9e267f050444f ("platform/mellanox: Add support for new SN2201 system")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>

Thanks, note since I needed to rebase my review-hans branch for another
issue anyways I've squashed this into the original:

"platform/mellanox: Add support for new SN2201 system"

commit which introduced this problem.

Regards,

Hans


> ---
>  drivers/platform/mellanox/nvsw-sn2201.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
> index 6165e0154424..0bcdc7c75007 100644
> --- a/drivers/platform/mellanox/nvsw-sn2201.c
> +++ b/drivers/platform/mellanox/nvsw-sn2201.c
> @@ -939,7 +939,7 @@ static int nvsw_sn2201_config_post_init(struct nvsw_sn2201 *nvsw_sn2201)
>  	struct mlxreg_hotplug_device *sn2201_dev;
>  	struct i2c_adapter *adap;
>  	struct device *dev;
> -	int i, j, err;
> +	int i, err;
>  
>  	dev = nvsw_sn2201->dev;
>  	adap = i2c_get_adapter(nvsw_sn2201->main_mux_deferred_nr);
> @@ -952,7 +952,7 @@ static int nvsw_sn2201_config_post_init(struct nvsw_sn2201 *nvsw_sn2201)
>  
>  	/* Update board info. */
>  	sn2201_dev = nvsw_sn2201->sn2201_devs;
> -	for (i = 0, j = 0; i < nvsw_sn2201->sn2201_devs_num; i++, sn2201_dev++) {
> +	for (i = 0; i < nvsw_sn2201->sn2201_devs_num; i++, sn2201_dev++) {
>  		sn2201_dev->adapter = i2c_get_adapter(sn2201_dev->nr);
>  		if (!sn2201_dev->adapter)
>  			return -ENODEV;

