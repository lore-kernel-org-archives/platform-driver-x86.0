Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108D7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Jun 2022 17:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiFFRSi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Jun 2022 13:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiFFRSN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Jun 2022 13:18:13 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B23F1085
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jun 2022 10:15:18 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id y15so11057654ljc.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jun 2022 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:cc:content-transfer-encoding;
        bh=s3ld9dbviT8JdxsfZiAoXVO0rdP+1apuy7OtDLRd52s=;
        b=G7vXWMSRk5iO3Gal0CRNkW5Nd89Gm+TIDtQfxcX6KV/HwMoagwq5rgxtY9QAaXvgT4
         qJ9aS+yP8q0zmDW/xUgVDms8Vn63+hkD+9hnm+FjwUSktn8Q169jq3c0r8cd048F2dUW
         gZWvS3UyBMJmDpLjlNtVk1gmBm55UrhlugtYENqwZugMy56MDis+i19XcbBvB10N/Nn0
         vIP+eCxqzZC/hvzjcN2l7+e5Hi5VNo+6vJ6s4T3jr029jZlwzrnCrfShOYomOAFasBK2
         B2VMD1Uq28vkXpH/c1G5/hu0YDQAQ5q/IFhiF2MvYC/EfzNbTavIwtmPA4kMajtcOxB2
         s01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:cc:content-transfer-encoding;
        bh=s3ld9dbviT8JdxsfZiAoXVO0rdP+1apuy7OtDLRd52s=;
        b=hNhh0ml3L3cCLRSpYGR+oKKU5cvbMwlem5223xxRgPS8FltZapg7IbYqke0vPyzf1l
         JYNM2dU+ee0mIzRdR0mnXvfVbORXmqWYDFzQYcgCcXioInuykXC8aVV8w2fYBtncR385
         49S3LOX6McklS0GzGGZMaQxJBfIlLBiDRiUwo1EStbyn43TyFAvQ8dAXCyhhlDY0xbPa
         xGWpaEPAZXEtd88h5FNjDAOrH9mvs5BF35QiNlC7IvDd4r5EzJBnI6be0pieNs5XQSGY
         a/xM0BsJsfHZbZPYst7Cz5KS/1VmNOi/ojRb35ybpX2M2PLfuSwXiy0GeuYDHFPu2MeK
         +3eg==
X-Gm-Message-State: AOAM533pxL+Osvz2t+p9ByO1888XGD/+nnuQNAUP1NXD9EmW2TL+OhPp
        HUhOJ+F0BssYQXGDBPSCCA4ZUGIe4b/jLQ==
X-Google-Smtp-Source: ABdhPJzos+wDuYofavoomXcTDNrz141yI3IMrTGsflZgG/OXgVy0XmtSHUL5Yfgx3FE621catQeR+Q==
X-Received: by 2002:a2e:a22d:0:b0:255:7b60:f522 with SMTP id i13-20020a2ea22d000000b002557b60f522mr10914181ljm.483.1654535716475;
        Mon, 06 Jun 2022 10:15:16 -0700 (PDT)
Received: from [192.168.1.2] (235.132.246.94.ip4.artcom.pl. [94.246.132.235])
        by smtp.googlemail.com with ESMTPSA id i26-20020a0565123e1a00b00478e9b136f6sm1642227lfv.221.2022.06.06.10.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 10:15:15 -0700 (PDT)
Message-ID: <bd83567e-ebf5-0b31-074b-5f6dc7f7c147@gmail.com>
Date:   Mon, 6 Jun 2022 19:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>
From:   Piotr Chmura <chmooreck@gmail.com>
Subject: [PATCH] platform/x86: gigabyte-wmi: add Z690M AORUS ELITE AX DDR4
 support
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add dmi_system_id of Gigabyte Z690M AORUS ELITE AX DDR4 board. Tested on my PC.

Signed-off-by: Piotr Chmura <chmooreck@gmail.com>

---

--- linux/drivers/platform/x86/gigabyte-wmi.c	2022-05-22 21:52:31.000000000 +0200
+++ linux-wmi/drivers/platform/x86/gigabyte-wmi.c	2022-06-05 18:53:47.242238345 +0200
@@ -156,6 +156,7 @@
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z690M AORUS ELITE AX DDR4"),
 	{ }
 };
 
