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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF09C43461
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 13:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14E1A611CB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 13:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhEENmP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 09:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32893 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233606AbhEENmL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 09:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620222075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8SvDOc2cSQFyiOQl5xUCSS7yLKATWDvDoAhPfKv8w2E=;
        b=L9i2WGIhEeNicsCbDXZ77C2ykiwx2IYqOJCMlvPqhhjmqoV4AySUxxqOdocGDmfMTKtNoM
        x02mvQPpZbyNj2XLvwqsFjkGC6OEU9uguCRUsmHJ4oV7MaMhNnQdWPLMJAeNE8eFhDzwhT
        kVYLx5l6eE49MotBj47+Ti7svRlOEUk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-6UBDNuNgOOihXBCQKoThFQ-1; Wed, 05 May 2021 09:41:11 -0400
X-MC-Unique: 6UBDNuNgOOihXBCQKoThFQ-1
Received: by mail-ed1-f71.google.com with SMTP id s20-20020a0564025214b029038752a2d8f3so881469edd.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 May 2021 06:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8SvDOc2cSQFyiOQl5xUCSS7yLKATWDvDoAhPfKv8w2E=;
        b=b/fs/f3I6YOl5YnFJI4pfDYuYK80rOBn5/UaJwTN2/aHcNNMJt6y684rdAEPUhClBB
         ky3FV6f/AZq9gqybS4PopeOlws+2ES2lMSX5QBtEfM6bqEoPn9/icMthc/SF4PISnc6O
         DnUaRmUw+U809GjRoLKR+gW9R79dLeO09ykGmSReKqrdEC7hZ4EfAwdaiXKaNjeDplz8
         aFVqRz1KKuPz7D/6U3UvIE18GsSKT1usq66tpSl6U+klr5HEleVzLh90zxU8IdfOl6P1
         IrQz1FNWgoyRbPa/xkHBlmhvNEg3802ti+OEcMAB+4WPpR+sayhKzQf3nte3M3FjdJCQ
         Ffvg==
X-Gm-Message-State: AOAM530geSgRdT/Q0nVpqsmm5VUtzeffXkfiV3a9m7ujq+gp+0zMARjk
        1ymzJkWHrbk4migMMjSeTvgs0OeGMzqzJOaivdyWEGr/jul4US60ISS7c7P/fRgBZWqgas0dsGj
        Pz2AUELqTo2jols80JlySHv/1swfpgTm0Nw==
X-Received: by 2002:a05:6402:5158:: with SMTP id n24mr32094312edd.74.1620222069641;
        Wed, 05 May 2021 06:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWo2ZfxiXHGn8NhGbl7X0qDlgKK/ISF6oNF/JmFAq74DaEN7Tv7cyExL8OYk1dGyZorzrHyA==
X-Received: by 2002:a05:6402:5158:: with SMTP id n24mr32094299edd.74.1620222069521;
        Wed, 05 May 2021 06:41:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t14sm2872225ejc.121.2021.05.05.06.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 06:41:09 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: Do not mark interrupt as
 shared
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210505133635.1499703-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <733587d7-8373-e157-4c9e-4b53d387cb82@redhat.com>
Date:   Wed, 5 May 2021 15:41:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505133635.1499703-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/21 3:36 PM, Maximilian Luz wrote:
> Having both IRQF_NO_AUTOEN and IRQF_SHARED set causes
> request_threaded_irq() to return with -EINVAL (see comment in flag
> validation in that function). As the interrupt is currently not shared
> between multiple devices, drop the IRQF_SHARED flag.
> 
> Fixes: 507cf5a2f1e2 ("platform/surface: aggregator: move to use request_irq by IRQF_NO_AUTOEN flag")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you I'll pick this up (and at it to the pdx86/fixes branch too)
once 5.13-rc1 is out.

Regards,

Hans


> ---
>  drivers/platform/surface/aggregator/controller.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 69e86cd599d3..8a70df60142c 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -2483,8 +2483,7 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>  	 * interrupt, and let the SAM resume callback during the controller
>  	 * resume process clear it.
>  	 */
> -	const int irqf = IRQF_SHARED | IRQF_ONESHOT |
> -			 IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
> +	const int irqf = IRQF_ONESHOT | IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
>  
>  	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
>  	if (IS_ERR(gpiod))
> 

