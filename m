Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393A1C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 15:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 059E660F58
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 15:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhHQPri (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Aug 2021 11:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbhHQPrh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Aug 2021 11:47:37 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E8EC061764;
        Tue, 17 Aug 2021 08:46:54 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1629215211;
        bh=5oJmrU3bQ/80jwLl91wrKNmiGvuNDgFqVb88Chy/67c=;
        h=From:To:Cc:Subject:Date:From;
        b=a+KvXlXMimjaXgLoVmwPfrkI+/YopKdutIk5BaLUUetdbyxTSRoTEPADVSgcAKmyH
         qVRFzsn9uxE0KvDXHMeNGka0ffhQAfWNyw/FSfPhIkVVdxOOf0E4OnvrB0dHKwherC
         I6FCRkes20WhgYr3gQ6K6y5dEMKoJJAIQvkxToAM=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: gigabyte-wmi: add support for X570 GAMING X
Date:   Tue, 17 Aug 2021 17:46:28 +0200
Message-Id: <20210817154628.84992-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reported as working here:
https://github.com/t-8ch/linux-gigabyte-wmi-driver/issues/1#issuecomment-900263115

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 5529d7b0abea..d65aa43e6f72 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -146,6 +146,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),
 	{ }

base-commit: 009c9aa5be652675a06d5211e1640e02bbb1c33d
-- 
2.33.0

