Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC1FEE4996
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 16:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236822AbjHUQyV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 12:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbjHUQyU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 12:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E92CCC
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692636812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xkaZXG8S2KS31Ed6S9yvZesu6cBtPabbNcGsCRxf3U0=;
        b=a+uT+BnWHuwA3bpnZQToan/TSVIAFjew2Xa9pkSKV+V0WNjYjEQxVjZ+rYXXE9X6vnIqe8
        C+Rr7mw6cAGmH07r5sb4OvDDJ4xa0/SgXWpghRLsLVF84SaIDEsuKFigbqn4QRGefsARiA
        ntFLMg6kQAO4xRy1Zk/CjMdEaXObSvc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-VPtAgAvmP9WlD6a4TpYFUg-1; Mon, 21 Aug 2023 12:53:31 -0400
X-MC-Unique: VPtAgAvmP9WlD6a4TpYFUg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5230741478cso2331726a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 09:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692636810; x=1693241610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkaZXG8S2KS31Ed6S9yvZesu6cBtPabbNcGsCRxf3U0=;
        b=i9SZ8/a2SrqSE92kBJF5N3vTULCebUvhgnyLDGu+4zvAd4pNZy52Y24JA4oVEJYozJ
         94XqlKjjFEIAmKrlOMcKrVZp8d8ZU8gngHMkiovNoArtcwVI3llBomkfLCt38qA06pjG
         6qeufGpkX7KBv3gCcv8LSSvnhUT+xg9N+zsDKKyVYyyYZbuA2wMvRdSUn6BggwaGKF2p
         DlMWYbXnVuk25bCdOhDexxZftS897KnIkllwYpA/oSBWUIi9fUQXP/80cfEg2C5KqfE5
         3cBxGMwin3+OMFgLzAxA24DchHcZTYmMcspwpCYKvV30nkYHSXNHWytrQKGMxXY2pW7y
         Eefg==
X-Gm-Message-State: AOJu0Yw0g+iT6ZdePOPUsOpxl2BvYDR5X+nk6bNfLI3NCmadVf3wI4f2
        cC04W0WWIxb4bpj/mEN6TjSmV+YF8Vg+OLq8yrR1UeBvC4Rzhvt+0iHHDL3s/cIayz8WFKUrUmY
        6dWRSmkVGukaTQ6B7nx3s0TzzFlTWy+oaqg==
X-Received: by 2002:a50:ec8c:0:b0:525:4471:6b59 with SMTP id e12-20020a50ec8c000000b0052544716b59mr5682184edr.7.1692636809965;
        Mon, 21 Aug 2023 09:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyTFD8e4P4bXW4x+3w5anGhQd0zaiH3++gCKjrBnoKJKvvGUYzaWuhy4BtsmiJcCRY5IPszw==
X-Received: by 2002:a50:ec8c:0:b0:525:4471:6b59 with SMTP id e12-20020a50ec8c000000b0052544716b59mr5682168edr.7.1692636809712;
        Mon, 21 Aug 2023 09:53:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d19-20020a056402517300b005272523b162sm6151345ede.69.2023.08.21.09.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 09:53:29 -0700 (PDT)
Message-ID: <5180ac42-3d5c-a6dc-a6da-9ede451d6a14@redhat.com>
Date:   Mon, 21 Aug 2023 18:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] [v2] platform/mellanox: Fix mlxbf-tmfifo not handling all
 virtio CONSOLE notifictions updated to use set_bit()
Content-Language: en-US, nl
To:     Shih-Yi Chen <shihyic@nvidia.com>, linux-kernel@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Liming Sung <limings@nvidia.com>,
        David Thompson <davthompson@nvidia.com>
References: <20230821150627.26075-1-shihyic@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230821150627.26075-1-shihyic@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/21/23 17:06, Shih-Yi Chen wrote:
> From: shihyic <shihyic@nvidia.com>
> 
> rshim console does not show all entries of dmesg.
> 
> Fixed by setting MLXBF_TM_TX_LWM_IRQ for every CONSOLE notification.
> 
> Signed-off-by: Shih-Yi Chen <shihyic@nvidia.com>
> Reviewed-by: Liming Sung <limings@nvidia.com>, David Thompson <davthompson@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>

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
> v1->v2:
>  - Per review comment, replaced test_and_set_bit() with set_bit()
> 
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index a79318e90a13..b600b77d91ef 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -887,6 +887,7 @@ static bool mlxbf_tmfifo_virtio_notify(struct virtqueue *vq)
>  			tm_vdev = fifo->vdev[VIRTIO_ID_CONSOLE];
>  			mlxbf_tmfifo_console_output(tm_vdev, vring);
>  			spin_unlock_irqrestore(&fifo->spin_lock[0], flags);
> +			set_bit(MLXBF_TM_TX_LWM_IRQ, &fifo->pend_events);
>  		} else if (test_and_set_bit(MLXBF_TM_TX_LWM_IRQ,
>  					    &fifo->pend_events)) {
>  			return true;

