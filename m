Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A68C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 12:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99BAA60FE8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 12:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhIUMx2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 08:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59054 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230519AbhIUMxZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 08:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632228717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TqxAQwuwKeUNvwuaTqo1+dLfw9h1X6NxpXvwJl/CpGM=;
        b=K9pT03i5PRU9Gcr3ivzXCPuUGt+K7EtfhxY1iy68pSZQQbQTNTLGxQu+Ly4aLotVbLkupD
        UXtMQ8HAfps0hg0s7x8UF6TFeseg7GiBYxA1yZZLDg/6aYc+9qstflC5V9GoynRxhMtDJn
        8yHAL/sTlyHQTmHPkplGAF3Jv3HU5QU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-osMPAF1-P-uFny7WUjk6ig-1; Tue, 21 Sep 2021 08:51:56 -0400
X-MC-Unique: osMPAF1-P-uFny7WUjk6ig-1
Received: by mail-ed1-f70.google.com with SMTP id e7-20020aa7d7c7000000b003d3e6df477cso18878681eds.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 05:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TqxAQwuwKeUNvwuaTqo1+dLfw9h1X6NxpXvwJl/CpGM=;
        b=rF74VndMALVs0lss2NZAKWhp6m1y0bAl1lRH8m0zLIVtfWhQDqIyzkr7huxAUITh46
         rA8r5gbOZWvvJuzw6hlbgaRtt29Lr/ENq6lIsvpJ3VYmaTxwdqbk6TL5od2TPfgTpeVL
         HAHcc+peKztWo/4fB3zYr6/d8HOSO4+t4s0ggAUiIM9PI+QAoKIYnSLFCXT3UHpmS8nB
         Y4MOnPQugDYe7ksAs24scy38/gpiRUh/Bfk9QvLKTA5rzHKuD4yGGIur+pZFju6kazU6
         Je67RUDfvyMhfbdw5jr9nNZvNXB2R9LrbRYX9AmWPy1IHaokEI9xOlPZasEzTtr9kh9R
         igMA==
X-Gm-Message-State: AOAM53115xfdnG6N1kEqQ+qBByDAsaij9YRv/6/tToKV3Zj+uVMkoywc
        7aXmWAmy2vpzP1qARup/dsmh8Pf2EFuFDuPWcWN8NSlnbIHbIjfgayZqCftxMedrUQ8jPN0LhoJ
        hFO/6XVpnriJVyGkWlrIqLgA0iQ9GObDr0C2KlhzoqUOA8ziady6XtdbevJw8bYkp3quYHOWeJA
        jk8HyyPa9+3A==
X-Received: by 2002:a17:906:c52:: with SMTP id t18mr34493882ejf.148.1632228714557;
        Tue, 21 Sep 2021 05:51:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhuiUQhb0tewsqj63rPQftRwt57rxaB6FUVbu3JbDMhgH6wEublWh/IKVcBTwPNrwaAf/NaA==
X-Received: by 2002:a17:906:c52:: with SMTP id t18mr34493856ejf.148.1632228714315;
        Tue, 21 Sep 2021 05:51:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d9sm8435983ede.31.2021.09.21.05.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 05:51:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] acpi: pnp: remove duplicated BRI0A49 and BDP3336
 entries
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Matan Ziv-Av <matan@svgalib.org>,
        Mark Gross <mgross@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210916170054.136790-1-krzysztof.kozlowski@canonical.com>
 <20210916170054.136790-2-krzysztof.kozlowski@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f78523c5-df88-a768-3b9a-d542bbd73a1c@redhat.com>
Date:   Tue, 21 Sep 2021 14:51:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916170054.136790-2-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/21 7:00 PM, Krzysztof Kozlowski wrote:
> BRI0A49 and BDP3336 are already on the list.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Rafael, I've picked up 1/2 since that applies to a drivers/platform/x86
driver. I'll leave picking this one up to you.

Regards,

Hans

> ---
>  drivers/acpi/acpi_pnp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_pnp.c b/drivers/acpi/acpi_pnp.c
> index 8f2dc176bb41..ffdcfcd4a10d 100644
> --- a/drivers/acpi/acpi_pnp.c
> +++ b/drivers/acpi/acpi_pnp.c
> @@ -156,8 +156,6 @@ static const struct acpi_device_id acpi_pnp_device_ids[] = {
>  	{"BRI0A49"},		/* Boca Complete Ofc Communicator 14.4 Data-FAX */
>  	{"BRI1400"},		/* Boca Research 33,600 ACF Modem */
>  	{"BRI3400"},		/* Boca 33.6 Kbps Internal FD34FSVD */
> -	{"BRI0A49"},		/* Boca 33.6 Kbps Internal FD34FSVD */
> -	{"BDP3336"},		/* Best Data Products Inc. Smart One 336F PnP Modem */
>  	{"CPI4050"},		/* Computer Peripherals Inc. EuroViVa CommCenter-33.6 SP PnP */
>  	{"CTL3001"},		/* Creative Labs Phone Blaster 28.8 DSVD PnP Voice */
>  	{"CTL3011"},		/* Creative Labs Modem Blaster 28.8 DSVD PnP Voice */
> 

