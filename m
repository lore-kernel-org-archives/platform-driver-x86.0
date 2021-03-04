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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF332C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BF9C64F45
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 13:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241416AbhCDNov (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 08:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42122 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241490AbhCDNob (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 08:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614865385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P6jU/+yi/gu3OyKqfKyKelNq/M1F72u6d5gyrBV0tQk=;
        b=K2hw9e9/M3wLLsfJPPi5sJBUfF4NWaAL/rnWQpkVwASTcxl3qPdIiWE97xXSPLiHhtXptH
        5Q4ZWPqxpwU46QV+LwAbZWpb4Z4xMcOeYAxjJvHoK3xrPKO5t05Y72UTmTQdsty37QRke3
        zcbBjzPjMulN9loEH8aaB14rsl5UPGc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-B1mWFHU_Nyy1imYTbh8tzA-1; Thu, 04 Mar 2021 08:43:03 -0500
X-MC-Unique: B1mWFHU_Nyy1imYTbh8tzA-1
Received: by mail-ed1-f70.google.com with SMTP id i19so11695148edy.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 05:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P6jU/+yi/gu3OyKqfKyKelNq/M1F72u6d5gyrBV0tQk=;
        b=atIJ5APGKnFbASpybQoC4MDFGlzZwX1aGnJus6EMgYzW+2IA0ePtDSeCRvK5O8HM5Q
         GL28BGaC/O7qpiK/nqlvxIbHm73vT8KHqawOn5+Zf7ZOHc2nKF54cRoVRpSeT/tUcLLp
         nTiV3vS/SFkXI+fAZf5BZD5Gfgnvkc2RDyNi0wfjGfhPBpMAxHidn0zcBKZ1M74M35Mo
         WgzzFdwEvr/1WfU3JMsqLzS3FharryEH3xxqBmuXSXFGXdGSW+ovplZUMoeYl8qJDNjV
         qZfKg8P6C86Z+Wf/ONQuvi/4UjbxjCHWkTCZPwe2dJjQfHYDedgQqWZuzaYa9U2aHBZC
         0GTA==
X-Gm-Message-State: AOAM5302qY/1WH5U5mlWDO0uhmpNpy2CS34kINlLswWuAujOsPT2QoBe
        7N8aYaIjH5eU1YngDMsAWmxx4HmIcvaeTSeqOcdXCF6IUiikTtPEx2iGisOvzIMhTj/Jjx+0DzT
        NDyqHP7Oi+7vjg4TxWkZ30iBteovZpkOaLA==
X-Received: by 2002:a17:906:e116:: with SMTP id gj22mr4189033ejb.398.1614865382394;
        Thu, 04 Mar 2021 05:43:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbu02THzqMMzc7eoXDwlkDR2xZFT4tZXRpBbfiihYAqMjd7SGEXM9lhm+I7/clbghLxThcNw==
X-Received: by 2002:a17:906:e116:: with SMTP id gj22mr4189018ejb.398.1614865382225;
        Thu, 04 Mar 2021 05:43:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h2sm22162425ejk.32.2021.03.04.05.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:43:01 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel-hid: Support Lenovo ThinkPad X1
 Tablet Gen 2
To:     Alban Bedel <albeu@free.fr>, Alex Hung <alex.hung@canonical.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210222141559.3775-1-albeu@free.fr>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5fd625f4-eb41-b057-fab3-6e53be404dc3@redhat.com>
Date:   Thu, 4 Mar 2021 14:43:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222141559.3775-1-albeu@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/22/21 3:15 PM, Alban Bedel wrote:
> Like a few other system the Lenovo ThinkPad X1 Tablet Gen 2 miss the
> HEBC method, which prevent the power button from working. Add a quirk
> to enable the button array on this system family and fix the power
> button.
> 
> Signed-off-by: Alban Bedel <albeu@free.fr>

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
>  drivers/platform/x86/intel-hid.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 2f5b8d09143e..57cc92891a57 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -90,6 +90,13 @@ static const struct dmi_system_id button_array_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x2 Detachable"),
>  		},
>  	},
> +	{
> +		.ident = "Lenovo ThinkPad X1 Tablet Gen 2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Tablet Gen 2"),
> +		},
> +	},
>  	{ }
>  };
>  
> 

