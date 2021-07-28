Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772E6C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 10:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 577F06056B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 10:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbhG1KAA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 06:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20029 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235787AbhG1KAA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 06:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627466398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rjrGUELJrum5Ji89g/7iaRnZY9OVtK3tF4vpedgBiQw=;
        b=ZS8n+oZVnYeEF8JGG4UCnSx6dJ5g8ag6bd2xwxIaO12j24NfS97w6YviDlj5Rr0suTae2h
        Oti+0R3rBtSiX+rm7xMgqooDPdbG3NfeIlfLQ8hYEARlrdEpX7L4cfBkfs2WOs09FpHGss
        B38ILyarxwIpHnveioMg/Go6g3bsO7Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-l1fphUQcPWa4KWxu696dDQ-1; Wed, 28 Jul 2021 05:59:57 -0400
X-MC-Unique: l1fphUQcPWa4KWxu696dDQ-1
Received: by mail-ej1-f70.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso624018ejc.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 02:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rjrGUELJrum5Ji89g/7iaRnZY9OVtK3tF4vpedgBiQw=;
        b=GUbRrPV5osQXh/xQE2KVnKPuCo2QqPyHgjEHxCjzlnukjZh9zeUeqb0RY8XLBr1lkc
         FbSH4Kf9EL41XuQ6CuL2HnOtJt2TDg3evyVW5m9xzz8b91WeGnRxAl8dA7U5XaMw/Clr
         1m7ldXTLjv77AkOQh/x0NAAk2fmXLLevDdoK28kvbK8jslQ4C5JCIoT4i6po27Hd9Unm
         YRFZgmnNKhZ8tRdIa2bsSEaPL7qxiJKYTeuN4LIyKcAzim2gJaPyTMY0e4NsxBwO1GCH
         C4pUj4z/3JvSp+Xpc0eURxXaNZ4ftIVT+YBHDupx6xCV5ikjcXx8qj6tizdtXvZqS0GL
         HTZQ==
X-Gm-Message-State: AOAM530BMhPIkSL/tIB0B19yGcEhvMF6gZT//xiHLp379LSOf5pwQnoR
        0/JTbYsgsiulbn5Pyr69ErT1eYP/UvV+IZ5VEEBMb18rquf+xRmpEiX6b9sljwsfRhel3v05BDc
        RvLhLzPq3BKNp3fUnsbhUU076Czh+g7F/9Q==
X-Received: by 2002:a17:907:97c9:: with SMTP id js9mr26616793ejc.109.1627466395955;
        Wed, 28 Jul 2021 02:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+R9CtvMSrFv6XUecaVJPF6EkDx4k8me+9FoZ9YuZQCC0sy6c5eaUJPoGZ8dOhx+S85lT+Aw==
X-Received: by 2002:a17:907:97c9:: with SMTP id js9mr26616781ejc.109.1627466395789;
        Wed, 28 Jul 2021 02:59:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g24sm1838086ejo.77.2021.07.28.02.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 02:59:55 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-hid: add Alder Lake ACPI device ID
To:     Ping Bao <pingbao@gmail.com>, Alex Hung <alex.hung@canonical.com>
Cc:     Ping Bao <ping.a.bao@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:INTEL HID EVENT DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210721225615.20575-1-ping.a.bao@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <49552fec-82b6-955f-584a-029e27c92d02@redhat.com>
Date:   Wed, 28 Jul 2021 11:59:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721225615.20575-1-ping.a.bao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/22/21 12:56 AM, Ping Bao wrote:
> Alder Lake has a new ACPI ID for Intel HID event filter device.
> 
> Signed-off-by: Ping Bao <ping.a.bao@intel.com>

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
>  drivers/platform/x86/intel-hid.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 078648a9201b..e5fbe017f8e1 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -25,6 +25,7 @@ static const struct acpi_device_id intel_hid_ids[] = {
>  	{"INT33D5", 0},
>  	{"INTC1051", 0},
>  	{"INTC1054", 0},
> +	{"INTC1070", 0},
>  	{"", 0},
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
> 

