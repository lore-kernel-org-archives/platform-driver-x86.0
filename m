Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AB1E5714;
	Thu, 12 Feb 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918249; cv=none; b=ZJ9D9k6ZBoWX6iWGJ/qZAUl6OWC98cjAqeEHywpRwG9TV1IKNkxB9Pa3qvuDLnKRvap0gbySCnVrCdfCf5qougBBtnUwK8+e6X7gxM2r4yWCJwW4dR6bPhmNSlAMCMRf4Z3dPQmAPmqT0dMlsH0JZ8l+CC3Y6PEpGPJL37clIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918249; c=relaxed/simple;
	bh=nc4Czj/QOUaYmoPeWEobBQ1GlfO5PX8mcEO5fLMVPzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sMrOTN9MBWpK5vbeNV5Vz+R6HjiIh4786U0JwRXkAM6bH5nkxwRel1UbiyoRVyBWpirxRFq8EWENvlEj5Ecun+PAoJ0tsXyD2nFFjTRgNSR0UFl8JdXMDM7CgXnwC7p2z6JHlFcnU3IM1E2CQq8AE1zOhZVXoz79i7xn+QIIQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Js0cSAUA; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Js0cSAUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770918245; x=1771523045; i=w_armin@gmx.de;
	bh=HglzlwWjdI4nJonuODb6c0Lh6RN87yn2wVGh2rDsFU8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Js0cSAUA/8NJ6k+9SpMrYTPc67QyaYjxS5r7QSf+EQkC8xQ+mP8cX2M3n/jUAPtM
	 5yVoqKciSqPvhhMN3sPBzH5NzFMHMIDFBegXX6wywkBMVRRtdedzABUyp4RXB09FE
	 LmAkm+y8p3iookezAx7yC6XSduzjd43gC1/U+o2pJwjDU3envCPC4xpOY817qb4z/
	 hr+4cUNDCESeUaT2RFg/d+wZNs56/7UKZWq8VOzmflQCScIz4uoKPUKwPz7kAD7WY
	 yy/5py2CXHM7Uf3I+barFkVz/cMbtioO136GFKoiYksNb40K7XVIdYo/ooHJBo/8K
	 9G9RSGI77H7EakOWmg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N9Mtg-1vlJsv0XpM-00siVE; Thu, 12 Feb 2026 18:44:05 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] platform/x86: uniwill-laptop: Mark FN lock status as being volatile
Date: Thu, 12 Feb 2026 18:43:53 +0100
Message-Id: <20260212174355.23965-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212174355.23965-1-W_Armin@gmx.de>
References: <20260212174355.23965-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JLJ1+pRdF8TID2Ejb7Nvf0Ti97z5uP12IzSY99GpAApNYt07Yc2
 luqLwhA8SfjPAQrfZ3Xh5g+9x2YzEWrSOnuJjWllHlFfyKxEmad4cguJH8FJWhRNWRv9Qn2
 STHE4/GeMROMGCYKvuD9s0pu3TtTFjwsM2pSNArHjCdlNbGJbwf5VNBdOglXLY1CdCgdS3F
 VDD5xa8q95lh4DkxVMWsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iulzKokpDJ8=;4AHzTzDEYDjuSPsQge4DZs4Bghi
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

