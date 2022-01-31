Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4FAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Jan 2022 17:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380803AbiAaRNc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Jan 2022 12:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380772AbiAaRNY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jan 2022 12:13:24 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08351C061714
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jan 2022 09:13:24 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id s18so26736329wrv.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jan 2022 09:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XynZHtvD8T/EbmQgZ15CsiypgVAUseBYZYVWP5WDzHc=;
        b=AVUm+bRMGdtXuiZWCip2DIRQW5iJMcj+qePn2VTWcKYF6+uKTcOu/jM4N6+qI++sYA
         FNixHxLQafMjEQ6PesoXKZd9g8scfTZGVUzyUy2d3vwKI13dIbXGEkC2l1hKngnm2JQ+
         3g8SHiWeiNNlT/iV64hhvN/WoqHYXoK7frnRDsNU0wR3FKpq2BT94gqLQOlbosYe7gpk
         gqsVPUG+/SgfkO/723wOCbUlUupk0ak/zh1oo/0ro5ueZwN8rsZpXZKO3jHjCpj1SC0o
         jTbsvN4EZ0qYH1KveyAnrdY3MBUCbmWAhw6MViy4z4z6eWAlIM39Lff947zAUfF0tJ/w
         3Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XynZHtvD8T/EbmQgZ15CsiypgVAUseBYZYVWP5WDzHc=;
        b=FBZvWiPUQaRedOZ65WM39trEi0Elr5jYuEuSEETMa5wUEu2MYADh1Gh7k828nBKcUr
         zn/wuMElp4jF+RxifxG4Ieb3+gBvjEuzyusZ7GTBSkj+8v6W8zGUyeyGKBB588cqELzN
         UblI+rVPsiRwuibpckqRJm5x818gvc7cRNhbwtYSVRybuFOemLYNsEhlAM986bR/hiD2
         Y3ANKRhtVNrINUVG03CeYDQ7kr1x0tsAfQNlu4Zc04VjWouCLqH5e8k4v0JBrCtGM1ha
         fqyWXc1bxOrKKpRhuSDokK/qXgyV5XjEDj+iFHz7gtcMi6udG7hU6sMy0CSQpH4dIcxy
         obkA==
X-Gm-Message-State: AOAM532nxm9VhoEBWqs8vhzitAfjKYIroBnLUUNVhhyFtBdTKfdyi25m
        EJn8iTkL0Uw+7zowvuDGyMCgsg==
X-Google-Smtp-Source: ABdhPJxtwkiQoHsnirCmZonhMfF3H3P6nm+XFOmoUqr9Obwi4ULoMWxKN7nHI9n/JbIS58YFhr07Zg==
X-Received: by 2002:a05:6000:18a8:: with SMTP id b8mr18144848wri.604.1643649202606;
        Mon, 31 Jan 2022 09:13:22 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id b15sm12331776wrs.93.2022.01.31.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 09:13:22 -0800 (PST)
Date:   Mon, 31 Jan 2022 17:13:20 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mfd: intel_soc_pmic_crc: Sort cells by IRQ order
Message-ID: <YfgYsC4hYkuLXUVa@google.com>
References: <20211225115509.94891-1-hdegoede@redhat.com>
 <20211225115509.94891-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211225115509.94891-2-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, 25 Dec 2021, Hans de Goede wrote:

> The cells for the Crystal Cove PMIC are already mostly sorted by
> function / IRQ order. Move the ADC cell so that they are fully sorted.
> 
> Also move some of the resource definitions so that their order matches
> the (new) order of the cells.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mfd/intel_soc_pmic_crc.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
