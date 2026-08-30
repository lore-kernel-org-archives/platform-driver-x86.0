Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D813AC0E4
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088528; cv=none; b=mnVbI6QYGgLOzkMo51V8svlGHVzG9O2TOZAlBzBiOnFUthX+gZAUgF3YX0EtPWgBqVWEGQ50obB3zIlI1CkHTtNLQ/wvdKPSuB4ickgxZvPrdeCp82ZKQ5f/9v+D85qzBz1AXOMSutZCt3ulrZOFHh7m3NhwNroaCE/7rY93h54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088528; c=relaxed/simple;
	bh=bSFkHlBywicpVhyA0eqfqd0HB8Ubz62+8OUFuJaDKo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L61/5U3RgNOyrViektjJBwKYPuWiW0/oEX3K3U839cIy2cqqWStjk1Eksre56UtkrfkafcMr4La/zd+31bDee+M97ZT2F/ivbekxzhB/mvV6U/qscmuKEyv2oBqJo1tLZPRUdgvLc+6kQGFkFP8yslkw//3kkTRAIkHJBtd7w04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak27+rtX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak27+rtX"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccf2360620so20438005ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088522; x=1788693322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btitZhw7p+mJgoG52k2bmHLRAFRh3kEQVi1cVagZJs4=;
        b=Ak27+rtXAAHmQltBdfUF9WU4UmSAFljUqpv83eOzIjpWJgrz7iOpABmxp00ZmHenDF
         pMukqbmAteOSQeRRAxe5MupWctG5sCN2vZy1HxxYVp6IUcqdwrAlqEs1uv35ggoU5Spc
         pjsbBtJisN56xO2kSd+x5OSeTPJ4PhbFbybuT8LXSxVsuggw2RtODPX2rp5sA4ZGZ9l8
         e6mbrdu44AlcifR3yyincegEwyrFFK7+EW/LQdzmqJJ7oPF4ps3uvAaWSDuYEey0w0xZ
         yZ0blchg34UWYBq/ZuvvBRpKKtTXo0GFHF0vnaNEhjtrZT8wssE4bU26jqXDe9I9KcYr
         eqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088522; x=1788693322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btitZhw7p+mJgoG52k2bmHLRAFRh3kEQVi1cVagZJs4=;
        b=rLpoKAeCUiHYC2A8VBVl+P22szAZ3A6fNLtyGe2/r4Qa3WRVTMT0yBQQ9+rBbPiUXa
         ozGLj6bs4olfhybRcx1Bu8lB8mhoLbTY+mGtN8YaNFnsefcxMYTtipwVw64EVxZxZc1p
         2o/IYNgavCQ6RtLRpcDi9JeiIb47a0d24PrWpsNalrziJHm8tjY+x0VYTw4YJiugRb51
         rk/fG1+v4H/tF3gEOfWpxo4uChJUHp+XwUgjeR7JbQVTRpzQ76A+kgfQ6QIM8K5fk5vd
         nc3VfGkEdj/XEWn2YGJqX9iAuY5r9xBmUGFfHdRZW0gKdpGYyXeKTpwR5HOndXeNWNTY
         omkw==
X-Gm-Message-State: AFuF++m6ULhhxifJXGO4f6Mlu7edOqS9Lug+USAQMxLq6xh1rD8p2/Mx
	y8vXbeU+p0dNIkeIxt2s2Ros8MOAAEJfBRA6TGnfeRBm2F2wGGBiwNy4
X-Gm-Gg: AYBFou10vSHS/PU6zqTXBEaqAUWFAiQFw6cvfz2+loUZ3EdR/xTQ1lN26XBWJJZF5bl
	84rW7ieTorsD/skmRQl7wNHWwcMZXFo7Jg9gGE4l4ZCDBG3w18W0r3PwaKdOdttnrleJ0KWqvgW
	wQDO2nYXKTnGAHmA5U5dSHNSZhVCTUeadFOOjWjOhqpW+abr2D0XVInM7x9u2AJ1bnVMydJdfZY
	gBhAuSxygTcC+WsUiV657rqrRk7Yccen4MAX/V1FkHBrIbg7L8FLypOziZhIKEv+Yx8zQm5EHMv
	CVizr5RspScM9MbSaotZzUZ/hZnQGo/G174oSXwhnMk0sXsD5p+o9hsH+ZsgKASR+1fFcBufovL
	y1E9Qs4l3ASXzUnVtqHnsomWJasgqio6QT+SsTiTA/zvHdhAYMctSUT1JBdt0GX+3f45806kqzL
	AkM4A0PGDemJ5cK9T8Y6Q0RRKGJmzsiMwjNdeehJ0Z48X+97/+qwG5D7hM/rDrysyiihd+WK46k
	d5IAjEG8RKenpG9LiGZi3KkpuT64tsWR1rq/Ux0XLH8F7xjHcCo
X-Received: by 2002:a17:902:f70f:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d74dc0da0bmr332601975ad.4.1788088522058;
        Sun, 30 Aug 2026 04:15:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:07 -0700
Subject: [PATCH 3/6] platform/x86: x86-android-tablets: pass node group to
 gpio_secondary_fwnode_init()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-3-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Currently gpio_secondary_fwnode_init() uses a file-scope static
gpiochip_node_group variable initialized in probe.

Pass the node group directly to gpio_secondary_fwnode_init() as an
argument instead of using a global variable. This allows reusing the
helper for additional GPIO controllers in subsequent patches.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 722c0ae4ecd1..45673bfc0b7b 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -156,7 +156,6 @@ static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
 static const struct software_node **gpio_button_swnodes;
 static const struct software_node **swnode_group;
-static const struct software_node **gpiochip_node_group;
 static void (*exit_handler)(void);
 
 static __init struct i2c_adapter *
@@ -377,26 +376,27 @@ static void gpio_secondary_unregister_node_group(void *data)
 	software_node_unregister_node_group(nodes);
 }
 
-static int gpio_secondary_fwnode_init(struct device *parent)
+static int gpio_secondary_fwnode_init(struct device *parent,
+				      const struct software_node * const *node_group)
 {
 	const struct software_node *const *swnode;
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!gpiochip_node_group)
+	if (!node_group)
 		return 0;
 
-	ret = software_node_register_node_group(gpiochip_node_group);
+	ret = software_node_register_node_group(node_group);
 	if (ret)
 		return ret;
 
 	ret = devm_add_action_or_reset(parent,
 				       gpio_secondary_unregister_node_group,
-				       gpiochip_node_group);
+				       (void *)node_group);
 	if (ret)
 		return ret;
 
-	for (swnode = gpiochip_node_group; *swnode; swnode++) {
+	for (swnode = node_group; *swnode; swnode++) {
 		struct device *dev __free(put_device) =
 				acpi_bus_find_device_by_name((*swnode)->name);
 		if (!dev)
@@ -453,6 +453,7 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
 {
+	const struct software_node * const *gpiochip_node_group;
 	const struct x86_dev_info *dev_info;
 	const struct dmi_system_id *id;
 	int i, ret = 0;
@@ -484,7 +485,7 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = gpio_secondary_fwnode_init(&pdev->dev);
+	ret = gpio_secondary_fwnode_init(&pdev->dev, gpiochip_node_group);
 	if (ret) {
 		x86_android_tablet_remove(pdev);
 		return ret;

-- 
2.55.0.897.gb25b4bd76c-goog

