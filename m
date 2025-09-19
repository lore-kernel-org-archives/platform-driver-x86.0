Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0E35942
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314900; cv=none; b=O3cL/W/A2Z8J+PoFeU6ik4CC0+liR5+wDpUCkpvl84OuxXENXweiw/kX77etTYwBNs18yca92wGIjE5OHDCgZr1/Hjq+eNjRCuAB+YdGAHBbgvG/YwpZrvUNM+O81kUNDEtkvRN0ckvC//yPtPX7DmsXUeFnKGnV4OspZr/6eQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314900; c=relaxed/simple;
	bh=9Irvw4teD82bqwPBesfXr5rGObif2epZBDJukB4vYZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFeaJ4iGEGuiqEBBxNBsC4iEk/Q6Z3hy4Dkfju0XBUnVfTWFjFJU5l3Pw+dA+DJ4I+0THtnoSQOm8eNeWA69mr0HrLfjJhQECDbOSPgx9RXtWIguBFmrTB7cfT27o0Unp/YSlHdLYpUdTIq8lQH8u6m1+B6qr5WLbxjU6ffeC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6mNeCa6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6mNeCa6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F8AC4CEF7;
	Fri, 19 Sep 2025 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314900;
	bh=9Irvw4teD82bqwPBesfXr5rGObif2epZBDJukB4vYZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B6mNeCa6NM1rSjIU4aTvah3NSbH6KmiUT5GRtbqT04i7a5v7ddBa2zRM+Zrx2hogP
	 ro7H7xs289NnT+DTkeH1TwnpoSlvDdK8BbI8oTTS411SIFh7/GFTF4U5OKALosS7Nz
	 efS1RkEkgbSDhIQF32ITNXKUvg4CAtKoLxL0D1h5+41eXdI4zHyBdyQsusgnwNDDXw
	 LR7Dm5x/pHeA7w7gkxvzaAu+0pHRSTwNMotjt6ifDilL79ONNqWpI7NseRS/H18RU1
	 e9tiXP/sGi4aQUVf2OyjDVSYXyHKzhmUxaWBb3kM66Od7GdIpsx95LdVuf4zlb0jBG
	 Ec0Qx8eDDEvcw==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 19/19] platform/x86: x86-android-tablets: Stop using EPROBE_DEFER
Date: Fri, 19 Sep 2025 22:47:42 +0200
Message-ID: <20250919204742.25581-20-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919204742.25581-1-hansg@kernel.org>
References: <20250919204742.25581-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the x86-android-tablets code uses platform_create_bundle() it cannot
use EPROBE_DEFER and the driver-core will translate EPROBE_DEFER to ENXIO.

Stop using EPROBE_DEFER instead log an error and return ENODEV, or for non
fatal cases log a warning and return 0.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/core.c  | 6 ++++--
 drivers/platform/x86/x86-android-tablets/other.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 15d216be0bed..2fa66df8b605 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -276,8 +276,10 @@ get_serdev_controller_by_pci_parent(const struct x86_serdev_info *info)
 	struct pci_dev *pdev;
 
 	pdev = pci_get_domain_bus_and_slot(0, 0, info->ctrl.pci.devfn);
-	if (!pdev)
-		return ERR_PTR(-EPROBE_DEFER);
+	if (!pdev) {
+		pr_err("error could not get PCI serdev at devfn 0x%02x\n", info->ctrl.pci.devfn);
+		return ERR_PTR(-ENODEV);
+	}
 
 	/* This puts our reference on pdev and returns a ref on the ctrl */
 	return get_serdev_controller_from_parent(&pdev->dev, 0, info->ctrl_devname);
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index ea7a01d7ccb4..7532af2d72d1 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -711,8 +711,10 @@ static int __init vexia_edu_atla10_9v_init(struct device *dev)
 
 	/* Reprobe the SDIO controller to enumerate the now enabled Wifi module */
 	pdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0x11, 0));
-	if (!pdev)
-		return -EPROBE_DEFER;
+	if (!pdev) {
+		pr_warn("Could not get PCI SDIO at devfn 0x%02x\n", PCI_DEVFN(0x11, 0));
+		return 0;
+	}
 
 	ret = device_reprobe(&pdev->dev);
 	if (ret)
-- 
2.51.0

