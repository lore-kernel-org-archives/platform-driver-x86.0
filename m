Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC773161BF
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782050273; cv=none; b=iPgEdWLvfJybkJoJcd8cAb/Naw2nJSX8hCvtjkOExrZUHcuLHcnl+a2GxcR443NKzuPXs4hR2zhXCjkA9Wnt4XmXXrKy313cbpTJe6ObgAzLXWgfboXK1v6z0+dGzDPWSigTHUEzcQSvhuJmln69cRhQw/A1DVRk+CJ09/EW8f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782050273; c=relaxed/simple;
	bh=RjcmqHddOPJFPlXAo7SY94la3yf/PIGdxvDHfx5w/Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jyvx21QB5fROANlq7c4vqQ230y44ebkF5qAzK+XESTghUKjS9jrC6feklGRmoc5bGm2Icb3UPaE3Yl/Maq9T/1xAg49sCl6VvY6ys/pgLaAJy6JnD9SyLi9qpy0aHvKr75rxjJOnEGEHd6z++0Xf1cnhNSdSgmICkcKCq7TUUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArxQmSX7; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArxQmSX7"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-915c48e6ae2so282586785a.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782050271; x=1782655071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=ArxQmSX7oXwz5FquMI1rdek9J3+E3z+q2V0bZz56gT5rN5E1fpLvuy9sNTMYlpjpDN
         cyD1xKHiCKgc36P50la48wXQCXlieevjDQxYWtJ97A1gHmqjjSmfAr/3TmkUhk+CERSX
         JAllSOyxeJAvfPTw0bLk4qkOQOaYRpV3K27GGMBpi7mURqHHC4DnDHAEbfxoncMdwSsW
         noTvt4dKr4Kx+1qVObs5pH3PYQ7vMdi1E/cfBKxE3rYEIA7Eeqq8jxsK/lAqZ2KKfsoC
         LjUG6UkWpqnNBtyItA+skI4iRcJA+E3jRCXg125PG7AeY5YRqRuoEl/22R70iWDsBDv+
         4uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782050271; x=1782655071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=s2KWlB7cROOSzHL/KXmM1dzTNM79TNAMQabd5G3eKpEMl2l3bmv1fIKxoS4yASbplx
         t6bhd/8BT2yRXJfDq1Hte/bNGePlGwnGQhgUd+/YvumMPeO+wTVbZjRtCn7nhT0ebuaD
         x/A3/0APXg3VC16oTDqnHTQlZoLhqlzjAfuF/ohPnEnx/zit/zfdwWAigX9A1R2nuhlO
         USsr7I55ct0/4gAWTAa1e5w9w97IOKTLDl5hyNf+A6+ZDtudggvDjwIc/qdSLNdvYmIb
         n26yrkxDlLCPl9SjqtDxc9Ux+h1XqsdkPQY0bLqLye6DY3VbR9eXtyZxg/9rfgmWSmMs
         P9Qg==
X-Gm-Message-State: AOJu0Yx8j5ehH6Y4jKO8pkbJgut/FmVC2izLdCtWjmuh49n4PlKF89b3
	84rbFzVZHz9iiOECpnCxQA7T1gdv959A3li2u8qmOAtXpy87LnIC0x3WzsVEoD9q
X-Gm-Gg: AfdE7clVDp3my26XAHtpJdnB2DtK4p7OjToUKPno797BxBg4P60k+X+XMliHjPUJT9E
	dJecnFOKr4YIAvNJ19Yj5Hdalp0LR11zIs5kJOGyiGqdfZ8WzH4PofM2JaRdaecL9G8AdrPpHSZ
	tR85tdQIYferniJrvCL6CEDBo9z/0eAnzR4VJ0pGWDkDIhu2xFZmxaoX5TN95GMI4NBaAFNyJNP
	fIL5dKQpi0P0mz53pdDC4AxLU4ZzUVAGDmFr0XbBx0DVpEQ4mv2PqeBcsiCQ9kMv0S2c6TRsMXo
	C4CXgfl1ZHsvHmuCdENdqfDyEwPTQPVgYmtJ+nPI8TnJArWg6Gfrl5MEfMvw234M6b2z6RmyaP7
	PN0P73uh58zVnT+eU+jbjehiZv5Eq2YIN/5Fg/eXwXMjTZQpA4EmlESstWdmW8d8QQs6La9lzA8
	+mRJIaJMUQt686wZGgyYbLIOAXa4rrB1TFFK7TUIzG9ee50R09Z3sHepE7Mrx06guY5lFi
X-Received: by 2002:a05:620a:2552:b0:915:79c8:ec92 with SMTP id af79cd13be357-9209197be5dmr1709443485a.37.1782050271265;
        Sun, 21 Jun 2026 06:57:51 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921db451a12sm600578985a.40.2026.06.21.06.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:57:50 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	johannes.goede@oss.qualcomm.com,
	W_Armin@gmx.de
Subject: [PATCH v10 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Sun, 21 Jun 2026 09:57:43 -0400
Message-ID: <20260621135744.504613-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621135744.504613-1-carvsdriver@gmail.com>
References: <20260616143508.124122-1-carvsdriver@gmail.com>
 <20260621135744.504613-1-carvsdriver@gmail.com>
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
