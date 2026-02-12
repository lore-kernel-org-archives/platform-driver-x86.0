Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9BBA34;
	Thu, 12 Feb 2026 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770879776; cv=none; b=hWBMYGxXooyCJtXA07ZyoO7ABi2+t77AFRH2VRRInNO7Gr8NmSKoK6/PXN7HYkMknKQc2oWA3/9Y+X7RwFRv+eOySzq76zFisQvrxWzhWh1aAZjZZTBzkbvOmIPGFJR+Ybc/nQlhlhNbKDMt5cgqk121O5nkIB8phOm4SFe0dww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770879776; c=relaxed/simple;
	bh=37nR4fMidhFiBaPoF36iozZr4tqKD/V/bHy1eOB9bmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rKjlgSSBpvYgCC0YGPkx1SCZ12tGD8gPRIo5LhdcKA8klcySJPoOuoL0HzzEq15q5e7lZQKUttvjdd/lOkRH1NO3r0/aiQzo5vdWTmRJDvaWe8I3joMRN3EZwtT6RCaT9xJx86Z+4lD+r0LSrEMl6RfisGD2vVVOAbMPJLEJ4E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=gDptQUsO; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="gDptQUsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770879769; x=1771484569; i=w_armin@gmx.de;
	bh=azcG0NDpxMJZHFPjxRLnijLybw5rz9BsVUnYNy4ZCj4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gDptQUsOSAOl4qjkZwi1jX0YvD5d+k5sGOk9rMZ1Ym6IAc8z6B5T5iomaexGelXT
	 jAPj6nL+tmr1N3Xxo7CXpWAJr0tgz9I4Sq4Tu6NrQO9wG1FZh6Hds1sdb+zIucKad
	 fsJjVYTWaEsZZQanrP/M4pbs5RG5hz4Li0wn8SO3lZi0AOmBIK5z7w9uKRq+Hxv6Z
	 fwGzFSrHPWFGfsLj2RwecsoS108Y+X8M+f/lrOxDSKn9W2pBFVs5HJs4Zc5uAfRxU
	 mFAIEWZMt+ln8MC0TUICJAXdd9rqOKnGl6PuRB0UPNQr6iEkA/mZQxBVLDpo91D/3
	 uNCApd821Scjq/rmGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N3KTy-1viDJS3cI6-00vRMs; Thu, 12 Feb 2026 08:02:49 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] platform/x86: uniwill-laptop: Mark FN lock status as being volatile
Date: Thu, 12 Feb 2026 08:02:34 +0100
Message-Id: <20260212070236.17296-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212070236.17296-1-W_Armin@gmx.de>
References: <20260212070236.17296-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gZnJbDobw5H2Lnc1wNnj5ajy7p+qcrZJAx3QCJwbyl9On/28Sgh
 sAOi3hDyOQApM4L16DTAFIvXxcPKGr4cfXv74waX1Ofh38chMBHpupWz6LWrHWm+OEVWmFh
 Rvz5K0Dlv1tShrHk0OJtnRZPu3gfOdJzVg7Wt0yoCLVPEdzeLVVsX9ssn/ASxaXKmOVcfjU
 uLg5Pb5POEZBm7mOYKHTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:m7Mw61CB7hQ=;1A39xs3AzdKhKA4dX3dHypnFSD4
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
index ca66288e0d5d..5ff8fcec9d9e 100644
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

