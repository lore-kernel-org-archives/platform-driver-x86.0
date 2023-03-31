Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEB3C761A6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 31 Mar 2023 17:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjCaRhw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 31 Mar 2023 13:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjCaRhv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Mar 2023 13:37:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6381E71F
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680284222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TW3eRYhY8krxuQYRljIfEDzKI7IC0lmrJ5k4rfM21Xg=;
        b=BnyJCO/11KHHeB2YFKq5Vstgpu1P2Foq+3sbNu7FVXNl4BWdEx2WJJQ349r8WRtN2Z7/A+
        r0rVFoGUQ4uuCzyQofHNqUPKSloKbQkHAgVWZZ2xZhe8V1uzHY1ZU+pA71J1ztm1chHjZB
        AIcuzwjPORn+ewooUjgamegAZnymcaI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-0FRk-s5sPoeHEpww84br1g-1; Fri, 31 Mar 2023 13:36:58 -0400
X-MC-Unique: 0FRk-s5sPoeHEpww84br1g-1
Received: by mail-ed1-f70.google.com with SMTP id a27-20020a50c31b000000b0050047ecf4bfso32991416edb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 10:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TW3eRYhY8krxuQYRljIfEDzKI7IC0lmrJ5k4rfM21Xg=;
        b=5pbaPx8zqohPqflvf/4ePFwvfVb0gNGZ9z9D8iuFmqz6Wx2wWcEzTgVHLL8qQ/D6oi
         zV006KjuRLw+VQ82WP6Nsx1YCc3bYqvldqfCgDjrkd2LSkuq0U+p6D+b7IfkeUGbg1um
         wEvpsBnnYN2xT1j+hfmJl6bF4wsZCwEVt0Ww3SNhdrGZtvZRoMvvjbCTuB/OyTUPFGk/
         WuXKbhIYuIT3w4eU3Lo5FFmcz0U4kbfS/vMjId7HB25m4qUgJQvONLVcHMl3Lg9Qw56U
         LoLLDVp6gFmU58hvpcaSAVErcE4uX3JLea3FON6kuxzWbL+X1SSY+WzR7RD0cJwmeaCj
         jZLg==
X-Gm-Message-State: AAQBX9dJjfm7T+b3ROt3hxZpnV41eKDaUEuA1IREvZSO81R5wbvOMOyK
        D9HBuOMiArDPwHvsL6oq+5J3but3qu37YborBGP70Ywkm33JvZE8I7rvK+ztBj1KWeKaBfRq28l
        92Zsm65kAqj3igaDVYWwTtN7i9vtFxasnDA==
X-Received: by 2002:a17:907:31c9:b0:8e1:12b6:a8fc with SMTP id xf9-20020a17090731c900b008e112b6a8fcmr35359823ejb.4.1680284217413;
        Fri, 31 Mar 2023 10:36:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLVFsaDSdzCWqC92WwjhMyQo3uQWkmyog3iTj2B/nfN3+H43nOF4AhDPjhQ1C+MvaERqwQkg==
X-Received: by 2002:a17:907:31c9:b0:8e1:12b6:a8fc with SMTP id xf9-20020a17090731c900b008e112b6a8fcmr35359813ejb.4.1680284217188;
        Fri, 31 Mar 2023 10:36:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oq26-20020a170906cc9a00b009318ad4a583sm1172870ejb.210.2023.03.31.10.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 10:36:56 -0700 (PDT)
Message-ID: <15c8a804-6e73-706a-d6de-fa9d84e9a0d4@redhat.com>
Date:   Fri, 31 Mar 2023 19:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] asus-nb-wmi: Add quirk_asus_tablet_mode to other ROG
 Flow X13 models
Content-Language: en-US, nl
To:     weiliang1503 <weiliang1503@gmail.com>, corentin.chary@gmail.com
Cc:     markgross@kernel.org, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230330114943.15057-1-weiliang1503@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230330114943.15057-1-weiliang1503@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/30/23 13:49, weiliang1503 wrote:
> Make quirk_asus_tablet_mode apply on other ROG Flow X13 devices,
> which only affects the GV301Q model before.
> 
> Signed-off-by: weiliang1503 <weiliang1503@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-nb-wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index cb15acdf1..e2c9a68d1 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -464,7 +464,8 @@ static const struct dmi_system_id asus_quirks[] = {
>  		.ident = "ASUS ROG FLOW X13",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "GV301Q"),
> +			/* Match GV301** */
> +			DMI_MATCH(DMI_PRODUCT_NAME, "GV301"),
>  		},
>  		.driver_data = &quirk_asus_tablet_mode,
>  	},

