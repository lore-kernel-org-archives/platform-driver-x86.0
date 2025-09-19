Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9E525CC5E
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314869; cv=none; b=KH9HWbPwbBsxujWBjFDxAgyRyVKR/XX2xNVjaxiKo/ZyoQBbSb/JkWicn1zy/Fw5HET0tnWJGVvls1BjnuPgcgn8TpkmwOKMFPZcGSo2YVN+AJTJ4bZYdbd5Mhqe42MrQJtgVAhYqxF85bJ5mauUmNjVQRRFpfYSdzFfqX93tbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314869; c=relaxed/simple;
	bh=h3f7Cm75TfrRL2kRpbySF8zgsSpEa6qhqjmBPrjRWNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFZbC9tijIjzgKV+8l4I9FDhS4oyOFPgaq6YsbT5zd4I6lKpDRDr0Gzf7KnhSNthnSONMnSrGAahhKzy6gkJBRsIAJJZbmYbhRGmT3yg9QTDCiHatUN/7i8oLbi8HNrVyejJbi1IvDZYQAv24O7agQblBl0EyqmpQWNZ/pYnziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i32R/Ohk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i32R/Ohk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C269BC4CEFB;
	Fri, 19 Sep 2025 20:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314869;
	bh=h3f7Cm75TfrRL2kRpbySF8zgsSpEa6qhqjmBPrjRWNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i32R/OhkWP2ZO58IF2rr6eOBY9Qv45id/rFWGD8JA37ueG4YfigAwzAMn4/LrKs8T
	 OWTUzBrl13Z8cBB9/wDCby2HHIYxTHDhUQh3QHpBRpXOIocTlUZMQzmFb1XKLQSulD
	 HzUTcmyWb/xW56mLv0DDyj0Eo5DAoZ677KEyhdrd5ipv/CT0oQ5gq5MXVy/2RHnr9b
	 wOxHJl1/+xxqPdWULZFdR9flProN47ekK1Hh3dHc9Fof7CAhDSLeAgBvjSXpGzeoHG
	 REoTlvCfJQ/l2UOzZO6pqTZqh6lZjcgYee4yMn8d/vj/NVwfT+k+h3HKmZM4wv49fZ
	 gDtbleWwzbx1w==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 02/19] platform/x86: x86-android-tablets: convert Wacom devices to GPIO references
Date: Fri, 19 Sep 2025 22:47:25 +0200
Message-ID: <20250919204742.25581-3-hansg@kernel.org>
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

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that gpiolib supports software nodes to describe GPIOs, switch the
driver away from using GPIO lookup tables for Wacom touchscreens to using
PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
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

