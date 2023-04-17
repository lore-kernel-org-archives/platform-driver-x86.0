Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53138C77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 10:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjDQK2Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDQK2X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 06:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A707ED1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681727101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=US1TGa5gXkoZDhfsUZW9KdyEpL0e2tgaTlLslLPTFBk=;
        b=TCnkqqsXtfj1R1stEt+q6//YOOu7StjBPYRq8q/sBoGqEWOkZNH0lZcDX0qgiQ0AiBJg8m
        8fumti28+useS475kGQDv+sBFY/S7s5bMwGCbOyUi02QDRi9ZHp4xZKcH1m3DS4wpp2fzv
        AO8AmYFsM0hSSh9QGL4YSA5czrw1Z4I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-gCDJAHh-PzGgmNyUa4rGlg-1; Mon, 17 Apr 2023 06:11:10 -0400
X-MC-Unique: gCDJAHh-PzGgmNyUa4rGlg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5069f2ae8eeso2438850a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726269; x=1684318269;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=US1TGa5gXkoZDhfsUZW9KdyEpL0e2tgaTlLslLPTFBk=;
        b=huC3jNYkpFiN0+vVfnePET4GJ46W+FTtlqhVRB0dcSUaiAXsPpWwoO1jbv6xkju0wb
         6cQHRIpec6SRpCA9KPFM4tEafR5W5YxsbyH0vEwuTHu8lzhh7TvAWmTUD8KxeyuKLUaK
         nZTMDF5pj4WJjN48wqgxxzg3PSisIll2JxmOzGuJXASmNs3TgiOhc6hEZz6PMnhihybj
         PDCNsDlK1upljzupWVUsXz5KI+pCPPLaOYNJoV/RClEekFzvKfuIUxGKExQakctXYmW/
         QPmdpG4yZ4IoaOmSboGMBzyu96vmY/0XppbIEvEd2YC3y3Pvv5JSZ6bZJu/626JkK+wR
         WALw==
X-Gm-Message-State: AAQBX9e4s9/QzdpGJSUy18STOI8cJ0Qk5yCqbuNiCK2ZbbmY+JKjGoKo
        q7cQpLWzyVO1e70G/K5DjRi6i+3xqg0+1XrNqG/oM9ycpW7cusfT8k4O6cAh8NBhsjjXMeZczja
        Siq0fEiKGNoR3u1RNCHHrJCzysOq5kM4dng==
X-Received: by 2002:a05:6402:1396:b0:502:2953:c0b2 with SMTP id b22-20020a056402139600b005022953c0b2mr12495401edv.12.1681726269370;
        Mon, 17 Apr 2023 03:11:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350b6ZTZLLKnwjcZjrXspHKEEelT6AyvFodc1jTTw8jXr/BMgQto9ceyoO3D87qJmF21Ebr5tHQ==
X-Received: by 2002:a05:6402:1396:b0:502:2953:c0b2 with SMTP id b22-20020a056402139600b005022953c0b2mr12495387edv.12.1681726269097;
        Mon, 17 Apr 2023 03:11:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t10-20020a056402020a00b005049412d7b8sm5583842edv.22.2023.04.17.03.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:11:08 -0700 (PDT)
Message-ID: <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
Date:   Mon, 17 Apr 2023 12:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
Content-Language: en-US, nl
To:     Julian Winkler <julian.winkler1@web.de>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20230416154932.6579-1-julian.winkler1@web.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230416154932.6579-1-julian.winkler1@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Julian,

+Cc Andy, Mika,

On 4/16/23 17:49, Julian Winkler wrote:
> This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, saying it
> is only used on Moorestown, but apparently the same id is also used on
> Medfield.
> 
> Tested on the Medfield based Motorola RAZR i smartphone.
> 
> Signed-off-by: Julian Winkler <julian.winkler1@web.de>

Hmm, so this is a former SFI platform, from your:
https://lore.kernel.org/all/20230223060107.23029-1-julian.winkler1@web.de/

patch I guess the plan is to use some custom bootloader
and then use x86 with devicetree support to replace SFI ?

Do you already have this working ?

Sorry for all the questions for what is just a simple PCI-id
addition. I guess I'm worried this is just the tip of
the iceberg for getting medfield support back into
the kernel and I'm a bit worried about how much maintenance
work this will cause.

E.g. also see commit e1da811218d2dc ("drm/gma500: Remove Medfield support")
which I guess you will want to see reverted too ?

That is an example of a lot more code to bring back
then just a single PCI-id addition.

Don't get me wrong I'm all for supporting older hw
if there are users who are interested in actively
maintaining support for it. I just want to get a feel
of the amount of work this is going to involve.

Andy, Mika, any remarks ?

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

