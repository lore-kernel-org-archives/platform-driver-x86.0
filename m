Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE82C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Feb 2022 13:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359608AbiBUNrT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Feb 2022 08:47:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234669AbiBUNrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Feb 2022 08:47:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00F78E7C
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 05:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645451214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L8wxK0sx0ARjItoAWBtZbxxCje2iLbxe1SCm7RJ8TpE=;
        b=fIlBTsxyTfiBe3qKm2FJ0/v96fg8v3qoIs/K6PwQDhHpudo/D8OXk0TziDgvh1ZPWjVsD+
        vLSkVblTWkTo84AnFKX/ceQX/gCKjpJ+Ec5NZ08pRqYjxfiawzZKcZ1vp72FA9hA88JBkH
        tRSxIdPAbjv546zKIcPPql7Ybcn4/6o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-q2mMxq6OOjCSuKOqrXZQ-Q-1; Mon, 21 Feb 2022 08:46:52 -0500
X-MC-Unique: q2mMxq6OOjCSuKOqrXZQ-Q-1
Received: by mail-ej1-f71.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso4651860eje.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 05:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L8wxK0sx0ARjItoAWBtZbxxCje2iLbxe1SCm7RJ8TpE=;
        b=uQatE1C+9+QEiBuGsZoQtQeRMijAFSmz+YwPgj6VZ+dXHL71raBK2Di+wNZDq+nHcE
         UNmdr6iX1Ao2x/QmvfkVASBFuLKLzjcd/5w30sqAQJ8oKPTdApnA7QtSkRKZ7z2LM4Bx
         HYL3f29K7PXzMAtXBDO0QLwE1mNrTC/G+wMBs9jbz/ApMmjJUQFjemxWtSYm+BIA6QY6
         LR06CkmsU3E8jZ1m/KUchHIiZ4GVua7xPv6OPyp3F9XDl22y+DwlWqVi4033w2WXHvae
         nv9RhDU0bMlCH923eb/oms+neZkHEben39umjMtPwOSW1DOGWMDfZ4I0Q/kPSoBysf3s
         +j8Q==
X-Gm-Message-State: AOAM533kCqGl71Moon/uPx+H0wMUFyXb3WI16T3pQN/0V3TTGntPE9lg
        JnCWQO+3h4LsGPvdbeP9y0BmjPmtlZh4c1Au+Nwslmi5gICaoOiQFltQAW5Ehb43nOtn7Qet1Fr
        zrhwxfRliy3+TOVocZ7Klx2MEdSUk8D9wqQ==
X-Received: by 2002:a17:906:6693:b0:6cf:3cb:89c9 with SMTP id z19-20020a170906669300b006cf03cb89c9mr16122871ejo.23.1645451211815;
        Mon, 21 Feb 2022 05:46:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJympFeYNPwVrvpdOujabcUfBrLcZOhXrnp6/5Mq9sO8/wrPnfABGYtpZyaMWkA/NIB/5P/gXw==
X-Received: by 2002:a17:906:6693:b0:6cf:3cb:89c9 with SMTP id z19-20020a170906669300b006cf03cb89c9mr16122858ejo.23.1645451211599;
        Mon, 21 Feb 2022 05:46:51 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 12sm5240258ejh.30.2022.02.21.05.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 05:46:51 -0800 (PST)
Message-ID: <be628caf-15a6-d1f2-8c5f-c40baaeb0b5c@redhat.com>
Date:   Mon, 21 Feb 2022 14:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/6] platform/x86: int3472: Add terminator to
 gpiod_lookup_table
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
        linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, markgross@kernel.org, robert.moore@intel.com
References: <20220216225304.53911-1-djrscally@gmail.com>
 <20220216225304.53911-5-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220216225304.53911-5-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/16/22 23:53, Daniel Scally wrote:
> Without the terminator, if a con_id is passed to gpio_find() that
> does not exist in the lookup table the function will not stop looping
> correctly, and eventually cause an oops.
> 
> Fixes: 1596ef1251b5 ("platform/x86: int3472: Pass tps68470_regulator_platform_data to the tps68470-regulator MFD-cell")

This fixes tag is wrong, that sha does not exist?  See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/platform/x86/intel/int3472/tps68470_board_data.c

I've updated the hash to 19d8d6e36b4b while merging this.

Regards,

Hans



> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470_board_data.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index f93d437fd192..525f09a3b5ff 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -100,7 +100,8 @@ static struct gpiod_lookup_table surface_go_tps68470_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
>  		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW)
> +		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
> +		{ }
>  	}
>  };
>  

