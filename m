Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24CFEE49A6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 10:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjHUKEt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 06:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjHUKEs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 06:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46CADC
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692612243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xg9daV7uWAmIhLcF/R04spGodJ9GWcUQaJbU5Trx9fQ=;
        b=ZyN/kjrPKD+Fi0Eg7juHXcIB4Jo9UTQ8lgSjzzpo9jNhNkWJ9sMfdPTHIv3/bEj9zzWfaj
        K/8a1hLIFYXuARB7htLl53brRnzwuH4qTzCC1cnFKJRvSwPLm0DCtu1+bUlBhXb7rvtUaO
        CkBjCA5NimFiT0g64rEBrIzcUzYLC6s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-5HI5pTnHMXmX8nu2xzstsA-1; Mon, 21 Aug 2023 06:04:02 -0400
X-MC-Unique: 5HI5pTnHMXmX8nu2xzstsA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99cc32f2ec5so210841966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 03:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692612241; x=1693217041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xg9daV7uWAmIhLcF/R04spGodJ9GWcUQaJbU5Trx9fQ=;
        b=DSysy+2jYsyC1hHgYvuQoBaOqPt0aCqDf1i2rmY/fMrw3JZO8nC2lCBOZA04c2ZBQK
         ebZTND+50S7NLQWHpqWGZXAyj0MPdPUgy/zk3JkK9aknDIdndHwEZv0/XXTbVfiFJvqX
         RBhx8RaTPz801MhvVdi2yEQ1Tu50heg0A9NoQeFUMo6okeydM9rZFYO2RvhlfVEF/9or
         IuZNnvmVX4LjWfjKtosmQ+NhI3zZRK8lkH0BAe43l7M+ai0RJKMdkKME1ZqtrPEr1uNG
         D3hWWzUeYn3O+XZwMzrDwLljOJMU139+1BjH+CuEGrlcm5GeeDf2adoNspwcjF7P1DK3
         iN+Q==
X-Gm-Message-State: AOJu0YxyZk8EIGNhOcFz2qWhNcKlK3nr3GgiWbosu3FzL/D5OJqeo5fO
        QJRAK9+JVzusQB1VRMINgbMlxbGkD/QFCiWnt2A5yeVVVeFUs5713WlvHv+wi46ebJ41S1iahHJ
        xL9apDmhzCQuYS5AlNbu0JhthvGZ96h7sYA==
X-Received: by 2002:a17:906:113:b0:99d:dc0b:a898 with SMTP id 19-20020a170906011300b0099ddc0ba898mr3819184eje.69.1692612241359;
        Mon, 21 Aug 2023 03:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+kOx3h4pL6VVinVKGtauFYxSqWn9IHcE9L+rnnke+HTGQpb9UPTXLilgemLfOfaH9txtzmw==
X-Received: by 2002:a17:906:113:b0:99d:dc0b:a898 with SMTP id 19-20020a170906011300b0099ddc0ba898mr3819173eje.69.1692612241047;
        Mon, 21 Aug 2023 03:04:01 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906140900b0099bca8b9a31sm6238818ejc.100.2023.08.21.03.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 03:04:00 -0700 (PDT)
Message-ID: <6f57cd3a-f10d-d94e-d74d-685e2722d11f@redhat.com>
Date:   Mon, 21 Aug 2023 12:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] [v1] platform/mellanox: Fix mlxbf-tmfifo not handling
 all virtio CONSOLE notifictions
Content-Language: en-US
To:     Shiih-Yi Chen <shihyic@nvidia.com>, linux-kernel@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org
Cc:     davthompson@nvidia.com, limings@nvidia.com
References: <20230814175313.7101-1-shihyic@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230814175313.7101-1-shihyic@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/14/23 19:53, Shiih-Yi Chen wrote:
> From: shihyic <shihyic@nvidia.com>
> 
> rshim console does not show all entries of dmesg.
> 
> Fixed by setting MLXBF_TM_TX_LWM_IRQ for every CONSOLE notification. 
>  
> 
> Signed-off-by: shihyic <shihyic@nvidia.com>
> Review-by: limings@nvidia.com
> 
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index a79318e90a13..4561b7d42412 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -887,6 +887,8 @@ static bool mlxbf_tmfifo_virtio_notify(struct virtqueue *vq)
>  			tm_vdev = fifo->vdev[VIRTIO_ID_CONSOLE];
>  			mlxbf_tmfifo_console_output(tm_vdev, vring);
>  			spin_unlock_irqrestore(&fifo->spin_lock[0], flags);
> +			test_and_set_bit(MLXBF_TM_TX_LWM_IRQ,
> +					 &fifo->pend_events);

You are not doing anything with the test result of test_and_set_bit() here,
so I think you can just use a (cheaper) set_bit() call here ?

Regards,

Hans



>  		} else if (test_and_set_bit(MLXBF_TM_TX_LWM_IRQ,
>  					    &fifo->pend_events)) {
>  			return true;

