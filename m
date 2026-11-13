Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549464;
	b=guPiySeFPUj/C+uhxiHwYNtOSuZKD5+TWE1bIa6qJ9B/Mx6/bTEEO27Nm1RPYXeMdxHy
	 3+Ez2IsIHYWeXJPFAdS+DAMMAQ8w21iEjbby3rcCLJ4PW7Uc0R54AFPE/Q0Sf3uLGGx1v
	 y6buSaSAeFvYymanSEx7d6ZqGR+5UaxXw09cNKZkrClHTZZhCUBzvijF0sE7kH6XvRheO
	 0nEWWcQ3SiXgKMSEQEk+ML6vrV1lkWCMpO8nHfdBERNInhhEUlaAcUUtNje+3xg4tmxRB
	 62csq0lttGRySMx8OuEMPsMR+581m4awGOoHocOwxmWa7bLDw6zjgK15rmTS3nxVgjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SZhpgh6Yq01P39/1qSrQzNSaVxZcNgrejNPHx6b5Ek0=;
	b=sgF647cKT8oD7AdWRyYsaN+WJoWrUVFye4dDiw4msU0kL1RF700fzzuUvOArSogaFydK
	 kM359Qw1FxM9LRKVRaF8B/RURDPTYSZ77unXnJXhe7wxClqqhYPRvXIxRAKq4KNUUGMTS
	 0RRC/lp2i98kEqgGRNgwwy13u7I0jDtl41AVa5C88r73SirWENe/10yAc4KBjB+h9UmUN
	 YrgwZzoPFl8DLjFjQsjTzy78LWY91wk9C6EH8aw1obDp9qPAjbu5pMprubXwXjBF+em8K
	 Hf3GhRZ03NUpT5vibo6TzBRt5vRLSqLYQkWunBcXgqeknvXAojlIr/BxAaQ6NeHEmJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=DHK9g3r4;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16037606A321
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 05:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16037606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=DHK9g3r4
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 40CCE40CD4
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 05:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794549461;
	bh=SZhpgh6Yq01P39/1qSrQzNSaVxZcNgrejNPHx6b5Ek0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DHK9g3r4ddk1k9N0M6ToMb+990a/BtpM8f66rMTPl60gOK3uzpBahVd+q8Eey6quW
	 FcusPpKKTxtqJsndm3oEzoxjdADD2r0kUxlYCpUfJSiTnOQLv8DwAH4Nc4N2WZLNOl
	 km7KT4HTJIWzX7gvSiTKYCYtB8UTcB33DVj5EoCqB8fyg7KBwoaeTmIil1xklWxC5F
	 q5mlsIrw8EqNdBRfT0xko4AsVQUWoQ63tnJMThnXV2Qcad0LFuCNMWQxXAjXMGr1R1
	 y+YkHAH2rcU5TViI3NQSiYXFnDyDxmCo8E9N22/NLkr6Vkf6lGddbJ9U6R25EWBXFI
	 bxYFFVIIyaiJuntbsEN6VhNo1Xc/qThW3eRy4MMJaaV2fpP+zYgJVNq7z9GtN5CxvO
	 SEkBDyOSO/fcw6X+/DC4twgKqYpT5fZJ+0NFtCztkEgo1bYlyi/KgKdINg/m0zkxwJ
	 caGSpyPGiUZpscaJVFZ3qoorwMQznG9IEt969/0ec1/9XJ5aL0LMhSJ8jBwWrLpdcJ
	 RFrRBeUM3IFHwg8QR8E+LzacyRy8f9EpOtMkZAVdJHVbEu28qWgMFQYbCs6DU49SYk
	 dXvbxompLP4zj2biK88edgnL3HwkjmrH9Gg0Zx3ODl0ZUcMbOryJXr0ksI/jK2dJ1C
	 uPUA9Hu8VzOdrJr2Ghvq0uMc=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so427909a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 21:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549459; x=1795154259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SZhpgh6Yq01P39/1qSrQzNSaVxZcNgrejNPHx6b5Ek0=;
        b=b1XL34gtvFUvDuQsqKCa70Pna+0hb/2SIl71DK2ESjyQUmvLnD4BxyYuT86LMautAn
         pJJSwnMYmvYM+DW5gEa+POsLEqDP3E57FLDgTwTqRC3QuFxNapSd9fytnplhAthtlgRQ
         k9sRFCDijG2ShHpnC7VQRgz7svQUSS2+4kSsk3uOVjZuZfV2cUX08+69FVloin6IYX3Q
         /zEn+N6ftKrPmR87NjdykqnAt9eYVtHqinxKaTSbDNftXZuvMcI0j+GW1ICtt2vTQMQu
         Yhopm5p5n+HfLNiXn8VSYPae6GzRhndklxVQwIqaxo9kxqeQ+1b4mi6m8uSTN5d+rOEa
         2mvw==
