Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19803C7EE2E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 11:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237681AbjFLLDv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236810AbjFLLDa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 07:03:30 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571B57EE4
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 03:51:20 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9745ba45cd1so637296766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686567079; x=1689159079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urXa2w8+hg8AKYlUv+TAcgSse3nPa4Vcu7Vz6BhODWo=;
        b=OQkfz2FIe14+rP2MsdCs/taCUwjnGMKS+DALa4w6txl7nbxmnxZSipBWCRLTHH2+s+
         M2x6NCr1zWK6e8u2dYUFq7S39dmy4GTehexyvWmDaitq+Kg7RrpdetaZr4DgmoDETHMu
         nlzOLeucBnU+QGaHFksWnI54L1HuhNjaKhNUX8YBdvcqMkQGlVDHCkk8fZGZw9a4jPgu
         qcPAeqYMXKNSOjnMxsY3P8n0ileMQzes2AWM0cDFjiUBw7By5YKOfoiQBm6LjfakYZT7
         A6Pp8SgddaqVDiNtCH+Xtr3ZIpCGTXnassFM0/2+C8eMSYaqcnM3RIetv8UovRssJ2Mi
         UY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567079; x=1689159079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urXa2w8+hg8AKYlUv+TAcgSse3nPa4Vcu7Vz6BhODWo=;
        b=GRrUZ0pPcWUMmoJkb0i9buMdFTkYgeBDXHSiQIvr/BYKIt/AlsfgohX2Qj34mFq+Ll
         ItriIygboNVRUBdZZcniBb6UP/sSQZo/OwkUcX5a0K+uSbz729yhcxO5ca27+3+y2KwQ
         pjLww0eBezHx3FUmdPA/lwgMB+t6+wXDD8vEqxutrqqar7PHquuwRnvR+p3YnEIJSqWC
         AVAe/awK4I2pNJJlFHU4LpWIF1UvV07bfQBub6o7mPMtf6HBpDOC40Dg74jdfOr+ycJN
         mvYH1T1aKa/yQmoAMbfucvR5IrSTj4iYs3hmVyxqAZoBtPWl1Be66iQN2AaQwaAstEBO
         ZSMg==
X-Gm-Message-State: AC+VfDy/ZvM/OtBn5qUvWkKNsan9wYcG/n2V1DJNPBs6s1f+89LNnqsA
        kEAJQt6a5mMZHc0oZveH6mY=
X-Google-Smtp-Source: ACHHUZ5bQbuWKaeVUQiw5KyS9luj8vH+F5Yp9I2MfoSsOXg4d05HE6dM/RMvwwZe2oauEK5gJvXtxg==
X-Received: by 2002:a17:907:e8b:b0:973:da59:7c76 with SMTP id ho11-20020a1709070e8b00b00973da597c76mr7643685ejc.56.1686567078392;
        Mon, 12 Jun 2023 03:51:18 -0700 (PDT)
Received: from [10.27.0.2] ([37.120.217.170])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906151000b009746023de34sm5019225ejd.150.2023.06.12.03.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:51:17 -0700 (PDT)
Message-ID: <6649e0b3-1e59-fc1e-4abc-f9c228406aa0@gmail.com>
Date:   Mon, 12 Jun 2023 12:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] platform: Switch back to use struct i2c_driver's
 .probe()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de,
        acpi4asus-user@lists.sourceforge.net
References: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/12/23 09:38, Uwe Kleine-König wrote:
> Hello,
> 
> these three patches convert three i2c drivers back to use .probe() after
> its prototype was changed.
> 
> I was unsure if I should put the surface change together with the two
> other x86 changes but as surfaces are x86, too, I thought this might be
> right. If not: The patches are orthogonal to each other, so they can be
> applied to different trees without interdependencies.

While Hans is the authority on that, I believe that's fine. Both go
through Hans' pdx86 tree.

Regards,
Max
