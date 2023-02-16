Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F94C636D7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Feb 2023 08:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjBPI5t (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBPI5r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 03:57:47 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2643B3E7
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 00:57:46 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p5so1003231wmg.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 00:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQRWAqkGFsJ+LjehBXgApan0WOe/BP1zPoLzYk+yFfw=;
        b=LPbn+cUHBfIQ3A6x4nCwl/Q7ROlaWzew+glz759Zno4q4wCuetuhzf8NO0F+jDOmjm
         c/2cHxB6wHc/GEwP7ZuT/O+K42TAFl+7la3vbmqRgBgRIC5lnUhIAV2egpfroWdo6NJD
         IPNw4pCmavYVo6DgZvDWPacyH3Uew6BWJtM563NkY6uYDXcYzS5e68BjFLWpWGPrThVQ
         GqPQ5mH0PxDePG10LURLXASHMHHN8gm2tswt02/iEQB3tiTZ/yjlaFJMPT8VxXkF5Fb7
         w4AZbPnsT182e7u+cWwxbyXn0tzJNEPPpJ3pNV5k95bjQyQyO6SQtPY03sn14hrW4qRr
         HDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hQRWAqkGFsJ+LjehBXgApan0WOe/BP1zPoLzYk+yFfw=;
        b=Wp94pJF1unaJvmDlGBsgEVloskrPSEWJyAZWDqAPYxGJhYA+eX3zyzU4a9y6YZkZfy
         uYK2kGaIOjtO1i5REHYGVKBn9iQDbNNCicoXozlvNqZlCW8PPc3ItpH6nUbrdAioQOPm
         /yF0ka9/q1OE6Fr7xCYFdRunXQyXGqp1lYY7trkgGJd+0erVkY1k58Sp/AObWYRTtro/
         1sDdkrGTqwHVh2NkNbhY0nhUDjbnBu/krCOhlglrhWVTM56fbILMX+zSoC0cXkt9+bVp
         P3RUGIxGp5Qmj2l9euqw//026sf8OJ+nmaOLoJxjwjijfmxpVooJUueOdysaNN9e38bm
         KkeA==
X-Gm-Message-State: AO0yUKX4j/RwZmr9e0MCkW3BQ3dTSeVb/ABr8m6iMnP3DEdr64rl1xpO
        4iuTFOhEySrFq2+NDwK/gcxFTQ==
X-Google-Smtp-Source: AK7set+ElThht+MPa1EVx9z7Aq77H/HCF1ng6TquZ+MT/Qlp8AQ0crLPrNdtONN/k1wDW2SiebROPw==
X-Received: by 2002:a05:600c:1e12:b0:3e2:9a2:a6b with SMTP id ay18-20020a05600c1e1200b003e209a20a6bmr1195490wmb.16.1676537864970;
        Thu, 16 Feb 2023 00:57:44 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id j1-20020a05600c410100b003dec22de1b1sm998237wmi.10.2023.02.16.00.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:57:44 -0800 (PST)
Message-ID: <59c24c3d-eb1e-cdee-3d2e-aa1dda5a96fe@linaro.org>
Date:   Thu, 16 Feb 2023 09:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: acerhdf thermal question
To:     Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi,

the polling interval is specified and modified via a kernel module 
parameter [1]

The value is used to change the polling interval of the thermal zone, 
implying that is accessing the thermal zone device structure internals 
directly [2]

In real use case, is the interval changed at runtime? Or just when the 
module is loaded? If the latter, the interval can be passed to the 
thermal zone at init time without doing a polling change rate after the 
thermal zone started. In this case, we can remove the 
polling_delay_jiffies change in the code and fix the structure leakage 
in this driver.

Otherwise, I can add accessors to this field but I would like to prevent 
adding them if they are not really necessary.

Thanks
   -- D.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/drivers/platform/x86/acerhdf.c?h=thermal/bleeding-edge#n792

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/drivers/platform/x86/acerhdf.c?h=thermal/bleeding-edge#n359

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
