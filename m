Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D323F26A
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398841; cv=none; b=aDwuBZ4wQqVLug5i0thr3XTdif67n3ycDji721N4wxg2nbVXKCKR4KfOMdIIdKJfH+qx4zohO/+fouUL2jFhAU9BxdvtaMMiuba/ft9nir0MzGlZQHV4X9a/FWVu6h3G0aR4tWCi8fA0zGEFwYuikcmjoNRHxoDLW2kYG2qcaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398841; c=relaxed/simple;
	bh=fHCoDRd5+tDCf+6Mdb3AWVFqAc8gsNykBC3bPtSsSgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E70xhXjGz4I1KYAAJjNxkvcLi5dhpC3ZJBdwbWV/JLkkcHCnDhAe0COyO5xcO20g+ubwO8fcRaA8Uvm+5EsNInK6CXLBnDPF61hSwOrvIBU+6BS7hOzdpnbD6AGu4Ez+MTPgPRf5OehJZDAbRPEBXBU7IOaqazp/if7PJx9In6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5oeKjp9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5oeKjp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4875BC4CEFA;
	Sat, 20 Sep 2025 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398840;
	bh=fHCoDRd5+tDCf+6Mdb3AWVFqAc8gsNykBC3bPtSsSgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b5oeKjp9zJ3DLD4BCUmQcQGT6k6KMkxjnWhyYssgQN61345gAjg17dg/ungpm4A2p
	 83McNgdET8HndPzpdblP7axNw5OuJzkHarCCifE/SCJQAb/JI1/shHm8QzDesSMMDj
	 U8JsNU5zZ4T2BwDJWF0vnSvRiTc9RMS7/KVB8zl3/v0VFH9fmLnZciw4rcDGJVAaJt
	 QkZgy4RwacQ0H11qdCpkJK8F5mRxVx4s7NsniIS8eE3Jp0kbCwyCgm6vIw6oC5gsrD
	 Ai4o06zqt5MjnHUnHQ8UALFGueeWZ/SHkJPOes5cITOKoqqxuu09x0AJaVMQioHk8p
	 605hJpsxAAeDA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 02/20] platform/x86: x86-android-tablets: convert Wacom devices to GPIO references
Date: Sat, 20 Sep 2025 22:06:55 +0200
Message-ID: <20250920200713.20193-3-hansg@kernel.org>
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

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that gpiolib supports software nodes to describe GPIOs, switch the
driver away from using GPIO lookup tables for Wacom touchscreens to using
PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 22fe76ef5b5a..f8d261d37284 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -75,6 +75,7 @@ static const struct software_node lenovo_yb1_x90_goodix_node = {
 static const struct property_entry lenovo_yb1_x90_wacom_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0001),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 150),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 82, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -218,17 +219,8 @@ static struct gpiod_lookup_table lenovo_yb1_x90_hideep_gpios = {
 	},
 };
 
-static struct gpiod_lookup_table lenovo_yb1_x90_wacom_gpios = {
-	.dev_id = "i2c-wacom",
-	.table = {
-		GPIO_LOOKUP("INT33FF:00", 82, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
 	&lenovo_yb1_x90_hideep_gpios,
-	&lenovo_yb1_x90_wacom_gpios,
 	NULL
 };
 
-- 
2.51.0

