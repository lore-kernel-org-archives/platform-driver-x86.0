Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B20EED7;
	Mon, 27 Jan 2025 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738011742; cv=none; b=gbmVwGCqr8mhpmggYrLGmKql3fI3ZDl74N14b69xAlsKCK92uU5f3R9Pk5B5K/D3asq5Uyzd0ZeX3hXoCCn5fWboLRadp7vmunaOrHDMHBZRTl4SNAfKp4lUEONM9QrJ82uX9XR3eaIpLQ4FGcY+gkjrA1gndOoO4adddhRsRE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738011742; c=relaxed/simple;
	bh=hXM8l2VHSRTi9xYkeWs/kSyOQ7F8kv10d/EMYUFX2dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UeYWkp+RQgHA95LIXkPc8kXB8t3y5w49K4Ub/ERsU/akAOg97sRkJo2varZXg+ZOVOc2NiRV+LTUl1PnSizj6at8CkeeeeLNwnEJaukSGKq+Br/TO8OPUPo27wuN2Ot1CpKGqiftONzvnhBOHOp7F+FDyuB4USkFfonXCb7K/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=nTivAsaK; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="nTivAsaK"
Received: from fedora.intra.ispras.ru (unknown [10.10.165.8])
	by mail.ispras.ru (Postfix) with ESMTPSA id BD8FF40737BC;
	Mon, 27 Jan 2025 21:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BD8FF40737BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1738011735;
	bh=o5wfFRTfB5nV7Kkjb7RpX4/eKAt2bf1s6LU8AcVyL1I=;
	h=From:To:Cc:Subject:Date:From;
	b=nTivAsaKnlA0cf9C/laD7bLFb1JC6IxfpH7m29zbUJn+zeFk7oBb8m6tYddyDgmpp
	 QOhVGwjYLTlTEXCca9/5jGhJJP/BJ1gnv4X6bQ5zstGjJ3UUonB3vKXUhRNRtGYcF/
	 SI8tht+OgppebUyjtTETirPSbEtvb8SK+JKbvYQI=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Ike Panhc <ike.pan@canonical.com>,
	Hans de Goede <hdegoede@redhat.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] platform/x86: ideapad-laptop: pass a correct pointer to the driver data
Date: Tue, 28 Jan 2025 00:02:01 +0300
Message-ID: <20250127210202.568691-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_platform_profile_register() expects a pointer to the private driver
data but instead an address of the pointer variable is passed due to a
typo. This leads to the crashes later:

BUG: unable to handle page fault for address: 00000000fe0d0044
PGD 0 P4D 0
Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
CPU: 6 UID: 0 PID: 1284 Comm: tuned Tainted: G        W          6.13.0+ #7
Tainted: [W]=WARN
Hardware name: LENOVO 21D0/LNVNB161216, BIOS J6CN45WW 03/17/2023
RIP: 0010:__mutex_lock.constprop.0+0x6bf/0x7f0
Call Trace:
 <TASK>
 dytc_profile_set+0x4a/0x140 [ideapad_laptop]
 _store_and_notify+0x13/0x40 [platform_profile]
 class_for_each_device+0x145/0x180
 platform_profile_store+0xc0/0x130 [platform_profile]
 kernfs_fop_write_iter+0x13e/0x1f0
 vfs_write+0x290/0x450
 ksys_write+0x6c/0xe0
 do_syscall_64+0x82/0x160
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Found by Linux Verification Center (linuxtesting.org).

Fixes: 249c576f0f9d ("ACPI: platform_profile: Let drivers set drvdata to the class device")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/platform/x86/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index dfb5d4b8c046..30bd366d7b58 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1121,7 +1121,7 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 
 	/* Create platform_profile structure and register */
 	priv->dytc->ppdev = devm_platform_profile_register(&priv->platform_device->dev,
-							   "ideapad-laptop", &priv->dytc,
+							   "ideapad-laptop", priv->dytc,
 							   &dytc_profile_ops);
 	if (IS_ERR(priv->dytc->ppdev)) {
 		err = PTR_ERR(priv->dytc->ppdev);
-- 
2.48.1

