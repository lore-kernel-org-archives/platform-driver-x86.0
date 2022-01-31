Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C396EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Jan 2022 17:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380806AbiAaRPT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Jan 2022 12:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380807AbiAaRO1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jan 2022 12:14:27 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88ABC061755
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jan 2022 09:14:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id m14so26540254wrg.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jan 2022 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3yjwrap5tpYm/7QbYNvtDb/JoJt6s3ryblr4h6gy70g=;
        b=B9HaQORPQI4grECruzNH3W+5u9nr8Jr+sg/eSIGAmjXJFQktjGrhuXth86OUoDUDk0
         F8KVjBz8fMrLGo9uot3DKOYGGZCgCW1EO7WUvB96P0z1vy0TcRSa3isfz9sj3U96KLOe
         PNCxCicRGoUn7coFaA0s95MUo7A4g+08oGMU19+JFpG8R4ho4ZcvV2AMKW8Dku5ALzyk
         Bxj8UflaWGrlzxrODda/USFX9z+byyIVe1MEjmZQcWWEY26xFbIQLi7/0ewjYM//yoVT
         YNthBy7I45H0mHaDYxKwQ8BbRrLwurtVU2+Q6EJRoL/DD395wskazTLP3DlP7J29vuHf
         /Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3yjwrap5tpYm/7QbYNvtDb/JoJt6s3ryblr4h6gy70g=;
        b=4+PFkg5E+5jMUuFT1530Ee+u9ipeL47NPEA8rgPmShvJjZqyNzA3JtKNjUSWjhUVmW
         g9cdVAAslvGLJ7EH3fsqBvXLCpnAa5NtX1p/rxq5qY/mEp0pBmB8YtlV5Sq+nKsunJ0L
         CKMRvAPITXlxxN7zAAARc+PGTXD19QLtnSCgpigURDKmLglsjF4nKhHJ9qs2b7EXcU+d
         fzpQ9OWp8YUpD9Nm1U6RfOukc63U0RKmXZAWiKBzCxA7HeBIiZoORplH0CERq+yIbwZ8
         ZM31TubcYA5csozhhjYYUIcIC40n922w35IdzhbtoLOQ2Fk6HV6l2GEvBZFprW1Cr9Hu
         LaRQ==
X-Gm-Message-State: AOAM5339AmaW4LJsUi+h37r2E2n5ZyXmpXM533yQ4hGtP97Ssx4FvcyC
        Ad1NhjOBUok9xXCOSaRNch/IEw==
X-Google-Smtp-Source: ABdhPJw42Le5iZT2qXkgrtxMR7FF4qTxmm9m8ebyY+4Wba7HFzlF7+BZgNB/svyFpU6zRVFN50opiA==
X-Received: by 2002:a05:6000:1a89:: with SMTP id f9mr8845596wry.573.1643649246296;
        Mon, 31 Jan 2022 09:14:06 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id o8sm9042175wmc.46.2022.01.31.09.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 09:14:05 -0800 (PST)
Date:   Mon, 31 Jan 2022 17:14:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mfd: intel_soc_pmic_crc: Add crystal_cove_charger
 cell to BYT cells
Message-ID: <YfgY3IdqiXo75rX2@google.com>
References: <20211225115509.94891-1-hdegoede@redhat.com>
 <20211225115509.94891-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211225115509.94891-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, 25 Dec 2021, Hans de Goede wrote:

> The Crystal Cove PMIC has a pin which can be used to connect the IRQ of
> an external charger IC. On some boards this is used and we need to have
> a cell for this, with a driver which creates its own irqchip with
> a single IRQ for the charger driver to consume.
> 
> The charger driver cannot directly consume the IRQ from the MFD level
> irqchip because the PMIC has 2 levels of interrupts and the second
> level interrupt status register, which is handled by the cell drivers,
> needs to have the IRQ acked to avoid an IRQ storm.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mfd/intel_soc_pmic_crc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
