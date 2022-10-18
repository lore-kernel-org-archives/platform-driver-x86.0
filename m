Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAFFC43217
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 06:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiJRGXU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 02:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiJRGXT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 02:23:19 -0400
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E559AFFA;
        Mon, 17 Oct 2022 23:23:08 -0700 (PDT)
X-QQ-mid: bizesmtp80t1666073706t6ngp5r2
Received: from localhost.localdomain ( [58.240.82.166])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 18 Oct 2022 14:15:01 +0800 (CST)
X-QQ-SSF: 01400000000000B0L000000A0000000
X-QQ-FEAT: RrZlkntZBfkO1zuyo6mQi/AMMkM1s35cFr2TFrzSvY2FV1QmOzOfeDuYz27oJ
        Q1Jkdev5h9or4exEYxbYSDVrqd6y3smAEbUyu7eiZb9tSpWBtu7y1cZW8Nn3yiRWH8cGINu
        3ZoNLC2cSgek7HJ1Xc9kAtJe9BstGxsLNpM2NEHEUnLrHL3Copk4C80ymw23QVOaA/p6Pij
        /2pzQF5pxAewMAUIGpnFlJDmcPgnBXqYmPzKE3CuJA7JH8odfw6ZNd7uG4pjlXvWbnFS4ZS
        OWjwLlcz80bItVobIk5+1XPrIJTYvYO11VfUnNy2FkBQSXWvuLrd69PZzVcB0Qc3d7YKzvs
        xYlNHlQ4scoFTmB3J4keTNYk7hTFf+heS8MCAwlwfM9fKXH8Ria3y0nfb8a19kpt0CQngEY
X-QQ-GoodBg: 1
From:   Manyi Li <limanyi@uniontech.com>
To:     ike.pan@canonical.com, hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manyi Li <limanyi@uniontech.com>
Subject: [PATCH] platform/x86: ideapad-laptop: Disable touchpad_switch
Date:   Tue, 18 Oct 2022 14:14:57 +0800
Message-Id: <20221018061457.26937-1-limanyi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Ideapads for "Lenovo Yoga 3 Pro 1370" and "ZhaoYang K4e-IML" do not
use EC to switch touchpad.

Reading VPCCMD_R_TOUCHPAD will return zero thus touchpad may be blocked
unexpectedly.

Signed-off-by: Manyi Li <limanyi@uniontech.com>
---
 drivers/platform/x86/ideapad-laptop.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index abd0c81d62c4..20b8a94934b4 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1533,6 +1533,24 @@ static const struct dmi_system_id hw_rfkill_list[] = {
 	{}
 };
 
+static const struct dmi_system_id no_touchpad_switch_list[] = {
+	{
+	.ident = "Lenovo Yoga 3 Pro 1370",
+	.matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3"),
+		},
+	},
+	{
+	.ident = "ZhaoYang K4e-IML",
+	.matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		DMI_MATCH(DMI_PRODUCT_VERSION, "ZhaoYang K4e-IML"),
+		},
+	},
+	{}
+};
+
 static void ideapad_check_features(struct ideapad_private *priv)
 {
 	acpi_handle handle = priv->adev->handle;
@@ -1542,6 +1560,7 @@ static void ideapad_check_features(struct ideapad_private *priv)
 
 	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
 	priv->features.touchpad_ctrl_via_ec = !acpi_dev_present("ELAN0634", NULL, -1);
+	priv->features.touchpad_ctrl_via_ec = !dmi_check_system(no_touchpad_switch_list);
 
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode = true;
-- 
2.20.1

