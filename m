Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC150C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:19:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 881F0600D4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353544AbhESNVI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57081 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241309AbhESNVH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621430388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LXXvD9CiFNirNA4dOLZzvSxS6V8dpX3pz9Nd6UAH9HM=;
        b=fuSzWHdStpcTU+Ig7EqheBMIkVsH8Tht4IPBWX6U+uI4XIShB/ay1bdHCDEX6iypTke0bS
        +nAbhGK9E8PmGCQb0GHNv4kj9hsELxG2YEJDNTjap+wZeQ/rq0C8UEifn+It9CDhuA7Rqd
        wuB6ysDMTeeGDIQNsUuwv90mUveax2k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Ytl7nj1pM-y4C0UxSDa66A-1; Wed, 19 May 2021 09:19:46 -0400
X-MC-Unique: Ytl7nj1pM-y4C0UxSDa66A-1
Received: by mail-ej1-f71.google.com with SMTP id eb10-20020a170907280ab02903d65bd14481so3396978ejc.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LXXvD9CiFNirNA4dOLZzvSxS6V8dpX3pz9Nd6UAH9HM=;
        b=c0uqSoeUuy3dz0zcRR7+t9CIqk9+mFJmtlaS94npFhl35eQoLMLhcIEo+V3XuzIkJq
         2bC2hYL4Ikkg1G8XrYDXgJZ8GIPI8C4Yi8XDZYWRL7UTuXhBQzqr0RXVW6nVFFTUj3LC
         pdmzrNo/eLj3S47EgpOdEIR0bn1Vx0tSHwfyQxF1/gjnuNtlIseE9+H3fd1Z0amEedQ8
         UVRGFem/tWpH+nWK8rsr4TEVUnAthVLWAmfC4ojmc19PSnBYDdXCTlOj1kt3Zzs+stmI
         gX8RvQULZFm6fae3WNjG3uPkmiszVZ5WvCPnwssp+S7sZFZh6xf+eF/bPJ+7Of4mtNPl
         Mybw==
X-Gm-Message-State: AOAM530iwZ6yjTca99FVHzCCRK3J6dK904o0gXFE/0Po6epFEZhZSorv
        w7oCHX5yCbww9COaMQmj8Xs1PhJO1YqIsqrEEsccIj3Y7jj3YpVPRl2GU69jn5bVylfnMfzZegA
        AyX/rWgepP+dTDDt1F3MML+DsOZHurh9IOr6YUzIpTZv0VbVQit0lV0CbNklqC7U6TwRKCnCYqj
        JZwVoT6bBN9A==
X-Received: by 2002:aa7:ca1a:: with SMTP id y26mr14299315eds.297.1621430385058;
        Wed, 19 May 2021 06:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvRFKubsHlILUrx/qm59JE7s2LmaR1khw5pnBK55ULXzlaOM21JTyS8pJ7Y6SbybI7WONb4w==
X-Received: by 2002:aa7:ca1a:: with SMTP id y26mr14299287eds.297.1621430384843;
        Wed, 19 May 2021 06:19:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cn21sm8976581edb.36.2021.05.19.06.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:19:44 -0700 (PDT)
Subject: Re: [PATCH v2] platform/mellanox: mlxbf-tmfifo: Fix a memory barrier
 issue
To:     Liming Sun <limings@nvidia.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <177d12443460bc613aa495fbdbabbbeef43ba7ff.1620400475.git.limings@nvidia.com>
 <1620433812-17911-1-git-send-email-limings@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c3a1f86-14de-c787-9831-409d1e4c4243@redhat.com>
Date:   Wed, 19 May 2021 15:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620433812-17911-1-git-send-email-limings@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/8/21 2:30 AM, Liming Sun wrote:
> The virtio framework uses wmb() when updating avail->idx. It
> guarantees the write order, but not necessarily loading order
> for the code accessing the memory. This commit adds a load barrier
> after reading the avail->idx to make sure all the data in the
> descriptor is visible. It also adds a barrier when returning the
> packet to virtio framework to make sure read/writes are visible to
> the virtio code.
> 
> Fixes: 1357dfd7261f ("platform/mellanox: Add TmFifo driver for Mellanox BlueField Soc")
> Signed-off-by: Liming Sun <limings@nvidia.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also include this in the next pdx86-fixes pull-req for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> v1->v2:
>   Updates for Vadim's comments:
>   - Add the 'Fixes' field in the commit message.
> v1: Initial version
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index bbc4e71..38800e8 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -294,6 +294,9 @@ static irqreturn_t mlxbf_tmfifo_irq_handler(int irq, void *arg)
>  	if (vring->next_avail == virtio16_to_cpu(vdev, vr->avail->idx))
>  		return NULL;
>  
> +	/* Make sure 'avail->idx' is visible already. */
> +	virtio_rmb(false);
> +
>  	idx = vring->next_avail % vr->num;
>  	head = virtio16_to_cpu(vdev, vr->avail->ring[idx]);
>  	if (WARN_ON(head >= vr->num))
> @@ -322,7 +325,7 @@ static void mlxbf_tmfifo_release_desc(struct mlxbf_tmfifo_vring *vring,
>  	 * done or not. Add a memory barrier here to make sure the update above
>  	 * completes before updating the idx.
>  	 */
> -	mb();
> +	virtio_mb(false);
>  	vr->used->idx = cpu_to_virtio16(vdev, vr_idx + 1);
>  }
>  
> @@ -733,6 +736,12 @@ static bool mlxbf_tmfifo_rxtx_one_desc(struct mlxbf_tmfifo_vring *vring,
>  		desc = NULL;
>  		fifo->vring[is_rx] = NULL;
>  
> +		/*
> +		 * Make sure the load/store are in order before
> +		 * returning back to virtio.
> +		 */
> +		virtio_mb(false);
> +
>  		/* Notify upper layer that packet is done. */
>  		spin_lock_irqsave(&fifo->spin_lock[is_rx], flags);
>  		vring_interrupt(0, vring->vq);
> 

