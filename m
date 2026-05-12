Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B447E37419B
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 23:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630297; cv=none; b=h/zE/zEKx4xnI4Ytk0g46PKy/QI3zyLNDSVObVJ5GRHYxTUlA2toUmLb7g0hYzH7y5k1aiRzUpvYi+gcR6xYHZ32LKw5J3Em0A11Oj+10D1ZyF46PgfsGwtb8JU/BB93mJghB2Pwvb5Zsyk71hEoljasyNCrg3tXQ3w0UYDtPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630297; c=relaxed/simple;
	bh=vVU5ca4ZrYFEp728QuuxNejz84yy8dbrZDDgPuVxjdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fW1xTHZvJN90v9S7tgf7pIMtWaIeCXm8c5j3Ak9Ujom6SYeOv5XUrO7ZSqCgDQ9uxSoLbPcwOi9nOqkhe+Oo5q3owDGeCQKJxkm02f8GZaSkUohbJBAUcaSL5dXNlbQTNn7UahVnuu9SzowykIoI4JdJMG4lG0OwVvdREsowF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTcD5QV5; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTcD5QV5"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ee1054627bso5148159eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 16:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630295; x=1779235095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCJC2OYJjDBPJCpUjZ7QH30Gry2bxV2/GyYziaCQI5w=;
        b=qTcD5QV5OfNPMQu2/RO4AtycST+psYE4otZtH1GOdIAmYk07JpxC/hRDQXJZ6DLEHq
         bFvhWc/GKASvjcUga2RavtIQLD3xG+BbRNe8U4JJvcXb4RG1Td0MiqPfoe3sU6TQP9MH
         uN+rsBoulSgas9ZU/wzlPW3XQXh5OPkPQqyd0c0WmN9V8UGA5ayO4+WeVb1BFKjt5H2V
         KQeIlJABM+ThpfgHLLvID+99nQbL0R5dP2gICkt3nc/2JScOVMwqvPNWLpObsr4yHXH+
         WnHp9melEpdA+uZFbDcSDS4i3/CMU39wKpcuLd14f1+zrtX9ku6tFU35PgXojEo+Vr7Y
         9ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630295; x=1779235095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCJC2OYJjDBPJCpUjZ7QH30Gry2bxV2/GyYziaCQI5w=;
        b=RVMIway2dx5s7EWetnNW4RX5DLtKLQFdiFm0QDrYNKoxxfa4RJwKtrV/Bjt/QpS7vL
         SeP5Epu+QkTPCHPA7PfE4TdHcjp4MtzeK7NBWDofUIBPCQGX2FsuydJy8be53Xt02I/R
         boOIOke+vy9okcLFMHECr7sEWWsq5kT9uvwsLpR+hytEhz1A02V9bFYygBHJzApJ2AzR
         guLW9yrYjoLfVqPw7qrNNNT6PBbLR09JkFwR3aYda4WJxCuUrl9T060KV8lkpSpG7tEn
         ocHFtksgl2mZxJa0MSW/KjIoV8Oz8P1dVOckyJSRuthzPr+wC5LbwHdnRyAs/k3uod0n
         PMdg==
X-Forwarded-Encrypted: i=1; AFNElJ9kB2P4YPOJzpYibWpBaEG4hrhzj97h7jQ+cU1RXewwT3BVnR4/0oCpLv1z4tEvYaLx0wXTsb8I+PmAShc2Z16PwbPT@vger.kernel.org
X-Gm-Message-State: AOJu0YxBN0EeOQ1hOO9yvI/91wqFonKERYVPmHEPSEwAFFh9uHsVxZQE
	V1gmIj0AFpyLv43lfXWBz12WeYTHBPUwUu3c0QJmaDDAbNtF7eESCzo3bhGtXuRz
X-Gm-Gg: Acq92OFmUSrp/fydLmTjAnU5u8ZBPcCWATjO852qjK6M5B+TN2ZU7PHawntS7IQvboC
	0xiaZu2joFo/8Vkz/mopRgcepB+hMnsalFt/ZGgze/8sF60xiPmZgNl795nl0I07LsjWLbjbNXG
	EfLtE+2S/BS9EAmmNd7wlQoE215DVURClCeDZwuSdMLls6wAiggfiEebnHs0AcG7moSJlP52uMl
	0feO1EmAHmltSzSIRQFyK1slc2I0gdQQD9sHvtVHUMin+5Ghfqe5WlLPMZ7BaY9j287WrIL3iBc
	MpVArEjMR1V0ml6jwI9LgWwrBp3sThdHqVh6Jbj4wrEPfweuORfv7LA1SaIFOM5Vep4IHkK+3sd
	l80ffVw2JRijB4IFgeAw+7Sk0v4oqwUqC8T+TfMXSOMFhvu7JpYjSqhyLke4NUUGlQXUqaTk/G8
	RAWI8eUQ/Vaqb9x0ZjeZW8Ii4hGyfo6i1YQ3FkAUu8Jei4uVTPagbzfgSHEQvzjWWzwjyOleAZX
	eAYTwnjLSsbmZM=
X-Received: by 2002:a05:7301:6096:b0:2d9:1c9d:fc22 with SMTP id 5a478bee46e88-2ff96344cf2mr3376758eec.21.1778630294968;
        Tue, 12 May 2026 16:58:14 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm23625851eec.27.2026.05.12.16.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:58:14 -0700 (PDT)
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
Subject: [PATCH v13 5/7] platform/x86: lenovo-wmi-other: Add force_load_psy_ext module parameter
Date: Tue, 12 May 2026 23:58:06 +0000
Message-ID: <20260512235808.691046-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512235808.691046-1-derekjohn.clark@gmail.com>
References: <20260512235808.691046-1-derekjohn.clark@gmail.com>
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
v13:
  - Ensure is_writable and is_supported always return true when
    force_load_psy_ext is true.
v12:
  - Move the force_load_psy_ext into its own distinct patch.
---
 drivers/platform/x86/lenovo/wmi-other.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index a423bd563291..9d5250d41a3f 100644
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
@@ -755,6 +765,9 @@ static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv, enum power_sup
 {
 	int ret;
 
+	if (force_load_psy_ext)
+		return true;
+
 	ret = lwmi_psy_prop_get_supported(priv, prop);
 	if (ret < 0)
 		return false;
@@ -781,6 +794,9 @@ static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
 	struct lwmi_om_priv *priv = ext_data;
 	int ret;
 
+	if (force_load_psy_ext)
+		return true;
+
 	ret = lwmi_psy_prop_get_supported(priv, prop);
 	if (ret < 0)
 		return false;
@@ -909,6 +925,8 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 		props |= LWMI_PSY_PROP_TYPES;
 	if (!props)
 		return;
+	if (force_load_psy_ext)
+		goto load_psy_ext;
 
 	/* Deconflict ideapad_laptop driver */
 	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
@@ -920,6 +938,7 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 		return;
 	}
 
+load_psy_ext:
 	/* Add battery hooks */
 	priv->battery_ext = lwmi_psy_exts[props];
 	priv->battery_hook.add_battery = lwmi_add_battery;
-- 
2.53.0

