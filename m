Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6330F523;
	Tue, 12 May 2026 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628121; cv=none; b=goLOuaQmxrlgA9z7i3GfruRrmAPylPSld/R4OoTFZCM9d9wqcMPtLBzN3P5pmqq2yca2jh0KUndLnwG6vj98XZyMW2E1Hq1q8meqQGz262lnXGLJdWb5KJJQgAbp61YDXyeEVRZK908nyGtgu9KpY48QVWuvSKycwSYxtqtfowA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628121; c=relaxed/simple;
	bh=I+UnSG560s8DA3WsEWEfeklcyTRSlA+TE9Wd2xzE19M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GANXQGcVH/ocAFJTgdbxm/CHeOqR9MmYwgtEh4/GK3lC1bmSiMYKVh/VYb0xG4qOXb1zh+ZlLbJTl+0xhvgxr9MXLN2zqL5t35PufkX2bgodVKYZipr2wnOqibD1S9074yXLswWfpa3r5DIwOTNG8pzraTFuBdGCoMXGyUFle5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pUBRRyPJ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pUBRRyPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628114; x=1779232914; i=w_armin@gmx.de;
	bh=ma9YegZvKimvNcoUFnLpPQglceX9SLuALrtHiawenec=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pUBRRyPJhUf8BskcF9o4DwPg2ricGHU1Qq4P3nlts2Es+vzSsM/0SKAXAWRpqdLV
	 wRWrNCTdXOrd9EbBZBCgE8+wHUrfkrUwVp90Kk2ojHiXtMrL2N+yv27x0IPd0mSzd
	 jvqsbNhKImnyCbFBiVEHTdf0kRuaTnJy383x/G4n5u3REQzB44q65NqZA2WtyLYVj
	 XQqLlW3VHkNz5GsBpm47/XIgmkJJ4A9N/ipgvO4k+b+IBqRzH7vXp9I0tyyeAoT8k
	 FayuA+IHk2nnxt092r3ARTizJGC7kwxEEtqj1X0GxalBnX3mqpfV/LzcXKvfkoGjL
	 afjOTnOvV5EVK+macA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiTt-1wqP9A36Yn-00KP40; Wed, 13
 May 2026 01:21:53 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] platform/x86: uniwill-laptop: Properly initialize charging threshold
Date: Wed, 13 May 2026 01:21:38 +0200
Message-Id: <20260512232145.329260-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8l+rSwVorEA5Bnj92J7V7BOP7fMh2fzF8jQ64IiwGQkU3kYJB4Z
 HaGdZkWGDsuP2YN3gIxpTGBolTY418Sf78NeJQOYXbymbO9enbWAIQIlD+TGklVIvA9MvAD
 ThjqtUqxj1ImGmOFpXnfeZyushK3W8CuQcX2JaGGd0kWkx07ic9k+EHwMVnN3U4t5ZqsuL8
 cUgG0vdO0FpYQfF8lEgGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7jMT2w9BwOY=;/sFfaxNCSJ9ryH9ZnJwovaDhfyI
 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
 BJxZyg==

The EC might initialize the charge threshold with 0 to signal that
said threshold is uninitialized. Detect this and replace said value
with 100 to signal the EC that we want to take control of battery
charging. Also set the threshold to 100 if the EC-provided value
is invalid.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 35 ++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 945df5092637..d9c202fc8c71 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1359,6 +1359,16 @@ static int uniwill_led_init(struct uniwill_data *da=
ta)
 							 &init_data);
 }
=20
+static unsigned int uniwill_sanitize_battery_threshold(unsigned int value=
)
+{
+	/* 0 means "charging threshold not active" */
+	if (!value)
+		return 100;
+
+	/* Guard against invalid values */
+	return min(value, 100);
+}
+
 static int uniwill_get_property(struct power_supply *psy, const struct po=
wer_supply_ext *ext,
 				void *drvdata, enum power_supply_property psp,
 				union power_supply_propval *val)
@@ -1405,7 +1415,8 @@ static int uniwill_get_property(struct power_supply =
*psy, const struct power_sup
 		if (ret < 0)
 			return ret;
=20
-		val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
+		regval =3D FIELD_GET(CHARGE_CTRL_MASK, regval);
+		val->intval =3D uniwill_sanitize_battery_threshold(regval);
 		return 0;
 	default:
 		return -EINVAL;
@@ -1500,11 +1511,33 @@ static int uniwill_remove_battery(struct power_sup=
ply *battery, struct acpi_batt
=20
 static int uniwill_battery_init(struct uniwill_data *data)
 {
+	unsigned int value, threshold, sanitized;
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
+	 * need to replace this placeholder value with a valid one (100)
+	 * to signal that we want to take control of battery charging.
+	 * For the sake of completeness we also apply this to other
+	 * invalid threshold values.
+	 */
+	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
+	sanitized =3D uniwill_sanitize_battery_threshold(threshold);
+	if (threshold !=3D sanitized) {
+		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, sanitized);
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

