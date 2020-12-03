Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46579C83022
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 13:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15CE9208D2
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 13:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436823AbgLCNbB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Dec 2020 08:31:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:47984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436813AbgLCNa7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Dec 2020 08:30:59 -0500
From:   Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Timo Witte <timo.witte@gmail.com>, "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 19/23] platform/x86: acer-wmi: add automatic keyboard background light toggle key as KEY_LIGHTS_TOGGLE
Date:   Thu,  3 Dec 2020 08:29:31 -0500
Message-Id: <20201203132935.931362-19-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203132935.931362-1-sashal@kernel.org>
References: <20201203132935.931362-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Timo Witte <timo.witte@gmail.com>

[ Upstream commit 9e7a005ad56aa7d6ea5830c5ffcc60bf35de380b ]

Got a dmesg message on my AMD Renoir based Acer laptop:
"acer_wmi: Unknown key number - 0x84" when toggling keyboard
background light

Signed-off-by: Timo Witte <timo.witte@gmail.com>
Reviewed-by: "Lee, Chun-Yi" <jlee@suse.com>
Link: https://lore.kernel.org/r/20200804001423.36778-1-timo.witte@gmail.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/acer-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 60c18f21588dd..7fa27e7536917 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -111,6 +111,7 @@ static const struct key_entry acer_wmi_keymap[] __initconst = {
 	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
 	{KE_IGNORE, 0x81, {KEY_SLEEP} },
 	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad Toggle */
+	{KE_IGNORE, 0x84, {KEY_KBDILLUMTOGGLE} }, /* Automatic Keyboard background light toggle */
 	{KE_KEY, KEY_TOUCHPAD_ON, {KEY_TOUCHPAD_ON} },
 	{KE_KEY, KEY_TOUCHPAD_OFF, {KEY_TOUCHPAD_OFF} },
 	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
-- 
2.27.0

