Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E63C433ED
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 May 2021 09:02:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0276C610CD
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 May 2021 09:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhEHJDC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 May 2021 05:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41243 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230249AbhEHJDB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 May 2021 05:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620464519;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BCbUAU9uZUHADCrJEyLeipgqPF0tUBdom+0LDVHCM/U=;
        b=L8+EIMHBHSMAtLY8QH+gpgmX2NwGDq/vThzbjCO9lnq0m7OB1XnPSkrr6ZdP+s//vClhPN
        YI3WdvdqnLdk5sBmHkG1H22Su7zGuSlVYF6QqIsWIrT84QOcuzc5Zpu+8tEtVoHYWSYJ0W
        snjwDzzbeC7dyl8fFZVJL301WJC72Eo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-n-zljq0kN7WXFhXg1dlqyA-1; Sat, 08 May 2021 05:01:56 -0400
X-MC-Unique: n-zljq0kN7WXFhXg1dlqyA-1
Received: by mail-ed1-f72.google.com with SMTP id f8-20020a0564020688b029038840895df2so5825105edy.17
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 May 2021 02:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BCbUAU9uZUHADCrJEyLeipgqPF0tUBdom+0LDVHCM/U=;
        b=m4miZra4gEJ/2XRLDatwh3WrItWfh3d5lA2OBxGbkbU89QmvIO1HBGwsYHxBgNsUPn
         gEEQJOQX2uOsz053lsXqMy3QY2ZMrupRVv1Wmqfl24aPpkG9sUvVEYI4+iI9Hgm9HRgB
         tSY1B7mXdvrrxB0zAirfvUNjBUYTemR8fXEV9cUVlHXuh1sPFpwUeF1X1BDbRpHiyjaC
         E3v0Hi44SmOK4/9WIsyRyI5msFsCPkUww5hs1oImCkjg0pV8f+fq951FMrw5V0sOYzkz
         0zhcwZIvD5dpWpJz7GHslDub0V/YRRumfStyyu0hwZ7I3il0LlnJ7gBujAEhCDOSG6wl
         rseQ==
X-Gm-Message-State: AOAM533bELck69l3+4sAhVQzG6NWeElFA2osjKv+Jfl8nKP4kbkOzAVd
        XtwjlvmUed5SPfYt2rBKMt/A5hmXinEsjlUA56GbbTvYzn3pTLKIYYai2JsEaqPdKXaf6SVOwUd
        tSQgrSjBByifF4tDcd6bus6EIe55cv0qKKyycFk/C4U6BaA3tEH2h317rVbQAA695a2R/s/CCr5
        igDghHXeUP6A==
X-Received: by 2002:a05:6402:154d:: with SMTP id p13mr17078162edx.371.1620464515333;
        Sat, 08 May 2021 02:01:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt5GlxBSQQ3xpVkR0d/Nh0jBErUXlyzjJMNN+s0evPf6E0kgadaL4aiTqwg23olMcW4g9J/w==
X-Received: by 2002:a05:6402:154d:: with SMTP id p13mr17078142edx.371.1620464515168;
        Sat, 08 May 2021 02:01:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c5sm107224eds.94.2021.05.08.02.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 02:01:54 -0700 (PDT)
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
Message-ID: <816fdf7e-b69e-0cb3-ccb9-20b174682209@redhat.com>
Date:   Sat, 8 May 2021 11:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
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

I'm not familiar enough with this / the virtio code to be able to
judge if this makes sense (I assume it does).

Can I get an Ack or Reviewed-by from one of the other Mellanox
folks please?

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

