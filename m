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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB1FC48BCF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B14961364
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhFIObs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38166 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237342AbhFIObp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 10:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623248991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6w5P+5GBZeCY0UV2lck32gOuVQryFfWC78fsk4UZYKQ=;
        b=JQYEZxX3JVboIFhmDDeVCVPsQywaYLWXXBo2UwMCEGWaDIBPoyjmrj7RAFpyLsnT31V7ub
        eDzbII/mRvLcEpLiolQezC9HpR1eXYehR5TOaweBfL/MqkJ5xUPnwHQVyuw02qMjnqWyY3
        /GFCLG8OcwZAKpT+GWwXggx1cc8iGJo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-HAyQ8FugOGuJRhLsi4XDpg-1; Wed, 09 Jun 2021 10:29:50 -0400
X-MC-Unique: HAyQ8FugOGuJRhLsi4XDpg-1
Received: by mail-ed1-f71.google.com with SMTP id q7-20020aa7cc070000b029038f59dab1c5so12533059edt.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 07:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6w5P+5GBZeCY0UV2lck32gOuVQryFfWC78fsk4UZYKQ=;
        b=GDx8+op0frTo8Ayh4GUSQDBUF0zBkjseQ9OFtSSBSSbRFXQ9h1uu7eeiDyqW3r1x86
         8vQEBjwjxf20Kz9BBm9k/gXk90oTQLxc8dXl1H0+NDUxW1FpIPPHQguBhnw5xfNO6IPn
         B33ugU/MwVYYBhxdA86HPn2zR9x5Orqqol2OvYIRB3EgIRgNsHdv/ombTZLi8ZxMNqev
         HL5RoYLpuQZRZa7zfdZXpcQUwaB3vxwXahmftbsGRxCxkYDD4tps+PZpxUAS8nHkyjHN
         AM6UoexRUwD2ZIF6MB0+ULnhQHlvYu5gop5VrCZ3bYu/jGHL/3Et1tF0nF3pTdYzZC5F
         tJcg==
X-Gm-Message-State: AOAM532s2Xg1Izj9YaoOJ0m2/ZyaLkJSSX2hNkEVlQk9moHZuYboa4H7
        3WWv7QVVO3xvkrzku2ZVZi7BiVLojsKJJtWdueO9cW9t5Z8a9TG9rpLvIYQgCsYG38TgHqbaRCt
        l0tjMQwtKXh1r/KXmYPlZD+rIQ9yfFOCjRA==
X-Received: by 2002:a50:ee05:: with SMTP id g5mr11285420eds.73.1623248988577;
        Wed, 09 Jun 2021 07:29:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh3Za/nYUMukrYUOMCFUca+9qaHGPLAPr68ndTktjSBkx6oyOJclwM2RwVErLNFgIUfnml/A==
X-Received: by 2002:a50:ee05:: with SMTP id g5mr11285411eds.73.1623248988455;
        Wed, 09 Jun 2021 07:29:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dy19sm1218535edb.68.2021.06.09.07.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:29:48 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: intel_ips: fix set but unused warning in
 read_mgtv
To:     yangerkun <yangerkun@huawei.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, yukuai3@huawei.com
References: <20210607014702.2981097-1-yangerkun@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ccf48a73-033b-0e99-6507-71448fac5117@redhat.com>
Date:   Wed, 9 Jun 2021 16:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607014702.2981097-1-yangerkun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/7/21 3:47 AM, yangerkun wrote:
> drivers/platform/x86/intel_ips.c:832:6: warning: variable ‘ret’ set but
> not used [-Wunused-but-set-variable]
>   832 |  u16 ret;
>       |      ^~~
> 
> Fix it by mark ret as '__maybe_unused'.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: yangerkun <yangerkun@huawei.com>

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
>  drivers/platform/x86/intel_ips.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index bffe548187ee..4dfdbfca6841 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -829,7 +829,7 @@ static u16 calc_avg_temp(struct ips_driver *ips, u16 *array)
>  
>  static u16 read_mgtv(struct ips_driver *ips)
>  {
> -	u16 ret;
> +	u16 __maybe_unused ret;
>  	u64 slope, offset;
>  	u64 val;
>  
> 

