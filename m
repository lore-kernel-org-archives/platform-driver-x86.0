Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A1926A1AB
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398863; cv=none; b=RQSqebR1llrLvG8R8kOG6yZ+JwXMo9ZypKbO/IwQRauTLWkvU6OitLaSUqqmkBRXD5cec4hiGY08SVQOam1xWlAQH+kvWA3ALwO6WptYZDVJH+C0CPM2JxZdtqTlidkfFNCAbcowc68IwCSLcnJUi13wUbv5Z3Y05riacUPYu64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398863; c=relaxed/simple;
	bh=0lG5Xgc6dK5X6R83WKV27spoQmAkomY6MF9yiND7ItQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDVR/FSV3dyMSEjVZTOlB4itPgSWwTrm+Ctg4l+bBruSy8rjGcXKTw7730Gv+ykarxyQUCMidR6Sv1qFkMp/4vjbs2gUgkIQs5iVhQ+8yxBHTf3LrvuknTXxTWnz0qrCj4h2EOZa/wMrvBRt3GMgH1CVpm2sr/sPE1aRaLdTpq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVQXvJpi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVQXvJpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70F2C4CEF0;
	Sat, 20 Sep 2025 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398863;
	bh=0lG5Xgc6dK5X6R83WKV27spoQmAkomY6MF9yiND7ItQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVQXvJpivFwcvsrQFBjvQpSE/mRWk5aAH4CNNfS5CtifhFXB7DquhrmCrwTtw2kWb
	 TE4zSU/OKXzsig5LeaImPOl9wc90EpVY7Uk1MHcsEcFzJ+Br2d/Gwg9A74PEtP1mgc
	 NzWv7/bQO8+SicCP604nFuV7Dm5IxNvbK4f2mys1kzmtjUDk/SFjUpMYo6tfsbay82
	 +YjxsPjZ3aTK81W/UcIboMJgdXhrVAAnDLcg3eR8qaSNRnjGn4fnixBs8KivlQ5WTk
	 xAkLXJuK15D4i4ULNDSauHHMY91jPAldLhaa+kLlxklG8U1GJi+rvrUZYfoA0Z837S
	 Effksl+MZkB0A==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 14/20] platform/x86: x86-android-tablets: Simplify node-group [un]registration
Date: Sat, 20 Sep 2025 22:07:07 +0200
Message-ID: <20250920200713.20193-15-hansg@kernel.org>
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

software_node_register_node_group() / software_node_unregister_node_group()
both accept a NULL node-group as argument.

So there is no need to check for the node-group being NULL before calling
these functions, remove the checks to simplify the code.

Note the "if (gpio_button_swnodes)" check for registering is kept because
that also guards the creation of a gpio-button platform-device.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/core.c   | 31 +++++++------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 5675e888d84f..d0638664d1da 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -387,14 +387,9 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 	if (exit_handler)
 		exit_handler();
 
-	if (gpio_button_swnodes)
-		software_node_unregister_node_group(gpio_button_swnodes);
-
-	if (swnode_group)
-		software_node_unregister_node_group(swnode_group);
-
-	if (gpiochip_node_group)
-		software_node_unregister_node_group(gpiochip_node_group);
+	software_node_unregister_node_group(gpio_button_swnodes);
+	software_node_unregister_node_group(swnode_group);
+	software_node_unregister_node_group(gpiochip_node_group);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -430,20 +425,16 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	if (gpiochip_node_group) {
-		ret = software_node_register_node_group(gpiochip_node_group);
-		if (ret)
-			return ret;
-	}
+	ret = software_node_register_node_group(gpiochip_node_group);
+	if (ret)
+		return ret;
 
-	if (dev_info->swnode_group) {
-		ret = software_node_register_node_group(dev_info->swnode_group);
-		if (ret) {
-			x86_android_tablet_remove(pdev);
-			return ret;
-		}
-		swnode_group = dev_info->swnode_group;
+	ret = software_node_register_node_group(dev_info->swnode_group);
+	if (ret) {
+		x86_android_tablet_remove(pdev);
+		return ret;
 	}
+	swnode_group = dev_info->swnode_group;
 
 	if (dev_info->init) {
 		ret = dev_info->init(&pdev->dev);
-- 
2.51.0

