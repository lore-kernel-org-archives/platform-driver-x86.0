Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD535DA48;
	Tue, 21 Apr 2026 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802277; cv=none; b=q0sqgYV7srLDiAYK5WQogybFQUeS7DRcoOn/8/g6khcjiUz1PFqhGhgotKVwzF0XQHC0cdO500D5L38TFPpycrpzNoyJtBZZIklOMMprHkhP0QatIXWfgS61Ths3Mb42pqW4BpoDO1ZdV/5QrGs03thE8G5ouqRf+GEVocVAUdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802277; c=relaxed/simple;
	bh=t0v2qD+8FqrUczTY/vnoCRFN0soJX8hWC64yg673bMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ND4Eae4RUXcG2wJEobeyX/wXIpW+m8xi05233Ye/i4bnKXMIqC8F4KWeeiwbnYPQZuB0FLoiTvas3sAp270lNK2Mw7O+FvvaMPaMnsMA7KRIDOyHPNVoW9G+m/vKklRFduysvohw6VAGjJJceciw0uyBQYDoNaeCL4BQDY2mL88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=joYH+qbj; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="joYH+qbj"
Received: from wse-pc.fritz.box (i5C75F683.versanet.de [92.117.246.131])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 076172FC0224;
	Tue, 21 Apr 2026 22:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1776802267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lm+kkK6XtCYqdsLrVUlCFaw3rSJFL1LgYVEXMkex8Nk=;
	b=joYH+qbjEg0MvhuXE5ytVKoaYdy/yyHM9BBdUvlgXfZ6uOOQBDTvMaiNojPp5hOm9mZz3N
	vDG5GrRWL3+vn5NKT34AmCFCKEp8DtBneYdYzAVsUujd7maGiufih35psYBBk09wQjCSyA
	LkM+sly6uzJHYaHMADfSvWxiQ9SRGYw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [RFC PATCH 1/3] platform/x86: uniwill-laptop: Make super key init lineup with other inits
Date: Tue, 21 Apr 2026 22:01:25 +0200
Message-ID: <20260421201103.142403-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421201103.142403-1-wse@tuxedocomputers.com>
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The super key init, while being trivial, was the only one not in its own
method and before the EC init.

Make an own method and move it after EC init and probe call to make it
consistent with other initialization steps.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 766bc1ee192d2..7d1fdbacc6871 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -768,6 +768,14 @@ static ssize_t super_key_enable_show(struct device *dev, struct device_attribute
 
 static DEVICE_ATTR_RW(super_key_enable);
 
+static int super_key_enable_init(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
+		return 0;
+
+	return devm_mutex_init(&data->dev, &data->super_key_lock);
+}
+
 static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *data, bool status)
 {
 	unsigned int value;
@@ -1869,10 +1877,6 @@ static int uniwill_probe(struct platform_device *pdev)
 
 	data->regmap = regmap;
 
-	ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
-	if (ret < 0)
-		return ret;
-
 	ret = uniwill_ec_init(data);
 	if (ret < 0)
 		return ret;
@@ -1890,6 +1894,10 @@ static int uniwill_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = super_key_enable_init(data);
+	if (ret < 0)
+		return ret;
+
 	ret = uniwill_battery_init(data);
 	if (ret < 0)
 		return ret;
-- 
2.43.0

