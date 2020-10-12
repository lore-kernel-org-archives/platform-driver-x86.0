Return-Path: <SRS0=Q59L=DT=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D0AC433DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Oct 2020 19:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A39722073A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Oct 2020 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602529634;
	bh=LQiIUeJDNar8joC8HfhosT9RYOQFWtpnoIpewKKilew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ad2W0XhjMuDTIgsKhaHxRufOIStwhyaLMvyRq//k5uvUHMkXmjozMbqYUnc4SXXa/
	 iscM4Y8khATytKFCly8nVjiLSGU2soU8YT0SNi6Z4IRlrFyu+rVtvSudsujBLaEkIy
	 9AARfIeiq8vYx13leLASnab+06G3deGY1vMyc0io=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390304AbgJLTDl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:03:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390346AbgJLTDR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Oct 2020 15:03:17 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C14AC215A4;
        Mon, 12 Oct 2020 19:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602529396;
        bh=LQiIUeJDNar8joC8HfhosT9RYOQFWtpnoIpewKKilew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jiQJybJoWlMQMM3XDBM2R2xX1M5HYHIpuThRiBiQ9QMrWgXRrnTy2HXp5iFhwuh2/
         cA2Pzs5Pi8OKzbznwWLSr6DsFnPeJ9BJ3Ebe+g8NKbfswWNHOq5lKqpU+Bwit8xZhd
         IwUyE4GazHCbBwfx/Wek4srS/b+kggwcIomGfe0Y=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/15] platform/x86: asus-nb-wmi: Revert "Do not load on Asus T100TA and T200TA"
Date:   Mon, 12 Oct 2020 15:02:59 -0400
Message-Id: <20201012190313.3279397-2-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012190313.3279397-1-sashal@kernel.org>
References: <20201012190313.3279397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit aab9e7896ec98b2a6b4eeeed71cc666776bb8def ]

The WMI INIT method on for some reason turns on the camera LED on these
2-in-1s, without the WMI interface allowing further control over the LED.

To fix this commit b5f7311d3a2e ("platform/x86: asus-nb-wmi: Do not load
on Asus T100TA and T200TA") added a blacklist with these 2 models on it
since the WMI driver did not add any extra functionality to these models.

Recently I've been working on making more 2-in-1 models report their
tablet-mode (SW_TABLET_MODE) to userspace; and I've found that these 2
Asus models report this through WMI. This commit reverts the adding
of the blacklist, so that the Asus WMI driver can be used on these
models to report their tablet-mode.

Note, not calling INIT is also not an option, because then we will not
receive events when the tablet-mode changes. So the LED issue will need
to be fixed somewhere else entirely.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/asus-nb-wmi.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 59b78a181723b..fef739effa283 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -596,33 +596,9 @@ static struct asus_wmi_driver asus_nb_wmi_driver = {
 	.detect_quirks = asus_nb_wmi_quirks,
 };
 
-static const struct dmi_system_id asus_nb_wmi_blacklist[] __initconst = {
-	{
-		/*
-		 * asus-nb-wm adds no functionality. The T100TA has a detachable
-		 * USB kbd, so no hotkeys and it has no WMI rfkill; and loading
-		 * asus-nb-wm causes the camera LED to turn and _stay_ on.
-		 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
-		},
-	},
-	{
-		/* The Asus T200TA has the same issue as the T100TA */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T200TA"),
-		},
-	},
-	{} /* Terminating entry */
-};
 
 static int __init asus_nb_wmi_init(void)
 {
-	if (dmi_check_system(asus_nb_wmi_blacklist))
-		return -ENODEV;
-
 	return asus_wmi_register_driver(&asus_nb_wmi_driver);
 }
 
-- 
2.25.1

