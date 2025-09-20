Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF946269B0D
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398874; cv=none; b=aKGfY7y6OmG8WuQ93J2yL1HEk6tCapYm+ybKXwkpEtaXAU84HQ7PKCi+JhnLMPerA4J0jL1BvNGE1yvQINzMLaDBZo3wmeQXorH2EDidcKUVAd3ea+GWNmmdi0eHi6JchOjCjGD/rG66tB5DSALuqaI5p2GUdpZQD2Kg6ZZk2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398874; c=relaxed/simple;
	bh=LZuFzT7SZwzJwKohAhn1Ak4A3vrn+S37CJBuiRAiD7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/j3c2l3BLoUKVxxeqalno8w0c7bdKpYmeK2AnTBtnWt7r1Q+oYs8+XQKWk0zp0DRKqKNcdqj0ECJv4bHWvbApCVZNIYNdQoSWnJBhZvC6U1gJ/aPfyzMxsQlUwsw7TuI2VxYVko5GOgaMDzKizz8db/cDQYeJBhqr2maA6e0+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VT4AmeYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VT4AmeYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28744C4CEF0;
	Sat, 20 Sep 2025 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398874;
	bh=LZuFzT7SZwzJwKohAhn1Ak4A3vrn+S37CJBuiRAiD7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VT4AmeYOSdlxWPNw/G0ovSByDdWR4k/TXyTcY9KrvTNSxb2wOpwwrM+IXt/FAF20T
	 aL7h09As2ODmgpjAhx88PHOiye0JB+HHDjgK+QUO4olJJGrQ50UTgxNOWf0ASLulXw
	 ni5rJe7ROh+WMyxGYIv/mE571FyTSF7uzvmp3DIsS265gNS2QfN7B4yotIDdx56O8A
	 R7hMWkaioWqhyCym7bUY5R0OMYhVkppRYuG8rysQihOiFVMT8pRd4N06EjKpun8h1m
	 nrzqFB8VkIc7AhfCo0/XlJRm+AGrkNVQqPjArg6egetny5W8J8eOjhwihMoV1DMpZj
	 RHzY64MpFVGUQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 20/20] platform/x86: x86-android-tablets: Stop using EPROBE_DEFER
Date: Sat, 20 Sep 2025 22:07:13 +0200
Message-ID: <20250920200713.20193-21-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920200713.20193-1-hansg@kernel.org>
References: <20250920200713.20193-1-hansg@kernel.org>
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

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/core.c  | 6 ++++--
 drivers/platform/x86/x86-android-tablets/other.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index a8e9fa97b676..6588fae30356 100644
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

