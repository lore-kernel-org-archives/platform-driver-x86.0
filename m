Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67492C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 06:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E091227C3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 06:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgLGGoz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 01:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGGoz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 01:44:55 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C931C061A51
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Dec 2020 22:43:56 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q22so8804873pfk.12
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Dec 2020 22:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8MzWU26NA6WzGVu02R2++Pobfkc6wq7hjaCWSX9ojMc=;
        b=pcmgLXzy36HZaEATgxETcWogWAyO2mZ4FTMmpgTaX4L+oj4LW5Kb+zMnGBeHj4Cy5s
         nNyjB4FESSefsd+7agRvbSP7xOob/FNjzm4v0Uu+cQOeGULFb/+95ExGv8x5GzJyW5YD
         dBRZVhR0qSI9sryog4rURcCBXSsRFfcosaM2xT8SnQyExtvOEMgMj5PXq7k3d8oBxKc7
         DZBnw0sONT26YXMdlowx62kWDVjTG8HZytG8ZrH3+No3eHTJxtcrv8Hz9fALYkZDX90k
         ZmU9m3NsPMHAh7Cr4oWxlCzEMVzjltif1JS+948BtuGYJX76WPkVLkQ+oAYIfiFDZ7H9
         4M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8MzWU26NA6WzGVu02R2++Pobfkc6wq7hjaCWSX9ojMc=;
        b=j+nfw5NjJhs7tlOdcfJBrDy3jEIq8zxlBKeaV2lUMK0kIF3kJq3djoOw1/XBeHYmpK
         c17LoVjmCFN4ipye8dho6d6lGwEm+xePv1qSe8ouBmeLXJkO2J6lxuh49ucFfi/DUKo0
         rbRDUA+VcK812VDqi/WT/12gG+9iAstppn0nIKTFM9Vqvjsv/1TwYfYIUnDl9phwBZrk
         rOiof1G9Da9Yl+ezKqWGX3yQ205erMXmos+C2grMwdPalQk/vitNH9GLYJw6YdV+WVrp
         5rKZZcTNXo2Sqkt3ditlvPB2G5eg653l+3ijJwh4mXrMxq5n/6vQu/LOIGeVSTYN8Or0
         Bb6A==
X-Gm-Message-State: AOAM531/thBFR3+okTZxzR75VSPl8swwN0e8GGYLXDJD6KpNbfxpY8gq
        RGKsVd5aedE0VxlqBGYsP6JIyA==
X-Google-Smtp-Source: ABdhPJyL9fd9WGzslRmf14Luh5pVxh/d5EGWPI1fNAbgfIKcSBsaPibZqKtAc8hLEI0/0e1jd7ejNQ==
X-Received: by 2002:a62:1dd5:0:b029:19d:fc87:5f45 with SMTP id d204-20020a621dd50000b029019dfc875f45mr4817465pfd.63.1607323435367;
        Sun, 06 Dec 2020 22:43:55 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.googlemail.com with ESMTPSA id js9sm22865087pjb.2.2020.12.06.22.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 22:43:54 -0800 (PST)
From:   Chris Chiu <chiu@endlessos.org>
To:     dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessos.org, Daniel Drake <drake@endlessos.org>,
        Chris Chiu <chiu@endlessos.org>
Subject: [PATCH] acer-wireless: send an EV_SYN/SYN_REPORT between state changes
Date:   Mon,  7 Dec 2020 14:43:22 +0800
Message-Id: <20201207064322.13992-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Daniel Drake <drake@endlessos.org>

Sending the switch state change twice within the same frame is invalid
evdev protocol and only works if the client handles keys immediately as
well. Processing events immediately is incorrect, it forces a fake
order of events that does not exist on the device.

Recent versions of libinput changed to only process the device state and
SYN_REPORT time, so now the key event is lost.

Same fix as 'commit <bff5bf9db1c94> ("platform/x86: asus-wireless: send
an EV_SYN/SYN_REPORT between state changes")'

Signed-off-by: Daniel Drake <drake@endlessos.org>
Signed-off-by: Chris Chiu <chiu@endlessos.org>
---
 drivers/platform/x86/acer-wireless.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acer-wireless.c b/drivers/platform/x86/acer-wireless.c
index e0976180532a..1b5d935d085a 100644
--- a/drivers/platform/x86/acer-wireless.c
+++ b/drivers/platform/x86/acer-wireless.c
@@ -28,6 +28,7 @@ static void acer_wireless_notify(struct acpi_device *adev, u32 event)
 		return;
 	}
 	input_report_key(idev, KEY_RFKILL, 1);
+	input_sync(idev);
 	input_report_key(idev, KEY_RFKILL, 0);
 	input_sync(idev);
 }
-- 
2.20.1

