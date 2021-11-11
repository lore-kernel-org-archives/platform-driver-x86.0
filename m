Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626E4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 15:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BD2261252
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 15:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbhKKPQY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 10:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30641 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233857AbhKKPQY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 10:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636643614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RaQiWNaeSvc1w9swWxxIumoFqnCNft3G1L1GowqGe2c=;
        b=MSDTsxISWasLMfut4FQp6aIyIIUpEvvO0BNmPqpvYRWtZ7W9JA5/1dF/GbtGN0h7O8qndi
        MWSJvnPV35hZfgjDhFJ+5IQVsn7iAzNygKXl3IVygTVOWLefw1yrooxZ9DoZEY6nJw/Nf+
        F4V2NjHbvtvYkcNwyfOft/I4/dGmF84=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-IKVAGZuwMHG_4jaRulX35g-1; Thu, 11 Nov 2021 10:13:33 -0500
X-MC-Unique: IKVAGZuwMHG_4jaRulX35g-1
Received: by mail-ed1-f71.google.com with SMTP id t20-20020a056402525400b003e2ad6b5ee7so5666937edd.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 07:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RaQiWNaeSvc1w9swWxxIumoFqnCNft3G1L1GowqGe2c=;
        b=cmObEfOmt038wwF9RC8ky2s/RIdPVwE7Ar3RuToTwDHuOwz9y2l3R4Kvvt9oR2w8jt
         6BDiAnlkvc5y8AI3+ZwZzZkcCZogs3jNHok+6Qr/x+n5K6WaLq7jw6dxWG/ASuKky1Uu
         Qfi9I03VavmnYLV0yYcklr21tHQDr+x35FAnnM8pPAjO3otlQzwy0YgK68CKshpEMhLM
         b0d7GfMkRojTd/JgfKUBSMCm2vEVO7Z+kswHmlDoMo4DhfJhUHA8TY/AjOl8WmJidV3R
         1yNSmaSxNhqBq+Q61Biioevznib4qZ3iDmNIcKgZh11KfTWv9RE7puLv3NJiPmUox1oS
         xZaA==
X-Gm-Message-State: AOAM5313FBs5Mbt9LBktaTrgT77DvZ6+e3viFKYGR6YeYnKGdiHjfxkI
        8y5Gd8ZfFWIP28GpAz4TiC1RoPvO6TOC5Ij0GgLjULkRiJswO0dIQXHp3T0fuUDkwJK4Kfz8H8e
        oWN9jnsjoWxMScrKtt9b8u6hzLCRlV6QBBA==
X-Received: by 2002:a05:6402:184c:: with SMTP id v12mr10984241edy.242.1636643612258;
        Thu, 11 Nov 2021 07:13:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsd8FhsX1gKUjz/vl5VBZUjBU0VRQilvxDGoCBMaISX6Ysxjz7/nj2uP1yoHWIQVdIILT48w==
X-Received: by 2002:a05:6402:184c:: with SMTP id v12mr10984194edy.242.1636643612058;
        Thu, 11 Nov 2021 07:13:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id nb4sm1606641ejc.21.2021.11.11.07.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 07:13:31 -0800 (PST)
Message-ID: <4b8f27a2-9c2f-af96-cbd2-9e4c01d37c90@redhat.com>
Date:   Thu, 11 Nov 2021 16:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/11] regulator: Introduce tps68470-regulator driver
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-5-hdegoede@redhat.com>
 <YYpmMNefsGUhqJ9W@paasikivi.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYpmMNefsGUhqJ9W@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Sakari,

On 11/9/21 13:14, Sakari Ailus wrote:

<snip>

>> +config REGULATOR_TPS68470
>> +	tristate "TI TPS68370 PMIC Regulators Driver"
> 
> s/3/4/

Thanks fixed for the upcoming v6 of the patch-series.

Regards,

Hans


