Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AFC35AC07
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730443; cv=none; b=DTMjlZiNbFCuZfFuVlCgorN/Z6zvNqxGrCL63/6w1TVJLe9J4hCJwybS40vTiInC8HvXN3+ZAIFwRDzPZTAOYgkvbGnH0keGvSf6jiTsme4cJESpZ+a+L4aE30IxZ6I8m7rptIrdWP5Z6egXOxdMH/Wgg6Z/qrndLKQafmp71W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730443; c=relaxed/simple;
	bh=yxyu4TafIzC4Fzi3U2zMmEJdSaIIbhl+1/fqKiyfzh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iY+zQJRrWbzYulMzX69fZPT75VGFUw5vxD8YZKwD+EqFRkbeUvLLuaHHSehuo7wxMD6P7dcw0rGFpNPw+wN/CqxFPVv8ERvD4nc9HlGdLbPzJ1a5bQpIeBwUHBX0dpkbdi/+l0WmfeYGyabkgudk7jlX3QbxFqyIxz2XuRTiu3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRBGS75l; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRBGS75l"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c8e2e39easo128619551cf.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784730440; x=1785335240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBogkq6bXpW2SrdB8gUUtEgmwXCQCaUQO6IY6/OhnhI=;
        b=LRBGS75lOV/DcveESgD4t/LPpzJS7gPRVWMJ+MRrLxyfEtAqcGV7cB+twMotMIgbvQ
         yE8MvXWY7f6RZPl4PMxvbwM0sU5mo+ql6C7u1CqMd2QcLN9bWM+LIPqrbqHu4r4iKIJO
         uAmR3WaNUFjZmTnKhdaIf2NLyRjuTWAWoAqK5rgswQZj4dj+gz2dFrlmHDwV04Eu6tdS
         X46y5nOTKw+gJ/W1BK3+xIxEa/XSoOTrfIxSC7SvY8scvx+mTDn7ztLoLkIn9qxywS+F
         yhLXk038N2Rp7INTxjxtiv/2s2roHkfk6oRDhTitXlIGi7xzTOffWDbva+kTsPbSNM+2
         W3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730440; x=1785335240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBogkq6bXpW2SrdB8gUUtEgmwXCQCaUQO6IY6/OhnhI=;
        b=FPZSv8zz3OMHK5KmxXF6l5uOtmtU/ipKsagWvO1etnVhQvsbR2SE+ipNvWNyX3bzef
         YyShE66Mw6BbsKkGh6/y2NaDcIgSci+MAdhkmLEjc6oo8+ozm0FNiPbaCJ7SvduW9IAj
         /IsTKO2eS+dw6MBtdFenGXBEbAaRz0uQI4Zhks7AfWzwKDfs29knLrgjYwcTmAFFUQNJ
         ck20JkcATxYPSz8t09cyMuMwItu85XWHtkCv9RDK1CKZQUilRB8D7IzS910t0vTfgExC
         CisQaPsm01cuMCnnijnXEpX6qv0e5dVvdwNczhppCVJtpI74as/0uq1ANCw7uD7QIQ6U
         Z6Pg==
X-Gm-Message-State: AOJu0YxkRZe5OdGbD8ZRaRxqXM0BRgmwlZm0ib5/TdTjhrcCMZu52ylc
	UWWk+znJbUov1A0fFt6aMws4ApN26lEgCUQ8oWImSeKG8VQJUbJ57/HQBY7y88+6
X-Gm-Gg: AR+sD11pzqGQIyc24fg3zez+y8dm5oXxKAdKdEFVs9BxrpvMPmavtFfdDuh4IhaqD7Y
	ahD1jeaLwtfEQ0YCYx/aMBCEA0zoQEL0fsdakPbXip3y+LFp6JSD3t7Tx8NIhfgsRzq3ZLxPfCd
	0kYSngGLVBomQWMFGUMCdr3sQ8+IBgyjutx7gWBQvOXy+0619HI1hgV6v3j+Co9vt80LN70Px4S
	YsG06PiPZFiTXBkiVjBJLz5JdfiEvesVWvW59axklmlVm4weONuNRQBww+pu/X9Di78BI9ciP0A
	BWn9Pq7bInOv6aX1wX7/OU2aVaLsao6LWWwfvKY0pCFY65hOohwzIr8RwTjAmCQRWgn4UNaFY5H
	xrtzPhsmgk8iFCzttUaaU/E5PmfM7iYKnSBo34kLAFlZwxAp7eo2dFJcZ9Y3ZIgqSKALkCl8qJV
	0=
X-Received: by 2002:ac8:5d88:0:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-5213c8e3aa1mr212142181cf.8.1784730439956;
        Wed, 22 Jul 2026 07:27:19 -0700 (PDT)
Received: from fedora ([2600:383:441:9b80:8f82:4b87:4a4b:5554])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d0c4fe92sm16224981cf.11.2026.07.22.07.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:27:19 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hdegoede@redhat.com,
	W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v13 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Wed, 22 Jul 2026 10:27:10 -0400
Message-ID: <20260722142712.814597-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722142712.814597-1-carvsdriver@gmail.com>
References: <20260722142712.814597-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book 9 14IAH10 (DMI product name "83KJ") has a dedicated
yb9-kbdock WMI driver that registers an input device reporting
SW_TABLET_MODE to track the detachable Bluetooth keyboard.

lenovo-ymc also loads on this machine and creates an input node with the
SW_TABLET_MODE capability bit set.  For input switches, the presence of
the capability bit has semantic meaning: userspace (e.g. GNOME) reads
the switch state at startup from every node advertising the capability
and does not expect more than one such node.

Add a DMI match for the Yoga Book 9 14IAH10 to probe() so that
lenovo-ymc returns -ENODEV on this hardware, leaving yb9-kbdock as the
sole SW_TABLET_MODE source.  The ymc_ec_trigger EC write, the only
other action taken in response to a YMC event, is guarded by a separate
DMI table that excludes this machine; no other functionality is affected.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
 drivers/platform/x86/lenovo/ymc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
index 470d53e3c9d29..a13c89dcb285a 100644
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -24,6 +24,22 @@ static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");
 
+static const struct dmi_system_id lenovo_ymc_nosupport_dmi_table[] = {
+	{
+		/*
+		 * Yoga Book 9 14IAH10: SW_TABLET_MODE is reported by the
+		 * yb9-kbdock driver.  Suppress lenovo-ymc on this machine to
+		 * avoid userspace seeing two input nodes that both advertise
+		 * the SW_TABLET_MODE capability.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
+		},
+	},
+	{ }
+};
+
 static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
 	{
 		.matches = {
@@ -101,6 +117,9 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 	struct input_dev *input_dev;
 	int err;
 
+	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
+		return -ENODEV;
+
 	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
 		if (force)
 			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
-- 
2.55.0

