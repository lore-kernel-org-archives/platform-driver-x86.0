Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0366BC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Dec 2022 22:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbiLLWmR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Dec 2022 17:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiLLWmA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2022 17:42:00 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8781BE81
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 14:41:54 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id n20so32121574ejh.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 14:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WU3mAWKHah7f5cn/9LK1A0sGZayOaeYggQzG2/Nasyk=;
        b=TvcYH862sVsa6sMzd5bsiS7lzGRY1ARFG7NOhmCnA+U3DKC2jwyWBoV/rXDbH8lTj6
         vWmoYIGpS5248r7tUrVsYhsc4dnBQKWLJupPps1oP4su1Kin7173/hFL71U21m2jaccp
         kYKjR6Yca2Ca9GqjjJscthKYLyXzBIsVP/OsoeVVM3RI8nLXryvr86ylSNIh7aSQ47kv
         3j38annxmozxwtJ3YkHrkEiVPht9UXilx5oXroqqoMbh1RXCKysadE9KqYYerl3uVFRH
         yAPdysLka4fkj4o1o+EOOs/wvIGavTQLHHj7TDNj/Rwt6Zm42f09fyhu8rltHtHtmhAd
         Xh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU3mAWKHah7f5cn/9LK1A0sGZayOaeYggQzG2/Nasyk=;
        b=KrLMYkL8ZDkGA4g+OkNEVlGSacDaHKps82FZsQdGsxCPfHk46bg/Qgw1UCTbvErVZ6
         8XZDcTJdsmdF7k6YFSmBcimI4Ri6BcCIlmnrHjtJaiFRkm2yvNzZa0RfRnnUntMWgtQX
         g+bOs8ioipcy04hWVnvbl1oGqZrcIkBC0sxHI7ZgWx8VKlStIXtmSsapwgEPf+UWuNGI
         Sht16ZLX7kt1WmzuqmokFCaICCsdT8Ajehuxk2LvHdLxqEXKyzybONStnxHhE6co5srB
         cWM+rMxHCYCxNMn/Rn9vvpP/3c4ioW84WyUqhonlp8Xbbixykxb60KAPr0Y2n6Gpl1Yq
         uKcg==
X-Gm-Message-State: ANoB5pm8dwMVZ0Ohb+I4G3zPoCFsgWJDuaZEljDvPh22HAmVxSH5wkuN
        UgRGC7JcoCTA6vQn3vxXoP0zkQ==
X-Google-Smtp-Source: AA0mqf6+0Nqj9S6J+i5RAccGr7GoxwdmoERl5p+Q02OYkWJKoTkLDczYvW5snGTNovE/ASrNnhxDLQ==
X-Received: by 2002:a17:906:4154:b0:7c1:639:6b42 with SMTP id l20-20020a170906415400b007c106396b42mr15436504ejk.62.1670884913195;
        Mon, 12 Dec 2022 14:41:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id h22-20020a170906591600b007bdc2de90e6sm3756374ejq.42.2022.12.12.14.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:41:52 -0800 (PST)
Message-ID: <1c3a4d62-7111-dd21-a2e4-350a3d26c0a2@linaro.org>
Date:   Mon, 12 Dec 2022 23:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 13/19] irqchip/alpine-msi: Use
 irq_domain_add_hierarchy()
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-14-johan+linaro@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209140150.1453-14-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/12/22 15:01, Johan Hovold wrote:
> Use the irq_domain_add_hierarchy() helper to create the hierarchical
> domain, which both serves as documentation and avoids poking at
> irqdomain internals.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/irqchip/irq-alpine-msi.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

