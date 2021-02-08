Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5CEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 19:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A921F64E73
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 19:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhBHTDo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Feb 2021 14:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21299 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236031AbhBHTCn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Feb 2021 14:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612810876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qsOZdP6JaGBCys6lI8Ps0nCa4t1QI6F4FQf8RXTti5c=;
        b=cMCW3tFy/xnkG44LXmfpmHPxrd5ewSzu5hIx80ebRQw8033N4UyJ6PBbpwfhw1b8HiekdD
        HYgK0kSmGPs8zK9oktq762okbuk8R39eK9CHdTlcoe/NfuQVsqkNUL0VDVp7kpEj91WHrJ
        F3/e0g4GDQvKocL+Twr2j3WhFdM8u8Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-8OkrJr3VNrKCQGRlsl_P7g-1; Mon, 08 Feb 2021 14:01:14 -0500
X-MC-Unique: 8OkrJr3VNrKCQGRlsl_P7g-1
Received: by mail-ej1-f70.google.com with SMTP id n25so13138932ejd.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Feb 2021 11:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qsOZdP6JaGBCys6lI8Ps0nCa4t1QI6F4FQf8RXTti5c=;
        b=H8c/gF6jNohPQjHX8BGb+nQY/KNb3Jr91XcEbxTFyo+raksWR6HlWFwfVLfRoQdoVN
         i2WvPDMZBB5Q29XFBJnKJZGIM0W8x1S2XIfWU6jJugZoFU6MdTau9mYx1OD1yBqtpsRd
         Ua21OmBnlKWMbDdR5QjSUM1/sAENgcSzfUC6i2EStdaXY1r3DzY480v7XorAmin3NEOX
         cTir7zPXtTLLm2UeVGllPMDNIMEbAFal9Sbtl9owzbaPCHQ7dm4ZiwQatnkFhwJ2WVfE
         Q0GvvzEiyuT2IUyNEz8ddL8RGeP2NWHq4ln8aEk8s/YeqjYc0E6LHRR6Kx3/c1cke/GN
         kkGA==
X-Gm-Message-State: AOAM530HPGu98cMvVxaUqFN+ifQm2Pz1tCVcQkOr0rY7pq/HJPNTq5OU
        skOzTc32sMXqNJxfKZSeaSVfdliq+MH1KkUHfzaEjtOPto28REKkgKdQjbekk2r978quke3s1Pb
        LpFCr2PidJMMNzx4DmF20o1sYog/3Ptr6fQ==
X-Received: by 2002:aa7:d58b:: with SMTP id r11mr18480089edq.241.1612810872862;
        Mon, 08 Feb 2021 11:01:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrKaV6M4wNhPDX70JYnsrA7SHTqWJx6bMT62GOn1cJQvQVqzhPKKQ7HGRLi0rlL6RL/liZ5Q==
X-Received: by 2002:aa7:d58b:: with SMTP id r11mr18480077edq.241.1612810872685;
        Mon, 08 Feb 2021 11:01:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id kv24sm8947329ejc.117.2021.02.08.11.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 11:01:12 -0800 (PST)
Subject: Re: [PATCH] Platform: OLPC: Constify static struct regulator_ops
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210206232152.58046-1-rikard.falkeborn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c0f6456-56cd-0778-fda1-98d810963225@redhat.com>
Date:   Mon, 8 Feb 2021 20:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210206232152.58046-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/7/21 12:21 AM, Rikard Falkeborn wrote:
> The only usage of it is to assign its address to the ops field in the
> regulator_desc struct, which is a pointer to const struct regulator_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

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
>  drivers/platform/olpc/olpc-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
> index 72dbbea0005c..4ff5c3a12991 100644
> --- a/drivers/platform/olpc/olpc-ec.c
> +++ b/drivers/platform/olpc/olpc-ec.c
> @@ -386,7 +386,7 @@ static int dcon_regulator_is_enabled(struct regulator_dev *rdev)
>  	return ec->dcon_enabled ? 1 : 0;
>  }
>  
> -static struct regulator_ops dcon_regulator_ops = {
> +static const struct regulator_ops dcon_regulator_ops = {
>  	.enable		= dcon_regulator_enable,
>  	.disable	= dcon_regulator_disable,
>  	.is_enabled	= dcon_regulator_is_enabled,
> 

