Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E84ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 10:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiISKuJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiISKtV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 06:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FC2DDE
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663584170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Np+fkkjO8lPl7vvZkMr0k8ISZAWRunlk0eF5U4B0S+s=;
        b=cCv/tgwqju7rMRlmSBdJqFhQZv2M6x44OyYbtAHJizBQ4A2W9/xfQfAOTTnxJquqNM7iat
        VD6Rib1KF4K3TT522afkTARFkI+cG6feZ7EP1Y/gsKIrvAAHRUq5XbhEYXepIfK9DY1CsL
        cc5fjV/ABHwVRvvIh1JnkzIQGJ3W5lg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-_zZNI5y8Oa-3-6WDZuL8-w-1; Mon, 19 Sep 2022 06:42:48 -0400
X-MC-Unique: _zZNI5y8Oa-3-6WDZuL8-w-1
Received: by mail-ed1-f71.google.com with SMTP id dz21-20020a0564021d5500b0045217702048so14539748edb.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Np+fkkjO8lPl7vvZkMr0k8ISZAWRunlk0eF5U4B0S+s=;
        b=YbK0Xylav2J4vEgvEmwteXb+9Nl3Cz7tuyxH2SIEsOD5JXLzfFRv5VqLNG31r0b3xC
         kw0ue+40fwy2YvirNdObJyP0Kaw65xXxje8BL40qaznmY1qCHGrsdeQYsoeieulVu3Pt
         lx22/QwSS/76670p08rEHE6LY52hSX3rCBwgmCMlW8RQC4icnVV+AoDTAgNj0SsVrHzE
         QJhcH8+ge+qcRdCi5CX5RklyEJreOEoVKt8qp4TnO4bKR6hePRcqdI+B3dx896X5XA6z
         7tX+GLUtmsgGzPE8aOg2ycw1f69Os8z/YiEPrE3jQDc45j3A7vGtEDq4BVcqer+GiLAq
         DtZQ==
X-Gm-Message-State: ACrzQf1rV2potS8OKSj2eD90c/b368Rnf3sXeVNXR0KVOfFLW9Xil3JC
        fqGacr3YYFv50pi2TI9oMMg2cl2pHs4iO/DHzchhinHLEWTib25CDzSFByXOGDrxyUl9eJvoZCe
        L1pZQn9qhpHdY0T2QtlVE3DVFFlF3Ai79fA==
X-Received: by 2002:a17:907:70a:b0:741:78ab:dce5 with SMTP id xb10-20020a170907070a00b0074178abdce5mr12638727ejb.527.1663584167810;
        Mon, 19 Sep 2022 03:42:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FiwxrL7uPiNvLAfLhlopkwhwhbm4bGbnVuuFkEIv/9QzhlBdvIK4zNn7OcPAey1ylp5FbCA==
X-Received: by 2002:a17:907:70a:b0:741:78ab:dce5 with SMTP id xb10-20020a170907070a00b0074178abdce5mr12638715ejb.527.1663584167587;
        Mon, 19 Sep 2022 03:42:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id dk9-20020a0564021d8900b0044ea683d04csm20050091edb.14.2022.09.19.03.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:42:47 -0700 (PDT)
Message-ID: <1095514c-f734-b7d5-4a6a-4ed230ecb03a@redhat.com>
Date:   Mon, 19 Sep 2022 11:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/5] ACPI: battery: Simplify battery_hook_unregister()
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, hmh@hmh.eng.br,
        matan@svgalib.org, corentin.chary@gmail.com, jeremy@system76.com,
        productdev@system76.com, platform-driver-x86@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220912125342.7395-1-W_Armin@gmx.de>
 <20220912125342.7395-3-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220912125342.7395-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/22 13:53, Armin Wolf wrote:
> Since __battery_hook_unregister() is always called
> with lock set to 1, remove the unneeded conditionals
> and merge it with battery_hook_unregister().
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/acpi/battery.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index e59c261c7c59..4aea65f3d8c3 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -686,27 +686,22 @@ static LIST_HEAD(acpi_battery_list);
>  static LIST_HEAD(battery_hook_list);
>  static DEFINE_MUTEX(hook_mutex);
> 
> -static void __battery_hook_unregister(struct acpi_battery_hook *hook, int lock)
> +void battery_hook_unregister(struct acpi_battery_hook *hook)
>  {
>  	struct acpi_battery *battery;
>  	/*
>  	 * In order to remove a hook, we first need to
>  	 * de-register all the batteries that are registered.
>  	 */
> -	if (lock)
> -		mutex_lock(&hook_mutex);
> +	mutex_lock(&hook_mutex);
> +
>  	list_for_each_entry(battery, &acpi_battery_list, list) {
>  		hook->remove_battery(battery->bat);
>  	}
>  	list_del(&hook->list);
> -	if (lock)
> -		mutex_unlock(&hook_mutex);
> -	pr_info("extension unregistered: %s\n", hook->name);
> -}
> 
> -void battery_hook_unregister(struct acpi_battery_hook *hook)
> -{
> -	__battery_hook_unregister(hook, 1);
> +	mutex_unlock(&hook_mutex);
> +	pr_info("extension unregistered: %s\n", hook->name);
>  }
>  EXPORT_SYMBOL_GPL(battery_hook_unregister);
> 
> @@ -784,7 +779,7 @@ static void __exit battery_hook_exit(void)
>  	 * need to remove the hooks.
>  	 */
>  	list_for_each_entry_safe(hook, ptr, &battery_hook_list, list) {
> -		__battery_hook_unregister(hook, 1);
> +		battery_hook_unregister(hook);
>  	}
>  	mutex_destroy(&hook_mutex);
>  }
> --
> 2.30.2
> 

