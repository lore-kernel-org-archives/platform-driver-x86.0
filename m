Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB544A730
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106836; cv=none; b=Mql5JGR14WPi2wXigfw5me2ZIqE6dJ7FuHmM88fPim41pTVjcSLoXA4Lc9AvwsbPeWs4bSy9CM+Iw6D9tnzFYw4YULTSnq/Yt9b+0uiKwWuxtomiUtJsU6u7FCscg2R3ZB10UWdB6f732BRyV49/qS3ZU0Zyf/W2TfecW+EJrAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106836; c=relaxed/simple;
	bh=RjcmqHddOPJFPlXAo7SY94la3yf/PIGdxvDHfx5w/Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoepF/u50eflKilteG+pQnKocZFeieYSrdL3MrXepfTo47JkjcWmST/eeRbVsFhsFdwMohaMlg+1CjaYja3BntStEPCVGNUJ1lDMdQXdrNXuHRX2MmbTy78nlYslrrjbXuIhbQkWHrN0csP4XuWJG8WbiDY0WaBon44KNSd+Sw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8v/cenR; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8v/cenR"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66061993121so6742970d50.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781106833; x=1781711633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=k8v/cenRbhpqDrQwI/IzJp3HvLdFLj6duFgM/5C/uTxySP7xjqpfuhjsvrMNaKANqH
         QHv64zv2Ez8/ZNZD4tE2WepiXbvmzl7boQiiVuYRpBRPS6owKaUD8ZNCBcrnG/MccOxM
         K766o3udo4ElNiwm9G2CZMryLuIJJOlsKELvJ7JN2PiH0UZF2mG0jAEgtupPVpKfI/69
         QtHfKQ96p+kCrQMte+ECZ3EVjl4tT5qARKuOezebXA49xoRQOFX5BHe1PifZR0Rj44gp
         91uTUW1lGNNZBje5w0sSveLFwLPxNMC2Pa9Q3SsvfFhOt9gEzlToHB0CUy6kChHjr4Mo
         0IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106833; x=1781711633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=ioqjx1QOeyyDGAq2PpY+1QunOHF6Az2MfFyQEQmcQRLP+CliqoNgU8s6zwRGPNioE5
         LInYnujRt1CDN8Ub02fDyBuqN+DoHWK8XzBi7csjJUxtXph11334jpW71XshusJBNngI
         7HrhiNHMM3eh4lse4ujQf5YdyIODrabNjkN0TRRWXoWFLI7a1tEgx0PHjNjHdqrAtIzO
         RI1gxwEnU7u1oZWfGripeQLfTFpoeGrqm4ZIFPXIizPdfsaouhjrEYYt0lJdPAlS3PXc
         jnzDLC77whE5b/MvvLDC2UquFZbgaLH89oim1zBNHLM3Y6EWFijsEyN478318mJDs0w7
         HzJA==
X-Gm-Message-State: AOJu0Yx7tmzfxlSK5SJGskCWxWXSUA6T8566JhKcxHvA2f6wU2OYvD5x
	/zRKpEIFLF5m3eiGiTEeL+LUg9VopQZQv2ZL1BrRArDX1ZCkAlsXf0A9X8EWFkCk
X-Gm-Gg: Acq92OHHsTkV+7XGFiQ+085V27QPHaf6LVylYiZNoh+ICtBVFRgsKdmZlyQe9wDUL+S
	7YXciYXQabYTyVqbgJ76AvHv2mdTah8TNXhUqIh2umNyWsi7WibT+1e9s8OdYUmvqPib6uK3h8w
	2c23bOvNoiCzWQlTWSX7LvE1UHFwf16hN6VxXC/Io78k2FAoz/ovIC/P1ziTeVqOVHbCv3Hpxtz
	bXyvBxvikyhTeH66SH1lUlbhtn+PmF7VFawdb6+cO8JhrnUXy8SXXfO+WL01x5BYy2aJf4HOOTQ
	jOEPfkI5I5uV3kObtyOuNoKCPKlkY9AGA99STPaglaIX4DZxf1Qvwv1jVRXttF6l8QPsTYr2TDl
	UN3LAIqGAKBZp01473AAyEj06hAFYTnHqNO0W8BgmaArD4fJ4TH+aem+y15MZKEBVldBKzS8sI2
	4Q3rZzyE+dM4wqIP2DHfI8jhHvTQrG
X-Received: by 2002:a05:690e:4397:b0:65c:2360:dfc8 with SMTP id 956f58d0204a3-66106e38366mr17145696d50.19.1781106833266;
        Wed, 10 Jun 2026 08:53:53 -0700 (PDT)
Received: from fedora ([164.86.10.141])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d62046fasm12573759d50.13.2026.06.10.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:53:52 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Subject: [PATCH v8 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Wed, 10 Jun 2026 11:53:39 -0400
Message-ID: <20260610155340.342949-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610155340.342949-1-carvsdriver@gmail.com>
References: <20260610155340.342949-1-carvsdriver@gmail.com>
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
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -23,7 +23,23 @@ module_param(force, bool, 0444);
 static bool force;
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
@@ -100,7 +116,10 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 	struct lenovo_ymc_private *priv;
 	struct input_dev *input_dev;
 	int err;

+	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
+		return -ENODEV;
+
 	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
 		if (force)
 			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
--
2.54.0
