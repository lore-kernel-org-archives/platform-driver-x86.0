Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CADC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 12:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D3CA6109E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 12:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhIUMzb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 08:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55446 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230052AbhIUMzb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 08:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632228842;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H+b5UoLgDQSF/YjzkyFGb3xutkBcXnYMPgLZGlo8HQQ=;
        b=hxIx/GH6UTQ8SuQ22idq0HZ6lvj7C78Gecb2IXimr5W5Ybubgf+iirbCFHpFkreAgWsH9e
        latoVBpKJaRGytw/gYTCdxcP3mz/GyT3tI3/zqyi2JVbZvhHJGmHBJjFDyv5GeKXx4qbcY
        aukTir14hC05EBAO6W6nyQ8s5Tysb3k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-O257DV4RNCKmmRL2xXgDcQ-1; Tue, 21 Sep 2021 08:54:01 -0400
X-MC-Unique: O257DV4RNCKmmRL2xXgDcQ-1
Received: by mail-ed1-f69.google.com with SMTP id 2-20020a508e02000000b003d871759f5dso5076611edw.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 05:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H+b5UoLgDQSF/YjzkyFGb3xutkBcXnYMPgLZGlo8HQQ=;
        b=x+IjJKhbNeO36tBgvBFZK8CZOvdDkweh9JqnKQKt5ixrYOT3Kc96pjZpHYD83LRAeW
         cdD2e9/fk9h5sn0ZFOotdnal5K75ISBlh3eo3026FcYAqHVCE1y2fOgIuOjAhKTpajxU
         qRQ4UVXHdb0qaZVHaOklT4S4bL/6kAxK1XKU7BndCXtmzh4Cvugj0GekNHelUapGDXBp
         AlwfWRwX84YCj2pKQaJ5T9r71z/sQmqP1m161ZVRgRiWOBncZbmqLAYLSYgmpb9D0BjT
         xs9pZQcV9Mdk2Ok9I351cxjLX1K9UpcLd8MeH7cbpTMCP0ZvVbBLCVoLPQj5qeIxa+a5
         Yqeg==
X-Gm-Message-State: AOAM532GTNrvTHI7MbOqaPYePbWrOIgChAwzM7gqaB6fCY/twB/EabuI
        guafpk1B6yqORIjwGtYj+RfeUQ6H5zJcYvyR3fqphhXrs/ffxScmZyl1uhRZBwCb3/53iRB5CXE
        cf4I5aWrWhQR1W3HCLHZ2kNfK2fjHPzzsgw==
X-Received: by 2002:a17:906:36d6:: with SMTP id b22mr33863552ejc.387.1632228840205;
        Tue, 21 Sep 2021 05:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzej+5g7x6TemeslhOOdlpCQmBmaDpo6kRWLe9ZOmYqqbCycpzqQjqvNHfWZl4sMcheezE7fw==
X-Received: by 2002:a17:906:36d6:: with SMTP id b22mr33863532ejc.387.1632228839988;
        Tue, 21 Sep 2021 05:53:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y4sm8424063edw.1.2021.09.21.05.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 05:53:59 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell: fix DELL_WMI_PRIVACY dependencies &
 build error
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Perry Yuan <Perry.Yuan@dell.com>, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>
References: <20210918044829.19222-1-rdunlap@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a2d38288-d78d-1c08-f710-d75cbd31a125@redhat.com>
Date:   Tue, 21 Sep 2021 14:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210918044829.19222-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/18/21 6:48 AM, Randy Dunlap wrote:
> When DELL_WMI=y, DELL_WMI_PRIVACY=y, and LEDS_TRIGGER_AUDIO=m, there
> is a linker error since the LEDS trigger code is built as a loadable
> module. This happens because DELL_WMI_PRIVACY is a bool that depends
> on a tristate (LEDS_TRIGGER_AUDIO=m), which can be dangerous.
> 
> ld: drivers/platform/x86/dell/dell-wmi-privacy.o: in function `dell_privacy_wmi_probe':
> dell-wmi-privacy.c:(.text+0x3df): undefined reference to `ledtrig_audio_get'
> 
> Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell hardware privacy")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Perry Yuan <Perry.Yuan@dell.com>
> Cc: Dell.Client.Kernel@dell.com
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <mgross@linux.intel.com>

p.s.

I'll also add this to the pdx86 fixes branch and include it in my next
pdx86-fixes for 5.15 pull-req to Linus.

Regards,

Hans




> ---
>  drivers/platform/x86/dell/Kconfig |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> --- linux-next-20210917.orig/drivers/platform/x86/dell/Kconfig
> +++ linux-next-20210917/drivers/platform/x86/dell/Kconfig
> @@ -166,8 +166,7 @@ config DELL_WMI
>  
>  config DELL_WMI_PRIVACY
>  	bool "Dell WMI Hardware Privacy Support"
> -	depends on DELL_WMI
> -	depends on LEDS_TRIGGER_AUDIO
> +	depends on LEDS_TRIGGER_AUDIO = y || DELL_WMI = LEDS_TRIGGER_AUDIO
>  	help
>  	  This option adds integration with the "Dell Hardware Privacy"
>  	  feature of Dell laptops to the dell-wmi driver.
> 

