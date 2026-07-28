Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431C63AFB19
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785279354; cv=none; b=RR6+jYZilIB53nJ21RYKvYOIu7s4RhS1Bs4ks14dS/P+QOgK+bqPtHdnZbl+A56pTq2eKSjTDHjjEcEqZyW1lrzPmFVY/cbJF/s1FxsbmErl5xYZNVDVeTO3I2c8wLlPycCBYh5en9oaHV926zdxL7DyMqHkfvWEd5TuCMCZ6yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785279354; c=relaxed/simple;
	bh=8QDTGea8YD5fzdTqveHssulvg3hImMkLzrmbzptehnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmLzIqHUVusDZhSIhzCA3maR/N/ehTEkqD7zLBA4aBtv3UZJdX0lTCtYrXUh+NoEW3r5wZ+sXc5KfGDpuASPKlqaAwFPG03LlHvR+RHLX5Edi9U8TkHsRr5Bli6SkU4JHoNa45oqtuQJoMNLOark4M+8gT26LQbcJqn39lrfcqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPawdzmh; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPawdzmh"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c08df8513so2491201cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 15:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785279352; x=1785884152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ye3eMu6vu5RBUSzIcLpzipwJNEqmUBEyQ4TiICAypL8=;
        b=nPawdzmhrFq7TRmUHRZwxbmV73cHRqgtYnaO7Le9pCtX/C5a07PxJthvC8wvKUCMuI
         jnd5bXKv37RU2jVSMmoPE5fg2S1aCwwAfGUOlc9aZ3GXNn6A5BOb8SrjD4GhnZtMoaD+
         WNxzx6lnsspQV8vWWTq70Nfhr0s5lmUX5LjD2T2l1FhZpDGUCHTqERIq0EguSZp4wRVH
         hSsP+mU5x5KxYi0BF+PMf9uA5ZF0+ZBWiMfsv0rcg2R68nvLWyPF2H4ZFpKsDbVjx09S
         cR9+8rLINrWwdTYZQgVVDaKyYVKU7g1kkLBOf6R2zwjRWCYrXar/hg3+XI+0pIf2ngka
         Q2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279352; x=1785884152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ye3eMu6vu5RBUSzIcLpzipwJNEqmUBEyQ4TiICAypL8=;
        b=PeZl4bjYysNNneT2MAVZ9jQ7yPIupP+/ZUaAzioeScfGFQpYLVZKSKG/pQXT/3xJLe
         G8MI4v9tMf8dqBZ1w4OImP7EMOKzgHOUvvSM8OgOrjYyERI4DEbh21APrvo3GzW7n1kl
         8GULHVoENHjorLTPSPO7Pdmpq4dERJOn8+0QpPU4FWSc45lktcRMHN6B3qN7Ryr8ytUK
         NDZ2HyIIVulD5nDEq8sbJtda8CHSKKl5bh3kuRV/18COd5fPZkdoE74y4QT0enzu+8cJ
         qtipiKl4/bTpalSkoyr/dP86/86Kd3U2D1s84HymAvVML0749k4lGX/TdKBa98fopA5Y
         qiQw==
X-Gm-Message-State: AOJu0Yy7jzxLOpAFXXwtasys3uwSP6WBy0FrCrXw0CJK6KAeHxVMH/Mk
	nYW57Dwy7UnkvxeVyXu9rZRLkGRPBDrrfw9Cp5vrUVD9zQ+JLa6v4x2b0xBUirkpNj4=
X-Gm-Gg: AR+sD11eHwDq3oVc1/SLVUdCJ91S6mXKs+4pbLyKV8zy173z8n1XNSSVMtCaM6PLS6Y
	OhSIBBwAo8P3f1bSCiIgO+nJtetDH91KUokUAc6YAtPUHejmxmhCdEJmoG5TARFK9Q/iMFJWkbm
	HR7xt+7et7j8om25zhgAAdSRtPAF+Wl9BhR/QFco403Cdz73/qWic2zqbkoTdSI5G+l9UV4iorA
	2YkRJ1Lwl/VgS44fk+6ROvyHRPGGiBrPdSbTBD5rr1T/Uv43wETCFxfeNAM8HzMVEPb74iDsw4r
	Re1lIt/CjiG0Pab2fdT9k5dB78WTlDqoOWyhA2PLDDaTGdKa3xfREyFJCt+KzQwJ2L3GEQrRjpa
	WX8N1g+HYCFdcUHkAJoVUYABdv/H7Df2NCO+nvJOhv0Zb1jFpw9OMYxNmHvj+pIRSbIcqUeKFNp
	gNF2ypY46q+xtvuAZjgw6IlRKMAVKKaM280GXMIIj3bZWOu1E=
X-Received: by 2002:a05:622a:1a85:b0:51c:1e2f:1281 with SMTP id d75a77b69052e-529d71e91e9mr40343311cf.42.1785279352015;
        Tue, 28 Jul 2026 15:55:52 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2b4f241sm8017991cf.7.2026.07.28.15.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:55:51 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	W_Armin@gmx.de,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v15 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Tue, 28 Jul 2026 18:55:43 -0400
Message-ID: <20260728225545.1333610-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728225545.1333610-1-carvsdriver@gmail.com>
References: <20260728225545.1333610-1-carvsdriver@gmail.com>
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
index 470d53e3c9d2..a13c89dcb285 100644
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
