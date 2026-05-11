Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C73FE37C
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510522; cv=none; b=gPQb9KQAHDsiTNB5DzOOwU5U4SAAo9qWebmfj8qq8HYq6UlhVc+DPGrScCDKmi7KGaN0xcmDgM4qel6Yd/OgRZXOx9qfPQwop5+TClKA2MVm1G3bfR2vzFNEyOTEw8h4YKZ8cQlHG1xqIyR+DmOtk1ARXVnhzLJxtEOwuB33mns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510522; c=relaxed/simple;
	bh=Y73P+DS/FTU/93/7veziKipaMWdTKZWFtdrT9hZPEZ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evdECXyCc0h0JfqORmi6vfEG+TFMcUFGEysj1JCgX2MijIa9974tIjlCNCdAaNhnOghPajiSK2qEfOYmwUDmfFgxnOB/9Q2maUe8on8fRFtkBxSID9aIhnQef12J6xkkL5RuIcpcgNcn6o3BEoX+/+3bFZ0wUMVn+/m3ewhH2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLK6hae5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLK6hae5"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8025500cc7so3132816a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510520; x=1779115320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QMruzNzp/w/H8WMl6Rm7xeR7IZKT2QV9Y6KPDlL64Q=;
        b=BLK6hae51WcGJrI7CQVOQVyqr0fs6P7kAD1QXrbHTBEjCyLLbxepzGX6GNWNBsJ2k3
         KWFi6PHCVB9oRtsJue5pveKBG4gz3YaoS4aNhYtfxvPVtLGkFjm+H79ZnLxx/wgeZbIk
         rp0fk1yXcgosa4v567iQvjTkFPU7o+XHg4YD0jak/RJvEIqXr4sW3+XD5PkHbzUm+tBa
         vRumId3R7vS3JZxeB6xYAD7HfH8TBPruwMsoaiGFd3dUmOWEig5CxJvZcRQAH4AJZr9n
         DQuTXaUGTgU1sL7aoJ2VbX28K2kZrP0pk23cRdbRsUzEHnUZ3cSYZY0xCFK2AG82V/j3
         /pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510520; x=1779115320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QMruzNzp/w/H8WMl6Rm7xeR7IZKT2QV9Y6KPDlL64Q=;
        b=iVXp9XxtdpggJNx5W7oBzszepbaoHJXrlaeDmhDlaErY3UyjFgAhXbjLJPxGAxlDOM
         crB8/t04xf0NXO8QEU6h5/5PAbSz8q4ATqae9PwUmM/OEwO5fNxepN8MVfS3Y8ZfPQwm
         TAWwF6FjcT/FkoRJAHrLtu9OleusMnJsZNkO7WXiywbgT4xeXLYdaYZ3QJ6+vJ+Pr89k
         1E5TTZnyjqJ2EVh8ZyowbqsgmbOCHs+0xfByeO2QBcHZc2Y+dRmvp0deI2Ysj8nWaDKV
         /hDZyvMu8scPwE6KcyB8A/GBO4cvkp0YoKkM7/eV6RfVd8D4aQvURLsRVQTh9Xzbtjoz
         RTOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/L7R4V2lFwV4I863mehoHS/ycEdJVfd2LIauMyoXrJsHOyX5q9G4Hj06bzW6f3r8baLpeCJ5ORC8qe0MQBG8DjPeGy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3zel8faDHNVxKeyMyfwAznOJcrQnSLhwHWvcYga2JTNr4Zv3K
	34ZUXoPoDUqcWUq1mYZtpcqhFVSRczk4qbKai2VJxEi5Mbh4Tw5me04pSY1tbVuUcIA=
X-Gm-Gg: Acq92OGMsFQFuBxcnJUjV5Ca6J9R6IAKpN5x7kvBReQhdB5Hkq/EQlYlHAxcTpsAdiq
	MzHsnpRchXVPQ8yGCMlLf68NASPrf/eAcEgFZTmOYj4mwZ7g4EeApqGihjK295LuEpp6y6SNpGx
	VUcgHQOv7q0UWwiSdmi6CzOQUzEyZFHqvG+uiZRqlHjJVDG+T0HjZilrRBz4EDO3rxmVVbkhJ5I
	UhrzW1CvUqi40kJiSgBKBWVsHIkxU3VI1tHFMmr3QO7JOWH3FVhdERvGb4jzwAnDdK8qiJxw+Xr
	DZaXwTfDnVEW6bjvKOkdCtQ0fPKEJOqY8VZWtMlKS3aJyVlKifCRrZHPkTJAGTNAbegs29EjJkI
	SULOS75+vyea9IqRLijkMv18XyRfHD4IliR7xSn17hG3X216DwGWuvuXAGgPVBkSZQs5pud4+uI
	nIbJCSW2t8ALxav1aQANB476XfUghvXlZa69dbjkrtgKRvDToGwEJLYW2sUK8Z8683AzBCbhtZR
	d1vuaSR7AE+cA==
X-Received: by 2002:a05:6a20:a106:b0:3a8:21e0:1ffa with SMTP id adf61e73a8af0-3aa5aadcc7amr26724961637.27.1778510520189;
        Mon, 11 May 2026 07:42:00 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:41:59 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/8] platform/surface: SAM: Add support for Surface Pro 12in
Date: Tue, 12 May 2026 00:40:52 +1000
Message-ID: <60b41585fc437d8f0090466d774161f1ea2fefd7.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a SAM client device node group and registry entry for the
Microsoft Surface Pro, 12-inch with Snapdragon.

This set enables the use of the following devices.
1: cover keyboard
2: cover touchpad
3: pen stash events.

The battery info and charger info devices have been
purposefully omitted as they are also reported by
other drivers and cause conflicts.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../surface/surface_aggregator_registry.c         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 0599d5adf02e..884049961415 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -422,6 +422,19 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro 12" first edition (ARM/QCOM) */
+static const struct software_node *ssam_node_group_sp12in[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_tmp_sensors,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_sam_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	&ssam_node_pos_tablet_switch,
+	NULL,
+};
+
 /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
 
 static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
@@ -500,6 +513,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
 	/* Surface Pro 11 (ARM/QCOM) */
 	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },
+	/* Surface Pro 12in First Edition (ARM/QCOM) */
+	{ .compatible = "microsoft,surface-pro-12in", (void *)ssam_node_group_sp12in },
 	/* Surface Laptop 7 */
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
-- 
2.53.0

