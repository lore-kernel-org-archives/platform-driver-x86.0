Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDA396D1F;
	Mon,  6 Apr 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504234; cv=none; b=OPfUYYIWxhnKklcSGh6tdvk8U1QLOAHxmrEU788sbj1TxVEDM+nPKNsIYTRVPAWGin+znrjjLOZZHsP8OE65WxC88nzZuowGUTkMnLEgYu+Kt/8j28oTlvFwwqHS9iRPJ+Li22C3nfwx/otQDh/dKSFELBAUnC3kO+51hUCXHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504234; c=relaxed/simple;
	bh=5TC26Ptdx4tuYhuPqw0/YxBA1olP5iJIEZiKBC9B8DY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ohN6v4qwyuMfAOsWBsI2uyArJ5I8oUp6f96d3AijzkiHC25QzD+KKbdgi0Or+hqs6ei6cmhpkl5/c/Q/ry48ekDgCyDBYSgWOmwlmhJRV+sqbP7ggOt91spyVEe1K3Q0e4m980TWwHRaVzhxBH0Gv20qdpEzBKRpsOUYaaUIrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Z9cpaX96; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Z9cpaX96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775504222; x=1776109022; i=w_armin@gmx.de;
	bh=Yl4RMfwPBmbVWShMGFLxwWCf0nqT2ef7m8wM5ZraTnc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Z9cpaX96GznuZ4Nd1Feo6TaV31XzXgJxaNeTz4JguYmHx+wooc/vqyNVMmQcVf+k
	 Z47a19XAfSAAz3DmbM3OrRw7ZcPjUVzTyW5tjYFNNbDfYtoMuQEBLI7lB79QkDiPn
	 9Ny04mF39OeYa/grpHG+SjSIZnYvyJLJHjNI7M2aaG1RKX0So1riwu9pLFL7yeJ8+
	 rq/DdHI9N6ZK5mGAkdezSO2njUFRqR99cYB5DrFLX0rseI5frE761SxIPtXH5UnA8
	 vqw5LoydaX0qORDVPBmz8BkJr+ohqpzpClgN2hzYn/+THVkK4UMyA8AoFHkYjmDJ6
	 i8LFUyNakTgUq+h+vw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4s51-1w9Ylt1LVv-004Sff; Mon, 06
 Apr 2026 21:37:02 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] platform/x86: uniwill-laptop: Properly initialize charging threshold
Date: Mon,  6 Apr 2026 21:36:48 +0200
Message-Id: <20260406193653.7799-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406193653.7799-1-W_Armin@gmx.de>
References: <20260406193653.7799-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0LXu7fExgL7KYRO8cp/MQvVb6T75+SxZD6RknR+4vlt9vHxV0gB
 4LH7NBUB4VVlB+063hAJcKHcNEgBnk+TXRGipBMxqh0XWPUHTdnarWIVz2VZ3HnADoXfR1U
 mDYt2gX9RwS7TvKgVyoLCTiO/8Px8g5m1yjF6xxedoy+Oi/a6+mX9rng8q//0JdNIfNRZe9
 gxL9iSrhxgBcXzX5BHgGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7qJe7FCDRJA=;v4M7jjX9GSaT5UuaYlshV+hdBIE
 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

The EC might initialize the charge threshold with 0 to signal that
said threshold is uninitialized. Detect this and replace said value
with 100 to signal the EC that we want to take control of battery
charging. Also set the threshold to 100 if the EC-provided value
is invalid.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
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

