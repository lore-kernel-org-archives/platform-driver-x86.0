Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62FAC432BE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Aug 2021 09:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CCEE61056
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Aug 2021 09:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbhHIJBD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Aug 2021 05:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43187 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234153AbhHIJBD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Aug 2021 05:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628499642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L8HttrntNZPFs0juELsB3vTreBKXm0ssKSUN1T2UgVs=;
        b=aGJcQ/6Q0ejeQwUttWqOrAc5Ue0l+T9GQn2EEYkmjNXSHppFkUqBaPbiKMz/w1fkIfiHOX
        yBMODoxvg4wWmz9E94DeymT3/4GtVXHuicVv+zJirMc3NzWfRlCP86WR4xn2SFAPMAQJZe
        y4XgAtJoUkYethnPShxi/xj4k14P6OE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-zvIJT2qhOHWTQdNLtPC6uw-1; Mon, 09 Aug 2021 05:00:41 -0400
X-MC-Unique: zvIJT2qhOHWTQdNLtPC6uw-1
Received: by mail-ed1-f71.google.com with SMTP id l3-20020aa7c3030000b02903bccf1897f9so8540621edq.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Aug 2021 02:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L8HttrntNZPFs0juELsB3vTreBKXm0ssKSUN1T2UgVs=;
        b=HG6oN91/v5OSwbrY8YdHy9Aj8sBD7Xu4vxxS0Zm98r7S+Reph0wtafi8iTRvtQChjD
         o+hkWNDQDepw4qXjBnhc7M5VakfMlnDlIH86bgpmKU5atLGiZ7W0/jHbSAHHqeZQg79/
         HYP1XhhtotZ2WQt3JDD6jZ8paaPUX2diMFMuWOVbMHeZAUGG54O9YygjQ3KZSsx1SPCe
         dR3n+5QrdAc3j2AhkMbrxkwqu8Wh+6w8gGzo7mXpOOar7NKHB/z1fB4CxRaWlSsf4PeJ
         2YoB47R1mNyTuicF8LIumDLAGTh9kmJ4EcJm9V+tfuTabNVk+YsLZ30Xeqg3Jq8zXsuu
         874w==
X-Gm-Message-State: AOAM533hPnF8ItYnUGro5NFUQmSftQVbar89NUyYdpLbbnzu6ikY4UhS
        um2vZeMA2fe4DaF+fhPBZiBmYiks/r5yuIEsBKdGWI1/KccZnLTNN5+0hcqbha0iqxZ8gVmWDNr
        HZ6PhKMBlmJhueRvHxK1MzBCQefV34jmgoA==
X-Received: by 2002:a17:906:5e45:: with SMTP id b5mr21620422eju.301.1628499640127;
        Mon, 09 Aug 2021 02:00:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw09sn2gDpVU46Yw+tmDb/2htDgapIE6hFOQ5zm1XmYLbdAv6Pp+VPMXn88sB/Yp0DTV5l6UA==
X-Received: by 2002:a17:906:5e45:: with SMTP id b5mr21620400eju.301.1628499639906;
        Mon, 09 Aug 2021 02:00:39 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id v13sm5669377ejh.62.2021.08.09.02.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 02:00:39 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] platform/x86/intel: pmt: Use y instead of objs in
 Makefile
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>
References: <20210806155017.4633-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a6b48303-1a43-5cc2-ec4a-41fed5ae02cb@redhat.com>
Date:   Mon, 9 Aug 2021 11:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806155017.4633-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/6/21 5:50 PM, Andy Shevchenko wrote:
> The 'objs' is for user space tools, for the kernel modules
> we should use 'y'.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
> 
> Hans, feel free to fold in the original commit
> 
>  drivers/platform/x86/intel/pmt/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/Makefile b/drivers/platform/x86/intel/pmt/Makefile
> index 019103ee6522..279e158c7c23 100644
> --- a/drivers/platform/x86/intel/pmt/Makefile
> +++ b/drivers/platform/x86/intel/pmt/Makefile
> @@ -4,9 +4,9 @@
>  # Intel Platform Monitoring Technology Drivers
>  #
>  
> -pmt_class-objs				+= class.o
>  obj-$(CONFIG_INTEL_PMT_CLASS)		+= pmt_class.o
> -pmt_telemetry-objs			+= telemetry.o
> +pmt_class-y				:= class.o
>  obj-$(CONFIG_INTEL_PMT_TELEMETRY)	+= pmt_telemetry.o
> -pmt_crashlog-objs			+= crashlog.o
> +pmt_telemetry-y				:= telemetry.o
>  obj-$(CONFIG_INTEL_PMT_CRASHLOG)	+= pmt_crashlog.o
> +pmt_crashlog-y				:= crashlog.o
> 

