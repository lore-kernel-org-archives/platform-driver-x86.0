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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA1CC48BDF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:24:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88757613B8
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238012AbhFIO0N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46097 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238023AbhFIO0F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 10:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623248650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RctbnkCJ0hkm48G2SuISc1IfcoEWeO6UvDG8UIpRugQ=;
        b=BswOZ7P93unhWODNu5HR9nv97FCiC5aGQ7D+viTr/BZYRLtTUUcC18W5raAFmxLFBB5cFF
        UVeU06IajfVPrXLZZsnien5hfFAx67qRutxNTXYMjevUBCJT+HaU4sVIgyXr1pjR9fqzHJ
        ZJoPwcH3FV68k0uGoqLwUIzaXNqYCaA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-30elqb_9Pw2ZyzN7bnFEEA-1; Wed, 09 Jun 2021 10:24:07 -0400
X-MC-Unique: 30elqb_9Pw2ZyzN7bnFEEA-1
Received: by mail-ed1-f72.google.com with SMTP id h23-20020aa7c5d70000b029038fed7b27d5so12376373eds.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 07:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RctbnkCJ0hkm48G2SuISc1IfcoEWeO6UvDG8UIpRugQ=;
        b=g5CJFX9GtcXT1Bbr4brWncENKCSwjXk9+HQXpbaChpbARl9TdW8PoEaXulIu2Z/oIR
         ciPYysLgpuCfUOrRlAweJV3eob8F6wyYcdNiimpG4ezpS1eRKOheNssFle0orzgQAaIi
         FvGD2HYpP43+T5Vv1Hnwa4IbZKcEQiEoJagp+QhpdwaA7VMjj50VhIXX/dOWp8yeQmwN
         iTJ4LscCcJT020WOXWL0uuwCds76jmviQ1u6guWPSRxsvLolLFarCrDgrBQ3m8TdezIs
         UW8tOew3/ZR8ahk0o9Ef4Vm3jL2Z3RIefbuU9lGJ79LuAFXSOLohGBo+5E9nAK6dOv/5
         JWdQ==
X-Gm-Message-State: AOAM531FDsKJ+0/T5yWUCuZUZZ0YgfQhDJ6oyvmQlQj7d75wRh84TzaE
        DHmyGaU6GcqzQrsdsru8ubCfMMVHkwb72OxH6053KnPWoFIrZECahxqGCw0AvnkSFCJXu56QBDx
        x1iVEdH6CrFtXFE91HBT/VEfOcGzj//pRwg==
X-Received: by 2002:a17:906:5947:: with SMTP id g7mr105714ejr.351.1623248646520;
        Wed, 09 Jun 2021 07:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1a1ZSnpCGddbbiL3MnOdj7UHS4rfq0Y3xTdakZNWCOgKTUC0MmDC0Ku9SWerLR/cY++x1LA==
X-Received: by 2002:a17:906:5947:: with SMTP id g7mr105702ejr.351.1623248646367;
        Wed, 09 Jun 2021 07:24:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id au11sm1217249ejc.88.2021.06.09.07.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:24:06 -0700 (PDT)
Subject: Re: [PATCH -next v2] platform/surface: aggregator: Use list_move_tail
 instead of list_del/list_add_tail in ssh_request_layer.c
To:     Baokun Li <libaokun1@huawei.com>, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210609072638.1358174-1-libaokun1@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ebe9e952-9938-adfd-7f52-658aec2cd466@redhat.com>
Date:   Wed, 9 Jun 2021 16:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609072638.1358174-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/9/21 9:26 AM, Baokun Li wrote:
> Using list_move_tail() instead of list_del() + list_add_tail() in ssh_request_layer.c.
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
>  .../surface/aggregator/ssh_request_layer.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
> index 52a83a8fcf82..fec2d7af2646 100644
> --- a/drivers/platform/surface/aggregator/ssh_request_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
> @@ -863,9 +863,7 @@ static void ssh_rtl_timeout_reap(struct work_struct *work)
>  		clear_bit(SSH_REQUEST_SF_PENDING_BIT, &r->state);
>  
>  		atomic_dec(&rtl->pending.count);
> -		list_del(&r->node);
> -
> -		list_add_tail(&r->node, &claimed);
> +		list_move_tail(&r->node, &claimed);
>  	}
>  	spin_unlock(&rtl->pending.lock);
>  
> @@ -1204,8 +1202,7 @@ void ssh_rtl_shutdown(struct ssh_rtl *rtl)
>  		smp_mb__before_atomic();
>  		clear_bit(SSH_REQUEST_SF_QUEUED_BIT, &r->state);
>  
> -		list_del(&r->node);
> -		list_add_tail(&r->node, &claimed);
> +		list_move_tail(&r->node, &claimed);
>  	}
>  	spin_unlock(&rtl->queue.lock);
>  
> @@ -1238,8 +1235,7 @@ void ssh_rtl_shutdown(struct ssh_rtl *rtl)
>  			smp_mb__before_atomic();
>  			clear_bit(SSH_REQUEST_SF_PENDING_BIT, &r->state);
>  
> -			list_del(&r->node);
> -			list_add_tail(&r->node, &claimed);
> +			list_move_tail(&r->node, &claimed);
>  		}
>  		spin_unlock(&rtl->pending.lock);
>  	}
> 

