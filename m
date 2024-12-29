Received: from vps-ovh.mhejs.net (vps-ovh.mhejs.net [145.239.82.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA020EEDE;
	Sun, 29 Dec 2024 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.82.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735490645; cv=none; b=jNFvdKBGzeSdu17GM3A1qAHJz9KKyFt+1Hd3tvVwdJGnFYzq5EgYCYeadFEcZ2Bgf5lXBodpZKA6jkk5+R/77u6Uaf8NiVyBlMr32T8pVeEc5/qHtsWl7w87G3O9Bem15t57gDTV2KkYRTpQvOiRzi+rMYD4nw/QIgHTAnXCEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735490645; c=relaxed/simple;
	bh=cl6bjGKlMzk1s9N5296xv2ipL9XkTN8ykT6jIUqz8WY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SVa5Itiv1SZMRSwfe+zUMJ+qecXfHCMaK5bqQmP2Cka4I3lxKMBuV3d1OF7FA+HGDXrFngnGowa2bloHQpco4LvO7l7FOc24jn/gsHytl/+0V7s+3YC5Tgnp/hsnyNvvKrCfDbdd5KA9FDOrboCDR5eVqn5put0mA/hyqjecR5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name; spf=pass smtp.mailfrom=vps-ovh.mhejs.net; arc=none smtp.client-ip=145.239.82.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vps-ovh.mhejs.net
Received: from MUA
	by vps-ovh.mhejs.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <mhej@vps-ovh.mhejs.net>)
	id 1tRwOR-00000004nmt-3ig8;
	Sun, 29 Dec 2024 17:43:55 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmc: Only disable IRQ1 wakeup where i8042 actually enabled it
Date: Sun, 29 Dec 2024 17:43:50 +0100
Message-ID: <d5ed5ffc88fed17e1b1eb988c942e44fb540a68b.1735490591.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: mhej@vps-ovh.mhejs.net

Wakeup for IRQ1 should be disabled only in cases where i8042 had actually
enabled it, otherwise "wake_depth" for this IRQ will try do drop below zero
and there will be an unpleasant WARN() logged:
kernel: atkbd serio0: Disabling IRQ1 wakeup source to avoid platform firmware bug
kernel: ------------[ cut here ]------------
kernel: Unbalanced IRQ 1 wake disable
kernel: WARNING: CPU: 10 PID: 6431 at kernel/irq/manage.c:920 irq_set_irq_wake+0x147/0x1a0

To fix this call the PMC suspend handler only from the same set of
dev_pm_ops handlers as i8042_pm_suspend() is called, which currently means
just the ".suspend" handler.
Previously, the code would use DEFINE_SIMPLE_DEV_PM_OPS() to define its
dev_pm_ops, which also called this handler on ".freeze" and ".poweroff".

To reproduce this issue try hibernating (S4) the machine after a fresh boot
without putting it into s2idle first.

Fixes: 8e60615e8932 ("platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN")
Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/platform/x86/amd/pmc/pmc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 26b878ee5191..a254debb9256 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -947,6 +947,10 @@ static int amd_pmc_suspend_handler(struct device *dev)
 {
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
 
+	/*
+	 * Must be called only from the same set of dev_pm_ops handlers
+	 * as i8042_pm_suspend() is called: currently just from .suspend.
+	 */
 	if (pdev->disable_8042_wakeup && !disable_workarounds) {
 		int rc = amd_pmc_wa_irq1(pdev);
 
@@ -959,7 +963,9 @@ static int amd_pmc_suspend_handler(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmc_pm, amd_pmc_suspend_handler, NULL);
+static const struct dev_pm_ops amd_pmc_pm = {
+	.suspend = amd_pmc_suspend_handler,
+};
 
 static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
