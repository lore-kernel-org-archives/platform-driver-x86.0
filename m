Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73956EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 12:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjHMM5d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 08:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjHMM5d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 08:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F41E6F
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691931414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MwOeQyOfEPRG85LNHqnJdq5su7cAfoH5L/qgXVbC+7I=;
        b=V28bu5sjjZcZBetU9KyCYT9IilLz584smLYG88nQZwMmasmVaWPk9JgPI2LVSt+Lk1YIBB
        6uVdVhp20L1dtYY+JNwIj21drKnFBy/QbScga/zulwpoY36XGTKIQygupLdAhMN/FOs0OA
        SUa0Xe5t9R+F4HPL49nl19MQ2veclsc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-j4hMJM2SNZmKoB2XihHxkw-1; Sun, 13 Aug 2023 08:56:52 -0400
X-MC-Unique: j4hMJM2SNZmKoB2XihHxkw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a34a0b75eso214270766b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691931411; x=1692536211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwOeQyOfEPRG85LNHqnJdq5su7cAfoH5L/qgXVbC+7I=;
        b=jGCo/iUbF6ttqlaxzhn//lR7GCM0aez5kK6OVZinPBof58OwVM4RN/CWSqA5oPPUsE
         eIwPpLM7yZEPmC0M8THlDNAEAi0fpC0ZTPDgVZip0fLk8oAibt3agbpS/mhGheXM8k10
         m1uRROJiFAb+lrfxht6tBlDG1RJj1V+CkW6O7t0rGFKfirIEdizDn9ttayjroR9068+y
         GJELXv4e6Er38og/MFS5gAx1ZFpJZ6IAcPWvK5zTIBBsb7dNJUmmDadxbPBVDW5ITVgB
         L2JtwbmtceCi7rbRgmSLG9tCQx/IKXKZ7gC/+RrplcSD12E0RZri+ANDUhJxQuEod6fv
         L/Mg==
X-Gm-Message-State: AOJu0YxfRlzBCDDyW/DllX2rU+g2oABgeIP/YHWzNnsKc3l8F8l9Uv+o
        OiibgVgZ+xp1bsjgmjohYAbzUCZgc3ywWph1ne9WxsgTnKUjQKrDpbKfzebetom9y6GDeWZvdfT
        K1d4XDcjTZhTJj+fU1PCGW/6PPSHNlbNnLusM4TNP4A==
X-Received: by 2002:a17:907:2c41:b0:992:bc8:58e4 with SMTP id hf1-20020a1709072c4100b009920bc858e4mr5506346ejc.20.1691931411166;
        Sun, 13 Aug 2023 05:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiAxZUT5UTZD9CM8NMeBqHnXWrXShMP9Tm/WMJd63pczOEMQjV4t3ob+USDUx+hGRRViVEhQ==
X-Received: by 2002:a17:907:2c41:b0:992:bc8:58e4 with SMTP id hf1-20020a1709072c4100b009920bc858e4mr5506338ejc.20.1691931410829;
        Sun, 13 Aug 2023 05:56:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h24-20020a1709063c1800b0098e78ff1a87sm4548034ejg.120.2023.08.13.05.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 05:56:50 -0700 (PDT)
Message-ID: <135e50ce-26dd-225b-1a26-0f6ecb8cd030@redhat.com>
Date:   Sun, 13 Aug 2023 14:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform 0/4] platform/x86: mlx-platform: Provide fixes
 for several issues
Content-Language: en-US, nl
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230813083735.39090-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230813083735.39090-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/13/23 10:37, Vadim Pasternak wrote:
> The patch set includes fixes for several issues:
> Patch #1: fixes exit flow order.
> Patch #2: fixes signals definitions.
> Patch #3: fixes platform shutdown callback.
> Patch #3: fixes register offsets
> 
> Vadim Pasternak (4):
>   platform: mellanox: Fix order in exit flow
>   platform: mellanox: mlx-platform: Fix signals polarity and latch mask
>   platform: mellanox: mlx-platform: Modify graceful shutdown callback
>     and power down mask
>   platform: mellanox: Change register offset addresses

Thank you for your series, I've applied this series
to the pdx86/fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


