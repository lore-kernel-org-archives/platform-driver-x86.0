Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1BDC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 15:00:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F1BD60EE2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 15:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhI0PCb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 11:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbhI0PCV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 11:02:21 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FE7C061776
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Sep 2021 08:00:43 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id e15so78893662lfr.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Sep 2021 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o7aWEaG7d8VlXsJUgRUNgDGFp/UH0eh8Fh7AnFwc+iI=;
        b=GEiHy//lRl/jCmjIbarhafUQ7+n9M0EpQT6CcNW8qs0K6whglZ+rEza5SpVof2QMiI
         LABAcAVhxPpjCj0l1YBFMrYvXW6nsRUy4391I1qbMXT6TaRbIUAe6vqTvjTlKpwMdcA+
         Hq3y7waicaGU4piBm69bEwuLckNtCuV6aEP5PJheQYI/YVI08qQu2+Mg9a2bhSxanP/T
         W0sq1N+mgkQnHJjQnQzlXNAOZ5T6a8GWPE05YK9LY7NWA7mPU8/7a5C3dmwClYHXVya0
         tfZW+A407EZVTBJNsS8MN6e4RfiSAWdsXqtOq6Spsme10AA7sv8A4GA0MWrAFY4WtIyV
         gyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o7aWEaG7d8VlXsJUgRUNgDGFp/UH0eh8Fh7AnFwc+iI=;
        b=agi0UttYXjQNSpXKH7Y8qx2njlJCi0Y8y57xQT1+pAHzL/YArLpM92O7ol8SvmovkW
         WVLHsNlW9MY/OcUUzo0BTzzgXcsUI+R9TFpHAgG/TmZlL8KghOizCJM4mAGCL1p5+JN/
         WvpJOwf+JpxwAIZ/Dt4/72cDY+7N6eMdVddVNivsrvnG0lCimbdpma7r4LYO+LmQW/eb
         O+6U5gwE2M4VoFMF8hQ3ipfreFAE9yVmECqlIwylUs8M6aLDgY3zcyhHPLavpHla7EAP
         uXphmpPjWgxQine3y+KoEm3m//HuKmN0gQinWBZc4XJt+QV52TNMAT7uOlPJMwPwMIK9
         w9+w==
X-Gm-Message-State: AOAM533IDB5+jaDmGrps79F7WY4XUy7/Isn5a+3hkBx8MfRwB8UjArlz
        utshd44j2436Tob8zbd55Q8=
X-Google-Smtp-Source: ABdhPJxkOUDb6pwx0eQ93Uef18lyz9W0npSfwzwL4G6xDxkO2NMXyXQVuL5CCiuwS4UfhzgiES2niA==
X-Received: by 2002:a2e:7504:: with SMTP id q4mr281704ljc.157.1632754840629;
        Mon, 27 Sep 2021 08:00:40 -0700 (PDT)
Received: from [130.238.95.198] (emp-95-198.eduroam.uu.se. [130.238.95.198])
        by smtp.gmail.com with ESMTPSA id s4sm1984262ljp.115.2021.09.27.08.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:00:40 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Mark Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com, linrunner@gmx.net
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
From:   =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>
Message-ID: <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
Date:   Mon, 27 Sep 2021 17:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/27/21 3:59 PM, Mark Pearson wrote:
> Do let me know if there are some important use cases for these so I can go back to the FW team and discuss supporting them properly.

The important use cases are force discharge and inhibit charge.
These at present are dealt with using tpacpi-bat, which relies on (out of tree) acpi_call.
See also your previous reply.

On 4/12/21 7:10 PM, Mark Pearson wrote:
> Just as a follow-up - I got some more details on the four ACPI methods
> from the firmware team and it all matches up with the code (and indeed
> the implementation in tpcacpi-bat).

Best,
Nicolò
