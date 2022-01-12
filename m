Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC255C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jan 2022 12:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353143AbiALM3p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jan 2022 07:29:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34468 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353158AbiALM3n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jan 2022 07:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641990582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GfBNnlwLmAcmJ2yGQp1CTmprPgU7Fh4RmKFk2QXUXEA=;
        b=M/NbBus1P/cMikSnA2iy0Zeiu3H45zz7y9er6B22Lo/Ro9jERMsxtpqG/ka2WhOFhlFtTJ
        ODX6Z0zOU7Ae+5c18WxMFkYFi5id86kSRj5jGB63Np39nlgI/8hUaOQsBEedYvGCDjsg+w
        4P8aUS29xEDuFpjOhrVj0yzxozdst/s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-I9KW-RUNOrehHEFr9E92sQ-1; Wed, 12 Jan 2022 07:29:41 -0500
X-MC-Unique: I9KW-RUNOrehHEFr9E92sQ-1
Received: by mail-ed1-f70.google.com with SMTP id h11-20020a05640250cb00b003fa024f87c2so2141843edb.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jan 2022 04:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GfBNnlwLmAcmJ2yGQp1CTmprPgU7Fh4RmKFk2QXUXEA=;
        b=Jqv8Kj68W/cGwBo9iSITIrr6LbMjOYLyrrEx21647rTvYk01GQymJxRqK6lwhpfWrf
         LvO10A6131jL7VJZsaNA0DY6Tgmu7GKdC0tIq+A0BxM+efctfGr2jEBiUjZVMmGWqx2q
         UcwuXdZCFOBhvYoqPOZCk9Gv0jNiqoy4rBV4tk0ag0i5bqAv7W9Y2CjbGlyuhXumiS27
         2DQRHjv6KFQ2aCqDuWVMeXBDy02j91hmlyfTRoqE3AACprqUPwoPSmYkdkJjSKsfD53d
         pBi7VPLnyiL742RfdhhQYONAz9leAtbS6TE7SYoqRB4w6X2yvV2+ridqQd5mbwcmm5+h
         jQHw==
X-Gm-Message-State: AOAM531oonww87Erq5CwFNF8ZAVcdMAaGuhNKR/J7WsreoPc6XRFAz8f
        1EmRLHkDGiDIOqTQIpdremQGtqIYek49jDoFquGS8fEd+o8/bjR+Lnx/m5v/c+vJj8l4xNB5cTS
        V5IYG7oM1K8I/yjZrDFue924vxMJfCbMTAA==
X-Received: by 2002:a05:6402:2684:: with SMTP id w4mr8588205edd.139.1641990579720;
        Wed, 12 Jan 2022 04:29:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnnOP0Hx8forv87z1QvNr3/duR8culvxnQ1WOGwzIyhRKVdztrtCGzCCZart6/w1/LguIEOw==
X-Received: by 2002:a05:6402:2684:: with SMTP id w4mr8588180edd.139.1641990579341;
        Wed, 12 Jan 2022 04:29:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id w7sm6078604ede.66.2022.01.12.04.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 04:29:38 -0800 (PST)
Message-ID: <10f4870d-660a-0181-6e0a-1196dc1f2e70@redhat.com>
Date:   Wed, 12 Jan 2022 13:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: intel_crystal_cove_charger: Fix IRQ masking
 / unmasking
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220111232309.377642-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220111232309.377642-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/12/22 00:23, Hans de Goede wrote:
> The driver as originally submitted accidentally relied on Android having
> run before and Android having unmasked the 2nd level IRQ-mask for the
> charger IRQ. This worked since these are PMIC registers which are only
> reset when the battery is fully drained or disconnected.
> 
> Fix the charger IRQ no longer working after loss of battery power by
> properly setting the 2nd level IRQ-mask for the charger IRQ.
> 
> Note this removes the need to enable/disable our parent IRQ which just
> sets the mask bit in the 1st level IRQ-mask register, setting one of
> the 2 level masks is enough to stop the IRQ from getting reported.
> 
> Fixes: 761db353d9e2 ("platform/x86: Add intel_crystal_cove_charger driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../platform/x86/intel/crystal_cove_charger.c | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/platform/x86/intel/crystal_cove_charger.c
> index 0374bc742513..eeaa926d2058 100644
> --- a/drivers/platform/x86/intel/crystal_cove_charger.c
> +++ b/drivers/platform/x86/intel/crystal_cove_charger.c
> @@ -17,6 +17,7 @@
>  #include <linux/regmap.h>
>  
>  #define CHGRIRQ_REG					0x0a
> +#define MCHGRIRQ_REG					0x17
>  
>  struct crystal_cove_charger_data {
>  	struct mutex buslock; /* irq_bus_lock */
> @@ -25,8 +26,8 @@ struct crystal_cove_charger_data {
>  	struct irq_domain *irq_domain;
>  	int irq;
>  	int charger_irq;
> -	bool irq_enabled;
> -	bool irq_is_enabled;
> +	u8 mask;
> +	u8 new_mask;
>  };
>  
>  static irqreturn_t crystal_cove_charger_irq(int irq, void *data)
> @@ -53,13 +54,9 @@ static void crystal_cove_charger_irq_bus_sync_unlock(struct irq_data *data)
>  {
>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>  
> -	if (charger->irq_is_enabled != charger->irq_enabled) {
> -		if (charger->irq_enabled)
> -			enable_irq(charger->irq);
> -		else
> -			disable_irq(charger->irq);
> -
> -		charger->irq_is_enabled = charger->irq_enabled;
> +	if (charger->mask != charger->new_mask) {
> +		regmap_write(charger->regmap, MCHGRIRQ_REG, charger->new_mask);
> +		charger->mask = charger->new_mask;
>  	}
>  
>  	mutex_unlock(&charger->buslock);
> @@ -69,14 +66,14 @@ static void crystal_cove_charger_irq_unmask(struct irq_data *data)
>  {
>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>  
> -	charger->irq_enabled = true;
> +	charger->new_mask &= ~BIT(data->hwirq);
>  }
>  
>  static void crystal_cove_charger_irq_mask(struct irq_data *data)
>  {
>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>  
> -	charger->irq_enabled = false;
> +	charger->new_mask |= BIT(data->hwirq);
>  }
>  
>  static void crystal_cove_charger_rm_irq_domain(void *data)
> @@ -130,10 +127,13 @@ static int crystal_cove_charger_probe(struct platform_device *pdev)
>  	irq_set_nested_thread(charger->charger_irq, true);
>  	irq_set_noprobe(charger->charger_irq);
>  
> +	/* Mask the single 2nd level IRQ before enabling the 1st level IRQ */
> +	charger->mask = BIT(0);

I just realized that this also needs to set charger->new_mask. I will fix this
up when merging this.

> +	regmap_write(charger->regmap, MCHGRIRQ_REG, charger->mask);
> +
>  	ret = devm_request_threaded_irq(&pdev->dev, charger->irq, NULL,
>  					crystal_cove_charger_irq,
> -					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> -					KBUILD_MODNAME, charger);
> +					IRQF_ONESHOT, KBUILD_MODNAME, charger);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "requesting irq\n");
>  
> 

Regards,

Hans

