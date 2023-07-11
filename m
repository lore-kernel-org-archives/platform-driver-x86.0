Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35379EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 10:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjGKKGt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGKKGr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 06:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009A1F9
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689069962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XgFS22KMNt/Z039riROpRHFrd+xYe/Nj9xO6G3OkVaY=;
        b=LNPPxBUsjQqg/kQnNQiHu8EAruZbErHWukSaldn4xdIbncDYGIWeyVmKKEL8WuqKcwIqYe
        FGjD2kSr3B2bjUjQU7gnWLFQyBVVspCrVOApgMF/iRGVLXXyD7GEm/R7W6q0M0GxgmnVHU
        luDdWSHG0TK/A8iv00a5abukj+F5weQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-kjP95v0sPbSzMrFNCFCNGg-1; Tue, 11 Jul 2023 06:06:01 -0400
X-MC-Unique: kjP95v0sPbSzMrFNCFCNGg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34e35f57so322499266b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 03:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689069960; x=1691661960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgFS22KMNt/Z039riROpRHFrd+xYe/Nj9xO6G3OkVaY=;
        b=NhKcNgEL/q/XPCCLPm0oTcvldhucXoCU1x/xoPczoOwU53bCpICwu9vufr+ZYPp+jI
         0o+cB11zpZ5qnLEPp8VnxSLMK1KfQS8InMj0bFrCmfk8+fcQzaEDy8BAw5INj/JYCDAw
         FVRsGMw8UTXwYxF8Ll2SF1ReVIKNRtxi+CKbcnM2BQX3pI3IKZbCcbdv5qL5E1CgV657
         cSodpXj9wr5pFLKzn7h4pGfxFT+V0visb2wTjXjPIqO2pwpv5O4+T+1NhKAklN9p15WY
         TUZUhAd7v+D68E74v+gSDOldQ/zqrG8dEom5cWTSHS2LS4pQlXi4pr8gcAsdyzvMwSgk
         nYZw==
X-Gm-Message-State: ABy/qLZPaGDmcUiatC6SAKX7DmC4dxWNyyv7wMZ4Jotcj2l+l1lutB/H
        k2b1o2XoRWTFI3mkvnbSja4o5wJ7CMqVydFAfeCKdWFKqX7YJp3dtuHtSHfHVu/TnMdu7Sj513P
        HmCC3FyVYOztukxXqHb2+lsxJP7wZbUt+aYTaLVrUag==
X-Received: by 2002:a17:906:f147:b0:965:d18b:f03a with SMTP id gw7-20020a170906f14700b00965d18bf03amr15546014ejb.58.1689069959918;
        Tue, 11 Jul 2023 03:05:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGtVzoVf1XNl8dafwx/k5zCNRuZJfKHzG+HQgRu6ryupCBH4tyDg85cgJzwuykagl+2/7nM+Q==
X-Received: by 2002:a17:906:f147:b0:965:d18b:f03a with SMTP id gw7-20020a170906f14700b00965d18bf03amr15546000ejb.58.1689069959522;
        Tue, 11 Jul 2023 03:05:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z26-20020a1709064e1a00b009937dbabbd5sm935282eju.220.2023.07.11.03.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:05:58 -0700 (PDT)
Message-ID: <ba221a19-09b4-fae8-8c0e-9785b8f0370d@redhat.com>
Date:   Tue, 11 Jul 2023 12:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: amd: pmc: Add new ACPI ID AMDI000A
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230711100344.383948-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230711100344.383948-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/11/23 12:03, Shyam Sundar S K wrote:
> Add new ACPI ID AMDI000A used by upcoming AMD platform to the pmc
> supported list of devices
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
>  drivers/platform/x86/amd/pmc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index f7bda8a64c95..22bbd2a4a6b7 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -94,6 +94,7 @@
>  #define AMD_CPU_ID_CB			0x14D8
>  #define AMD_CPU_ID_PS			0x14E8
>  #define AMD_CPU_ID_SP			0x14A4
> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
>  
>  #define PMC_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
> @@ -926,6 +927,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>  	{ }
>  };
>  
> @@ -1115,6 +1117,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
>  	{"AMDI0007", 0},
>  	{"AMDI0008", 0},
>  	{"AMDI0009", 0},
> +	{"AMDI000A", 0},
>  	{"AMD0004", 0},
>  	{"AMD0005", 0},
>  	{ }

