Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A30C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 13:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83CD76121F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 13:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240063AbhIPNbB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35262 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239964AbhIPNbA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 09:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631798980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UNUyJu951BhTSiFHZpKJrsLVVUjWy7DLWDoXmLf4AkI=;
        b=Aepjr3vHkYXTaIjzDjtOQQ/Oltx2uWqNQ5zJDQFTfIsRDXMjNqoK2y6djO6Xn2bFKqcZFt
        qN6fchJ/zsuHeJHzuT6Eb6GLijijOqTowdtlUJeagQGtmqpC+5bACd1JhxNJ1eRXsbMkwZ
        Cs0QTJ+2WCWg9aIOeBsMnrHWJAXl+24=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-T9icesYGNCizLXyHuCG33A-1; Thu, 16 Sep 2021 09:29:38 -0400
X-MC-Unique: T9icesYGNCizLXyHuCG33A-1
Received: by mail-ed1-f72.google.com with SMTP id x14-20020a50ba8e000000b003d5a565de3aso4490899ede.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Sep 2021 06:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UNUyJu951BhTSiFHZpKJrsLVVUjWy7DLWDoXmLf4AkI=;
        b=aBMFTNZhxAghUVZB/41j58p2cQVcnNngQkjqhubj/u60oKD55cmPu6OPPRnw+5U59q
         37haRaCWUejlFc1Q9MuoOCoSYgnMPzLpsB3FSLZKxPG5xmIA0/gfZKUuAucpng1zoWlb
         QP7Tg1jFDx6h9TxeUsgXVNGamMmcHOgyR+kJ8Q1/fzKnM11zHLx8OWXjVfBW/5MQDtH3
         /vmasYtDL2viXObjdOXOh5qokBPLb0cVqyWuybma6ccLi8crBuptlM4RMRAhN2fUdn9u
         5k79kzX6o71NOkv4+IX8FK1pjEWJtgQRk3s71Zos+4jlIy93GBw+eFPap/USbeFGCRRG
         tf2g==
X-Gm-Message-State: AOAM533p5b2dDkoKM+Z1F8mps7YTAqP0kMwwZ+t5XCsht+9EXLJUnP5J
        8t6t+VoJmBywyHojmURR30cXj8YRXjv3xMGWmvffTB1oWXDT1kFA13jeY6nIwhBKfOM+4g32hYl
        E3Tk5Njkj8yl2iY1Oxm+mpeUcLyYE3N53Ww==
X-Received: by 2002:a05:6402:1808:: with SMTP id g8mr6445034edy.188.1631798977745;
        Thu, 16 Sep 2021 06:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwn49jlXs40BqzVoyB89n7L3QbZtj8ZP+wvht+EJhEbTQOs9HeOEyVNBGkrMkuPr5qgBN6Nw==
X-Received: by 2002:a05:6402:1808:: with SMTP id g8mr6445018edy.188.1631798977581;
        Thu, 16 Sep 2021 06:29:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s11sm1373620edy.64.2021.09.16.06.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 06:29:37 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Check s0i3 cycle status
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210916124130.2581-1-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <145806c4-e544-0a76-0e63-553375d1ce9b@redhat.com>
Date:   Thu, 16 Sep 2021 15:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916124130.2581-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/21 2:41 PM, Sanket Goswami wrote:
> As the PM firmware returns the status of the last s0i3 in the smu_metrics
> structure, the existing name "s0i3_cyclecount" seems to be a misnomer.
> Change it accordingly to "s0i3_last_entry_status".
> 
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
>  drivers/platform/x86/amd-pmc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 0c970f613e09..91c1f1c6c929 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -141,7 +141,7 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>  struct smu_metrics {
>  	u32 table_version;
>  	u32 hint_count;
> -	u32 s0i3_cyclecount;
> +	u32 s0i3_last_entry_status;
>  	u32 timein_s0i2;
>  	u64 timeentering_s0i3_lastcapture;
>  	u64 timeentering_s0i3_totaltime;
> @@ -170,7 +170,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  	seq_puts(s, "\n=== SMU Statistics ===\n");
>  	seq_printf(s, "Table Version: %d\n", table.table_version);
>  	seq_printf(s, "Hint Count: %d\n", table.hint_count);
> -	seq_printf(s, "S0i3 Cycle Count: %d\n", table.s0i3_cyclecount);
> +	seq_printf(s, "Last S0i3 Status: %s\n", table.s0i3_last_entry_status ? "Success" :
> +		   "Unknown/Fail");
>  	seq_printf(s, "Time (in us) to S0i3: %lld\n", table.timeentering_s0i3_lastcapture);
>  	seq_printf(s, "Time (in us) in S0i3: %lld\n", table.timein_s0i3_lastcapture);
>  
> 

