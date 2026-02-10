Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D61F31618C;
	Tue, 10 Feb 2026 23:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766214; cv=none; b=DhYXh9X82K91OQZU7urWLqQ8UN+/EPBEBEjeb1TyhyUgkF+N78D1ZqEstdVv1zZu56Fm2NVWnnYg0Q4Yf3YLOWfXE3BaHxcegAGfcXS74e/QeoEqeCLLFqR5mEEzegst1IKKYsWjMKiJ8fUUt+rWEMR1STBK+3DAszH7s8QOMgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766214; c=relaxed/simple;
	bh=UccsnU/dr6V5kge6N9UjBGTYxZu9EO8rCdBPXNvNRzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QOtfwGFZEWfnwbTyPUjvIZ592PRkAMRte7RW5imJPug0/+Z5fAH9OkT0oDsENLi9s1fKYUpnOsPefSPNHHiFKdb3WL9FSwBBhgHq5rMUiW9STs4X4PxJ8JThlgBpUJkxBLno/8zRIlR7vposcXZ2npxN/DOEiehG/x+ApZM51lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=M0WYplfo; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="M0WYplfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770766202; x=1771371002; i=w_armin@gmx.de;
	bh=THTQXMIKeVsYSmqJyVL/DNq+JqgNTJ8A4stF67oa+wU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M0WYplfoZLXGhKVplyTv9TVbntCHzC/B/vOo+DvrBnLfsorK6qnybj4H5SIHCLU9
	 HNGPQExOGmxAdPiFWrLBabGYuvKP5gLFAzLXrnOfSyo82oNQa/sGvrmLeqCl3lgHL
	 aC6wLlkv7phM05CWrAT9XBRxh5EEaLsmC8f6y9jEI0S85pjb4CKTDf9CrN30xZJkW
	 NOrvOjmn8AaSbWZUPVe3tt14D+dsFkfiwRrVJ6pDxN1ysqL7wlAn5KnWCkXqmpWjV
	 0CHZbxbJVEmVQjtXVUp7dwCfC+Kj5Fhk7idnaAMJHErZsvTwt6cDomZupp3mCQ+gy
	 gosyroFf8b2Q207jvw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MKsj7-1w6ERY2Vaf-00Yzqo; Wed, 11 Feb 2026 00:30:01 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: uniwill-laptop: Mark FN lock status as being volatile
Date: Wed, 11 Feb 2026 00:29:44 +0100
Message-Id: <20260210232946.302936-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210232946.302936-1-W_Armin@gmx.de>
References: <20260210232946.302936-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xowTGBnqtQVxxQgICO6LYGy3wqr49xMATA67CFtID2VoUC08dmZ
 R49XBSu996lK7HXL/GUPo+18BJnxGia3nDQTDzm9Qx0fF8Ck4PdpHiN39EiC1Crq5POtUyf
 ZCChqnSwMjR6yg98KJcvLRW4mRr36kxc78vSYazvXPYn148ugIYS4XMXqJZNtaCUkQrHv3B
 Jwa45fCwQ1uAiOEDPWZlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yBVPa6PSM2Y=;ccCDWswL/SPAo461Ya7VfgjAvU0
 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
 qN2vmnIi63qj9/ID9pol

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
index 938e39647be5..fa1ffe541983 100644
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
@@ -576,6 +577,7 @@ static bool uniwill_volatile_reg(struct device *dev, u=
nsigned int reg)
 	case EC_ADDR_SECOND_FAN_RPM_1:
 	case EC_ADDR_SECOND_FAN_RPM_2:
 	case EC_ADDR_BAT_ALERT:
+	case EC_ADDR_BIOS_OEM:
 	case EC_ADDR_PWM_1:
 	case EC_ADDR_PWM_2:
 	case EC_ADDR_TRIGGER:
@@ -1504,7 +1506,19 @@ static void uniwill_shutdown(struct platform_device=
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
@@ -1543,7 +1557,11 @@ static int uniwill_suspend(struct device *dev)
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
@@ -1561,7 +1579,16 @@ static int uniwill_suspend(struct device *dev)
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
@@ -1609,7 +1636,11 @@ static int uniwill_resume(struct device *dev)
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

