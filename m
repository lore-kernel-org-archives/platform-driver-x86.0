Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FC6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 16:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238381AbiKOQRL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 11:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbiKOQRK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 11:17:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C36729348
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 08:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668528973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qv2bcO6Yto0Ts7qH6R3hn78ox82jnXpiAHlPzRbVZoE=;
        b=Y06V657JiQGR5gQi9VoVcvZzQEDhcgr2+zGgUZOtKZ7UrdvQOXbxAi+m7nPtVMZmVeMyJA
        Pi7/yg5uDoV6RSAVjn1ZideYn7nYoYBOrYORblEasJdOKDfG5H2hov7Egj0mE7g9TRNJ3K
        3d0LRxGn4qW5XODIz5cIegEikMFpqIw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-6LMrJ4ALPd-eQMFgaP5KBQ-1; Tue, 15 Nov 2022 11:16:10 -0500
X-MC-Unique: 6LMrJ4ALPd-eQMFgaP5KBQ-1
Received: by mail-ed1-f69.google.com with SMTP id y20-20020a056402271400b004630f3a32c3so10252662edd.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 08:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qv2bcO6Yto0Ts7qH6R3hn78ox82jnXpiAHlPzRbVZoE=;
        b=szm5ly9ULuoXmv2bhf053eBfjdB5iujsKq0vc/e9pXO8fhuIUKYZ3pE2qgbo/6Td44
         NfHNICu7gsO2rJC6pEMow22gCFMHPwYnqzrIDP9GvgGFSKDEABxwgjXVT+Sae46SkSsm
         TGtlILRmfTbrNgOLkmfuhX5KgzW8Cm7tL9AEZLNWxw5G+/qpXt72+g8VOTx76pVa/Dor
         /EcdFpJMys05AEYMiCc7X6Gf2DgrMvw+gxwbcAXRd2hnunbb4CvbBWx1LtxCtTg7cbG1
         nudcaGdDaYs34EV5RAZjKUWWy1TLOEYrGYM+GaMtFHdyNyUguxFUUcweQ+RAJUEBKxzG
         20LQ==
X-Gm-Message-State: ANoB5pnQsy9EV7sPuUQIqQdaKzylq3EO3Yu7F7isBnVO6LxCxRhEjjpn
        uusu4B/k5PEmPcYQTRqNMtEJUlP3TadqqIcbGYNh6Q8sM/eXxh8GYvSe5Id2kIDkZTfqRz3MuDB
        dnPF/q1OqCvVzshTPGIITp65hMuQtlSheMA==
X-Received: by 2002:a17:906:16d8:b0:7ae:23c:3cb4 with SMTP id t24-20020a17090616d800b007ae023c3cb4mr14140147ejd.599.1668528968915;
        Tue, 15 Nov 2022 08:16:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6aYZfG/JzA2ONHwnV4oEm503m61pxGRUPgH/02VtSrWD047FAWDy+B5MXBVUWfDzZ1idXp5A==
X-Received: by 2002:a17:906:16d8:b0:7ae:23c:3cb4 with SMTP id t24-20020a17090616d800b007ae023c3cb4mr14140127ejd.599.1668528968711;
        Tue, 15 Nov 2022 08:16:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q12-20020a056402032c00b0045d59e49acbsm6371640edw.7.2022.11.15.08.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 08:16:07 -0800 (PST)
Message-ID: <209d9493-d46d-4a2c-afde-0f2ce137cb84@redhat.com>
Date:   Tue, 15 Nov 2022 17:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: asus-wmi: add missing pci_dev_put() in
 asus_wmi_set_xusb2pr()
Content-Language: en-US, nl
To:     Xiongfeng Wang <wangxiongfeng2@huawei.com>, luke@ljones.dev,
        corentin.chary@gmail.com, markgross@kernel.org
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, yangyingliang@huawei.com
References: <20221111100752.134311-1-wangxiongfeng2@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221111100752.134311-1-wangxiongfeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/11/22 11:07, Xiongfeng Wang wrote:
> pci_get_device() will increase the reference count for the returned
> pci_dev. We need to use pci_dev_put() to decrease the reference count
> before asus_wmi_set_xusb2pr() returns.
> 
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

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
>  drivers/platform/x86/asus-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6e8e093f96b3..872efc1d5b36 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1738,6 +1738,8 @@ static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
>  	pci_write_config_dword(xhci_pdev, USB_INTEL_XUSB2PR,
>  				cpu_to_le32(ports_available));
>  
> +	pci_dev_put(xhci_pdev);
> +
>  	pr_info("set USB_INTEL_XUSB2PR old: 0x%04x, new: 0x%04x\n",
>  			orig_ports_available, ports_available);
>  }

