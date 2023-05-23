Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94436C7EE26
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 11:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjEWLIa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 07:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236478AbjEWLI1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 07:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD0D11F
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684840060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TgAfeWGrsZZYnBL05wn3YJIuhT7jiDrtSHb3+2pNJ5c=;
        b=TTlnBzLXCbyiO7ZBf5AN18ieEyD4DNR859GiI9qbuh6taxDdJmy7KmIBofpVSefvPRmIbf
        ZHuRgmaDR2zGvat2vzGeuNVDODm9d704aKlnmhxnAtmu0Umr5Zq3gTBt7/+WkbGcqS3dxj
        q+ilDIdiweCd/weWZOg09etJNDCQi2I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-MBouAwakNi6BnlgxKGdGIw-1; Tue, 23 May 2023 07:07:39 -0400
X-MC-Unique: MBouAwakNi6BnlgxKGdGIw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-96fa4c724fdso418014466b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 04:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684840058; x=1687432058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgAfeWGrsZZYnBL05wn3YJIuhT7jiDrtSHb3+2pNJ5c=;
        b=EOkxzOEHtVTQdRBZ+O75/xJd8yooz66N2ODp8IXg6MHL4jHU33IBtJjcgyQ4SRELt7
         Z/JHePps0XKE3TzLyHg5VFfmcXRkpLv7qcKO7cV7oKpzDwaHOA1zBe8axY4CeMCInPue
         JFIudvZdHUsmDg4y9P1qv9TJXetT38VDtm/ymfl/jERIV19Z0DOSGR59OiCYVxHUPA2J
         eVB9GNGDJkLSsujDDB5CLqIAK2yBEx7bEZkYN2dFQYvHYhDa9ayfp/9xa8a0xeTGVMUi
         o2y/GxK0LSGkBC7aeceP+Z2J643lSJsiAoX/++Vt8BH8EdPlI7Utps//XkkYyOJntzMZ
         1e2Q==
X-Gm-Message-State: AC+VfDz9q8tH2avt0b1ybekV4OwXdCGBLORYgMfk1zL55av9L2xAHluY
        52+z/45pPxjgHg4VEZthXQYCGuDGeXDTe6zQfhqTZuV66uIwQSfnfaSH+ME2V/nhytZz0G9OhG2
        PLEN8jMyORTxLac5u2Dz1fw4uTWDeQjuVyg==
X-Received: by 2002:a17:907:6287:b0:966:a691:55f9 with SMTP id nd7-20020a170907628700b00966a69155f9mr11068569ejc.30.1684840057966;
        Tue, 23 May 2023 04:07:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4caVLW/8Ni1Ot2OEe8VHt0hfZFf8rele1i6QgoUF5MCgzUhu+7eQSnBFXZ045menh2EQYUAw==
X-Received: by 2002:a17:907:6287:b0:966:a691:55f9 with SMTP id nd7-20020a170907628700b00966a69155f9mr11068553ejc.30.1684840057699;
        Tue, 23 May 2023 04:07:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j26-20020a17090686da00b0096f7500502csm4299108ejy.199.2023.05.23.04.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 04:07:37 -0700 (PDT)
Message-ID: <e9eb526d-84fe-b814-67a3-6f7977aa0078@redhat.com>
Date:   Tue, 23 May 2023 13:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/4] platform/x86/amd: pmc: Use pm_pr_dbg() for suspend
 related messages
Content-Language: en-US, nl
To:     Mario Limonciello <mario.limonciello@amd.com>, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, Shyam-sundar.S-k@amd.com,
        Basavaraj.Natikar@amd.com
References: <20230522200033.2605-1-mario.limonciello@amd.com>
 <20230522200033.2605-4-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230522200033.2605-4-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 5/22/23 22:00, Mario Limonciello wrote:
> Using pm_pr_dbg() allows users to toggle `/sys/power/pm_debug_messages`
> as a single knob to turn on messages that amd-pmc can emit to aid in
> any s2idle debugging.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 427905714f79..1304cd6f13f6 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -543,7 +543,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  	}
>  
>  	if (dev)
> -		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
> +		pm_pr_dbg("SMU idlemask s0i3: 0x%x\n", val);
>  
>  	if (s)
>  		seq_printf(s, "SMU idlemask : 0x%x\n", val);

This does not compile, amd/pmc.c may be build as an amd-pmc.ko module
and currently the pm_debug_messages_on flag used by pm_pr_dbg()
is not exported to modules:

  CC [M]  drivers/platform/x86/amd/pmc.o
  LD [M]  drivers/platform/x86/amd/amd-pmc.o
  MODPOST Module.symvers
ERROR: modpost: "pm_debug_messages_on" [drivers/platform/x86/amd/amd-pmc.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
make: *** [Makefile:1978: modpost] Error 2

Regards,

Hans


