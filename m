Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD197C77B61
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 15:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbjDYPEO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 11:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233991AbjDYPEM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 11:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D504440F2
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682435013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RYquYkMe/fOaEtLjgO1VYUi+Rgz/cvkRuCvFbDydwhM=;
        b=XRy0d1WBIEH3PrM9ERx3+68hu7BIH/aK4aJm9VkhX6jzWiy9kEfopVvj/IF4//ndS2OJqC
        HVT4ScKMwwMjKWv+buLw6a69yHCQLECp4RChIeWg9jGITvSEtl6V2Ph59FjzboqYzNYClZ
        rP8gtA9PyW2ljPAdfxjc0b5ckmOTQ48=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-iMTMncRaP86uneDC4_16UA-1; Tue, 25 Apr 2023 11:03:29 -0400
X-MC-Unique: iMTMncRaP86uneDC4_16UA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5069f2ae8eeso16118634a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 08:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682435008; x=1685027008;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYquYkMe/fOaEtLjgO1VYUi+Rgz/cvkRuCvFbDydwhM=;
        b=EM0yNeaFcXQVqb0SKrTbKGie0/rqJvkzzuGWoRu9fynjnAbIevemQkWd4N8E65fnZw
         QeG5fCwxwWy89FDQYPJcB+IQXmeUxOHEeCtACTM2/kMux4hkjurtDru0NfY99ELG3pxj
         WicfOf+fEp6qsNZk5z0U1lDLZbdRH7wVef3urGFaEPGphU4rB0CwpiGBnyz7ZPNUZiGP
         VhwwHw4GFKHELko9dgnasO8g0syjxYEySewhKGa0ZiSWfYGARRYaMhvh4WtGDjLOitCP
         OnVudYbGqkEOEvmT0Zn5kev8ds3V+O55Sa8PJkA4ht7G2PQC16+XwIJUsU14UqC0X3YT
         R0yA==
X-Gm-Message-State: AAQBX9f2bBIj9MmB9eht94RaIqnvxKcSdd4XwDhfgeaWs+DmHEnVGZa5
        F7DU7KL+8iJsb/JKLPoPyLz8Y8bLxPV4H71KC95DAxnRDreD4qfY49TqOgt/0pBGX1JBigBWuk1
        b4V6FEJbArjhFKDQEoP3hIgsrzH4pzVeeN0iYVnj8Ig==
X-Received: by 2002:a17:906:850e:b0:953:8bc2:69df with SMTP id i14-20020a170906850e00b009538bc269dfmr13545515ejx.11.1682435008010;
        Tue, 25 Apr 2023 08:03:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZbEv+k0+4nUhewabxfrowIzFZrrXkCsSyUXB/Jj7g33RkncMjW2uKVbKScm7MPuZNmecQE6A==
X-Received: by 2002:a17:906:850e:b0:953:8bc2:69df with SMTP id i14-20020a170906850e00b009538bc269dfmr13545490ejx.11.1682435007698;
        Tue, 25 Apr 2023 08:03:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id oq27-20020a170906cc9b00b0094f410225c7sm6840079ejb.169.2023.04.25.08.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 08:03:27 -0700 (PDT)
Message-ID: <794e914d-6b63-0da9-4d3c-00b383bb4e87@redhat.com>
Date:   Tue, 25 Apr 2023 17:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
To:     Julian Winkler <julian.winkler1@web.de>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20230416154932.6579-1-julian.winkler1@web.de>
Content-Language: en-US
In-Reply-To: <20230416154932.6579-1-julian.winkler1@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Julian,

On 4/16/23 17:49, Julian Winkler wrote:
> This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, saying it
> is only used on Moorestown, but apparently the same id is also used on
> Medfield.
> 
> Tested on the Medfield based Motorola RAZR i smartphone.
> 
> Signed-off-by: Julian Winkler <julian.winkler1@web.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Patches which are added to review-hans now are intended for
the next rc1. This branch will get rebased to the next rc1 when
it is out and after the rebasing the contents of review-hans
will be pushed to the platform-drivers-x86/for-next branch.

Regards,

Hans






> ---
>  drivers/platform/x86/intel_scu_pcidrv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel_scu_pcidrv.c b/drivers/platform/x86/intel_scu_pcidrv.c
> index 80abc708e4f2..d904fad499aa 100644
> --- a/drivers/platform/x86/intel_scu_pcidrv.c
> +++ b/drivers/platform/x86/intel_scu_pcidrv.c
> @@ -34,6 +34,7 @@ static int intel_scu_pci_probe(struct pci_dev *pdev,
>  
>  static const struct pci_device_id pci_ids[] = {
>  	{ PCI_VDEVICE(INTEL, 0x080e) },
> +	{ PCI_VDEVICE(INTEL, 0x082a) },
>  	{ PCI_VDEVICE(INTEL, 0x08ea) },
>  	{ PCI_VDEVICE(INTEL, 0x0a94) },
>  	{ PCI_VDEVICE(INTEL, 0x11a0) },

