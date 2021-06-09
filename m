Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98011C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:24:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8294861249
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237951AbhFIO0V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23850 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238055AbhFIO0P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 10:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623248660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bJNebWYNcgp94iCSccsOMLK7A1oosUye0VHwk27VTQQ=;
        b=X8eFTOLkN+t2N8sEr+AH2n96QfauocrZwJqkm3XdHsD7FgIzpSQF1hJoxQI9FNohxMFeNS
        YHF57/QCJVBzG2WSgZcq6kTcx5Vv83aoVGsrQRx6oHg23MYZG/QN/XuNPQAO08Tr8LSdj1
        gBu+L9m6Q+MYCS3EbcnNYbuzu6ByATw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-F_Wrzy3eNxS0pR1_-o_2Gg-1; Wed, 09 Jun 2021 10:24:19 -0400
X-MC-Unique: F_Wrzy3eNxS0pR1_-o_2Gg-1
Received: by mail-ej1-f71.google.com with SMTP id p5-20020a17090653c5b02903db1cfa514dso8106326ejo.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 07:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bJNebWYNcgp94iCSccsOMLK7A1oosUye0VHwk27VTQQ=;
        b=JDfIkKG9N4boCzlMe/gKm/RjnONgVeEmdcY4SBxCPsG4YQUKYLyphYya93PSXoTtcd
         pjGr4K32kro7K0hulZ4K8pQ4bJUygPRoUv89fL8FZBAWNfFu/iUveDHI1M48KvPFXRbG
         l/HWxgquQVZlwd2oDchM8qcLdgthUsXkDk7yrungWd2bq6Fgb/kIxjpPfiZd6LU/sOjr
         YaUk6fNkC3QOHSqG7HhBKjVD/4SNQNF051KYk+VSCxwbJrHYaWRGWYe21xAklzd/pnkM
         HsY6EQPuExiAtjopM4SmET4f6cc1VzkTZyKKdJLv10RYP6BHIjEfb/Lz92Nch3GC2dAf
         e+yw==
X-Gm-Message-State: AOAM532Abx9kLanMZYdBCKgNMbkHWbK9Kmr6jb+jJzWyTKsKPdj/0gWS
        JmmLKTsUkWdy2lAwBY2CuirtbevVwZOea5PWTtjEX1vR648p7y+Jjnv5Gg3hWJ+D/i1j3PwvxK4
        PYJ1agjmib8Bl4OZWpQtYI1o1114dLuIU8Q==
X-Received: by 2002:a17:906:b41:: with SMTP id v1mr155673ejg.246.1623248657847;
        Wed, 09 Jun 2021 07:24:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKtYD9bl3HjpaQgg0qSpowvDymNQ7EbiYVuMuhGkX1Yc6O3juTkqDxmT9LMu/CXykh5ydVGw==
X-Received: by 2002:a17:906:b41:: with SMTP id v1mr155657ejg.246.1623248657714;
        Wed, 09 Jun 2021 07:24:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id oz11sm1207955ejb.16.2021.06.09.07.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:24:17 -0700 (PDT)
Subject: Re: [PATCH -next v2] platform/surface: aggregator: Use list_move_tail
 instead of list_del/list_add_tail in ssh_packet_layer.c
To:     Baokun Li <libaokun1@huawei.com>, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210609072448.1357524-1-libaokun1@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <be60d42b-5498-e15c-6301-3d8834af3c75@redhat.com>
Date:   Wed, 9 Jun 2021 16:24:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609072448.1357524-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/9/21 9:24 AM, Baokun Li wrote:
> Using list_move_tail() instead of list_del() + list_add_tail() in ssh_packet_layer.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> V1->V2:
> 	CC mailist
> 
>  .../surface/aggregator/ssh_packet_layer.c  | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> index 15d96eac6811..2f546ad11c4e 100644
> --- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> @@ -1567,9 +1567,7 @@ static void ssh_ptl_timeout_reap(struct work_struct *work)
>  		clear_bit(SSH_PACKET_SF_PENDING_BIT, &p->state);
>  
>  		atomic_dec(&ptl->pending.count);
> -		list_del(&p->pending_node);
> -
> -		list_add_tail(&p->pending_node, &claimed);
> +		list_move_tail(&p->pending_node, &claimed);
>  	}
>  
>  	spin_unlock(&ptl->pending.lock);
> @@ -1957,8 +1955,7 @@ void ssh_ptl_shutdown(struct ssh_ptl *ptl)
>  		smp_mb__before_atomic();
>  		clear_bit(SSH_PACKET_SF_QUEUED_BIT, &p->state);
>  
> -		list_del(&p->queue_node);
> -		list_add_tail(&p->queue_node, &complete_q);
> +		list_move_tail(&p->queue_node, &complete_q);
>  	}
>  	spin_unlock(&ptl->queue.lock);
>  
> @@ -1970,8 +1967,7 @@ void ssh_ptl_shutdown(struct ssh_ptl *ptl)
>  		smp_mb__before_atomic();
>  		clear_bit(SSH_PACKET_SF_PENDING_BIT, &p->state);
>  
> -		list_del(&p->pending_node);
> -		list_add_tail(&p->pending_node, &complete_q);
> +		list_move_tail(&p->pending_node, &complete_q);
>  	}
>  	atomic_set(&ptl->pending.count, 0);
>  	spin_unlock(&ptl->pending.lock);
> 

