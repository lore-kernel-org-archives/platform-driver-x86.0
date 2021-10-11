Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9556C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9BE460F6E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbhJKN2U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49147 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235197AbhJKN2T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 09:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633958779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+c171GEZ5sEGHxcwkPoH1CwAXO6/TbiZdxuKowbIgsE=;
        b=W8Q69v90KRJaxILNmWiANpZd3iSa2qY6Gx9Y4gYAwK3sy/gG7s4amZ67dJYdqF+StHvXec
        e9CmgkEzceBp1WBbSFn6BNxCBklMKPeF3o7A+R+1mN9gT2Aomc83s7+iC3x7Lji4BnYc5r
        3RDOtleh1B6E+edm0FlSw39HUHNevWY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-SNGzGvoxM5GT4a8iFlNszg-1; Mon, 11 Oct 2021 09:26:15 -0400
X-MC-Unique: SNGzGvoxM5GT4a8iFlNszg-1
Received: by mail-ed1-f71.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso7279836edv.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 06:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+c171GEZ5sEGHxcwkPoH1CwAXO6/TbiZdxuKowbIgsE=;
        b=BmhjE/zNyaQQzt7YLqpnl6ybdhPzigGV2+zymS1Sr7xV5YnAun0h3X1TQU49rgJ8vr
         HF+mykldycBUYHK3dKXI8bjT7cHg5cQ83/niJ+XyBF5zI0Kyahu9n5D5wq6bfoifxhi8
         5YJEzR/syLPpxPQskPuEeznx2/vpAntOeEG6P46/x2gJPnFzcRmbyjfBswGqLMCIyt6G
         SImJGPemr3vNAZyo+ie6mncPauh4RoZQ6c68ddY1XzdhHyS7yK9yYUMLzkwaASkflGeh
         fsJUTh9aa3saYkfyXXwA1k3q4P6kU+cUJm9vKmVj50N63h/FX1g53CxxuwwWdHpXQyMk
         whKQ==
X-Gm-Message-State: AOAM5313UYEtlsSDYsAcoStkXLKIIo0TQ+ENDW5NjB8FV0KMuzYIcbtO
        WLULd+7q5YsARXRMJ9MrKM+NXqknESKaNlH3LpUXH+NnoxkE1AG8fu2b17xjbjCtiFw4LZVxOF2
        +ew5rr9IFqpG0hWVFACghNSZJDr8psTodkw==
X-Received: by 2002:a17:907:9889:: with SMTP id ja9mr26716267ejc.361.1633958774188;
        Mon, 11 Oct 2021 06:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRMDoQIOTlgLw2p6wxHJdAQINVg5hw9NhXiXrDvH8SPChztQpeTd+v5mKF6jC0QToRg9PnYg==
X-Received: by 2002:a17:907:9889:: with SMTP id ja9mr26716246ejc.361.1633958774042;
        Mon, 11 Oct 2021 06:26:14 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id 10sm3515698ejo.111.2021.10.11.06.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 06:26:13 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell: Make DELL_WMI_PRIVACY depend on
 DELL_WMI
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211011132338.407571-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b35ed065-367d-24d6-b250-0f9dc89a1d27@redhat.com>
Date:   Mon, 11 Oct 2021 15:26:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211011132338.407571-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 10/11/21 3:23 PM, Hans de Goede wrote:
> DELL_WMI_PRIVACY is a feature toggle for the main dell-wmi driver,
> so it must depend on the Kconfig option which enables the main
> dell-wmi driver.
> 
> Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell hardware privacy")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) and fixes branches now.

Regards,

Hans


> ---
>  drivers/platform/x86/dell/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 42513eab1d06..2fffa57e596e 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -167,6 +167,7 @@ config DELL_WMI
>  config DELL_WMI_PRIVACY
>  	bool "Dell WMI Hardware Privacy Support"
>  	depends on LEDS_TRIGGER_AUDIO = y || DELL_WMI = LEDS_TRIGGER_AUDIO
> +	depends on DELL_WMI
>  	help
>  	  This option adds integration with the "Dell Hardware Privacy"
>  	  feature of Dell laptops to the dell-wmi driver.
> 

