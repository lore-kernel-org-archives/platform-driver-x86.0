Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780F64FB9C4
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371003; cv=none; b=EKWq6hVADSSc6diSl5Fgxh2uE786+kSRsITA2BrO9cxjA3NrSvb3mtj/4RDmgTzmfyoQpJ51qK8q76i0vPMCA4tj24D3NMyqP/uhkb2ssHwm4j+/EqrypF/LvnxqOVx7mC1AtBQhPHThcHcUoJHhR7b2h8UtfDiAFpZRT2ihgFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371003; c=relaxed/simple;
	bh=j1V0Ff0coyQcTLI3CpAzGM60yze7t0TzabVn96CgoWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZQtr3MVD+rHrgut2olptIVy+EsUSMsTAb+VQz9b/X3xUVHUBtaRBa9CI7zn8MNyisfbtoswiP6s8F19+V/btgsotMz3Nqp5Bw2j16RqQ460/tF/PI/5CbvveHSU1KcNe7b9p75y1kghoQx/BnjJoiZNEAD+b+mZ+fBwoZYJny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVseaeAv; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVseaeAv"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so178364f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371000; x=1790975800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqQR45PgbfT7V9sVuIzFCMVeJwigG0afJ6PK7q1+V8c=;
        b=JVseaeAvCU7+S7+GtG4TyNWiaHUXDehIIPzuwYKxNVmBWLtUI0b5b0OcN1tRGhwkDv
         xocwgR5dUYWSWegx5LX5mzcD/TYrAtJqpUGNzzin44otDaHjpIxiGAy7i7vJRt3sixJg
         mczb97m5B/qL+iun7Jh1CVKqEQCs2Ct115UeNMroA85cL5Egt349+SeNyCOldloSbiy2
         DB/Su2IS9BDjreMekI0VUWdWOo/IfPXRgO46sYLLAsDCn46rafVjyuLvo6iuOUjrLid0
         89vwSpFmsKIFQjPqYZsvR1DWdqU+qnET6bGt7NEyjjCGCvSk2vwWAd+LodZ8KaVRcQvO
         Ka+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371000; x=1790975800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HqQR45PgbfT7V9sVuIzFCMVeJwigG0afJ6PK7q1+V8c=;
        b=mSCalRlA8ly9+P0/Qw91lyQEp/3iA4viHO+i4J+wOese1k07PhHTwEfsDR2V02CFym
         gP6Y/2HUEnvFN+UGDY1JMOS0eTQ4b+PxZvzWY0NCzNx18E4msejUPupZujQrsMaN6XT8
         XYAxQhvsr8Weu+iHDTOVMjOodSxiVnewFZHr+WT94W9Tj1esJcdnzBJYR0CyikPgXxL7
         kljdtSKkMQU7/4/60KfbRH0gcqWLfK0Z8Wal+dxBpowDTG9IWkBsFGQpwnR9OUh6oywt
         Ra/3GdTL/TPcdh+Mxw/h/ZAEZQNgS3IIelFnmkovQdgVSBiTMs7wRrdgrSXCpUwTLeLu
         olhw==
X-Gm-Message-State: AFuF++m0cRqxGJjCDyH6sNsFR5jXBwcu9Cte1UwXEfpFhAjtQ/vZZzdl
	BvvWgYNV1F0xU2lCreFSE7jR4jafJ2wWB//s5uo753pECW+AlBmhxVf77SLuxA==
X-Gm-Gg: AYBFou3PtqkxaVX6XcN5nfhVM438j/ZmjPzDSYQQmydK6zsusNOowURGkGALRI6E415
	2Z8Udsx90E5OQaQ8ONk5v31UD0YEDKEY6n4BtoYNMFnzkVOz5fhicz6xgZbtOfLcQSfpww0sJy4
	7+YvNdQoT1NPws8fuTnpq18y6qjY5huDQxg3g5sr+yNPAHanR+i5NMvI3wZgOJ7i50VUp3GZmYe
	EIAzcZfCOMNxmX5KekX+/AVTwWXZnnvrL1lX80r/NrLRCCzbTtlQf2pjR0vzVD15qsFIamoEukf
	gBEUPaxcoBNkQB67tTus2arS2rkHdHUFu7KokfhIFiV0viNnIiiiJDDKJpJRfb3WRqE6eHd5AVv
	iq6TKCAfqNs7s2C7ncYQqhjPEQY6Wh6SPYY7aGm6DFUzRY36exovznLUVOnobElTfvXiCOHO4L6
	unrXQdZOuMGlt9dIM8FT5HwAMImqQsrKFK9jghvw0NC3FTDJdmOrIirBQQAuIr/hUmKv9zPxrXa
	RLrn8HS2g==
X-Received: by 2002:a05:6000:290e:b0:487:27f9:837 with SMTP id ffacd0b85a97d-4887170f426mr13064121f8f.44.1790370999654;
        Fri, 25 Sep 2026 14:16:39 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm9271781f8f.13.2026.09.25.14.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:39 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH 1/3] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
Date: Fri, 25 Sep 2026 22:16:33 +0100
Message-ID: <20260925211635.1422516-2-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211635.1422516-1-amad3v@gmail.com>
References: <20260925211635.1422516-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
existing entry does not match it.

Use the Stellaris 16 Gen7 AMD feature set, but with the percentage charge
limit instead of the charging profiles: on this firmware the "balanced"
profile does not limit charging (the battery still charges to full),
whereas the ACPI _BST method reads EC_ADDR_CHARGE_CTRL (CGLM) and reports
the "charge limiting" state bit while it is set to 1-99. Setting
charge_control_end_threshold to 90 on a full battery switches the
reported status from "Full" to "Not charging", and charging stops at 90%.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index eeead0159..beba5a76a 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2787,6 +2787,19 @@ static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_USB_POWERSHARE,
 };
 
+static struct uniwill_device_descriptor pcs_recoil16_amd_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE,
+};
+
 static int phxtxx1_probe(struct uniwill_data *data)
 {
 	unsigned int value;
@@ -3268,6 +3281,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &tux_featureset_4_nvidia_descriptor,
 	},
+	{
+		.ident = "PCSpecialist Recoil 16 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
+		},
+		.driver_data = &pcs_recoil16_amd_descriptor,
+	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
 		.matches = {
-- 
2.55.0

