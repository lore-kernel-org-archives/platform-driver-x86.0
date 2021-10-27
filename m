Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECF8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 14:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72BC060EFE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 14:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242401AbhJ0OKZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 10:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57285 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230160AbhJ0OKY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 10:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635343678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XAoL/CTblidgC2SmYOhdUOvISOvCTxUtHIk1W3hVrAo=;
        b=ilR2g0GN/MyTgjNp6CXylDs/g11Fsl5neMWU8MifitPOSiGBq3FHcl5lCVwzgbjEfcF+V5
        KLbc0MvfmE2Nade7/1aK2fBtDsvDvgzfOjoVEiBYhw4EP+AuZLTuFjvzYeWFSHKqUv0+97
        38Pj0eLQa0UtNqulfZ0qciJxTHmtIlg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-yX8uwwfPPXuXpt4o4BPwlQ-1; Wed, 27 Oct 2021 10:07:57 -0400
X-MC-Unique: yX8uwwfPPXuXpt4o4BPwlQ-1
Received: by mail-ed1-f72.google.com with SMTP id k28-20020a508adc000000b003dd5e21da4bso2404361edk.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 07:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XAoL/CTblidgC2SmYOhdUOvISOvCTxUtHIk1W3hVrAo=;
        b=i0mfhHZP5YAQ4vY5UYVXstyhLJTtcV1qZXh4+q6iJ+PNCRQ8mABkRI+bfksN+8g6Ar
         Da5KS9BzDMYuVugHk76MPs7RAMRKZVdx/GBsROl1DE+gwEowjt5Yu7xZbfJ9HsfFVk2m
         XYduUtLxVP2A6iogvWMAeFA0mqe3elNZnrYu/bwSQo1YEmm781/Jx8vZws62Ly7tf49g
         Pzk6BOjDnVp9tiXfd5xv61pXzXYF+11nQ43xnL7lkSy56npHiy0XLO0Ueb+NuNoi8QU+
         2FjaDpeR7An4tpj3HPVLpstHGJMA/1p/YSW9nUEV8tyKbLYdEhZjLO/12cyHvbVg0lr4
         U/uA==
X-Gm-Message-State: AOAM532ucCVqVEIEFGjG/c6Sh4NI4DI5sRDSR25nWy0IL8yw4Ty6HdTe
        16MRQinF/7btlcE5h+gRlgzZzgiaJwvtXIZvCvgz1qeiB6FDPskxxh4B5rHw4R8emd6FyFCPO/1
        mVZ70JVCxhsNRG9Qvrbz/5V1AUKF+niI48Q==
X-Received: by 2002:a17:906:2bd5:: with SMTP id n21mr38950461ejg.337.1635343676352;
        Wed, 27 Oct 2021 07:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGCotFWsjp5txArXbarReu55hlw2l07POWoN3rmUQoFU97ybPAZHx+UD69ZNoQigHI+dA0+A==
X-Received: by 2002:a17:906:2bd5:: with SMTP id n21mr38950439ejg.337.1635343676179;
        Wed, 27 Oct 2021 07:07:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j15sm71823edl.34.2021.10.27.07.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 07:07:55 -0700 (PDT)
Message-ID: <3022e301-b33b-92bb-072f-76b06878bf7f@redhat.com>
Date:   Wed, 27 Oct 2021 16:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] platform/x86: amd-pmc: fix compilation without
 CONFIG_RTC_SYSTOHC_DEVICE
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20211026171443.289-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211026171443.289-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/21 19:14, Mario Limonciello wrote:
> If the configuration hasn't specified this parameter the rest of the new
> RTC functionality should just be ignored.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> Changes from v1->v2:
>  * Hardcode the device instead of #ifdef
> 
>  drivers/platform/x86/amd-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 678bf6874c63..b8d77a18e95a 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -425,7 +425,7 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>  	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
>  		return 0;
>  
> -	rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
> +	rtc_device = rtc_class_open("rtc0");
>  	if (!rtc_device)
>  		return 0;
>  	rc = rtc_read_alarm(rtc_device, &alarm);
> 

