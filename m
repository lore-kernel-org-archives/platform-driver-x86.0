Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85998C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CA5060C41
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235258AbhJKNRw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57193 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236861AbhJKNRv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 09:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633958148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3CM0kmO1fy653gxIg+L+ggW9s7181BMVfb7Hpjw8Up0=;
        b=TifiTrXfmDFDjrfPlN2TVA+OuKJZ+q/N2+VYdpKr1poN4Gs4KZFewKKLFNHqZyggDGE0Cn
        r8NE7jN3pkRkDI5tKi3hLNa1h9wXRrmi+dRwy6nkgOK9W6ObNOoL0gSXfSkNsiIyfgWsz6
        YGnckhMnz4kZzMnwUhoRMiOY1ig08dM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-2x76J3cMNF2ydW3mBOniGA-1; Mon, 11 Oct 2021 09:15:47 -0400
X-MC-Unique: 2x76J3cMNF2ydW3mBOniGA-1
Received: by mail-ed1-f69.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso15802399edj.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 06:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3CM0kmO1fy653gxIg+L+ggW9s7181BMVfb7Hpjw8Up0=;
        b=ZvKovyDmAj5fY+dbKDjP3ni3F/F0tVTfpUBLSoEE4wJunmbKm7CaeTrTQdeELPNcmN
         xNI3qpQruZiK15TBCKSYGQb1eY7f3OglH+31Pv/m1Fq1nQpUYzf2WK2k17oh6Stdfb2Z
         rzKb9UxanrzFlU0HuizWzvOKygGsP2AmQqGxJyIS3OJ/XMbeA+jh1XVDau8uQW0GXWp0
         TVayP1oOCdFM8HXFMNn0xAVOzLt1xCTlPudAX2L4GNLZrNhF0VpWVakerRUap7hn0P7z
         BvFGS/TACURCo7SUoHCgwkgab5+5gEou0c2Nv0CQ+7j21/OBW86PG7G2sD0/Mt6mGsD0
         oL2A==
X-Gm-Message-State: AOAM530IBJzxxkt3VXjB/dN098O+yJertqsj1R6FCwACr++KHSf29+42
        iFjm4J3tN4SU8hHpFUdidhFBDkrex5csdsNEihAFDEwUM6yyxCaEFUwC9DMoj72YMN3amAhpuT/
        fANd/JlJqNDD1HhYldH/egbgOjVko07TAnw==
X-Received: by 2002:aa7:cdcf:: with SMTP id h15mr8804974edw.160.1633958145910;
        Mon, 11 Oct 2021 06:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUeyf+A5etQKzRm2DrYgc0tckKT+Aei9ChVhMz/bsMd0Uj7ffoSNAtOG+kmRsYC/iaY/jeQg==
X-Received: by 2002:aa7:cdcf:: with SMTP id h15mr8804950edw.160.1633958145780;
        Mon, 11 Oct 2021 06:15:45 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id d22sm3485207ejk.5.2021.10.11.06.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 06:15:45 -0700 (PDT)
Subject: Re: [PATCH] platform: dell: all DELL_WMI driver options depend on
 DELL_WMI
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Perry Yuan <Perry.Yuan@dell.com>, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>
References: <20210927205354.19342-1-rdunlap@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f8e95321-53f1-21f9-912c-354d32850d3b@redhat.com>
Date:   Mon, 11 Oct 2021 15:15:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927205354.19342-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Randy,

On 9/27/21 10:53 PM, Randy Dunlap wrote:
> A randconfig or a user can set/enable DELL_WMI_PRIVACY even when
> DELL_WMI is not enabled. This leads to a build error in
> dell-laptop.o:
> 
> ld: drivers/platform/x86/dell/dell-laptop.o: in function `dell_init':
> dell-laptop.c:(.init.text+0x719): undefined reference to `dell_privacy_has_mic_mute'
> 
> Fix this by enclosing the DELL_WMI driver options inside a
> if DELL_WMI / endif bracket.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Perry Yuan <Perry.Yuan@dell.com>
> Cc: Dell.Client.Kernel@dell.com
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <mgross@linux.intel.com>
> ---
> Found in linux-next, applies to mainline.
> 
> The last time that I sent a patch to Perry Yuan (about 2 weeks ago),
> it bounced...


Thank you for your patch, comments inline.

> 
>  drivers/platform/x86/dell/Kconfig |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- linux-next-20210927.orig/drivers/platform/x86/dell/Kconfig
> +++ linux-next-20210927/drivers/platform/x86/dell/Kconfig
> @@ -164,6 +164,8 @@ config DELL_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called dell-wmi.
>  
> +if DELL_WMI
> +

Adding depends on DELL_WMI to DELL_WMI_PRIVACY definitely is the right
thing to do, since DELL_WMI_PRIVACY is intended as a feature toggle for the
main dell-wmi driver.

>  config DELL_WMI_PRIVACY
>  	bool "Dell WMI Hardware Privacy Support"
>  	depends on LEDS_TRIGGER_AUDIO = y || DELL_WMI = LEDS_TRIGGER_AUDIO
> @@ -198,6 +200,8 @@ config DELL_WMI_LED
>  	  This adds support for the Latitude 2100 and similar
>  	  notebooks that have an external LED.
>  
> +endif # DELL_WMI
> +

But also adding it to DELL_WMI_AIO, DELL_WMI_DESCRIPTOR and 
DELL_WMI_LED is wrong, the _AIO and _LED options are independent and the
DELL_WMI_DESCRIPTOR option enables building of a helper lib which is
e.g. also selected by DELL_SMBIOS_WMI.

I'll prepare a new fix adding the depends on to just DELL_WMI_PRIVACY,
adding you (Randy) as Reported-by.  I'll merge that right after
sending it out for the archives, resolving this.

Regards,

Hans



>  config DELL_WMI_SYSMAN
>  	tristate "Dell WMI-based Systems management driver"
>  	default m
> 

