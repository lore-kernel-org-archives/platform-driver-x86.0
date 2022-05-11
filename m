Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E62C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 15:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245666AbiEKPQm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 11:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245656AbiEKPQm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 11:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3ACB410115D
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652282200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C8tAHsUaXeH5aIreYrSE446zf4Y+7VPnOdSUL2jWESc=;
        b=Xa+6Dv0OT1fv4zcpj4eNCzcsGZN7H7MiCH2a59vJWE5W9QXCBnEJsqltBUNdjrdqQl0W7Q
        WloIYBE930uwRZruKmTJ6Qj+ex1BistmSIEy1Q6oHCx4E8WGKslQhUA0AIoOCfIkqbOHZ8
        q75CmKj+nKrN3HynoQzRnNuTkMmMhZQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-Gye1GL6VOBWln7juqlNk4Q-1; Wed, 11 May 2022 11:16:37 -0400
X-MC-Unique: Gye1GL6VOBWln7juqlNk4Q-1
Received: by mail-ej1-f69.google.com with SMTP id qa15-20020a170907868f00b006f4c89bf2e3so1323573ejc.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C8tAHsUaXeH5aIreYrSE446zf4Y+7VPnOdSUL2jWESc=;
        b=YXdmCzn5cnPRGdqxw/ei7AQLxMdyPMURONoTIuiQpiALqkiZLaO9RZTYF7IXuMzrCz
         /CdERevECD5enTDPlQRwOhbvygZSPpwDSDjUcWajndy8IEGz6WM6B7I7oVE1RCQP2Afz
         JjIhPjLygFuDwuJ5r+/KRk85VpdESlohgHJK+g7w4PVZVz9eo8YWI66wU/Z9KbNrWUux
         O7UbMSuq4bJDURhqe8AWK0o+MNQNI9Pi4SdUom5QjZu1XCSn++wnsJ7ecbZ7KH3hVJna
         NYFPCliVORJx3d2dVyLUUFVs6yag+t0LCudEbBRQaj/ebAzj7gXeA9QRk8tVJWsK/Rlf
         JMIA==
X-Gm-Message-State: AOAM531OCtAxYvlDBhAeGsv+fvp/8UZoVY4Nmup44+30ICUhiVjP6eRd
        QgjF52Mkw6tzFn091FDRqbfBtw5lr5N3evexqvaMwdgl2fHKdF+ZbLTmafJxTkPXbjRMb5LBGEA
        lsFiFgdD+yCkRKozTpep/QRZbBp5qsZx8wg==
X-Received: by 2002:a17:906:12d3:b0:6f5:18a2:176d with SMTP id l19-20020a17090612d300b006f518a2176dmr24604258ejb.474.1652282195837;
        Wed, 11 May 2022 08:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzalPzBW9scyTGP9Q/0WkNxbU8XCq0kzYWjoozZOJHhRlViijcXgZrS+QybEUs+6GrMAmCjOQ==
X-Received: by 2002:a17:906:12d3:b0:6f5:18a2:176d with SMTP id l19-20020a17090612d300b006f518a2176dmr24604212ejb.474.1652282195328;
        Wed, 11 May 2022 08:16:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id lz6-20020a170906fb0600b006f3ef214db5sm1128878ejb.27.2022.05.11.08.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 08:16:34 -0700 (PDT)
Message-ID: <0fd2b4d0-e219-2e47-dd39-f73076e1eb9a@redhat.com>
Date:   Wed, 11 May 2022 17:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: Update unknown code message
Content-Language: en-US
To:     Luca Stefani <luca.stefani.ge1@gmail.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        "open list:ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS" 
        <acpi4asus-user@lists.sourceforge.net>,
        "open list:ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220506122536.113566-1-luca.stefani.ge1@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220506122536.113566-1-luca.stefani.ge1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/6/22 14:25, Luca Stefani wrote:
> Prepend 0x to the actual key code to specify it
> is already an hex value
> 
> Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 0e7fbed8a50d..35fe9641ba9b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3114,7 +3114,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  
>  	if (!sparse_keymap_report_event(asus->inputdev, code,
>  					key_value, autorelease))
> -		pr_info("Unknown key %x pressed\n", code);
> +		pr_info("Unknown key code 0x%x\n", code);
>  }
>  
>  static void asus_wmi_notify(u32 value, void *context)

