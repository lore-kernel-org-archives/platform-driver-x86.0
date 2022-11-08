Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AC2C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Nov 2022 07:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiKHH0q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Nov 2022 02:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiKHH0p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 02:26:45 -0500
X-Greylist: delayed 332 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Nov 2022 23:26:43 PST
Received: from juno.mpi-klsb.mpg.de (juno.mpi-klsb.mpg.de [139.19.86.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF252BB30
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 23:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mpi-sws.org
        ; s=mail201904; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:sender:reply-to:content-id:
        content-description:resent-date:resent-from:resent-sender:resent-to:resent-cc
        :resent-message-id:in-reply-to:references:list-id:list-help:list-unsubscribe:
        list-subscribe:list-post:list-owner:list-archive;
        bh=FFPYA/ZO2QdgeKxgxdRf///4XmUhuIy/OCYjnNvaGrI=; b=AxZt5ChxufDVaFJ8HX7Aezbn9Z
        VzCVAQud96iGhovmniGkTQccDxDKQf6o3w9hT4lE3i+uN20smqk9kqBjmlUqRM+jl3P+2jy1mityo
        nwZTdWyONG6lHk5QEd84n4GrO1+vfX3NhtRJIDxh9hbUp3gNyUNYlOMSZ4Vv9cNMknxY=;
Received: from max.mpi-klsb.mpg.de ([139.19.86.27]:52464)
        by juno.mpi-klsb.mpg.de (envelope-from <gaeher@mpi-sws.org>) 
        with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92) id 1osIun-0002Gi-FZ; Tue, 08 Nov 2022 08:21:03 +0100
Received: from ip5f5ace35.dynamic.kabel-deutschland.de ([95.90.206.53]:30832 helo=archangel..)
        by max.mpi-klsb.mpg.de (envelope-from <gaeher@mpi-sws.org>) 
        with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2) id 1osIum-007LOq-VT; Tue, 08 Nov 2022 08:20:57 +0100
From:   =?UTF-8?q?Lennard=20G=C3=A4her?= <gaeher@mpi-sws.org>
Cc:     hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Lennard=20G=C3=A4her?= <gaeher@mpi-sws.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] x86/thinkpad_acpi: Enable s2idle quirk for 21A1 machine type
Date:   Tue,  8 Nov 2022 08:20:23 +0100
Message-Id: <20221108072023.17069-1-gaeher@mpi-sws.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-RSPAMD-Score: 0.9 (/)
X-RSPAMD-Report: Action: no action
 Symbol: RCVD_VIA_SMTP_AUTH(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: R_SPF_NEUTRAL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: DMARC_NA(0.00)
 Symbol: RCPT_COUNT_FIVE(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: FROM_EQ_ENVFROM(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: RCVD_TLS_ALL(0.00)
 Symbol: RECEIVED_SPAMHAUS_PBL(0.00)
 Message-ID: 20221108072023.17069-1-gaeher@mpi-sws.org
X-RSPAMD-Bar: /
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, the s2idle quirk was only active for the 21A0 machine type
of the P14s Gen2a product. This also enables it for the second 21A1 type,
thus reducing wake-up times from s2idle.

Signed-off-by: Lennard Gäher <gaeher@mpi-sws.org>
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 20e5c043a8e8..8476dfef4e62 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4497,6 +4497,14 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21A0"),
 		}
 	},
+	{
+		.ident = "P14s Gen2 AMD",
+		.driver_data = &quirk_s2idle_bug,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21A1"),
+		}
+	},
 	{}
 };
 
-- 
2.38.1

