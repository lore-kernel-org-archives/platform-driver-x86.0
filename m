Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87043C3E8C5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 18:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48490221EB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 18:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QkNhIviW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732382AbgK0SOj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Nov 2020 13:14:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25688 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731966AbgK0SOi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Nov 2020 13:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606500877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zblCK4pOtDS7ElDLOLvKjMa2HPa6odT0ekp3Gal1H1w=;
        b=QkNhIviWQtF64onIfw2bPwPuSHuGIzseJ8IyG76LAwrcN8W0dFjiec+OLuXQfoZH1lkJFX
        9M8GFuD8g0sDIXHrHXrAadQgd8zEhzvAexQozMXyXEK9Z1QIPTADO6WSY2ULxoc/GzDFHK
        PpUtYMtegptyrasl88kvzL1lSHoF7Lo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-Q-C66MQgNpeLmN3gvmLjAw-1; Fri, 27 Nov 2020 13:14:35 -0500
X-MC-Unique: Q-C66MQgNpeLmN3gvmLjAw-1
Received: by mail-ed1-f70.google.com with SMTP id m23so2380190edj.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 10:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zblCK4pOtDS7ElDLOLvKjMa2HPa6odT0ekp3Gal1H1w=;
        b=kjTobel5iFOylVV3pTcr+El99LrpbJ45dsCqABO71maIDcVSFyOMUCyzePQ+Ds+BGM
         uG/7QfJItTcpFzek/vZ+TXdZNVb7lEaltektjfXn7QCaGu0EZcw8VcAgn4S8CYizNb8p
         4l0BDSjt+b5bKQCDLlgvO8yOWAu+bGs3qx48SLlOnFlm4TrLZWgxLBKA9hc8RmEFmnHQ
         VTrlyo+irwPPofpgqkxmy6Yl4bGnmh04mlzDWMI7e8HW3Vo/dQ60o6vDsKNyCtVb1JJF
         3p9dxXUJwlscq9KMyyvtA1BHSzu/7oQeKwPdEBqwf8TWq0XVt97V8da4zeQMPRv/SZ5v
         FPcQ==
X-Gm-Message-State: AOAM531oDQ98psw3Ue+RSFrorG6FIM5LxV//T1baEgbjaHeSyzMrNfVs
        LvEkeDhLHxh8DJtWgBYhOekRVQLSZO0v67l6H0l8ugq6RUrWnDWhL6tfEDBjkUw+kgKP/dfEsoq
        4NhzV/5n6HHUs8JE9CiqW0E2GmT0PfhawFWfuAnOQm1PAvNe/Njg9oNA5mlGHEdOqrxlPpPuRxQ
        LmbV3B037phQ==
X-Received: by 2002:a05:6402:19b4:: with SMTP id o20mr9226924edz.103.1606500874121;
        Fri, 27 Nov 2020 10:14:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj906MV6TfMhfgxY4BW3kZGDS2sM74mni8GwmAJEEajOFQ1+hgku9GWWzly854n9AUJDForg==
X-Received: by 2002:a05:6402:19b4:: with SMTP id o20mr9226901edz.103.1606500873894;
        Fri, 27 Nov 2020 10:14:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id s6sm5338368ejb.122.2020.11.27.10.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 10:14:33 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-smbios-base: fix error return code in
 dell_smbios_init()
To:     Luo Meng <luomeng12@huawei.com>, mgross@linux.intel.com,
        dvhart@infradead.org, mario.limonciello@dell.com,
        platform-driver-x86@vger.kernel.org
References: <20201127012430.2539121-1-luomeng12@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3f3e0242-7497-8cb9-84f2-fadc3a003d84@redhat.com>
Date:   Fri, 27 Nov 2020 19:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127012430.2539121-1-luomeng12@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/27/20 2:24 AM, Luo Meng wrote:
> Fix to return a negative error code from the error handling case
> instead of 0 in function dell_smbios_init(), as done elsewhere in this
> function.
> 
> Fixes: 25d47027e100 ("platform/x86: dell-smbios: Link all dell-smbios-* modules together")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Luo Meng <luomeng12@huawei.com>

A colleague of you already submitted the exact same fix:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20201125065032.154125-1-miaoqinglang@huawei.com/

I'm waiting on a review from Dell on that one before merging it.

Regards,

Hans



> ---
>  drivers/platform/x86/dell-smbios-base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform/x86/dell-smbios-base.c
> index 2e2cd565926a..3a1dbf199441 100644
> --- a/drivers/platform/x86/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell-smbios-base.c
> @@ -594,6 +594,7 @@ static int __init dell_smbios_init(void)
>  	if (wmi && smm) {
>  		pr_err("No SMBIOS backends available (wmi: %d, smm: %d)\n",
>  			wmi, smm);
> +		ret = -ENODEV;
>  		goto fail_create_group;
>  	}
>  
> 

