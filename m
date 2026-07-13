Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16B914883F
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953102; cv=none; b=cQfZjp+IagQAYO8/UGXdoi70/HlvatX7iBjZkKWr6p0M7PHs9/kfzXRondhk2H0+dzfCMf0UYU5CgqS7AyfobowNcca590quReMKEzlw+srOHmKchbIFMofbgjBTHKrS8jNW6y9D/DiDWqz7plSMD+3Nw75Qn0hxFXLCbkm01Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953102; c=relaxed/simple;
	bh=RjcmqHddOPJFPlXAo7SY94la3yf/PIGdxvDHfx5w/Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvQZn3EVjLEyln4rT6A4RYezpjqQDOHZGIVNbBzNbtRT2OLMd9+GOA0n8PGIObxj2jWAKtTlrMqtDMhvbAKgq0g7VFfTt9FGu7hhsBVU9fjs6OAUmBuiTRvlrOsitqpYSST5RR7cTiNmEmrJjZWHc388+ZqELWE60ZUlV4evh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AW1zn/a7; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AW1zn/a7"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e54f8c051so200123385a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783953100; x=1784557900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=AW1zn/a7CVFSm+JlZK6V1Qh0bpItlh5IeI5yw3R9Ta9A0debhQwg9vs/5ZAe0VTTxH
         DXMXxq05zycQrrslhoQXcX2JzBDxSWFwmOXS8Zdq3MO9APD0zqMhqf5Aneuh+p1K56ex
         sB2b2Lm0Yy+Uwg2jJO3FriYZ4WwUB3HEOiDkSN9Hmu18uoFzL+t9mFz05E92ENtnyO0p
         x1hUOqsMlurbQIDi4np6RXoh7fH/mObtVmOts5RLi+KQr6ewr/VgJytFrL9cE0f1MLB1
         R7UEwi1tzwxeeKTynsSslYygQ66KAJoOWTiexsziZUgFVFy6R4pLIcMPANFsLNtnc5du
         GWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783953100; x=1784557900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=Tt8g970puqyGeYfszFyLwVELzMfS7kUQU0TgDaicI1iWbns+bqWD/fM+Mi1JThaqZw
         GhWRoTojltDp7HVY3VFquarWMjLs5NbeNd8GWsiMskx70iWz2wav+kwWgU4/H1I9Uuei
         eW+sgWlHsUfQRVX2toSaoRFoJJnqQo0lLrsXwzJYb2x8MkKlZwzAtCAlS8nGzXwXRN/K
         T5UNPHDKw2Oa96FlY4NNC9xnigtHKsZkUStgoXWRN1x3UHmec3TFZ/ruj4iW6zD2cIUq
         VnwMcyAGbmrmez52o93pxN0aIcYNN83J8P25x5KHmyAoYtG3gdS/MV+T5xiaYdUX9I2F
         j4Qg==
X-Gm-Message-State: AOJu0YzTo8mWDUccYfuBDBlhVZJRhQ+Z+YorFeC4Wn7bI2JqKTeV3rvS
	48GmnqsxtH4skWPg97SPdSO+2S/2c3nsnx52d+TwH75of+0kwHuHzFOqlPWygLa9
X-Gm-Gg: AfdE7cnDeiEafpzC0buIPK9LLRwBHOZa1kBEp9rb0Yiro3LIKQFx8C1BJMZT9EYtiv/
	kL9KdL9Da4v7Z6Ga1J+9DC7682xy2g173YbNykALKE1MQN7+YL3ocNzh400z4lqfeZzHgzK4U7H
	4vEsBC8kmql4k2S+ZowRtjefi1sOO4bawklurwP2RbbwELFDblqaJ2eEKYTHooMAwZwSsSmDTmy
	mmZxcFzMj/nBYyHg6bAtp1++Kn6pi2RCqo6qHQaZeFNTjfX0ew4n83Rnf/Qkga77Lwt8eclJY80
	p/1DSy2ElQDj8bSV6jzV1bYeSgKOfUi6UnaqA3n4DpDNUz/1Tm11GcIGseCNXURLT8jnsAwvMvQ
	ZAyfWq8mFYxV1MQM3iso90aGvg+0yv3cfZusbP1zXqy66eY7gKZEGVo4XYtwZXcB1iZbiPpMNBP
	mhrtqlkpGlZijDK38FuUuVDnCo18LHyLIWQTE+xOBFA9FOcCCDFqPI7BQv2Q==
X-Received: by 2002:a05:620a:28d2:b0:92e:c117:5ef1 with SMTP id af79cd13be357-92ef2c9c453mr928410485a.93.1783953099373;
        Mon, 13 Jul 2026 07:31:39 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm1085295885a.42.2026.07.13.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:31:39 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	johannes.goede@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v12 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Mon, 13 Jul 2026 10:31:31 -0400
Message-ID: <20260713143132.381808-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713143132.381808-1-carvsdriver@gmail.com>
References: <20260713143132.381808-1-carvsdriver@gmail.com>
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
