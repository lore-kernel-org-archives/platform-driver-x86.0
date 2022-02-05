Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C2CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 11:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238741AbiBELBO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 06:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238327AbiBELBO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 06:01:14 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB702C061346
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 03:01:12 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id c194so7306640pfb.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 03:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:references
         :content-language:cc:in-reply-to:content-transfer-encoding;
        bh=d4b0HgP7j/7mVot/cOfseoBNwiauWynlLwBiBU/aQ/s=;
        b=YSSeKR/0X09TWr7YWW/r93gmNH9BtimCV6/ATJurcU8r/crfvQpCeeFFIzP54oktm1
         XEX8LTSbYpHkqM3PmbWCqQCqwsddHgB+8ozIpNma1U8Q5QgEiF9L97ayAtBHJWeORtZ6
         821K78o226JJJPLse/CM9MSi+723UHUJA7DR/bF1aqjuLt51I45Qhv5N8+Qajda9tAEs
         fRyFboBrD5TXJK+6u09M6N3WwtK/GxICyOuRWFoeFsMqskwIO9K4XqZkQCcJJxssM25d
         P3ZF1AEezNdK92JZhsHNugvC6iPomFrrOxL1XoLoQhzs2rmx6Hn86A0ZDNjYCZWTc3tC
         H/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:references:content-language:cc:in-reply-to
         :content-transfer-encoding;
        bh=d4b0HgP7j/7mVot/cOfseoBNwiauWynlLwBiBU/aQ/s=;
        b=pbP58ya2D/qW2RzwAFzLYkEVI1KCfhHQt9r0JsqSU7u5oFbX0usUm8o9tfLIvWDS0o
         KEW3x4btpKhSkr9ck6SDWSLMO4ttlBijAbo40AQkUNa3D2gEQO1UqE1Y7Oph2JZ4VMk8
         nQiVMmUbO2MRXQkiPFTzViB39YJwmxp0ooghjhnAskM/Kwv1Zhl5ourIGNrXlCpZU6VM
         L9nWsU0Z1Zgb9EhLLRQK4OmmRut6QsVKCP9eUNnKN8opY02GbwoWInB3viwkzD8Btm27
         AS9ykWoqDR2x8uqLoG5hPtRxiPjUinV/yIR379Y+ibiLXkKenH1I0kVoU3jNNBw79HST
         5s7A==
X-Gm-Message-State: AOAM530k6jbmM5BC6CF3zT7QqsN7ToQffCBdNqbF/u3ZAFVMaZOLtJYz
        B/jFSF+7Km6oYLjt3gJYjD8=
X-Google-Smtp-Source: ABdhPJyDO4f2UzwjEh89lzFzMQEA/yfriz+cVPd06Ci/H1D2TqqGL5q1qPV0fM9bGDIWIj1UHWqTIg==
X-Received: by 2002:a05:6a00:1513:: with SMTP id q19mr7339414pfu.12.1644058872081;
        Sat, 05 Feb 2022 03:01:12 -0800 (PST)
Received: from [192.168.18.53] ([59.93.24.175])
        by smtp.gmail.com with ESMTPSA id q9sm15780069pjm.20.2022.02.05.03.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 03:01:11 -0800 (PST)
Message-ID: <3223414e-2f95-9945-f0c1-c36782281478@gmail.com>
Date:   Sat, 5 Feb 2022 16:31:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From:   Abhijeet Viswa <abhijeetviswa@gmail.com>
Subject: Re: Regression in asus-wmi due to fan curve patches
To:     Hans de Goede <hdegoede@redhat.com>
References: <6c52edb4-7cb4-7bfd-a40c-a0874569de72@gmail.com>
 <fde23037-b9c7-adde-5a2b-79a67c329538@redhat.com>
Content-Language: en-US
Cc:     "Luke D. Jones" <luke@ljones.dev>,
        acpi4asus-user@lists.sourceforge.net,
        Corentin Chary <corentin.chary@gmail.com>,
        platform-driver-x86@vger.kernel.org
In-Reply-To: <fde23037-b9c7-adde-5a2b-79a67c329538@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, 

On 05/02/22 15:46, Hans de Goede wrote:
>> Firstly, apologies if I have included/excluded the wrong mailing list or persons in this email. This is my first time doing this and I've tried my best to make sure it is accurate.
> 
> No worries, it looks like you've done a pretty good job at picking the
> right people + lists. And even if you didn't with regressions like this
> *the* most important thing is to get the word out quickly, so thank
> you for doing that!

Thanks. I'm happy to hear this.

I tried a git-format patch which created an email patch. Wasn't sure if I had to send a separate patch email, so I've decided to inline the patch contents at the end of this email. And, I certify that the changes are mine and license them under the same license as the files modified.

Hopefully inlining it is fine. If not, I could provide it as an attachment.

Thanks
Abhijeet

~~~

From f5bae0a579dc211c329c7aa08837e462aee1af6b Mon Sep 17 00:00:00 2001
From: Abhijeet V <abhijeetviswa@gmail.com>
Date: Sat, 5 Feb 2022 15:57:23 +0530
Subject: [PATCH] asus-wmi: Fix regression when probing for fan curve control

The fan curve control patches introduced a regression for atleast the
TUF FX506 and possibly other TUF series laptops that do not have support
for fan curve control.

As part of the probing process, asus_wmi_evaluate_method_buf is called
to get the factory default fan curve . The WMI management function
returns 0 on certain laptops to indicate lack of fan curve control
instead of ASUS_WMI_UNSUPPORTED_METHOD. This 0 is transformed to
-ENODATA which results in failure when probing.

Signed-off-by: Abhijeet V <abhijeetviswa@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a3b83b22a3b..adeb58765dc 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3585,7 +3585,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 		goto fail_hwmon;
 
 	err = asus_wmi_custom_fan_curve_init(asus);
-	if (err)
+	if (err && err != -ENODATA)
 		goto fail_custom_fan_curve;
 
 	err = asus_wmi_led_init(asus);
-- 
2.35.1


