Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFBFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 11:31:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0141D611CA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 11:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240351AbhI1Lcw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 07:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59381 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240336AbhI1Lcw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 07:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632828672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D2q32GpaYYedmpbP0P4iF3ng7C5SjV9/mymtobdC0pY=;
        b=c9hq5u2aOXxD9PGaoRiX9+aZxkY5NGIe4mAZK0DCn0hZlRijRBkiIvxyAKDXK3pWX8Xfpu
        1r7q3LTEfkFssAZ40SG92379f6yZeth+Hd0uZzt0lxurHoIKab/DNRNbKHgoQsqCNQVXfC
        mis3n3PN3fpFmmrBQd64oye7Kg6CDGI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-d4tnuAspMD28tauH8HtpgA-1; Tue, 28 Sep 2021 07:31:10 -0400
X-MC-Unique: d4tnuAspMD28tauH8HtpgA-1
Received: by mail-ed1-f71.google.com with SMTP id x26-20020a50f19a000000b003da81cce93bso3778150edl.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 04:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D2q32GpaYYedmpbP0P4iF3ng7C5SjV9/mymtobdC0pY=;
        b=PfQwDvFp4dBOZI82zRL86FWkh9UjIiqfK0F7uEyU8n4A1fTG7sianfiv3HOx0r9WBg
         iTATEvrOeNxKm0M705IzhlXKrOT5nokDfpf7xvaR6lHaJcY1+l6LuYJ6S+RjJts4bb1v
         dmPnj6kla8FYJ5KrFrp2epkdnos7iGMlw4Tu68SIbonePSk6fgiK//KWHgGGpz+V1TMA
         urO6oYh6xvpr66JS80mFFYzm/XKxSR/yGizDp/h5iBYqGXPeL5VsXt5iILD0FfRlgK1j
         fHxqSb5roOSVPxZXV3vVpWznfGMf8j+F3/WlAHh49P8EHzsdxZeddtyUW47AI7ATFO6I
         iO0g==
X-Gm-Message-State: AOAM533FLeb99UXeF//iNnG67N61tP1xtDjxgHkwkR/PxTvXzbPjc0xv
        cQf9vZuWTNoh2io6MipQMyh6DmkL4CgmEW6TvE7UVdWQIrhEONsxeeIPItS8ypiBUJK2ZMxeaPK
        +aTKLbuIFbLpVLo2Pzr9IUevTNGDHGCI/2w==
X-Received: by 2002:a17:907:211a:: with SMTP id qn26mr6357447ejb.99.1632828669219;
        Tue, 28 Sep 2021 04:31:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMtVMKFxXezO/s2D7g+/sckT3AZY0sjKoFklhntZ/NFXnXyfMmzURfBRPd4qDCTeNkJu2Lyg==
X-Received: by 2002:a17:907:211a:: with SMTP id qn26mr6357428ejb.99.1632828669040;
        Tue, 28 Sep 2021 04:31:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e13sm10299447eje.95.2021.09.28.04.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 04:31:08 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Add a message to print resume time
 info
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210921120020.19454-1-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <04b3b748-06a3-fe35-7a9e-30b5deff18d9@redhat.com>
Date:   Tue, 28 Sep 2021 13:31:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210921120020.19454-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/21 2:00 PM, Sanket Goswami wrote:
> Add a message to print the resume time information obtained from the
> smu_metrics structure.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>

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
>  drivers/platform/x86/amd-pmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index bc7c4498067b..27c04ff57ffb 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -174,6 +174,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  		   "Unknown/Fail");
>  	seq_printf(s, "Time (in us) to S0i3: %lld\n", table.timeentering_s0i3_lastcapture);
>  	seq_printf(s, "Time (in us) in S0i3: %lld\n", table.timein_s0i3_lastcapture);
> +	seq_printf(s, "Time (in us) to resume from S0i3: %lld\n",
> +		   table.timeto_resume_to_os_lastcapture);
>  
>  	seq_puts(s, "\n=== Active time (in us) ===\n");
>  	for (idx = 0 ; idx < SOC_SUBSYSTEM_IP_MAX ; idx++) {
> 

