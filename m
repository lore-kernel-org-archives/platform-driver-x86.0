Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49BAC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Mar 2021 19:59:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96F3464E83
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Mar 2021 19:59:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbhCOT7W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Mar 2021 15:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhCOT6x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Mar 2021 15:58:53 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B92AC06174A
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Mar 2021 12:58:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b16so6039566eds.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Mar 2021 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zMS8GP4zvS5IZU7noAHHzSqaJH8crU+89WIIdCzVOXg=;
        b=UyCfj6ET/t1X8GE4H+RcNb9OQWPn+A6ZhRwJvOPK/QhQkdAaSnVA7/kg3dqkvg5cIU
         t74xFhSHA3komeSazIC5LskvFrymQRb9JEP3b4yWBZfbE53wq5W/1+AzcehzQWazKXqY
         WSnH0QyMfy/VjzNhWn0VQMFy8weZ/b6WEVA4Bqzu6vLWn/2WKO6Li4s95C669kKA54OE
         KXIKt7lwyl8IFEVAgQaHGNxpAll8KEmPV2jqFoIP+nZUZwwLJ5/WCiQyp1b5qG/86Z66
         GT4m1FDoV6M/J18qtargYr4MTOFcRd2PWWuMZgnuEpwFUo0XKFWmt52Pa2PPk2MuUDlk
         F35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zMS8GP4zvS5IZU7noAHHzSqaJH8crU+89WIIdCzVOXg=;
        b=GCsid+bzW43SBMxH2YL8kxTD3WQDxIY7zTw4yE6oHYUQWMoGpyYnSX3gyX50nNrabN
         tvFK4pbxszyGHjT6s5KMHTZOUip+E3UTg9NBs2MFa2XkxPiGEIB+AbgkbM2EaYayPmPz
         /DhRkiH71Fl74KlNvUf3sdGkBBhap2wHF4xztuK47sCNABA9lUaf2kEMV/PseonA2yfz
         EUpkdTnuGMsVamhiAEKfI2PdQDtjzAA5/dlkw02SMC8M4Hq6iUEmiZ8YXxu5PKN3g6O8
         j05q/hjs6x/79MG49HVpfWwfvJTwaTn/Lc2wQLhFq0fm/78WbJf+rSmvpYF3QakS+btF
         eIFw==
X-Gm-Message-State: AOAM532sqOCLiGXURaTuQUDlFMB7ZBcEDxbiqbkPxdWYVOGW/K8V+6I8
        LzmDxhMyRbnoqKwgJjCOROw=
X-Google-Smtp-Source: ABdhPJyPs8WjZol5rYF091YlaO25wpX8JHOvSX0sRdRj6Yfq0Dy1wpfI1fmDoytCKcUEKljN20xbbg==
X-Received: by 2002:aa7:d841:: with SMTP id f1mr31498429eds.286.1615838331259;
        Mon, 15 Mar 2021 12:58:51 -0700 (PDT)
Received: from PocketRocket.arnhem.chello.nl (j237254.upc-j.chello.nl. [24.132.237.254])
        by smtp.gmail.com with ESMTPSA id t17sm8958066edr.36.2021.03.15.12.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 12:58:50 -0700 (PDT)
From:   Esteve Varela Colominas <esteve.varela@gmail.com>
To:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Esteve Varela Colominas <esteve.varela@gmail.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] Allow the FnLock LED to change state
Date:   Mon, 15 Mar 2021 20:58:24 +0100
Message-Id: <20210315195823.23212-1-esteve.varela@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On many recent ThinkPad laptops, there's a new LED next to the ESC key,
that indicates the FnLock status.
When the Fn+ESC combo is pressed, FnLock is toggled, which causes the
Media Key functionality to change, making it so that the media keys
either perform their media key function, or function as an F-key by
default. The Fn key can be used the access the alternate function at any
time.

With the current linux kernel, the LED doens't change state if you press
the Fn+ESC key combo. However, the media key functionality *does*
change. This is annoying, since the LED will stay on if it was on during
bootup, and it makes it hard to keep track what the current state of the
FnLock is.

This patch calls an ACPI function, that gets the current media key
state, when the Fn+ESC key combo is pressed. Through testing it was
discovered that this function causes the LED to update correctly to
reflect the current state when this function is called.

The relevant ACPI calls are the following:
\_SB_.PCI0.LPC0.EC0_.HKEY.GMKS: Get media key state, returns 0x603 if the FnLock mode is enabled, and 0x602 if it's disabled.
\_SB_.PCI0.LPC0.EC0_.HKEY.SMKS: Set media key state, sending a 1 will enable FnLock mode, and a 0 will disable it.

Relevant discussion:
https://bugzilla.kernel.org/show_bug.cgi?id=207841
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1881015

Signed-off-by: Esteve Varela Colominas <esteve.varela@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c40470637..09362dd74 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4079,13 +4079,19 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	case TP_HKEY_EV_KEY_NUMLOCK:
 	case TP_HKEY_EV_KEY_FN:
-	case TP_HKEY_EV_KEY_FN_ESC:
 		/* key press events, we just ignore them as long as the EC
 		 * is still reporting them in the normal keyboard stream */
 		*send_acpi_ev = false;
 		*ignore_acpi_ev = true;
 		return true;
 
+	case TP_HKEY_EV_KEY_FN_ESC:
+		/* Get the media key status to foce the status LED to update */
+		acpi_evalf(hkey_handle, NULL, "GMKS", "v");
+		*send_acpi_ev = false;
+		*ignore_acpi_ev = true;
+		return true;
+
 	case TP_HKEY_EV_TABLET_CHANGED:
 		tpacpi_input_send_tabletsw();
 		hotkey_tablet_mode_notify_change();
-- 
2.26.2

