Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FFCC54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 18:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240507AbjALSku (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237409AbjALSkL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 13:40:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFFA55AD
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673547167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/kFle39ydkxIvTqDbjiQ26mYZY/ipPx5AO1Q9J7N87Q=;
        b=YxBFfiiquVmKpjTSrQQxGOYPy9ilwpRaOe+NW76CuRM7j2fcWhSvTzDtOjO2BhiMMJYZ61
        vgv8p9i59zlsaCXPt7jiQKYNFQ93bwTs71rkzvyEwpC+INzuvJwP2Q0cuP+sAoqjn8rcmZ
        O4mSvh/qeETr5W4dtziByss5CmK+JPY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-R1E0VfxBPI2axzZ_gXHYKw-1; Thu, 12 Jan 2023 13:12:46 -0500
X-MC-Unique: R1E0VfxBPI2axzZ_gXHYKw-1
Received: by mail-ej1-f69.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso13266993ejb.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kFle39ydkxIvTqDbjiQ26mYZY/ipPx5AO1Q9J7N87Q=;
        b=bkt62EAr8ZvjFPEmskBD61Va34Ap8loVq9C9lu0+bFSM8U7OHKYKS9V6ijFHsjseMo
         bwJCVfCOWPgxTIGjoEBES26wmzVSPHLVd0kY71TycHRwDu8MWYMn3YmN8gdjNIFuou6M
         gS+bIl/HgWv7VvMPnEODbsYpLz3mj5axwlAjDfdkKt3uh8VlEnJ1GWjvTPK5x3zTUK21
         8A2mi34hTd6S4gQDRze8wHtvHFldbVeb2OZj3HBj2lBDroxq0YoqtVf4ByS9xbsetetA
         GbSerzJs6cFbrUjHSyyK+Xo6cGV54kQoR7A1Pe9JB1Dr5g9TTm7n/LyAmXZiJZB+YmvK
         Y+hw==
X-Gm-Message-State: AFqh2ko9ufwLBpFmR9tA/4T0too7bMyrkdPy5vCfq5UcnBL45I8/pfPK
        iYXH6e9o5ZlpRG0UpUA7AQxDCR3AaUWs5kx5W4k1ceSnQOe39EEUQvgdyFG5NpDEo8roJVBD8dJ
        KP/TW2ypxmc2p7zpBRrZh7R8HnuBc0YAhag==
X-Received: by 2002:a50:a401:0:b0:46d:53d7:d21e with SMTP id u1-20020a50a401000000b0046d53d7d21emr70239820edb.27.1673547164859;
        Thu, 12 Jan 2023 10:12:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuocr0pZgktu2TVwsiNIJg76I42JC16Cs3Nyl/sxnH2yKH0FUdToUA61TD+NVTw1OYVtpCUWA==
X-Received: by 2002:a50:a401:0:b0:46d:53d7:d21e with SMTP id u1-20020a50a401000000b0046d53d7d21emr70239806edb.27.1673547164684;
        Thu, 12 Jan 2023 10:12:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7d889000000b00457b5ba968csm7424462edq.27.2023.01.12.10.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:12:44 -0800 (PST)
Message-ID: <8aa95d69-7231-0a9a-93aa-dbb5286a4731@redhat.com>
Date:   Thu, 12 Jan 2023 19:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] platform/surface: aggregator: Add missing call to
 ssam_request_sync_free()
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221220175608.1436273-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221220175608.1436273-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/20/22 18:56, Maximilian Luz wrote:
> Although rare, ssam_request_sync_init() can fail. In that case, the
> request should be freed via ssam_request_sync_free(). Currently it is
> leaked instead. Fix this.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  drivers/platform/surface/aggregator/controller.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 43e765199137..c6537a1b3a2e 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -1700,8 +1700,10 @@ int ssam_request_sync(struct ssam_controller *ctrl,
>  		return status;
>  
>  	status = ssam_request_sync_init(rqst, spec->flags);
> -	if (status)
> +	if (status) {
> +		ssam_request_sync_free(rqst);
>  		return status;
> +	}
>  
>  	ssam_request_sync_set_resp(rqst, rsp);
>  

