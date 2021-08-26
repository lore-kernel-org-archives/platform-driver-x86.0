Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77882C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 13:13:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E11760F92
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 13:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242457AbhHZNOj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Aug 2021 09:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45106 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237420AbhHZNOj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Aug 2021 09:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629983632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4rOTkazD8KxVh/cFMAxCF3aY7NFOOvs7j1BNmQ/pZqM=;
        b=ZZ1sN5MMnf/cxmAewzmNH9gn1ULZv6TeASSMZye+EXEtxLyxD4uF9L/NN4tfdWGs1XdRw4
        vrXn6bKi894O5k2MdTWa5ZCNPFmaER4AvZ1U4FJaVPw+UWa5iHA4eyjz+/oEmoa6moqVti
        B2W/GLK2b9ShXAcdeTSXeNODOaItkPI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-KY2dvr0mOKmBA3dfWh7dkQ-1; Thu, 26 Aug 2021 09:13:50 -0400
X-MC-Unique: KY2dvr0mOKmBA3dfWh7dkQ-1
Received: by mail-ej1-f71.google.com with SMTP id ja25-20020a1709079899b02905b2a2bf1a62so1180342ejc.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2021 06:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4rOTkazD8KxVh/cFMAxCF3aY7NFOOvs7j1BNmQ/pZqM=;
        b=dtBfWT8EUJVUTsEry8lpB2PsW3eectudsVbRn0eq6RqDRnCVlSCgQ+5IRjVk8mJirL
         WAAd3hhMtXl1znSDOB/sa/4Zc6XIEAd3Oy8FM2ME1cfQIEanB69/RWPYDK/BGdFxvOdj
         p1jSr4mnzAHEy2rb6L4xE62ABqZgeL9r6GJy1SDzbC9fkPXROzRi1kog5yaD2wRM6M6r
         cBsE+lQ1Y3NAVje4TLXDvHLe66VBdRXMoh07IK/y039H60hHWJ64mb+RGsU/M1y+B6o2
         IEc99RrcqYZZIvsp0YetEHdj3X5UYFqjqV8BNhV2zJrN/cTPP7cJ218JksWgxn0jWbOI
         sW/Q==
X-Gm-Message-State: AOAM5322kZsp3FFvhKw7Hui+x+gUALzpD968Bj0uciMR3cf28daMNDhg
        XHsGcxbHMc36fKxpXSNRRwTrIn4mQtjWbKimYxesIgDAEIFzONJySS0Ttt4zLJvWE3U6ZVXXXEB
        mL524piO1djp0ADVt/4oHiLUy8acQYYSYYg==
X-Received: by 2002:a50:fd02:: with SMTP id i2mr871496eds.22.1629983629508;
        Thu, 26 Aug 2021 06:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrcwrSRpuCH3o6u/eNoA/kIY8YOa04bBQIaa8wzVFzHePXrGbEm+mOfqVhuRJBrb00zOhLJQ==
X-Received: by 2002:a50:fd02:: with SMTP id i2mr871446eds.22.1629983628857;
        Thu, 26 Aug 2021 06:13:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gl2sm1408855ejb.110.2021.08.26.06.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 06:13:47 -0700 (PDT)
Subject: Re: [PATCH] asus-wmi: delete impossible condition
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     Mark Gross <mgross@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210824113654.GA31143@kili>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <44c6b841-fc90-864b-2f39-484d0158500f@redhat.com>
Date:   Thu, 26 Aug 2021 15:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824113654.GA31143@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/24/21 1:36 PM, Dan Carpenter wrote:
> The "asus->throttle_thermal_policy_mode" variable is a u8 so it can't
> be negative.  And we always verify that the value is valid before
> setting the policy mode so there is no need to check again here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/x86/asus-wmi.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cc5811844012..679429d41264 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2179,9 +2179,6 @@ static int platform_profile_get(struct platform_profile_handler *pprof,
>  
>  	tp = asus->throttle_thermal_policy_mode;
>  
> -	if (tp < 0)
> -		return tp;
> -
>  	switch (tp) {
>  	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
>  		*profile = PLATFORM_PROFILE_BALANCED;
> 

