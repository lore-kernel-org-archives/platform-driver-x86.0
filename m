Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3C37268B
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257273; cv=none; b=jEC4WXRbbuCm+WW6lWJNP2qVq9atGDudmZs1eO0FyF+nDV3GgmmSiMp1HdwcpnImU+eCaADnPBbqAIa47jf6u3dyBFCWiVMqWeo2lVC90VPnC7MVqZizH1Xe2Su8PWQMZbxXW1CacgOsdxDC7eCNwR5ZczQ81vqkuZZ+cvbN1oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257273; c=relaxed/simple;
	bh=ix2cnLN05qDVBqL5Ivaluk5AD3bR6qaGo0PGT4BxaMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3mTG9nfc6Us91wAUXwvJQjqoGK3yH/bFkpJgHGqNQpPRN+11iNKpOUCATUbDRaXSUKbfpSh3dYSywrhVQNIvQ8PmKL9KzT3xMi8/ApeVO6D/vDOPJZNmCvtGE/oIX06Xw7cZEpsQ776MHBA52xNgXMZC4U53JPDz2HwUy+Q1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxYSRCoQ; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxYSRCoQ"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1329fc4bf77so1378165c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 23:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779257270; x=1779862070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuX4siZvKFowva4pFQaHeUAjFbZPfs27UZMsgCXTI7Y=;
        b=fxYSRCoQauABHXx7lDagQ88OUxLDvilxThsHgE8PYF2nh4++a4N3BFWrjRM6V/29z8
         oCmbpxDEAOektH18tqXs0OFE5yfy1yzQDr/AmhN0eaFUMxU1pEsVQeHpmk0fZlseMG8A
         bBOm2KACnqMCd9WC9p0xYZ2mddlUrSvnjPlUD+gQi5rs6mR0X5H2NMpETAlyfJT1p0Vl
         H9t4rIu3Wz2/8tHxZ70Ic89oN+GaZcLDqg1L+hOuCHo6qlb1hZlHE+nnXeXfpW8fDGfs
         hv6JZ3iulDUvPkaj4Yc0B/FfgLB4+5bzn9KGuSlDkeX9yKG4fqKODJr0Esz3efsHD+ro
         ATXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779257270; x=1779862070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SuX4siZvKFowva4pFQaHeUAjFbZPfs27UZMsgCXTI7Y=;
        b=BtSu2W4SJK9e2HAzWx+7yAqJgn+18lVnehISLHAjpGRaPF9Gz6LGSlEPA3rwepsMMw
         99tYyRnWfKOCvL+XqTasQn9y8oRFzMSNdM+ISTqgjJxZOujIOyM8KPMEwP4Rjok+di7l
         Zq1p1S/dLmAfewKP8JXPD2kxhn0JgDb1ZGM+DiKLhHL5g3HOfYhVmsIvczUlA/DDqcDb
         k9ItONXXKmPZMtNrHtCbtYxz8dwaNFz62UuesKJ5EULX4mCMpcFsTeLw4VBnynu9NsHH
         HtXCEwhEP3uFhjwPsZcZ20h8NpBCfuG47dTyrg8KfEgnksI5eMPnXV60rzOtOCKKB22C
         HQ7A==
X-Forwarded-Encrypted: i=1; AFNElJ9mfUTsfcqWxfXBPfD3NF9uT17gMEVL1eybNGBSDUQrIofMHOABbt5EhV1XdheWTzXw1vO1/pqIgaw0p8OGD0qtieYl@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+akcxjsid+rmK8myAqaRCsEwzdDWfQV+F2uRHN9O/aFfWUVB
	ORTTtBjZuu662jLiq4p19RJHzE5gRVxEAXHUDUFrZKBI5DFS4AYfzwzb
X-Gm-Gg: Acq92OF4pUyGw6oaTof2yDAyjRxRxkEiI7UwHIdZ0ulkQHCsoQPkDaQTUQuIjO76V5q
	zeIFleh95W6lg7y/2+f0RMvOazuQOhwhFSAbMpw5EeQzINr47OVYhXYxlvQp5f+2y6Hv9upjUyE
	HMdT9vPAwiZEcLxCHYjUeDkWpgFpfpgQD3bOlNOuZvp8hALe6mBxqWz1uJE4dHzGo5J2lb4Ybf0
	F4aaOMGcJSFEstGrB+QhYgdMedUFh+nwKAoKH/eT5pHrYiX8AqkVEIeVaqH59LsY2pxfrT7Mv9l
	4d4jnNKfl4bnz1mNfycjPKbK373gRsYUEIdoBFdkT4Stz3nEkHVwMHXZBw9dUgxLXEqjRwvpDK6
	6W3tK4mTwGr75qDjHc7ngUJCFloeksrCfXcfhc6NGKu8sgF9z4znL78QdvXHZj1TgHsvOdWEINI
	zzNL79b3bQ5RZpuWZPTSM7m5EYjDIFNzdzCS3X8ubFOaYxTKjPt51Ytf/ipCP3gP0YlrYYUyguC
	Ggf
X-Received: by 2002:a05:7022:23a9:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-1350494f249mr10303932c88.34.1779257269645;
        Tue, 19 May 2026 23:07:49 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm27906026c88.11.2026.05.19.23.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:07:49 -0700 (PDT)
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
Subject: [PATCH v14 5/7] platform/x86: lenovo-wmi-other: Add force_load_psy_ext module parameter
Date: Wed, 20 May 2026 06:07:38 +0000
Message-ID: <20260520060740.119554-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520060740.119554-1-derekjohn.clark@gmail.com>
References: <20260520060740.119554-1-derekjohn.clark@gmail.com>
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

Reviewed-by: Rong Zhang <i@rong.moe>
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
index 8331da864beba..fbb32bf404f24 100644
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

