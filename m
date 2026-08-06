Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B6175A5
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996345; cv=none; b=TNEer5xGtgvxINdN6DIl/TN8V13fjOr2qpJGMuKaXkna4PtIk25crpKBDPoxerz0IgR7qMJZFMcz7kaVqIG2n/JGcvh0Wq/UgFHugSz34SK/e9oRjpn+lEdfjh10rVHwGgst3FRleuDEHJskZBTEW8W5IGFACPwyNsmoEzIwSQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996345; c=relaxed/simple;
	bh=G3uPmsO4L2cdVT8sDvYloQnI29FwcC8whywryMXupqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmlRsrEa2ItDpDndrdn3nlCiadt9jXaCJXgh4qTGYxgyepClZABSnFZhGj0fdZmngSPcClLxER5fdZkqAWSCLDeFGTiofHkYbJVR9qTbM5nSFKevD0nXibY8kpl4qkdndaob/lWSRSYb+M9wh+PhkeTFePAb6rTf26mPfNxDBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=fLN52YuD; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="fLN52YuD"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48fb94a17;
	Thu, 6 Aug 2026 14:05:38 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] platform/x86: lenovo: cancel fastcharger work on detach
Date: Thu,  6 Aug 2026 14:05:25 +0800
Message-ID: <20260806060526.1189-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fd5ad546a03a1kunm53429ce82892e6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSB4ZVk0aTEoZTxpDH0NCHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fLN52YuDUUtZpq0v3QNEyAqkMDZE+VugRSbgQN7lYy4mn+jxs7fgOgMhmkGjUUVN6vvzO2HeTKOXJgoizLjK3nuIg3X6+3EgU87+PpfVXJjM2yNJqRAkoC3lAhJb/ALkPlCG+3CuAxrxnM40+mv/JT2B5BUZa38ymKnfLAq7lL8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ZOCuB2EKr5YTLM/cxrnERyl1ehMzPIxhuvlqS/gprNA=;
	h=date:mime-version:subject:message-id:from;

The extcon notifier and probe queue yt2_1380_fc_worker(), which can sleep
for several seconds while accessing managed pinctrl, GPIO and serdev
resources. Driver detach does not drain this work before those resources
are released, allowing the worker to use freed state.

Use devm_work_autocancel() between opening the managed serdev device and
registering the managed notifier. Reverse devres release order then
unregisters the notifier, cancels the work and only afterwards closes and
releases the resources used by the worker.

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 .../platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..cce677b5db48 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/extcon.h>
@@ -160,7 +161,6 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 
 	fc->dev = dev;
 	fc->nb.notifier_call = yt2_1380_fc_extcon_evt;
-	INIT_WORK(&fc->work, yt2_1380_fc_worker);
 
 	/*
 	 * Do this first since it may return -EPROBE_DEFER.
@@ -209,6 +209,10 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	serdev_device_set_baudrate(serdev, 600);
 	serdev_device_set_flow_control(serdev, false);
 
+	ret = devm_work_autocancel(dev, &fc->work, yt2_1380_fc_worker);
+	if (ret)
+		return ret;
+
 	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
 	if (ret)
 		return dev_err_probe(dev, ret, "registering extcon notifier\n");
-- 
2.50.1.windows.1

