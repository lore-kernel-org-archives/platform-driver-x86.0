Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33219F11B
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777608313; cv=none; b=W+a2eB3orHOU+19XB99AXNnjsPm6iGSvopuHOpTsDFIzzBnxsv2rmeCOtjKq9ffSHufgzjOOc9+QXWG34oewzLh4YM4/1XOkFTrKSmi1v/zYmT1fAXpF/Op8fe8XdP/EmS4jAPE3WFDLzSYEbNIyNelfuamn+yp/r8sbpwfswRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777608313; c=relaxed/simple;
	bh=x8asYKlDkKAxWg2QNUkptK3yCeWzgXt6KCoFkomrGm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt4E13EtOH49oAOyEVbV4nprnOhfPYHxbpwXTocOFxvjeHl+5YSVIEWKC/80NCW3PSfsmowgdEo/fkTOxtLciEmqHLL5bOii2WFfmu4ZOOizLuVJLhOkd4+UZFgcK9tsmLd3BO5obJrKyKevoBncJjYNDK59pLWZF7icKINGBYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=c2Tm0rKo; arc=none smtp.client-ip=45.157.188.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="c2Tm0rKo"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g6Ggd3n4fzGMd
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 05:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1777606045;
	bh=NklM/KwBTPxhvyBRaWDKiyTyqId3OEze7ro/DoA32tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2Tm0rKozZONRrubxfZCGwUs27JS2e90/driORAqotFGu7nmMT9KzL11/g3l/8QzP
	 Jp2ODbbNUKU7F1Qngmigb/RuQkwPaWHKEvDHXk1wwC4LqCdDE6X9IK+FZQIiv/dAqN
	 Dx9oIp3xrckg4kYOnB/PX0lvYYVm2IvmIHtsYj7aR1kpU7y9D7jYDGCBML/o2wnDrE
	 FBXWzE7PuKsU6hnKIJhJc03IACGHG8IzNfeF7hvZ3TadznfHHBx6zEPfVPVj8NpdbE
	 2RfFU6sisGImLm+b55yBQV92haGeeTfasniTN515TovMNGeKOrjImeZ7g+sEfquJnH
	 LJfBdkojmDC0g==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4g6Ggd0ytNzf3B
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 05:27:25 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Fri, 01 May 2026 05:27:24 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH 2/2] platform/x86/amd/pmc: Add delay_suspend module argument
Date: Fri,  1 May 2026 05:26:55 +0200
Message-ID: <20260501032655.283789-3-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260501032655.283789-1-daniel@gibson.sh>
References: <20260501032655.283789-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Enabling it delays suspend for 2.5 seconds which is known to help for
some AMD-based Lenovo Laptops that otherwise failed to send/receive
events for key presses or the lid switch after s2idle.
Apparently the EC needs to do some things in the background before
suspend or it gets into a bad state.

There are many reports of AMD-based laptops (mostly but not exclusively
IdeaPads) about similar issues on the web; this parameter gives
affected users an easy way to try out if their issues have the same
root cause and to work around them until their specific device is added
to the quirks list.
I added a note to the parameter description encouraging users to report
their device so it can be added to the quirks list, inspired by a
similar request in parameter descriptions of the ideapad-laptop module.

The module parameter can be set to "1" to explicitly enable it,
"0" to disable it even on devices that are assumed to be affected,
or -1 (the default) to enable it if the device is assumed to be affected
(according to fwbug_list[])

This is related to https://bugzilla.kernel.org/show_bug.cgi?id=221383

Signed-off-by: Daniel Gibson <daniel@gibson.sh>
Tested-by: Daniel Gibson <daniel@gibson.sh>
---
 drivers/platform/x86/amd/pmc/pmc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c604dc7207ed..f76936036d1f 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -89,6 +89,11 @@ static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 
+static int delay_suspend = -1;
+module_param(delay_suspend, int, 0644);
+MODULE_PARM_DESC(delay_suspend,
+		 "Delays s2idle by 2.5 seconds to work around buggy ECs, often causing keyboard issues after suspend. 0: don't delay, 1: do delay, -1 (default): let amd_pmc decide. If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
 static struct amd_pmc_dev pmc;
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
@@ -634,11 +639,19 @@ static void amd_pmc_s2idle_check(void)
 	struct amd_pmc_dev *pdev = &pmc;
 	struct smu_metrics table;
 	int rc;
-	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
+	bool ec_needs_sleep;
+
+	if (delay_suspend < 0)
+		ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
+	else
+		ec_needs_sleep = delay_suspend != 0;
 
 	/* Avoid triggering OVP */
 	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
-		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
+		if (delay_suspend > 0)
+			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1\n");
+		else
+			dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
 		msleep(2500);
 	}
 
-- 
2.48.1

