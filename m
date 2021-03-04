Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96D1C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ABFD64F45
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhCDNen (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 08:34:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54367 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239727AbhCDNek (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 08:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614864794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AwdG3t5UAHsBi9SL/Yfrq+jahm1OjtL98jDJl0ORIEY=;
        b=NcpJoCgawPfHjyYjmb9nmvJhD2xjc4qvrHrs1A5gk6ySFmHK3LGST/kO2oRXRq4cC52acB
        ng23GQWguFzf0ZYP2NzmScg9YwtkU3cfByu+hh54yx/eGLx/w0Z/5aAsvYtvShmGzhz6cK
        zXLDwwI3ymSNX0BmM/B2u9s3f8x+ccI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-g6NQUli4MUWivnUeiCiT7Q-1; Thu, 04 Mar 2021 08:33:12 -0500
X-MC-Unique: g6NQUli4MUWivnUeiCiT7Q-1
Received: by mail-ej1-f70.google.com with SMTP id jo6so10028073ejb.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 05:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AwdG3t5UAHsBi9SL/Yfrq+jahm1OjtL98jDJl0ORIEY=;
        b=Sj7+fMvL+uTXe57RHUwuFEjQjUVwEaeGhzNPfFa9gRgVg2fBks3mbEsdj2JVNJeKvj
         7wnRjqItRewLGd46B3CaWycyvlf7OpYwD+5QXtvTAHarYbPA0GCda6genpfV9nvekSQm
         TXLLSjdcObXJdw3aB0mwBksFEGrJq/XYIHe8zVTjzu4mfcKq4Ugs8yCl7ImIZHhMCJ13
         30/QC0X+wrjywl6JPO5Y0LULkAT/jtebYoevJS/vx8D4XsLSb7K+m3AKfgbBq+sabte8
         EFxF9LsEXccPCBiT600lOcWP2/74amvymJKI7BLLDCIx0AXGcKuMQP+7j+l0MCRXEeiC
         BuXw==
X-Gm-Message-State: AOAM530Fqv1+LpOeKp+3FgBrdC0xSgKw2owwrtEviBDpU2ljeCn3WNk8
        PWtTBzjQkpDglH5Rd+hyuh671lsa5Khr1R4XOB2X5+Um8pS08jbQmPgwxZ3SbZuL+yCRdOnPKQo
        4kHSORooosbL91O0olxXznAgaAWkatX6IMA==
X-Received: by 2002:a17:906:ca02:: with SMTP id jt2mr4251217ejb.312.1614864791388;
        Thu, 04 Mar 2021 05:33:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRN4UMPe9nXogqsA95n2ngSH6SNhgA5g5XErEYFBiB307AIH2erIH59FRujP+12a5skOZapg==
X-Received: by 2002:a17:906:ca02:: with SMTP id jt2mr4251200ejb.312.1614864791258;
        Thu, 04 Mar 2021 05:33:11 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e18sm23187980eji.111.2021.03.04.05.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:33:10 -0800 (PST)
Subject: Re: [PATCH] platform/x86: Switch to using the new API kobj_to_dev()
To:     Yang Li <yang.lee@linux.alibaba.com>, ike.pan@canonical.com
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1613977238-104556-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <39606d42-f60e-0c17-4c70-4e94eafbb1a0@redhat.com>
Date:   Thu, 4 Mar 2021 14:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613977238-104556-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/22/21 8:00 AM, Yang Li wrote:
> fixed the following coccicheck:
> ./drivers/platform/x86/ideapad-laptop.c:523:60-61: WARNING opportunity
> for kobj_to_dev()
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Patch does not apply, please resend it rebased on the latest pdx86/for-next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

Regards,

Hans

> ---
>  drivers/platform/x86/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 5b81baf..d6ca4f0 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -520,7 +520,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
>  				 struct attribute *attr,
>  				 int idx)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
>  	bool supported;
>  
> 

