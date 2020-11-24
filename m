Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_12_24,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A06C64E8A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 13:23:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CA06204EC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 13:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=maxverevkin.tk header.i=@maxverevkin.tk header.b="Qkk1n5R+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389017AbgKWNX0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Nov 2020 08:23:26 -0500
Received: from in-mybox ([77.221.147.26]:59638 "EHLO mail.maxverevkin.tk"
        rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1730646AbgKWNXZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Nov 2020 08:23:25 -0500
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Nov 2020 08:23:23 EST
Received: from localhost.localdomain (93-142-28.internethome.cytanet.com.cy [93.109.142.28])
        by mail.maxverevkin.tk (Postfix) with ESMTPSA id 19FF360FD9;
        Mon, 23 Nov 2020 16:18:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maxverevkin.tk;
        s=mail; t=1606137485;
        bh=iJMW+N6SGA/9loTgraFaj02i7KR+pNuG/X3h06ydbIU=;
        h=From:To:Cc:Subject:Date:From;
        b=Qkk1n5R+9p2+6BvZyvrP9T+qQ5R1eohPc1eZDfr2zbLi6RWJsg0AZRUNyhEEd0JWW
         4iFPxedeq2V5X6NIxehlvJ/0PVWYePZ645/aa1HIPv+2XHE6XLS6w7OP1BM98cMF2H
         ujrEDyh+2IACire9mOWD4ieIEC3a3VmqpXmZvCI8GDhu9nDAozCn2W0EH4oiY0chp6
         GcfgcKU9q6u+KuKamIfapHF1mHfKD1vDn8wbpiSSZ3MIQ6nDMWqSIuIIjnSqDTG9Eh
         PEWRWZ8q7FyuKbXtZRaypxNMHj7VcKbGk3lFqDztJhRprPKllQ5nwSnlVOofp0evUw
         YJaNw0R7M5+FA==
From:   Max Verevkin <me@maxverevkin.tk>
Cc:     Max Verevkin <me@maxverevkin.tk>,
        AceLan Kao <acelan.kao@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Support for tablet mode on HP Pavilion 13 x360 PC
Date:   Tue, 24 Nov 2020 15:16:52 +0200
Message-Id: <20201124131652.11165-1-me@maxverevkin.tk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Signed-off-by: Max Verevkin <me@maxverevkin.tk>
---
 drivers/platform/x86/intel-vbtn.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index f5901b0b07cd..0419c8001fe3 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -206,6 +206,12 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Stream x360 Convertible PC 11"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion 13 x360 PC"),
+		},
+	},
 	{} /* Array terminator */
 };
 
-- 
2.29.2

