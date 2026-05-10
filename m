Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE7E2E11A6
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387164; cv=none; b=bR/odlXEN+/libfhh2SrAZpketBh5qSOsvxMhW/cMmzFyshE/7N5Lq2Yc6T1XZm/F2JuCt8AS7KdCbokbohfEJ0U36cvzb0j7/X74JPpJWw+gbVv3h/LtV0uskTvkx9yTfzz5/bHyvccYaBt859Sdog3gyKxkqUDaCq5d8oU2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387164; c=relaxed/simple;
	bh=cMLvcCzRf16Fy4OllrJfM9VTUlGAhvt/d2WJ+ZYZj/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HL3TZVO/45yQz2VHDIo2+HoeF9GRrhf/sFVPrChcOqdz+Ee/LlAkyIwB2rwbhscKYsfJUBt40ifMalDcnSOxN0S5BksK/d2/TcTEXrOl+YVTjapik+GtuPHjmuOsUiXT5J4+UomNq0WDocgtdyQjqSbOZJzqQzAv1tCZ8iRhUwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kARFxBVi; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kARFxBVi"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f3c623322bso5361494eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387161; x=1778991961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwkFBGvTENMc4sGLGliEmbZKBhpnHayO4oiqQfRUuMk=;
        b=kARFxBVilkFJZsKlFCpaPVYnRNMeZPsPPC8xXYDzSZlE15sq0HexUjD/5vqfbcqigN
         8QfqkHoFFivrmLchgntOd1tEpN8aPlYC24iNgBKTTEY5XESUKGeOzg7YVPUtnhLIkee4
         8jd0ig2oaoaC1QJ8xMUjTcMkOErL4MYt0YT+eU5wOsbHaY70h+Zn1j5GT18amwxoF0Zu
         N9WWZPPxqUL+uZi/1fBw4Z9blBETsXCpBWQW/b1z+yf2xjRmfoZYOsuhrEwFQxXJxOY9
         PlGd0AWXavXIO+X9gRubxvNTY3gZE7fz/0fIWydDpSCb0PIfu7NG5QlPSaq359i5fHZZ
         m8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387161; x=1778991961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwkFBGvTENMc4sGLGliEmbZKBhpnHayO4oiqQfRUuMk=;
        b=IIoYkO/Bf5rkZvZmvIFpnNgmtlC1dmzv9V1zBfHe/6NbGbJSq6qT5A2LpWH/Q//Zr3
         jSTJ2W1Q2C+9eO3hctwchsr5iUXup/CBSWEon6Lt51KnyA8ntkYmsnvc8ahcdKoT1254
         c+kiNluxRb6yp+JB42YAz/7thVsaWFu8s59NVK+AVSp/4Ygn449O7HGlTed4nRa8r7f3
         PbP9Ru5oeopHQqF5OJ1bTx+mDdGQRGVBOdUIwViysXch45H6f4A+9eyJF8DPq63Ald3R
         6ss+isdOXEpQN+zfJ67iIZUKQX2pUNwKzJh3BlddnknHtdV43xGgZRLlCucO1Eudwjcy
         iq4g==
X-Forwarded-Encrypted: i=1; AFNElJ+6HqJObJ113hU7fSfgjWqailCuIJ7A74euO3evqMBh6EmnJA1GAToDoRmVbbRl/6X0AwfGfnuJlYy2wEOiKDv/koUM@vger.kernel.org
X-Gm-Message-State: AOJu0YzseIGDgj7lNYmkBvvu/k0gVGlRFvbLDfoltPXQbxq/Yss/XmPN
	ZaqXwXtYaoFr+2GphjKKmFchlticWBhJpeKLQXD+MSdgZSZBC9W8N9hy
X-Gm-Gg: Acq92OGZrvE94AZ6DHRFiqoqADNa0+qFtovxFNbAYOHAk0KLblnQH601E1AZRTDcLsu
	wFyUR6HStltp+ot5ccsCuiZUzNPs4IiTk2TIu6YygNJuS3l1zBju/7+Wtusaaw08/rV9eD4RU1P
	IIPO9aKzmOcceHiempk8gw/65ahuTqpwD5A9gIR0KynjbR34C+O5Ftxt7YFG9HYNvTvgQFbnMPH
	c4jA99YAfGzPS+kp/VZw+OE+N0XC8797eRYzEez5fp2PPBxx1Z2AswJ4U83/nUk91IgzkvHaDlA
	dr0LDJ+LrNfsZzNx+MV6j2J3yvES8a4/4RlkKB/qPG4VCL3jm4e184yliKKlXHpuUbQBZ6pqtlN
	ElWIvKoR9F2+l7rqgoKT8wYczw72IZiNFYsZUbTFp6nO2PsaI+SdLH1eRySu4cRYSmMxV/eaHsW
	G7F4NH8PKp0N+LB3Z9a/8RNOYDkRLckn3L7kOaT493Mz9wFL2IwjQqlj+IrP+htPX8AfKPE3yjK
	eD8
X-Received: by 2002:a05:7300:3b08:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2f54d15fe7amr8804109eec.25.1778387161244;
        Sat, 09 May 2026 21:26:01 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:26:01 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 14/16] platform/x86: lenovo-wmi-other: Add force_load_psy_ext module parameter
Date: Sun, 10 May 2026 04:25:44 +0000
Message-ID: <20260510042546.436874-15-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Lenovo BIOS have been shown to have incomplete and/or broken
capability data and WMI attribute IDs. In some cases the capability data
reports that a feature is not supported when the get/set methods are
fully implemented. It is also possible that the ACPI methods from the
ideapad_laptop driver we defer to could be bugged while the WMI method
is fully working. To aid end users in submitting more complete bug
reports in these situations, add an override to skip the ACPI and
compatibility checks to force load the power supply extension as if it
is fully supported and has no conflicts.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  - Move the force_load_psy_ext into its own distinct patch.
---
 drivers/platform/x86/lenovo/wmi-other.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 4d95a9109f5e..007fef658bfe 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -185,6 +185,16 @@ MODULE_PARM_DESC(relax_fan_constraint,
 	"Enabling this may results in HWMON attributes being out-of-sync, "
 	"and setting a too low RPM stops the fan. Use with caution.");
 
+/* Visibility of power supply extensions */
+static bool force_load_psy_ext;
+module_param(force_load_psy_ext, bool, 0444);
+MODULE_PARM_DESC(force_load_psy_ext,
+	"This option will skip checking if the ideapad_laptop driver will conflict "
+	"with adding an extension to set the battery charge behavior and battery charge "
+	"control end threshold. It will also skip checking if the BIOS reports that "
+	"those features are fully supported. It is recommended to blacklist the ideapad "
+	"driver before using this option.");
+
 /* ======== HWMON (component: lenovo-wmi-capdata 00 & fan) ======== */
 
 /**
@@ -898,6 +908,11 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 
 	priv->bh_registered = false;
 
+	if (force_load_psy_ext) {
+		props = LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD;
+		goto load_psy_ext;
+	}
+
 	/* Deconflict ideapad_laptop driver */
 	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
 	if (ret)
@@ -915,6 +930,7 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (!props)
 		return;
 
+load_psy_ext:
 	/* Add battery hooks */
 	priv->battery_ext = lwmi_psy_exts[props];
 	priv->battery_hook.add_battery = lwmi_add_battery;
-- 
2.53.0

