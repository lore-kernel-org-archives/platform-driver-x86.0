Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B97367F4D;
	Fri, 17 Apr 2026 05:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402573; cv=none; b=NkTU6eAbiMz9tPybgGaleHVSG9GnIrsU66avftgGQJkOastVYfnCD9coSStPS56gPUlwgQDT+F8FZc+BHwN7NCpQvfzUlmQ6rReHRDcIdlbXpI2crWQW0vG+sdndIyoWDcZBIgOxvNdYgMwXfwEPuCbbyQuGzuEvw+JdSbNdSUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402573; c=relaxed/simple;
	bh=7PbMEasotSm7RIuXjoGjBoF6N6OfOLMDB+LK8yUqSls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LA0rcuJHT5SE10QtxJv2wYH+Vn5YUXX5Nv7+aadkM2K7pMkyezhyj5kvOE6TtWtTVWbsa1eWubIZ/V1tb3hwV/0qM8m4ObQRvObW766PUsZeRFMO5nqWgb40LhbLrVw/4KCP6XF2kd6H3n8RJbQZ2iPvxokBNjNpQkSk2ooUF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JpTZcJqh; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JpTZcJqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402562; x=1777007362; i=w_armin@gmx.de;
	bh=CkJY7ADe2YDlFSPTDzNgOOuqVXOYCA0xLCfweDsnxuE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JpTZcJqh1ekdqGK3lnvTbFozGt3fy7P4IMewu8VDlsWO9dmDAFLR9fQznL83o3W8
	 mFXEja/ztMwD4+szylWph2EZHJCO1edqRhednMu4Dlb+UxgzgGA76bLOLAxoeQNVi
	 B1XASDKYyDHRBw3w5ZNjlvNSrwJ/elV1osn172BHsIf/suOdzLRAzffL+Py0FiIHe
	 HiJki1edt2grhLxx6adfknc7kfxGRVypXtRR6O/2Jh9f32y60szvIkK20sDJKXReb
	 OXR/xFSS0jfdNOKEVReJYJcWvFnsbUTwLzDY08sQiqyyMRLM3s6Ld2yWD5l8syMl2
	 KA7wV7eOjZTKggEj8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgesG-1vlzsU0BIK-00k0rJ; Fri, 17
 Apr 2026 07:09:22 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] platform/x86: uniwill-laptop: Properly initialize charging threshold
Date: Fri, 17 Apr 2026 07:09:06 +0200
Message-Id: <20260417050912.5582-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260417050912.5582-1-W_Armin@gmx.de>
References: <20260417050912.5582-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TW5uEeKqY52BKwqPTzVk8IMl6NkX0wMRj9ddkVjF6/BrwbgElYE
 3CkS8OBsPur4vQj3Be7fRXRzE3fifW3ikQe3xDVBgwyJkDv2xVJIAcuKw6A5I7hizpChucP
 KF1IAoytmqSSr3snm+KEld0YXsuMtYJiCTdFLmMJRdg0J/XwqSPjqHY4FO5nog9vOAYosJw
 JZ6uRhCRASqIx9r7x3Knw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LpH/0HcnwNY=;FMETB3emcpDOJFRuPb72GvMz0GI
 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
 2aDhPmm1pLN41BFigwvOAHzpQeMiWUtwWBTI=

The EC might initialize the charge threshold with 0 to signal that
said threshold is uninitialized. Detect this and replace said value
with 100 to signal the EC that we want to take control of battery
charging. Also set the threshold to 100 if the EC-provided value
is invalid.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 28 ++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index faade4cf08be..8f16c94221aa 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct power_supply=
 *psy, const struct power_sup
 		if (ret < 0)
 			return ret;
=20
-		val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
+		regval =3D FIELD_GET(CHARGE_CTRL_MASK, regval);
+		if (!regval)
+			val->intval =3D 100;
+		else
+			val->intval =3D min(regval, 100);
+
 		return 0;
 	default:
 		return -EINVAL;
@@ -1499,11 +1504,32 @@ static int uniwill_remove_battery(struct power_sup=
ply *battery, struct acpi_batt
=20
 static int uniwill_battery_init(struct uniwill_data *data)
 {
+	unsigned int value, threshold;
 	int ret;
=20
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
 		return 0;
=20
+	ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The charge control threshold might be initialized with 0 by
+	 * the EC to signal that said threshold is uninitialized. We thus
+	 * need to replace this value with 100 to signal that we want to
+	 * take control of battery charging. For the sake of completeness
+	 * we also set the charging threshold to 100 if the EC-provided
+	 * value is invalid.
+	 */
+	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
+	if (threshold =3D=3D 0 || threshold > 100) {
+		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
+		ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret =3D devm_mutex_init(data->dev, &data->battery_lock);
 	if (ret < 0)
 		return ret;
=2D-=20
2.39.5

