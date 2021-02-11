Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E989EC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 15:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B436B64E7D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 15:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBKPzX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Feb 2021 10:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39841 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230303AbhBKPxG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Feb 2021 10:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613058640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OctynX1ar7RIiKNg6rIQfEi3ttswP1mzLAJnkpLc0uc=;
        b=XwqSxee51GXJY5evD6+OzHgPItaR6WTYG65tV9roWErKwPyedmzQtS9/9FGy9yeY5dnPvG
        0kxYD/lAwqsMd+j5/Oq1rPzxOFT1wHAQOAlLj2Uz9jwhuOPMiFx3iBaAwxleiMB4pb7ki9
        1rcRI4tlN8T/92FCbvl3Y5De33cij6Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-eqi0pZE6NsmaR-xN6ZQRLw-1; Thu, 11 Feb 2021 10:50:38 -0500
X-MC-Unique: eqi0pZE6NsmaR-xN6ZQRLw-1
Received: by mail-ed1-f70.google.com with SMTP id d12so982697edp.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 07:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OctynX1ar7RIiKNg6rIQfEi3ttswP1mzLAJnkpLc0uc=;
        b=RYMfwJUTm41PgoPgF6pk+wDbY4fqhLzMdrTYx2+4RJRETLjGWV7IkAFp35f0nNrtWk
         aHuOe39pyRmWZS8bpG4Ur4jVwORAsRlo/FWUUHUVjSfL3nV6U/69R6XWC3WXioEVXkYH
         U/Bqa6FWz51ZJb2PU62qRjD0Uv31QB0CCsEaJfNWzN1v/JqTWXhCLh0mnb5QoYjLMTJb
         Y3itUQ93PAn+TcJSr0DSLWlu5XGpTVTxcewT20cDmBJ/QktLvRY4wEBoZVc9eSecsTUg
         2eiku2J14MhFaJn4Q7s+aqspgNE7dFc3mmzYlxdLjt2tmSijX9YmCXIQ8vUeV+DmJ/vo
         Cw2A==
X-Gm-Message-State: AOAM532/a/zUHxDBclEetao28zxrx3gwpbhDB7OGNSAHUNBOXdvreyZ3
        3djTPxE74ACkXzTS/1YOI4ImbtLcvbCTsv8G95TD7XXs2s8GqwOawD1FuJSs95eAb6NRauA4Qv3
        EWELnPuBROxKvVP6O+8nezHsYzVssr3n+Jw==
X-Received: by 2002:a05:6402:104b:: with SMTP id e11mr9249607edu.367.1613058637551;
        Thu, 11 Feb 2021 07:50:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhBErHyk8KZGhQfafYwpubplafzqq8J+5udPvfs4dgWbjabZSJIfRFD0ddr+y6ZhYVOVZjbw==
X-Received: by 2002:a05:6402:104b:: with SMTP id e11mr9249589edu.367.1613058637407;
        Thu, 11 Feb 2021 07:50:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z22sm4134074edb.88.2021.02.11.07.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 07:50:36 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel_scu_ipc: Increase virtual timeout
 from 3 to 5 seconds
To:     Casey Bowman <casey.g.bowman@intel.com>,
        mika.westerberg@linux.intel.com
Cc:     dvhart@infradead.org, andy@infradead.org, azhar.shaikh@intel.com,
        lee.jones@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com
References: <20210210192041.17022-1-casey.g.bowman@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <74ea2a54-384c-9741-b269-f58ca15ea2f0@redhat.com>
Date:   Thu, 11 Feb 2021 16:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210192041.17022-1-casey.g.bowman@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/10/21 8:20 PM, Casey Bowman wrote:
> Increasing the virtual timeout time to account for scenarios
> that may require more time, like DisplayPort Multi-Stream Transport
> (DP MST), where the disconnect time can be extended longer than
> usual.
> 
> The recommended timeout range is 5-10 seconds, of which
> we will take the lower bound.
> 
> Signed-off-by: Casey Bowman <casey.g.bowman@intel.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

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
>  drivers/platform/x86/intel_scu_ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index d9cf7f7602b0..9171a46a9e3f 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -75,7 +75,7 @@ struct intel_scu_ipc_dev {
>  #define IPC_READ_BUFFER		0x90
>  
>  /* Timeout in jiffies */
> -#define IPC_TIMEOUT		(3 * HZ)
> +#define IPC_TIMEOUT		(5 * HZ)
>  
>  static struct intel_scu_ipc_dev *ipcdev; /* Only one for now */
>  static DEFINE_MUTEX(ipclock); /* lock used to prevent multiple call to SCU */
> 

