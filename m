Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B42188004
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725958846; cv=none; b=dKTgWir9bP0HJ0a8vzlHeyp2DX01v8dqNRLxNJKntjATpAClo00Q9q1Rqme2bjYxHVL+lV+4aLrepOwiOrnlj5l/5rupG9Be0MPqW0ai1Zc5xO/XbMBZxcnbqy1q0786VtPddRBL0XAGu4zNOPJqbOVq9I+Uvjnbvbvc/Wm1uEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725958846; c=relaxed/simple;
	bh=jvP2CShRbo1D59rvxjlwPvRbkOjjEaoXxnhnFtM6xB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fau8Y+Kq6HcR84v/hGilK3KCYv9ochLF4/nKUDHl8EpVJmnmA7MzFvNCa/pkNklldc/z83qOJW4AUweHgz4gXEtYjZMbcUMeanFlO1N5fUnozHicQddfpqLlsvsPseGeEwYGBZGQ38flS5xQmfr+B6SeTHTEDdCEx2tsiJNFoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LvyQnsCn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LvyQnsCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725958844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhiuzN32efomWjuY/NVTDByQS3uu6AVNQbc/n11HQBk=;
	b=LvyQnsCnvIyo0BQCOL1VJDGoJzobK7JbDMNkgvHaL4eSzoMIQwFsmtOR0St84OFf6hOFG/
	1Lcdl5XjEXCFTILnkyqDzYYW2vumHUC5GHQ1kOxJ1j6yO3bwJ4eVmK9rIg0msc5rsNa45D
	rf9tl7vPcIFhE/TF7Wc8zSVaSBtzo1s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-7LT_yPlXPYe31iwb-gM6Ow-1; Tue, 10 Sep 2024 05:00:42 -0400
X-MC-Unique: 7LT_yPlXPYe31iwb-gM6Ow-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8d3085ab6fso146003366b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 02:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725958841; x=1726563641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhiuzN32efomWjuY/NVTDByQS3uu6AVNQbc/n11HQBk=;
        b=O8EFLLX0Z/yHOKnYj2WFb06KZUd6thq8i8oKlAUlnYYecJU9KNLRtjzqJl/0J7/rzV
         xS82r267JQ3yR3arX64SYYfDQO3wq9BiM5rmIXdTyV1MoHItWFjzyofDtNgcLysug9u3
         01IugtO25Hyffl6RFERXtSYJ623+GEy2rtOEgIE4kFxfWJtvFpr9NtegfnzbBiR8UZiF
         UbPMP6AHpRmBtD1rIavkvswdxWVux8RZRX1l+0v1Fi+K4SHMQpCEooJosCbl7lXfJGqc
         zBuQ5+Ej09vqPBBaNtOT4GtDnOHcXX/jALxPUc1YPJCkDAlZsGtu63uh+8dqHCyrU4mq
         KQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1qiszZA7hdzIi8uV7nOE6cTD7MMdkiuyex7SbcIbo4C8rS0Sh2czcX7+EAzn6aaBEkkIO4QIGmHbqXD4rN3g8tbNU@vger.kernel.org
X-Gm-Message-State: AOJu0YzfR8MjnQjy2hzFj7QgZW2LS+7YW68bpxpLtSzvtjuq2IKJcPJI
	vXvZUT3jYNl3w099BBmGRAs0Qvejk5lkCtah1wd2yRh/22rl2EkGNpc0p/6pp8pEBzvTGoQc3Pd
	1DNUfwIDj/dlFtWhdkd1E386d1n44Owtb3mdg00A9YjtFboxKTv6uYdJ2/tc8J2pXQvARdoM=
X-Received: by 2002:a17:907:3f8d:b0:a86:43c0:4270 with SMTP id a640c23a62f3a-a8ffaa97a61mr7484866b.13.1725958841404;
        Tue, 10 Sep 2024 02:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8ecB3ho5gSaKqeWr0v4uJU2RAyDyWIvn4rzdMnoVxmq5t7dfn1QKTjY+0Zs76xfGNI6PSig==
X-Received: by 2002:a17:907:3f8d:b0:a86:43c0:4270 with SMTP id a640c23a62f3a-a8ffaa97a61mr7481266b.13.1725958840917;
        Tue, 10 Sep 2024 02:00:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ce86cfsm452720066b.150.2024.09.10.02.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 02:00:40 -0700 (PDT)
Message-ID: <1cdbf313-d585-471e-b625-16d3fd9ca90a@redhat.com>
Date: Tue, 10 Sep 2024 11:00:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 6/7] platform/olpc: olpc-xo175-ec: switch to use
 spi_target_abort().
To: Yang Yingliang <yangyingliang@huaweicloud.com>, broonie@kernel.org,
 matthias.bgg@gmail.com, yangyingliang@huawei.com, liwei391@huawei.com
Cc: linux-spi@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240910022618.1397-1-yangyingliang@huaweicloud.com>
 <20240910022618.1397-7-yangyingliang@huaweicloud.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240910022618.1397-7-yangyingliang@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/10/24 4:26 AM, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> Switch to use modern name function spi_target_abort().
> 
> No functional changed.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks, patch looks good to me.

Please merge this through the SPI tree together with the rest
of the series:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/olpc/olpc-xo175-ec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
> index 62ccbcb15c74..fa7b3bda688a 100644
> --- a/drivers/platform/olpc/olpc-xo175-ec.c
> +++ b/drivers/platform/olpc/olpc-xo175-ec.c
> @@ -536,7 +536,7 @@ static int olpc_xo175_ec_cmd(u8 cmd, u8 *inbuf, size_t inlen, u8 *resp,
>  		dev_err(dev, "EC cmd error: timeout in STATE %d\n",
>  				priv->cmd_state);
>  		gpiod_set_value_cansleep(priv->gpio_cmd, 0);
> -		spi_slave_abort(priv->spi);
> +		spi_target_abort(priv->spi);
>  		olpc_xo175_ec_read_packet(priv);
>  		return -ETIMEDOUT;
>  	}
> @@ -653,7 +653,7 @@ static void olpc_xo175_ec_remove(struct spi_device *spi)
>  	if (pm_power_off == olpc_xo175_ec_power_off)
>  		pm_power_off = NULL;
>  
> -	spi_slave_abort(spi);
> +	spi_target_abort(spi);
>  
>  	platform_device_unregister(olpc_ec);
>  	olpc_ec = NULL;

