Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E019E381AF
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Dec 2025 01:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764551756; cv=none; b=kM01NLDj4bdFynNL+zZseRfbMvuD8Ce84IfgNZ6qeJs8L5Yc+wUqnyFgekDq1OVJsXQxB+lzsyTzkrX64GEIhOMcwMX/+FCeEGw2+2wRuXuAPHqXtJBurnWQoDE2tft567v2nVt/81wGUcaKLNd5SvzKrhwG6MPDyOQO5NgC8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764551756; c=relaxed/simple;
	bh=fpUkE9ULX/qiNIgm+freNtTLYgz8I2UojpJ1nQJV6z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAqvTpMz9hhhzpCBVNsu5jeAjaWEHy+kt96VRV+OXtwsp/Km5eNIQ+qq/TO/3qzodTyG9rgcG51sPGasDU1WYQkqTI/U/po/TsUyJWzRIW6zkJWBD+etSRg27yJTcZI/nZWcYYzaQjPuNRBycbvjUz7cjAnIe5j4rtcREoqLgBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsYtRkj4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsYtRkj4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so42481105e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Nov 2025 17:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551753; x=1765156553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNWknMZFPXFAx6SymlKZ6NLCFxgnUo2lmZCpszapuiQ=;
        b=nsYtRkj4TBqTWJy0q3uR0ws1iSw7sakhmExtBLL3TM7FA71aVyab5XvOrHuc9znkuf
         uefovE1Kc2XEw2LWCRHA1G582TDh/eoAmWUzSERElyAD1EPZH6X4lulY9fjTUH72hmv+
         SnLNwc4ZcarDXKfOzn5OCSvYrD5dwvkwSTdNTbk781TFf0oQ8PpQlnZcrzSxX2DbXBnT
         3fGAinKN/SV6m++ZPPa1w9Sug8QWH3AE1Qtgh5aTo8wxWjCGs9Uf2Z1FEys/CJlIhAet
         vDo5w++p0eXqy7WtFAGafGfFzwsIH9fc3pBCZBDm5Ea09coxZbR2rSoK04b3zJPbSXog
         3r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551753; x=1765156553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNWknMZFPXFAx6SymlKZ6NLCFxgnUo2lmZCpszapuiQ=;
        b=cjL3GaSw08rFq24qFYuZnB8eGAOIOyWO7DXbmeK/LUYO1FB0KVgiUmybdCeWsYepSJ
         bT1RVMJ9uw3J5V0QRb5jadWWsN11O9eP/hB3Vr08PbH1zFog2T4+GjgMlRGj9wBZDLGU
         M+0B3t4GdHDablVeXrJ0PIlkXelzkZ99sdghIr1hX2O5Op7fw8TYgtVP51lk/OTN95Mh
         MhgfgOrPPvg6ILnJPbiR44R59MRwQ+NLVEcGC7fwyyAHCltUBzuJt//TGgzTvs2eFPcx
         qqz51i56eoqezvFuIpqnjXtbEKFoGngV8M+sFZhzdf30q9jr9n9ey/YOk5uIXSWg7iJx
         zLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXJXs2gD40CrP7knJZyKl9EzH90xmSkMKrfcRIHjRFbrgFl94LwJdb2XUoMgJhG4DdbRm8EJxTwEtnYfg0QVo9pZMD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3TR7Fm2umwYOjyhxTs4vS9VgHacCsuzp9iNV6+8fjT8aMOVlx
	4a5koYAJ/4otmYyo9vp12k4bGXlONhq43UKYvYO94W35AiSZWl2nao/jZFYwB9qz
X-Gm-Gg: ASbGnctbMJ4MPKtSrb5CEdadeJ8WBVquXx643XSbFR0RusOGpS9LWu949LXAndk/EgW
	e5n2d9V33gDwMeBVNWxIxrdLsoDof/llXwFrhFbljVxZbR8wm7+wKHrP4GP1IkzBIainIMGy+1Q
	vIUas4cSNZ0nir6KPqE0/g5q2/WpYKh9ZciTkeyPC5rjzSGTUsqGCZKrXeq30a4qPMX1putuONi
	xtvq8ycASKW9muCSHQ3EGHftG2JFPVVBYXze5ouuPXmL9ZApnsDunWA+knUdv6WeArD2FkipQXK
	8uclNs8XIWx+O5/oSR6GjA7XizopiFKKIXBLyRIQnQGphHorgeRtAV06NnDou3VydRsgPRKZf+o
	3iFUMpswzbtpMG5N+BYv8xPvkRw+xPYGzPrnJHEmE9Zv20dEtLIXlzgCXsC/wQBbEMl6EF2CcJ7
	vp9NpILnhzKhl00XR+YW9N01kUgqffisqIfTRTAm3ox5QAo0C/OjM4CQ==
X-Google-Smtp-Source: AGHT+IFdfAWMgKy7dIfy8+I+uS0Vi7nXIKnPE4HKi08R8Rbs2lfgQtD0jd9Zh7ZgArMkeFo1j1T/FA==
X-Received: by 2002:a05:600c:3b9f:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-47904acef58mr277229905e9.1.1764551752934;
        Sun, 30 Nov 2025 17:15:52 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:52 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] platform/surface: aggregator_registry: Add Surface Pro 11
Date: Mon,  1 Dec 2025 01:14:44 +0000
Message-ID: <20251201011457.17422-4-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This enables support for the X1E-based Surface Pro 11.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 .../surface/surface_aggregator_registry.c      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index a594d5fcfcfd..e08d029e0856 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -406,6 +406,22 @@ static const struct software_node *ssam_node_group_sp9_5g[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro 11 (ARM/QCOM) */
+static const struct software_node *ssam_node_group_sp11[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_sensors,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_kip_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	&ssam_node_hid_sam_sensors,
+	&ssam_node_kip_tablet_switch,
+	NULL,
+};
+
 /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
 
 static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
@@ -485,6 +501,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	/* Surface Laptop 7 */
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
+	/* Surface Pro 11 */
+	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },
 	{ },
 };
 
-- 
2.52.0

