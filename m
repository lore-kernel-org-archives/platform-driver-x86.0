Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D97C00145
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Dec 2022 22:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiLLWme (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Dec 2022 17:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233871AbiLLWmS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2022 17:42:18 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A3B1B7BA
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 14:42:17 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id fc4so32002350ejc.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 14:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlcpoCSFPycnYPmcGjwQP3wltEsXbaHWAE6UH218S8g=;
        b=FUdJ5iTV1wYlEPR+1XZCG3Ze2S2IQEsI5yy7xhuu1azTqEO17S0DnhSvgijzz1AR1n
         LcXDvZNQOsxlUF8JFRRDX8tOYCxZsQXKxw4ORzmpuoPpJYxXQGa07AxKq23taOF8CWQt
         40QexUNFijWSeTCM8qCQeLCabVEsXCPTnLyWvXxzhPUHd69QWIgqMJ47sj2oxTJnWKOX
         u2/HkQabYHcjUHpevpqDQj2TqTK/eRAeeD0AQIkiheOKts8LrHRld0rg9JzLwUwhfdUq
         RSIsqs7C52c7j9Y8g6go6JfsUJgJBG7KtupNldSVqDE5lDiDzGB3OrKtUcSJUfveexms
         7yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlcpoCSFPycnYPmcGjwQP3wltEsXbaHWAE6UH218S8g=;
        b=3z7tjiaLjtL6Q1N4JcQLKUoTH51VKKgpNKrX5Khg9y10ssJMU1n6WTj3knjESRe9a5
         KkveZL37YwgYbW4b034+0Eb24gI8NMFRWSa/T/+RK7I4uhP2ArOJZ4LbOccBNF9T2aXK
         7YxI5WnH6Po0JzOvPnklm+vOY6rhBN+V99KmMpCHhiIhE277wn5Mm8yiYA8H5iUjFX1k
         jQuWWrVYoXXiPDJVfKWBw/3FGXDLcX5r1YorRH/JkQ+73SwVjpkcmZSilnSJN7pzgBEZ
         x9f1QiwLjkNPz58GBm6c+oLfg7k9nUdpgQqhN762yKHLjLFbwsSXtcO87b3c5qZEh9iD
         SsPQ==
X-Gm-Message-State: ANoB5pmPtwc2ol+Wak+RLHqMHgsynqWpTCD4XgqzgoHrIxC7EoYsZ5W2
        ol3PmQteAOjzessSZ98v8pCrdw==
X-Google-Smtp-Source: AA0mqf5l76qni16j551VG+b2MdxVUOqtepQUhGMJeiqEJErxWA7l1xKG54dbvHn24mWxkOT/334hmw==
X-Received: by 2002:a17:906:b150:b0:7a6:b59c:1e1b with SMTP id bt16-20020a170906b15000b007a6b59c1e1bmr16197244ejb.29.1670884935913;
        Mon, 12 Dec 2022 14:42:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906200900b007c09a304eb5sm3711593ejo.201.2022.12.12.14.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:42:15 -0800 (PST)
Message-ID: <dc0a6798-a9f4-3b1f-e7e3-ac0bcd7e1ecf@linaro.org>
Date:   Mon, 12 Dec 2022 23:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 14/19] irqchip/gic-v2m: Use
 irq_domain_create_hierarchy()
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-15-johan+linaro@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209140150.1453-15-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/12/22 15:01, Johan Hovold wrote:
> Use the irq_domain_create_hierarchy() helper to create the hierarchical
> domain, which both serves as documentation and avoids poking at
> irqdomain internals.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/irqchip/irq-gic-v2m.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

