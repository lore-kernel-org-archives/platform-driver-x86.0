Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78158C001DE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 14:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjGYOjy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 10:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbjGYOjm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 10:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBD4CD
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690295936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/1h7vN7gw4b4VUnOpoTb+gc+Y2pZRY71isTItrRoM2k=;
        b=URBNT+QCQXIwcyus64B7D91ZZfaC6qbGVMP3EDC93CNCDrfR05pt1J8h4omucbIslrt6zK
        xeqidNspg1KEcYdGKjyP0Y/t7a50mVxHrCNnsIzTTqDXLkaF2uvkjHzI38xzSGpgI4java
        U6loVuJmV0NxsGbGzLoBBv1Bnn5a1HY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-lkCaM6dJP-uA63Br0wJhRw-1; Tue, 25 Jul 2023 10:38:55 -0400
X-MC-Unique: lkCaM6dJP-uA63Br0wJhRw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-997c891a88dso446348366b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 07:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295934; x=1690900734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1h7vN7gw4b4VUnOpoTb+gc+Y2pZRY71isTItrRoM2k=;
        b=Gv545M9UlamobdOMYzkV81dJR61q72iXIWZJddQaOXBTX/58gYfTqojYFvenZG8qnP
         qVYixfD2KjFDHD0qqLkuKprw7w97gC4+lURibd8MkvUiL4fd++rFiQ/XFCCKWsMDXB7w
         Vv4fMg466xzSmefzFf7f665tNUQcsLpnWrityY+MnIYNaiUF6Eat59XQvwoA8tepB2fn
         BRnI4ddqsCRpgmoMzrxXnwjBq9OStTzxE3M023RHGl0Gs/pilwFZfdRCmkQhgglET+As
         NkPsOKSDd+v6AH8gXgNh2Mnm9nsBAreJgRJFesSI++luDPLWrMI/UIGeDTfe8NCehwx6
         BXxQ==
X-Gm-Message-State: ABy/qLY3Q0ItiWa+1MIZqD0XjJ0ihZGxwI+h93Vr/7Isytrs/BikIZAO
        1trOThdVuJi1odty41dWRUkf19ZX1EoZp5uQJQMIIZGZ+Nb4zwOWatHm1+W+aN5RgPVuJSRAwSz
        adnNIuaMUYEIiZjPYHxdJvfxy2doFQdcWvA==
X-Received: by 2002:a17:907:7714:b0:99b:5a73:4d04 with SMTP id kw20-20020a170907771400b0099b5a734d04mr11923132ejc.71.1690295934016;
        Tue, 25 Jul 2023 07:38:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEdX0+HBQeLrPYCrsDDggU6cES3WxJKjmeJBpY/9SGagGAk12doMxkMYQs+QUDBrLovlYbPhA==
X-Received: by 2002:a17:907:7714:b0:99b:5a73:4d04 with SMTP id kw20-20020a170907771400b0099b5a734d04mr11923126ejc.71.1690295933732;
        Tue, 25 Jul 2023 07:38:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i17-20020a170906445100b00977eec7b7e8sm8353930ejp.68.2023.07.25.07.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:38:53 -0700 (PDT)
Message-ID: <cca68246-1e77-7585-ffc4-ff532269b632@redhat.com>
Date:   Tue, 25 Jul 2023 16:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: huawei-wmi: Silence ambient light sensor
Content-Language: en-US, nl
To:     Konstantin Shelekhin <k.shelekhin@ftml.net>,
        Mark Gross <markgross@kernel.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230722155922.173856-1-k.shelekhin@ftml.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230722155922.173856-1-k.shelekhin@ftml.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/22/23 17:59, Konstantin Shelekhin wrote:
> Currently huawei-wmi causes a lot of spam in dmesg on my
> Huawei MateBook X Pro 2022:
> 
>   ...
>   [36409.328463] input input9: Unknown key pressed, code: 0x02c1
>   [36411.335104] input input9: Unknown key pressed, code: 0x02c1
>   [36412.338674] input input9: Unknown key pressed, code: 0x02c1
>   [36414.848564] input input9: Unknown key pressed, code: 0x02c1
>   [36416.858706] input input9: Unknown key pressed, code: 0x02c1
>   ...
> 
> Fix that by ignoring events generated by ambient light sensor.
> 
> This issue was reported on GitHub and resolved with the following merge
> request:
> 
>   https://github.com/aymanbagabas/Huawei-WMI/pull/70
> 
> I've contacted the mainter of this repo and he gave me the "go ahead" to
> send this patch to the maling list.
> 
> Signed-off-by: Konstantin Shelekhin <k.shelekhin@ftml.net>

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
>  drivers/platform/x86/huawei-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index 70e5c4c0574d..0ef1c46b617b 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -85,6 +85,8 @@ static const struct key_entry huawei_wmi_keymap[] = {
>  	{ KE_IGNORE, 0x293, { KEY_KBDILLUMTOGGLE } },
>  	{ KE_IGNORE, 0x294, { KEY_KBDILLUMUP } },
>  	{ KE_IGNORE, 0x295, { KEY_KBDILLUMUP } },
> +	// Ignore Ambient Light Sensoring
> +	{ KE_KEY,    0x2c1, { KEY_RESERVED } },
>  	{ KE_END,	 0 }
>  };
>  

