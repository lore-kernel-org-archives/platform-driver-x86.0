Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A92AC64E7B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Dec 2020 13:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1E142086A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Dec 2020 13:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDg5ai06"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403831AbgLAN7L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Dec 2020 08:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403830AbgLAN7K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Dec 2020 08:59:10 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC047C0613CF
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Dec 2020 05:58:30 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id d17so4261530ejy.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Dec 2020 05:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n14zHrrTpanpWcE+twGgzzf6OrTF59KWONboXS0r3tI=;
        b=TDg5ai06qF231PrxSiM4G0LaxBBpGB0dRxreyjDGA28oKB7/IdHrB1C0Gzg40RFtaR
         AeAerZ+1pbwKjtJbCUF07R3YLLMOZ/Vi8OKayGGmW48HomHiJK8qx0zPaMgRDzqk85W5
         rdk5qFm3qDXHG4ZjwrCd7sNS0qD2gaxE0Af4dt3oe3wXbZXmsxcESuIouvdlugkeNh8B
         a6JAfsaA4blvXBtwq//Z3VkIacfgQC7TmFqWoff1C59nsXou4pOu2dvl9rgPnn8Z6Nzk
         8bwDSm5L+iH7dMJwVnTtjkVgl9WqzlYCAuB1goyA6Uvm3jbc33+Gx7a0WmXMC2nFx98i
         Tt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=n14zHrrTpanpWcE+twGgzzf6OrTF59KWONboXS0r3tI=;
        b=H6TgOrhZ3MOsiH+Fr9/rdiDXy7GVV9AAj1jJDWYu1Aa80JepXGfGDpOpIQj7d+AWBI
         glKlbXm0kIOp8D1oOgRfsjxkbooakaVA4EBwpUneaWIGYcJY6ukQbjo9sZuUtDz4vG8z
         VWwNzDRuR1vd6xYEP4qALAcKKCyoNl+fyC1Vfm95j+v7lNte3mE725wEW2254Spu1EsX
         GCIhIUY2CBp3s2MmAmPPX+vEgSuxzrw5t4ULFuz2zK+R8fr+TL/Xsa7Hiudvs3aSpWGl
         1on8D46wc7d7zQhhY+sBy8SzOpAIvaHTgc4m9rixS3MPeErEDCzxXOM31ITLi5hJ5GKC
         gBtQ==
X-Gm-Message-State: AOAM532T/2wZUTvxv50VEsxmzSXK7aRO1PlUqft6aFUxkoS1XCLsF6r7
        6aLKPmYV69gFZflKsHQCGAn7F1WnQJc=
X-Google-Smtp-Source: ABdhPJwzJp8JlfWOmPH1eWCYfQ+0mtj/9KxMDERObrcXTuRuu8RqkOjGceICTECWbS+Odfd2vUFPTw==
X-Received: by 2002:a17:906:6b82:: with SMTP id l2mr3069482ejr.241.1606831109096;
        Tue, 01 Dec 2020 05:58:29 -0800 (PST)
Received: from irma.. (2001-1c00-240a-3800-6f8a-1836-05fa-d917.cable.dynamic.v6.ziggo.nl. [2001:1c00:240a:3800:6f8a:1836:5fa:d917])
        by smtp.gmail.com with ESMTPSA id w3sm881759edt.84.2020.12.01.05.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:58:28 -0800 (PST)
Sender: Carlos Garnacho <mrgarnacho@gmail.com>
From:   Carlos Garnacho <carlosg@gnome.org>
To:     platform-driver-x86@vger.kernel.org
Cc:     Carlos Garnacho <carlosg@gnome.org>, hdegoede@redhat.com
Subject: [PATCH] platform/x86: intel-vbtn: Allow switch events on Acer Switch Alpha 12
Date:   Tue,  1 Dec 2020 14:57:27 +0100
Message-Id: <20201201135727.212917-1-carlosg@gnome.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This 2-in-1 model (Product name: Switch SA5-271) features a SW_TABLET_MODE
that works as it would be expected, both when detaching the keyboard and
when folding it behind the tablet body.

It used to work until the introduction of the allow list at commit
8169bd3e6e193 ("platform/x86: intel-vbtn: Switch to an allow-list for
SW_TABLET_MODE reporting"). Add this model to it, so the Virtual Buttons
device announces the EV_SW features again.

Signed-off-by: Carlos Garnacho <carlosg@gnome.org>
---
 drivers/platform/x86/intel-vbtn.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index f5901b0b07cd..d8114983498b 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -206,6 +206,12 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Stream x360 Convertible PC 11"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Switch SA5-271"),
+		},
+	},
 	{} /* Array terminator */
 };
 
-- 
2.29.2

