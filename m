Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DBAC0015E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 15:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbjGNPt1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235841AbjGNPt0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 11:49:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F293595
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689349717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5XeKksbSURQEd8d5fxKgEoZsC0sT/WC/oRl5S5IUbo4=;
        b=aabH85B+uRzPcqz0RyKeOJ0CmFmxZHiWrteyuW5NX8ZKmWfAKkvJzD3wBS0TErLSRbUkKg
        RevxmsU3P+2WQjJTkn58sPrw2Rb1scHxax6ZusOzk9ccqkUaudQjeOfbgyhll91oAL/PoZ
        /rbRisnJZZSgegXiJNT4zA0XBHPz3Uc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-qp5nLgxONBqLbJFkX7CHGQ-1; Fri, 14 Jul 2023 11:48:35 -0400
X-MC-Unique: qp5nLgxONBqLbJFkX7CHGQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-514b3b99882so1310510a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 08:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689349714; x=1691941714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5XeKksbSURQEd8d5fxKgEoZsC0sT/WC/oRl5S5IUbo4=;
        b=f7GMcwuHQe6IJvQi9YLTiX/z+Bhi2I0W7DmpLcqMqwrhk/K28TUZcE8LrqCogbUU90
         F/hTdjG7F9/DHZf6HHFZQz0zxfE+0Z0sceT+yLDRPDEESQGOw6sF1r0OdsM5352N8NoR
         WqDoNja+PD9Fw4uqq5HaJxL8aKqw9UTJEIyhGM7uGalJEqgDjwJG/ZXEPTITpBzaKWuD
         9gB+ZjA1bdzuewgV6WkTQ7W++gb02OcXXilXeQmr1SERYK9WxWKlJZBNt9I7ssrLkfV6
         lst60ZlkmqsyuQYK7Lwq4piTkNPUyyvH2PBezRtlIsOWWE6sAE5AVacuBGaqt+BeJHqT
         anyA==
X-Gm-Message-State: ABy/qLaRygUM5z7nvou9l7ar12XGSaQhErJjJtThYBHT7pn5pn4ySQkO
        k1k7v9KwxT6AvQ3EXN+rZ+kpP044tNyP/fTkm5w1rj7a+RR5gMfpyBuOLAYo/yTCSZ0EJDEEpBY
        Gy7svFXtV4H0r7O8lggqG+UuwNwQMOLhU5Q==
X-Received: by 2002:a17:907:724f:b0:974:183a:54b6 with SMTP id ds15-20020a170907724f00b00974183a54b6mr5681388ejc.33.1689349714578;
        Fri, 14 Jul 2023 08:48:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHt6qr4U4VNQtkZWtvqgIEWbFQVI5FjvwF/m0mTUTy5odDXP5lYc0uWRbR0VIqkObZfKlYAIg==
X-Received: by 2002:a17:907:724f:b0:974:183a:54b6 with SMTP id ds15-20020a170907724f00b00974183a54b6mr5681379ejc.33.1689349714299;
        Fri, 14 Jul 2023 08:48:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f26-20020a1709062c5a00b0098242730348sm5605470ejh.72.2023.07.14.08.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 08:48:33 -0700 (PDT)
Message-ID: <7ba62c1c-3287-99fb-39d2-ea698b4a3695@redhat.com>
Date:   Fri, 14 Jul 2023 17:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86/amd: pmc: Use release_mem_region() to undo
 request_mem_region_muxed()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20230711095920.264308-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230711095920.264308-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/11/23 11:59, Hans de Goede wrote:
> Muxed (mem) regions will wait in request_mem_region_muxed() if the region
> is busy (in use by another consumer) during the call.
> 
> In order to wake-up possibly waiting other consumers of the region,
> it must be released by a release_mem_region() call, which will actually
> wake up any waiters.
> 
> release_mem_region() also frees the resource created by
> request_mem_region_muxed(), avoiding the need for the unmatched kfree().
> 
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Mario, Andy, thank you for the reviews, I've applied this patch
to my fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
> Mario, can you ask one of the reporters with a machine which needs the quirk
> to test this ?
> ---
>  drivers/platform/x86/amd/pmc-quirks.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc-quirks.c b/drivers/platform/x86/amd/pmc-quirks.c
> index 362e7c0097d7..ad702463a65d 100644
> --- a/drivers/platform/x86/amd/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc-quirks.c
> @@ -11,7 +11,6 @@
>  #include <linux/dmi.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> -#include <linux/slab.h>
>  
>  #include "pmc.h"
>  
> @@ -135,12 +134,10 @@ static const struct dmi_system_id fwbug_list[] = {
>   */
>  static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
>  {
> -	struct resource *res;
>  	void __iomem *addr;
>  	u8 val;
>  
> -	res = request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80");
> -	if (!res)
> +	if (!request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80"))
>  		return;
>  
>  	addr = ioremap(s2idle_bug_mmio, 1);
> @@ -152,8 +149,7 @@ static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
>  
>  	iounmap(addr);
>  cleanup_resource:
> -	release_resource(res);
> -	kfree(res);
> +	release_mem_region(s2idle_bug_mmio, 1);
>  }
>  
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)

