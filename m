Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100DAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Feb 2022 08:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348138AbiBKIqL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Feb 2022 03:46:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346961AbiBKIqE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Feb 2022 03:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2EE5E68
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 00:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644569162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NIGJSGdDR+e/0lqDusmjI7J0UIItqFB5EseqZJ+/itg=;
        b=iG/QeERaNs9Sr0kOvajlHT4Cdcd87A8jmtccJKoGpzlUC8YlJl1S6LZ65rtjXW6JmdFPwv
        V/mmnpQlokDkZyGws5CNluJthiekVZuFrzMDpCy13ySHDwMt3prKEav2J3dzvtNgxldHvu
        j2kZpMreGqFzfX5ErhqMoD/an4vY1Cw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-HhHD_9eHMwqMk2ms9uudfg-1; Fri, 11 Feb 2022 03:46:00 -0500
X-MC-Unique: HhHD_9eHMwqMk2ms9uudfg-1
Received: by mail-ej1-f70.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so3784702ejk.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 00:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NIGJSGdDR+e/0lqDusmjI7J0UIItqFB5EseqZJ+/itg=;
        b=GZNLFnp4+wpMN3/FytkLykaWfqY3jxKgLfHFI1Z7SGwKjH7rN9xoat3xKXcar5F0MU
         9J+Ml0FY5UHl5yUyFyvYIYT8QR4oTsfISVS/K9rBQmVkzi9e8CtOqN4vhq/S1a0YVggU
         sSvA4KPgiwvRlQ5/h1N9w/3jx4XtNZ2yTn2zUd/+deu8n+57CB3QAtWhiAXVkMqlxeZV
         AGyu30xWO4k9JBRBvLC5Yf2pHBLiWC1kxa6+gCuOUHSlrYgPd73qiFz/c8HftBSEvGgm
         KXC1L3Q4UbzXeNPotxwpRVUrw27agSLMO8b+bnxEpRG1HjYjFKBM61TPCZWW/gOz0D0j
         OEYA==
X-Gm-Message-State: AOAM532x/mbSd8E4qGA0dNvKG2WMyelbkkotcnDiuENv0UPv/8ERma7t
        B3UFiDuCAKpddCXg76l5IMTharcWPYyp819tLQBnB7B00ixyLRKYCiQ9g1wC7jR5CxDZCRDr41X
        GN/jfy7E3yIhxeWJwYaKWeURpnwe70ixoTA==
X-Received: by 2002:a17:907:168a:: with SMTP id hc10mr466711ejc.283.1644569159071;
        Fri, 11 Feb 2022 00:45:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQtGaHy5U9JGMvxdUhyHS51vk9smJiabHDR4QMkXJw//KX0Gh6ttUq7C+QmDdzvWmB7pzNDQ==
X-Received: by 2002:a17:907:168a:: with SMTP id hc10mr466695ejc.283.1644569158862;
        Fri, 11 Feb 2022 00:45:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id v5sm10859303edb.15.2022.02.11.00.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 00:45:58 -0800 (PST)
Message-ID: <d8c31b9a-49fd-e10b-34ef-751fe1262513@redhat.com>
Date:   Fri, 11 Feb 2022 09:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 8/9] platform/x86: amd-gmux: drop the use of
 `pci_is_thunderbolt_attached`
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
        "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
        "open list:RADEON and AMDGPU DRM DRIVERS" 
        <amd-gfx@lists.freedesktop.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <nouveau@lists.freedesktop.org>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, Alexander.Deucher@amd.com
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-9-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220210224329.2793-9-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/10/22 23:43, Mario Limonciello wrote:
> Currently `pci_is_thunderbolt_attached` is used to indicate a device
> is connected externally.
> 
> The PCI core now marks such devices as removable and downstream drivers
> can use this instead.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, this looks good to me. I assume that this whole series
will be merged in one go through another tree (e.g. the PCI tree),
so here is my ack for merging this patch through another tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 04232fbc7d56..ffac15b9befd 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>  
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -	return pci_is_thunderbolt_attached(to_pci_dev(dev));
> +	return dev_is_removable(dev);
>  }
>  
>  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> 

