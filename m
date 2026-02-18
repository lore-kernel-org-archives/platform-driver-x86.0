Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0089D28A72B;
	Wed, 18 Feb 2026 00:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771375890; cv=none; b=VjnMAzhDNHn3XivqkDJH3ErTz2QEGFHh3Q/GBUZPmga0YPlGgcCYZFDRpnOjY1QR4DbIOcvdDf5mTOcbydcLrdX3ttGmiNNd9bSpYwUzWAjzsPZ/z7JK2Uv/GpLswd5yyZ/dFYJjHNguuK7oeNVy1dZyCGRG0cWLf2VZQdhsMII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771375890; c=relaxed/simple;
	bh=nc4Czj/QOUaYmoPeWEobBQ1GlfO5PX8mcEO5fLMVPzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q5RdTIU8M7K2vTQxTaigU/h5kPq6CUNCVRnn9HqrbD1AaByuYS/xd8aaYDRhXrqHZ8STcGgguusJazI54QNI0EPXSPKBqWbgNmJM0DKNskGS/HE5GJYISscnyx8ZU3hQi/TOMFRf8cMEBbemgJ4uzPynLgWYyyViF4+wyvrJ7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BTt31MeR; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BTt31MeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771375877; x=1771980677; i=w_armin@gmx.de;
	bh=HglzlwWjdI4nJonuODb6c0Lh6RN87yn2wVGh2rDsFU8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BTt31MeRG690v/WZpZN8XQAE107Zb8dNWN9aWnNXmXQLO2bz1s/l3d/x7T8aeo8C
	 IL/9uKodutUxQPirDoEq9RdIUwEmu6MkJej1cGHk83d2z42R+W4lDrdT/3cugKesd
	 sj9gea6vSFlzS+1fU7CnLn3f9bFj+WrCdh2x2bbMUb+/I68BIeuxOiFco3DE2d5l+
	 YAgGtXzYQrdm2BOlGUfTa+uPmRWpMVLzw3JQg4dp66QYNaghzpa3+eFspo1VNYRuv
	 cPYicAXXv0zSguESFUbS+p+JoKugxMvZTpMvoDavsDv7Gyibz6Dn4teXSR8zvTs6i
	 qsMlnYsnMxX7ltR45w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MFKKX-1vysWL2wp7-00FZMJ; Wed, 18 Feb 2026 01:51:16 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] platform/x86: uniwill-laptop: Mark FN lock status as being volatile
Date: Wed, 18 Feb 2026 01:51:00 +0100
Message-Id: <20260218005101.73680-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260218005101.73680-1-W_Armin@gmx.de>
References: <20260218005101.73680-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ano3VkE+Ejv/ACEeseKlhqvfVPTw2C0V14wB/1kKQ1uPVYf5JVM
 r6C+cT1eYD+VAeI7h1KlSyxOsI+H94tNvWqeZLB1VNMccqfDHjbFo6dqhAhVwqDHsIFr4oL
 KGPAZLp8X+voOP3AdNQYI6D1jQtIyX9hyAvLtpt90TTFky8ViqTaG0+uflV9yjwz48LOQ+N
 bgcCShR+dxvOMDfh5yXww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X+WaLkxSZoE=;8Tb5QdnYrnZdUzZOjVvRpI8eepN
 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

It turns out that the FN lock status can be changed by the underlying
hardware when the user presses a special key combination. Mark the
associated register as volatile to prevent regmap from caching said
value. Also add the necessary suspend/resume handling.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 39 ++++++++++++++++++---
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 03694e51d0ae..29daf83c0b26 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -330,6 +330,7 @@ struct uniwill_data {
 	struct acpi_battery_hook hook;
 	unsigned int last_charge_ctrl;
 	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
+	unsigned int last_status;
 	unsigned int last_switch_status;
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
@@ -580,6 +581,7 @@ static bool uniwill_volatile_reg(struct device *dev, u=
nsigned int reg)
 	case EC_ADDR_SECOND_FAN_RPM_1:
 	case EC_ADDR_SECOND_FAN_RPM_2:
 	case EC_ADDR_BAT_ALERT:
+	case EC_ADDR_BIOS_OEM:
 	case EC_ADDR_PWM_1:
 	case EC_ADDR_PWM_2:
 	case EC_ADDR_TRIGGER:
@@ -1508,7 +1510,19 @@ static void uniwill_shutdown(struct platform_device=
 *pdev)
 	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
 }
=20
-static int uniwill_suspend_keyboard(struct uniwill_data *data)
+static int uniwill_suspend_fn_lock(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
+		return 0;
+
+	/*
+	 * The EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
+	 * ourselves.
+	 */
+	return regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &data->last_status);
+}
+
+static int uniwill_suspend_super_key(struct uniwill_data *data)
 {
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
@@ -1547,7 +1561,11 @@ static int uniwill_suspend(struct device *dev)
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	int ret;
=20
-	ret =3D uniwill_suspend_keyboard(data);
+	ret =3D uniwill_suspend_fn_lock(data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_suspend_super_key(data);
 	if (ret < 0)
 		return ret;
=20
@@ -1565,7 +1583,16 @@ static int uniwill_suspend(struct device *dev)
 	return 0;
 }
=20
-static int uniwill_resume_keyboard(struct uniwill_data *data)
+static int uniwill_resume_fn_lock(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
+		return 0;
+
+	return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS=
,
+				  data->last_status);
+}
+
+static int uniwill_resume_super_key(struct uniwill_data *data)
 {
 	unsigned int value;
 	int ret;
@@ -1613,7 +1640,11 @@ static int uniwill_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
=20
-	ret =3D uniwill_resume_keyboard(data);
+	ret =3D uniwill_resume_fn_lock(data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_resume_super_key(data);
 	if (ret < 0)
 		return ret;
=20
=2D-=20
2.39.5

