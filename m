Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC72C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 Oct 2022 18:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiJHSuF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 Oct 2022 14:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJHSuC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 Oct 2022 14:50:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96EF237FF
        for <platform-driver-x86@vger.kernel.org>; Sat,  8 Oct 2022 11:49:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s2so11037513edd.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Oct 2022 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5epQj47sHxL0xV+W70y4hEnecmE3ASdEET21W4Q2Zpc=;
        b=q5Qlszmq+NigroZa/5gj3lQ6ENOcmbC1YJmfx51NkGfnXhPZ0kCIWeQzs2rotc2qPA
         BRxZWTuiZ6aNegwQ1MEdQzTS0trY6D0DPtxon2KQoQCm/yaarFswmXJud/YnvaJZoR9C
         2q0lmdLpCmPMXx5iYUYLNnYCBqN7eNAqoqNgf8iyO/EZUT6mpg/zpOJfoC+K6UZDgI9t
         w0CJJJNSYz4DPaLFkQfZBINTUijHvBHOpOHHwIYoGg/BC2uJrFmyjvwMYBAqM4+GmT+e
         QPAY6N8z2HA7r6QmSAbGKJpTCJPH4EfnF87QPBu6FvPbddL3qrWG73Qcsjvvj5Q6RCbj
         bGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5epQj47sHxL0xV+W70y4hEnecmE3ASdEET21W4Q2Zpc=;
        b=RsNKhpRNpdHfcsYpePemZdIH/OYfNoGH/P8tMV46OL2Q/ks9WzrLo0T7ciFVTIubLy
         CPqWFEjNUyJGvaDRmytW3R94aCX53p4Cwswip6sx1jT888jGVJlxr4mx/q8ktN5ob4rn
         I1UJBkrqyMQEr246ciiPcWAM9xUVKPYPV7dJzcCf5xX3iP1VKI5yPB7NAnFH2BIPP1C+
         3IsD5SOtqMix2jDtFr6YMVCmbc/gnzHcevJWUcuUHtl94OsaGYBgevUdNQOUKIpk8T81
         lUBiLU9pYGoU8n7MNEdBaR2cSJZHsF3W8kvQczrTY+ZdPso/IwBg+hy00vK7LxvsdWEn
         nutw==
X-Gm-Message-State: ACrzQf2h6Wqi0ceT3wTAvU+4mXyoGOAuZvIZuvCjt/zMs0i33zYKBq+2
        vOMEGcZyjUYJWcKPX3U/KnY=
X-Google-Smtp-Source: AMsMyM5QspheXEsi8coPHqCc+GmRkjb2wXwJ2c8UGKv8BJBScIT03+3DkuddaievAUoYA6i5LL6idw==
X-Received: by 2002:a05:6402:c81:b0:458:c428:173a with SMTP id cm1-20020a0564020c8100b00458c428173amr10087195edb.298.1665254998203;
        Sat, 08 Oct 2022 11:49:58 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id fp33-20020a1709069e2100b00730979f568fsm3022530ejc.150.2022.10.08.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Oct 2022 11:49:57 -0700 (PDT)
Message-ID: <55400326-e64f-5444-94e5-22b8214d00b6@gmail.com>
Date:   Sat, 8 Oct 2022 20:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From:   =?UTF-8?Q?Micha=c5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
Subject: [ibm-acpi-devel] [PATCH] platform/x86: thinkpad_acpi: Fix a
 max_brightness of thinklight
To:     ibm-acpi-devel@lists.sourceforge.net
Content-Language: en-US
Cc:     hmh@hmh.eng.br, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thinklight has only two values, on/off so it's reasonable for 
max_brightness to be 0 and 1 as if you write anything between 0 and 255 
it will be 255 anyway so there's no point for it to be 255.

Also sorry for repeated messages, I got no reply so I'm trying to figure 
out what I did wrong.


---
  drivers/platform/x86/thinkpad_acpi.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c 
b/drivers/platform/x86/thinkpad_acpi.c
index 22d4e8633e30e9..775c2f327dc3a8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5562,6 +5562,7 @@ static enum led_brightness light_sysfs_get(struct 
led_classdev *led_cdev)
  static struct tpacpi_led_classdev tpacpi_led_thinklight = {
      .led_classdev = {
          .name        = "tpacpi::thinklight",
+        .max_brightness    = 1,
          .brightness_set_blocking = &light_sysfs_set,
          .brightness_get    = &light_sysfs_get,
      }




