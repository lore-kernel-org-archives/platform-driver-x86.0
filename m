Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AF2C47082
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 11:07:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A43260FDA
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 11:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhFCLJJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Jun 2021 07:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55111 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229958AbhFCLJJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Jun 2021 07:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622718444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dcBt514DAgpwi2c+GjWuvkXxC4u2Bwwf8osuVxsYnHg=;
        b=boi4CaT8PrxeU+Kr1cZqVrkWqtO/2O8OB/GkAQgA0LDFn2faCyiMngVWBYUIsRXJOKfapE
        vyWieDKR6Jopdn/DK++EgHe64LrKCDWKi34GoD4dDb8dv3m/uuQPHb8dC/SbUJthaGxUqi
        4Z61dfNjjCkBt5pPJhngF8AIhfxiJu4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-g6ltsQ8aMCiNPuRlxdMVkQ-1; Thu, 03 Jun 2021 07:07:11 -0400
X-MC-Unique: g6ltsQ8aMCiNPuRlxdMVkQ-1
Received: by mail-ej1-f71.google.com with SMTP id z1-20020a1709068141b02903cd421d7803so1804243ejw.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Jun 2021 04:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dcBt514DAgpwi2c+GjWuvkXxC4u2Bwwf8osuVxsYnHg=;
        b=Ukay9C8VdtNmEgD/B0pH+pVL6EVwkjfokKs0znW6dd8/gSqDOHyP2SweGBhE5oFjKa
         RiK2Oshi46v160RwzXjYd5EQdpQv7ITkV8dFC/K0XLhSVrlvhUhJ1Clvn23DlHMIlio3
         dEkKYAXH9jlLK7ill6+tHrQu2W36xETFNN4KjO3lb9aJ5HmcwRp83caV//3x/W677Km4
         gVY0BdqY6ziU2mtXCdvRzgDhi/7qMThE23BAQG1Tpjmw+/5vtnoVXPbiRPXwhU/1Ebk3
         kMt1MoGy9drhwTC+UQ066lDUh8KxqzdEsnwZN7XsiP4lqMDWjCU2iRtafPn3wtF/hQNH
         q3/g==
X-Gm-Message-State: AOAM532OliVnikhE2ox8tcvy8rLGVtUBGzqM+K/l+dFzpwW/IDbe7nPy
        6fiv90rnhJ950sq3x0Jo+wipaNmUwNjb82cTEzhZh9caS32vozrpPHAuItc0US0DK+50sMTpIoU
        mhi2lXoJlxG3nbPElbK2Spou/Psf0zsuDQA==
X-Received: by 2002:a17:906:3f86:: with SMTP id b6mr38848955ejj.530.1622718430498;
        Thu, 03 Jun 2021 04:07:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3PMVYbjbJddxU25OBr5xYm6aX3+jkxIqTirZdNAI+NdlxWC7RrIl49J72AZw4TNhaX7ujNQ==
X-Received: by 2002:a17:906:3f86:: with SMTP id b6mr38848948ejj.530.1622718430315;
        Thu, 03 Jun 2021 04:07:10 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id kj1sm1399239ejc.10.2021.06.03.04.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 04:07:09 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: Fix event disable function
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210603000636.568846-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e6330ca-a2ee-acd4-b5d7-0f7a828d132c@redhat.com>
Date:   Thu, 3 Jun 2021 13:07:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603000636.568846-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/3/21 2:06 AM, Maximilian Luz wrote:
> Disabling events silently fails due to the wrong command ID being used.
> Instead of the command ID for the disable call, the command ID for the
> enable call was being used. This causes the disable call to enable the
> event instead. As the event is already enabled when we call this
> function, the EC silently drops this command and does nothing.
> 
> Use the correct command ID for disabling the event to fix this.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll also add this to the fixes branch, so that it gets included
in my next pull-req to Linus for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/surface/aggregator/controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 8a70df60142c..a06964aa96e7 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -1907,7 +1907,7 @@ static int ssam_ssh_event_disable(struct ssam_controller *ctrl,
>  {
>  	int status;
>  
> -	status = __ssam_ssh_event_request(ctrl, reg, reg.cid_enable, id, flags);
> +	status = __ssam_ssh_event_request(ctrl, reg, reg.cid_disable, id, flags);
>  
>  	if (status < 0 && status != -EINVAL) {
>  		ssam_err(ctrl,
> 

