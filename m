Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887CCC7EE22
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 08:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbjEIIjr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 04:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbjEIIjp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 04:39:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A387ABC
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 01:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683621535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mJSmFU9zrHf5gXujZLawk9fZZukHnaT0RDiG86PaeqY=;
        b=DRIn8yUCm85eWOvOVgyAdT7xuVqY+k6BJMKMAJMh49Ry9nc9xlmO2SEApCJmIEkqFVnBw4
        Ysr7xHC28hthv5ZFcw/3oSXeEBkkRw/tmBiLE+T16YZygYtYRpZgkt6+ExMGApy3pQEtJT
        pLPpu4XfxHZueP374HmfrxcufS/R8gc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-IOGvqbaMP2iMp3afZLvXyw-1; Tue, 09 May 2023 04:38:54 -0400
X-MC-Unique: IOGvqbaMP2iMp3afZLvXyw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9662fbb79b3so288254766b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 01:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683621533; x=1686213533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJSmFU9zrHf5gXujZLawk9fZZukHnaT0RDiG86PaeqY=;
        b=dhoEONKNUYuzOq6sBM48/THhWhhMwq3SIm37paMhDQQvykOoLm7yRGNnyZecBsqCW7
         LQe+dJJ6GYuAdBIsmbVict/44UmX42n+443AHrIrHlFyQ8xy54HYS46dieLEOsgNtHjc
         iI+qVwBvvsF5IbxAZYnEBM37wYbdMGx6u3ZkeD6aOk/a4jGriExgIyRuQU7aUkv1M1Ok
         afD10Wk2RaqsOo3aHKbBZ3qh7qDq71Qxl57RUfDUsErJm+smAcR5R2p02LNkB/os7Eeb
         niZjucl4wknGoJ9l6mEYHaLWwTRa0PQo5oSao0xds/zHyQgPr4iK0BcjwDdzf7p1C2km
         cgTw==
X-Gm-Message-State: AC+VfDzs+ApZ0HK54wzaAa5T825vyJBmZg0XLcaG3nGqWl11Mf4FVQ4j
        Dcb8X0zmAa0x0yQeMBHALKWkkP0N7LJVH1ld9HRkwIvHuPzmypjNQNH0Emchf9sqKXtcAW4ZhjZ
        o/4ldUA0wMteJGP4Ij/yxBFIPBiTeJuj8Kw==
X-Received: by 2002:a17:907:60c9:b0:967:2abb:2cec with SMTP id hv9-20020a17090760c900b009672abb2cecmr5001166ejc.64.1683621533057;
        Tue, 09 May 2023 01:38:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79H8juSReiDtwqU02HIvQKweDVFFWRtffuu60HFRPfCyGFi0P6hS2hQj+j0MQF3GZELcH9BA==
X-Received: by 2002:a17:907:60c9:b0:967:2abb:2cec with SMTP id hv9-20020a17090760c900b009672abb2cecmr5001150ejc.64.1683621532715;
        Tue, 09 May 2023 01:38:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ty20-20020a170907c71400b0096621340285sm1016899ejc.198.2023.05.09.01.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:38:52 -0700 (PDT)
Message-ID: <2d6a1063-34ad-70ca-3d1c-0be2143ff3f4@redhat.com>
Date:   Tue, 9 May 2023 10:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/1] platform/mellanox: fix potential race in
 mlxbf-tmfifo driver
Content-Language: en-US, nl
To:     Liming Sun <limings@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <b98c0ab61d644ba38fa9b3fd1607b138b0dd820b.1682518748.git.limings@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b98c0ab61d644ba38fa9b3fd1607b138b0dd820b.1682518748.git.limings@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Vadim,

On 4/26/23 16:23, Liming Sun wrote:
> This commit adds memory barrier for the 'vq' update in function
> mlxbf_tmfifo_virtio_find_vqs() to avoid potential race due to
> out-of-order memory write. It also adds barrier for the 'is_ready'
> flag to make sure the initializations are visible before this flag
> is checked.
> 
> Signed-off-by: Liming Sun <limings@nvidia.com>

Can you review this patch please ?

Regards,

Hans




> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index 91a077c35b8b..a79318e90a13 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -784,7 +784,7 @@ static void mlxbf_tmfifo_rxtx(struct mlxbf_tmfifo_vring *vring, bool is_rx)
>  	fifo = vring->fifo;
>  
>  	/* Return if vdev is not ready. */
> -	if (!fifo->vdev[devid])
> +	if (!fifo || !fifo->vdev[devid])
>  		return;
>  
>  	/* Return if another vring is running. */
> @@ -980,9 +980,13 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
>  
>  		vq->num_max = vring->num;
>  
> +		vq->priv = vring;
> +
> +		/* Make vq update visible before using it. */
> +		virtio_mb(false);
> +
>  		vqs[i] = vq;
>  		vring->vq = vq;
> -		vq->priv = vring;
>  	}
>  
>  	return 0;
> @@ -1302,6 +1306,9 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
>  
>  	mod_timer(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);
>  
> +	/* Make all updates visible before setting the 'is_ready' flag. */
> +	virtio_mb(false);
> +
>  	fifo->is_ready = true;
>  	return 0;
>  

