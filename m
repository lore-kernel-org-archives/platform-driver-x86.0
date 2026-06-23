Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337F256C6C
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 12:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219566; cv=none; b=KoiPVz7G7t7ZaFs9gTOVbYY4pwUqMJylIwSPzYqGETQ3DWx7ImuMZAe0b9xjg3rR2AElffP6UGXsRs0lUmPsEzawA8XmoNaHAEX8qu7fsNImHBJBQDfmZ/T7/Uia06YcDVhD0Uixtrk11CGLrKa7KU7HIgmyLhb93xcxKXQt8QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219566; c=relaxed/simple;
	bh=Zg4+zP0wTV80TxJ/Lm/sbGlz00er6sci0TVfyPMO8Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6JMCplcrEryZT05rI4OEoHSFeYHgLT5EL3L41eXgSMU5F9pW5y1PGM1SgBmW8F5I/5vyEhXIlPcIx+jCnFHK1dFBysKexuC0JBzFOnQY+tMLuruY2Orw1A7W0wQ1WGc0IyZCCd8+0pvDtz1p9nY87ir+CyPChdjklYx8lSb/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2ZxZP2e; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2ZxZP2e"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-519b63eff15so51644441cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219564; x=1782824364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8r5xr/NmciIo7ORHJ3QXFMLP6g3t6oGjq0toSBNYQM=;
        b=F2ZxZP2ezyBBitWDlBvGuJwoiZMPyDKLKG3lZGkyT4qSOfWYZp5X4me366g+x7+hQL
         cmeGWkeVIw03QlhKntBLmYGTefftFIGUAhNF8CPBioDce3NGEP+cYJNWlAYeW0IrtCf4
         AaiRbtQSBRN8QhRu9vQSSJWwXst7f8dxGzaSnWAuowcP33k/tTKd3dLWEUHHgd1QVKMo
         3CE+6ctV3tXTtvOQaTvc/SW1TtnMjRogCN3ntRjIiUI4hy3lcW404a+2YBcPff1TWVkH
         wm5B2LcDeM/8+reuWKhNN06yucO7y/5No/ccQ8mT68dEjoS6xMfdPUfjMFhmNGj2br/b
         hDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219564; x=1782824364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F8r5xr/NmciIo7ORHJ3QXFMLP6g3t6oGjq0toSBNYQM=;
        b=HYfZJGYyyO2KccHzUSZDRbw0uNuaY39JTvENCTugKmivzP/SNHKi3YGBXAZEikJf9z
         klysL1YqXCaVtEwTjFZCG/dnOcF01IXLZxbIuIIDuAN87Qd3RIvg5XZB398KTTRGjHb5
         W2KSpZISLVkGYQudG2X8pDfXdipEBs20DbpnqMd/+8C/2C7f8ohHLZueSXW2Ppbju1pM
         oKMaKDzCXQcj790uPmpgZu9rKFpvnRG7Fe0gH7E0B6S5dOd4suVQi31tzm6mvfQ+Zs+y
         Ohg+caxINEdT+weRsDoJgVmfb9kFRxoHjBsEl2tUle3qU+RSur1C0bhlcn9h7uvwXDhk
         qVAQ==
X-Gm-Message-State: AOJu0YxoT8UjZprv9ok1yqremqFLXZzC7Yniy29S4VMPU33PFZx65e5e
	fD3kyKMq0wJGt+RxK1Zx6nwtWdnVJYftNs2yla2FL5EswHw8IbnF7frqlzb7bwn6
X-Gm-Gg: AfdE7cn+Leg36tiiSfoJY8PWAjJO6fMWtyygpTVjhxrOImXbKCbRcfrm3SUHxQh+hI3
	rlpkF/r0QvALdHmXWSd1gnYZpVMKWi0cHqtBAJH48hfE7Vqq0lOsHcVRqgL1u88Ivp2Oxpz/xXc
	3ei+CG9l5b/uTfvKLDLOE8cyrFmwZf03MrMwWSEh+35aITZMaSTMWK4Rl4ZF9Q3paA2PKsNG6Cf
	iM6w2poRyeUHbxk8+Msw+NMlXy0+5rOyIQpFbL+O4EO9X07Wr6oU5siJbGEikQXiDjFcFzp4cwR
	UB+xGKoyfAn527I+vwXaD/DfPTz1oZXFOb20Ps8Q0yb6uuEJXmaXcrSHNUoB1X98qexcxUyQO79
	2zk9nem9h/jEXCuc5f9Qnzmg/9QhX94zeTgrBpZ2oJ0x9DFkf1K33qx/MS+67hh4W8JW2VzwUCh
	9zpINrlQc1q5LMDywUjqK5BGUX8KcxY2ymz+wqHcFvnxifdBE8VSP8pkPgIg==
X-Received: by 2002:ac8:7fc7:0:b0:516:d4b1:48e4 with SMTP id d75a77b69052e-51a558b92eamr34687461cf.4.1782219563870;
        Tue, 23 Jun 2026 05:59:23 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f01855bsm141447576d6.9.2026.06.23.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:59:23 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	johannes.goede@oss.qualcomm.com,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v11 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Tue, 23 Jun 2026 08:59:13 -0400
Message-ID: <20260623125914.833063-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623125914.833063-1-carvsdriver@gmail.com>
References: <8f84ca57-b856-4da0-8d90-e2be414f8997@gmx.de>
 <20260623125914.833063-1-carvsdriver@gmail.com>
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

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
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