X-Forwarded-Encrypted: i=1; AL+hErExc06BncvYLOMDrGyddlNHer4j6RvyuCvxOecWPTq3U1BlK3rECpLWBwHcc9y56ES68LcQh2hQAzRuwJrogWKmsh4J@vger.kernel.org
X-Gm-Message-State: APuU4Z8NXhh//jwGTl6DZOSVdjr6f+tmqdkNvbQoyfIWXUVAX1SGkd+d
	3GReyv4ggI6S4h3GOZ/i5TRIvPWmwSuP2Vng3wZIpM3XUPEbD4SIBjTYdCn4Uglz7CUTXuR8Pah
	Hqp2tU2I6wfbo+gzMt/P5IysTgeW9ft/L9PM5Uinc3h7mBYlneM5b1rLO9InRGlc/urJF7SHDTA
	G/9rGJbh9b3HQJEa0=
X-Gm-Gg: AYBFou1WvV8CF0kafLT4adN8Ian4dIKJUoA47ql1XxHFu+pKoMJdMfcG/bdqRmbGx9a
	biPKTIeOXM/ZgBJ8V7gm5qFvBbB2N+7elNA+wR/XqLdQNuTEiCxiuVYy80bFanZzJSjPzMP54/j
	9cW/DRI6hFYpZk6AWIAQE3bA50MK4gLqvXy2hrm6dUJ1DfDUwQSEzjZvW17lwIvLsZmekd1ksAs
	m0iIubbudqs89CF96nfRA8ZlJTDUq+u3Ez3YonHAVLrni1+Qnf9iCZ/ltd/5Fn0U/a4ea6Ajpo7
	flzvh8X3jNJ4VBcOpTCeJom891O3nGJTK2zsDXZiCD0beJaOejrT7uDOgRqLxlcLGzwYeo4lTa6
	VRlBhBil0/Yv1pH2JsFAVYmbrrbpTds+WOTN4xryXjCgvV8SXg+YvxDu6M+FtUvR88eqzw7E1EE
	j0qo4dN8yOb1VlC53hqQuIdnjrn48umuV4jZ7puTATv1wgDOCUbAohxGOUxhVi4Hq6xzWRJq1ss
	XyhXrDKKUfuZwI1/ssTJBGrTKP1SZmj+l5GFNRUsEEr9/WFPdhhiUxmZeZNKoBO0iiu8OXVopGo
	AS5NzQlBldM9pQ==
X-Received: by 2002:a17:90b:2251:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3b1b0a408bamr1337228a91.22.1794549459285;
        Thu, 12 Nov 2026 21:57:39 -0800 (PST)
X-Received: by 2002:a17:90b:2251:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3b1b0a408bamr1337206a91.22.1794549458569;
        Thu, 12 Nov 2026 21:57:38 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm756324a91.3.2026.11.12.21.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:57:38 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Fri, 13 Nov 2026 13:57:26 +0800
Message-ID: <20261113055726.952551-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ThinkPads expose battery charge thresholds and charge_behaviour through
thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
charge_behaviour and charge_types on systems advertising those WMI
capabilities.

