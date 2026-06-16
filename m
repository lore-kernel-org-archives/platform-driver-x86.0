Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C27521A459
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 14:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620518; cv=none; b=acwzcIO7g/xt9toCHgqavDcUpgz53wwfAt6l7+RUNeI9yMI1cL/9jh3gjLk490P0YfiMAPQKLQ1TQW8ULkCMgJGYyF+g7o8XcY5vdqoY5xugsbyZy0vWzVVa2VzKjh80kcAZcqMAVRcje23kRnTDn0g4WarCpzDsv1I1fOv3Myg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620518; c=relaxed/simple;
	bh=Zg4+zP0wTV80TxJ/Lm/sbGlz00er6sci0TVfyPMO8Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvpukdO72HZjjAZikdkDTONJOGagf/bzPo/sY4YMyWc8lvvCELdcSoE1YmAgbIejLR96ThPc6Z4Rfnm2/IPkZlWfFrG7WGpYaNxP6VKj1jCHEpSiEdbRdiz+wp18tbI5bmo9TVbUKm23NepMD8bkU5Lsy7+exrotJ/QsTqL15wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw70EIPN; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw70EIPN"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51775f2473aso35292281cf.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620516; x=1782225316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8r5xr/NmciIo7ORHJ3QXFMLP6g3t6oGjq0toSBNYQM=;
        b=kw70EIPNnp50W77f36WF0qrpBBWSdufbsuCTcvGTh0nr7qP4kPu7k9Bn7uWPV1NAZJ
         1BvXDszMGJeSJoqiIMsWTtV0feqNraaOu8QWzYYnNXBRLYiWDY6gZ6Tg16pTbCue6Y8k
         ZGuMG4Z7M5d3Lpr6aGyGQtuxlQVx8CpgXo2ZwNsr1hB+s/ZAi+LglomhXC+hhpUOeTtz
         RliMwpxI3ROFrMfSZ7Rkn2OWgK26bAQmvQ60zxXYIOEPa1E5Kz/cUc+nKDazKqkKcZMY
         iUvxQqoiT/lTisFcMFjsvQHpN1o7LgF62EnEEZGjeg7D2rcf+XGQA2MQNqfQ4UZdodPE
         lUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620516; x=1782225316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F8r5xr/NmciIo7ORHJ3QXFMLP6g3t6oGjq0toSBNYQM=;
        b=XFCwsU0hQfMNq9U4M+pzb0l3OesUWBHswTwuMhOUux57JjP2uXgzbuieMNPP4k3xBH
         bOuM0mePybU+xmVAT4bpN1WHBl8nr5QRI9B4uVTOujDCdWu9uw7kWlQdp67RocexmRok
         bbWGcb9H/ieYZs/DKuJzoOB/2/USDHslmODpnXVuzAMAJRM9IzNoivRBqH20TPnaLjui
         T+fcmCqgZ/qSkLMdANGU8p2tXUdPS6PBPs+NxDRMPpUM5gZcKHVUUINt50yHy6Z2qM06
         6/lR/MbtnPfmHZc1H77bVwtzO4Qw+Zgb36suoV3dpXvZDftw3t4RJ7JspRPl+Sw/Y9cX
         G3Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8VjIG2RRWAyNjZku/dAjqtLyNxJsnwWDBq1R1pGuzTDKghc0SsDCxJbNPj4e6MM4EQDT78XO5MZrACTF3qT6cgrKR+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76B1FiivvCTB4OwyjV3e1R2Q5Y95xzgrJo9sdtTH70Bax0L1Y
	MnVfDOHXSJ96pSem78NXZcY5HsMiZoZC+7D0QNx/NlYxHv5wb1i6KqU8Z3iH5tCV
X-Gm-Gg: Acq92OHLhrq9F4PCNdYXF0mZCrmbRfNwo08A8FWqwLLp9PifcHtRq3IaFYiD9QJS8n5
	oKGyHi75EMjhWVsyH0f382Ui9VbGW57Vxo1it1v+AFZ2donoF+o8TcjSllZMqCjSrU1w95UFSxi
	kVa+t1BNdsCneFLwYWN75CeSLOQygJ3zm/ExCShFcRYwtzTtZKcEfkkPWdJXctdLR4vtzxDUWO8
	grhwI5Qx0xkOcGgehiQEf9t7x9rAYIJiMFYBdt9zjggWkp/R4aJwpvzmylGeMBjYdEyu9gOYEbW
	3N+9MZoTNINTMWNAxKXiiQVtZXz4yULffXtB34qFy69uMZ82Y/Gt3m9qhJE4Vb/REVLu/ef6Ikj
	t3TJXs+UVazbteE1MqALWPabZOvKKpyUCE1VO7nrJT1ctmlO5y7S4lnwuaVntTqPTuh997wfIbW
	LEoXPcvBi+pbjDg5cQA4kDr62dkgmBKNMVbVQijDQrEUbFAROG+x9bof/S3GA+R/YUHwnS
X-Received: by 2002:a05:622a:992:b0:517:9648:f71f with SMTP id d75a77b69052e-517fe4f0d5bmr285002531cf.45.1781620515541;
        Tue, 16 Jun 2026 07:35:15 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm141855521cf.14.2026.06.16.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:35:15 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	Dave Carey <carvsdriver@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v9 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Tue, 16 Jun 2026 10:35:07 -0400
Message-ID: <20260616143508.124122-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616143508.124122-1-carvsdriver@gmail.com>
References: <20260610155340.342949-1-carvsdriver@gmail.com>
 <20260616143508.124122-1-carvsdriver@gmail.com>
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
