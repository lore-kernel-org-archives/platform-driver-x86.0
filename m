Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E38C4167B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Dec 2022 22:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbiLLWgf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Dec 2022 17:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233825AbiLLWg3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2022 17:36:29 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B838218340
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 14:36:28 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id tz12so9367613ejc.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 14:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7WlhP+l7ysygOjw8JeHYZhjUTz55yAdhFRrx1WIpzYQ=;
        b=DGM361xSjlWsUcFQzdJhlOnKtTrNw6HlhOJUH6RjPZm2+Fpu5KFMW+c0WZVggL34eN
         jmJTtDWZPipQyM/peidtWF/JVMHKT9TzVuUjKM+KMvxWthslcs6p/16OJhoG7ivJft+T
         Ne0JePxGvuDKtc4hHh6Al2eRUcEU480IxAVYr4v/WAD28UwOj0EfyL1lcyyFkfXEF5WP
         UjiuZu9AckIeIGjS0Npe2NWMFMlzJRodKdVR2Z1iUdKRYHgen8eW2wEhJQUsWzHbAyty
         MCh6EduR53dyZNMKYz3eKTeaRn9p7C8UaTZX0Loc2VDPAFCAJ8xHFcF/bhQQNRhlfBth
         qEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WlhP+l7ysygOjw8JeHYZhjUTz55yAdhFRrx1WIpzYQ=;
        b=YLOLI6LidxdiXhGANi+VLG51tvCq6YyXnqDMQ1kY1fQq6ccHc+EZm3mT4bLcD9i85n
         fcW8O38wxhnR2N4niOkOt3rPJsACYRXryzbWfRkw20jq1NhDOdRJkfvygC8zR6ojL1Ru
         jxRhp3upi5/eOIWXN5FN8iunOj/5F68wYyl/cyJgwX3++aAcGg/EZU7WCCgWF3lxCYMz
         JGIB0heyc1YzBG82Su628IDFl7sdTKBfjEYiTRmvE2UwHduJHDLC5k6fdd8WqTIJ4AA0
         kSMC0kEL7gyIr1FMl7ZtmNJl3lTvO/7BLzqmuR3b8kn+YNXCFYcxYF1KMlQx598eMZIx
         KVaQ==
X-Gm-Message-State: ANoB5pmt78vO1b6Q81fAAKqQVhXQPZ1vucvQoZphzOJoCYLNUzgamDgt
        u0WiOi+v/Nu6lyS2tzkBoD04Zg==
X-Google-Smtp-Source: AA0mqf6qREhjixkF/RMTbmutvuBG59uTKRpwKblJwLpiO9Tap2k0DZ14TncO7+FNARV7gGujveTzJg==
X-Received: by 2002:a17:907:9018:b0:7c0:e988:4157 with SMTP id ay24-20020a170907901800b007c0e9884157mr12258639ejc.40.1670884587374;
        Mon, 12 Dec 2022 14:36:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906539100b007c16e083b01sm2070944ejo.9.2022.12.12.14.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:36:26 -0800 (PST)
Message-ID: <e6fba0ff-587d-ac0f-ded2-a650479a3ce0@linaro.org>
Date:   Mon, 12 Dec 2022 23:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 17/19] irqchip/loongson-pch-msi: Use
 irq_domain_create_hierarchy()
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-18-johan+linaro@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209140150.1453-18-johan+linaro@kernel.org>
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
>   drivers/irqchip/irq-loongson-pch-msi.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