When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
duplicate charge_behaviour sysfs attribute and unregisters its battery
extension. Conversely, registering or updating any power_supply_ext on
the same battery runs sysfs_update_groups(), which removes standard
power-supply attributes not owned by power_supply_core and wipes out
thinkpad_acpi's charge_control_start_threshold,
charge_control_end_threshold, and charge_behaviour files.

Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
per-driver table guarded by IS_ENABLED() in Kconfig, and update the
force_load_psy_ext description accordingly.

Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Co-developed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
Changes in v3:
- Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
  driver_enabled, as suggested by Rong Zhang.
- Group deconfliction entries per driver (HIDs list + methods list).

Changes in v2:
- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
  device IDs, method pairs, and driver configuration checks, as suggested
  by Derek J. Clark.
- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
  instead of relying only on ThinkPad ACPI device presence.
- Check whether the corresponding driver is enabled before looking up
  its ACPI device, including for ideapad_laptop.
- Update the force_load_psy_ext description to cover both drivers.

v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-aaron.ma@canonical.com/
v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aaron.ma@canonical.com/

 drivers/platform/x86/lenovo/wmi-other.c | 66 ++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..340159df5f7cc 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
 static bool force_load_psy_ext;
 module_param(force_load_psy_ext, bool, 0444);
 MODULE_PARM_DESC(force_load_psy_ext,
-	"This option will skip checking if the ideapad_laptop driver will conflict "
+	"This option will skip checking if the ideapad_laptop or thinkpad_acpi driver will conflict "
 	"with adding an extension to set the battery charge behavior and battery charge "
 	"control end threshold. It will also skip checking if the BIOS reports that "
-	"those features are fully supported. It is recommended to blacklist the ideapad "
+	"those features are fully supported. It is recommended to blacklist the conflicting "
 	"driver before using this option.");
 
 /* ======== HWMON (component: lenovo-wmi-capdata 00 & fan) ======== */
@@ -905,17 +905,41 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
 	return AE_CTRL_TERMINATE;
 }
 
+struct lwmi_psy_deconflict {
+	char * const *hids;
+	char * const *methods;
+};
+
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_ACPI)
+#define LWMI_PSY_DECONFLICT_STRS(...) \
+	((char * const[]) { __VA_ARGS__, NULL })
+#endif
+
+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] = {
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
+	{
+		.hids = LWMI_PSY_DECONFLICT_STRS("VPC2004"),
+		.methods = LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
+	},
+#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+	{
+		.hids = LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068", "IBM0068"),
+		.methods = LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
+	},
+#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
+};
+
 /**
  * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
  * @priv: Pointer to the lwmi_om_priv drvdata.
  *
- * Checks if the ideapad_laptop driver is going to manage charge attributes first,
- * then if not, hooks the battery to our WMI methods if they are supported.
+ * Checks if the ideapad_laptop or thinkpad_acpi driver is going to manage
+ * charge attributes first, then if not, hooks the battery to our WMI methods
+ * if they are supported.
  */
 static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 {
-	static const char * const ideapad_hid = "VPC2004";
-	acpi_handle handle = NULL;
 	unsigned int props = 0;
 	int ret;
 
@@ -928,14 +952,30 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (force_load_psy_ext)
 		goto load_psy_ext;
 
-	/* Deconflict ideapad_laptop driver */
-	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
-	if (ret)
-		return;
+	for (unsigned int i = 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); i++) {
+		const struct lwmi_psy_deconflict *entry = &lwmi_psy_deconflict_list[i];
 
-	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
-		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
-		return;
+		for (unsigned int j = 0; entry->hids[j]; j++) {
+			const char *hid = entry->hids[j];
+			acpi_handle handle = NULL;
+			bool has_methods = true;
+
+			ret = acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
+			if (ret || !handle)
+				continue;
+
+			for (unsigned int k = 0; entry->methods[k]; k++) {
+				has_methods = acpi_has_method(handle, entry->methods[k]);
+				if (!has_methods)
+					break;
+			}
+			if (!has_methods)
+				continue;
+
+			dev_dbg(&priv->wdev->dev, "ACPI device %s manages battery for device\n",
+				hid);
+			return;
+		}
 	}
 
 load_psy_ext:
-- 
2.53.0

