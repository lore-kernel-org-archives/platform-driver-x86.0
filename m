Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547BEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 10:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344346AbiBEKKQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 05:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239292AbiBEKKP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 05:10:15 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63385C061346
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 02:10:12 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id u12so115108plq.10
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 02:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :content-language:content-transfer-encoding;
        bh=wEoU+g/vJlm2noHbumr4lvUXYEnzpeD4Vgp+5SFxHTE=;
        b=gYwdHU0/yr/qVxR/v258E26+k7BDJ/3obRsg3Oeqgh1E2HMSbC/SN8KpHsmZiI9k2H
         CZXH/Ps7BHC2rWjGpmCCKCCyhbDocboXRkZymNznCx+PoD4813ZmWptYgtB/lvwam4Zf
         PH7mlxduhloGnR0Sdl7AIbmicXPuno/yJuo/AEIxB284VnOWpWlK91rXq5fxVZzphCRj
         9jlMWGoIX8DEIqVfQnRSbaBV1tJFwTk/YwqH8tieWd9f+ms0AYL4WzQCNy4DtUUHkIoD
         ZkGjxoapusfR38Qptt/xKcpaZ32Mq00znzcLzxQxhQCKV8Pvmb+mOw0JS7w5m8JU4T+V
         jttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=wEoU+g/vJlm2noHbumr4lvUXYEnzpeD4Vgp+5SFxHTE=;
        b=nNP+PACNTtQaKHcartaj6J+u3biVJyf5UGWoupaotP7fSWu0xMsfUUNEj0z+4afv0J
         AR2BJe2S8YdlNBuBJF0B+dQoT+oRF2BujSGvS5Lum2qD66wZ9kdTqSLU5SoxLcbqCMha
         EEfolpJM/QF5NrgW4ekjuRKvHfvkMTHu0HOn4jkYf179HmYnSueN4gOrhxCwokMh4odH
         IWy/9/77P2ZQaaZUbnceVvT8Qy8geQn71Z70Uv48PPzY25OJ8fYT7zEmlp48Cd9iqVob
         IFGZJI/K9PCppYFTaANuf9pD3WqMVNx0dIik2+J4sBujjOwsZa/vFVZbZv0TRkILuOJL
         vISw==
X-Gm-Message-State: AOAM532D1mJ4PeXtZ5fyadi6aVbRAOw0lkBmifvQuy0sTYxQdPrX4WcC
        PHFI/bhPph1/r/2O4l45T84=
X-Google-Smtp-Source: ABdhPJwGy3F60UHNY21cQqKAyUbZDx51I3OHLwEp/zYMVBfg3Jw+LTU20Ng9pFIWqo0NSlO9XMEWdw==
X-Received: by 2002:a17:902:7c92:: with SMTP id y18mr7354981pll.131.1644055811570;
        Sat, 05 Feb 2022 02:10:11 -0800 (PST)
Received: from [192.168.18.53] ([59.93.24.175])
        by smtp.gmail.com with ESMTPSA id lk8sm4873657pjb.40.2022.02.05.02.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 02:10:11 -0800 (PST)
Message-ID: <6c52edb4-7cb4-7bfd-a40c-a0874569de72@gmail.com>
Date:   Sat, 5 Feb 2022 15:40:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From:   Abhijeet Viswa <abhijeetviswa@gmail.com>
Subject: Regression in asus-wmi due to fan curve patches
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Luke D. Jones" <luke@ljones.dev>,
        acpi4asus-user@lists.sourceforge.net,
        Corentin Chary <corentin.chary@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Firstly, apologies if I have included/excluded the wrong mailing list or 
persons in this email. This is my first time doing this and I've tried 
my best to make sure it is accurate.

I am facing a regression in the mainline of the kernel (commit 
0457e5153e0e8420134f60921349099e907264ca) with the asus-wmi platform 
driver. The driver fails to load with the following dmesg:

	asus-nb-wmi: probe of asus-nb-wmi failed with error -61

I have an ASUS TUF FX506 laptop.

I traced the regression to the method fan_curve_get_factory_default. It 
calls a WMI method which is expected to return a data buffer. However, 
if the device does not support fan curve method it is supposed to return 
the integer error code ASUS_WMI_UNSUPPORTED_METHOD.

However, my laptop returns a value 0 to indicate that the method is not 
supported:

                 If ((IIA0 == 0x00110024))
                 {
                     Return (Zero)
                 }

                 If ((IIA0 == 0x00110025))
                 {
                     Return (Zero)
                 }

This means that on lines 395-407 in the method 
asus_wmi_evaluate_method_buf, the if condition err == 0 evaluates to 
true an -ENODATA (-61) is returned.

         case ACPI_TYPE_INTEGER:
                 err = (u32)obj->integer.value;

                 if (err == ASUS_WMI_UNSUPPORTED_METHOD)
                         err = -ENODEV;
                 /*
                  * At least one method returns a 0 with no buffer if no arg
                  * is provided, such as ASUS_WMI_DEVID_CPU_FAN_CURVE
                  */
                 if (err == 0)
                         err = -ENODATA;
                 break;

I am not sure the extent of ASUS laptops that are affected. TUF series 
laptops do not support fan curve control and so I presume many of them 
are affected by this regression.

I have tested a patch which selectively ignores the -ENODATA error code 
when probing for fan curve control. However, I'm not sure if this is the 
right way to do things and hence have no included the patch here.

Once again, I apologize if this email is not how things are normally 
done and would love to hear feedback on the same.

Thanks
Abhijeet
