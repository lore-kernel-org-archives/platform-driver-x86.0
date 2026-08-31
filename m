Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCCA3655E4
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202105; cv=none; b=iYUhaFF+WCGClyc+V5/HkFfxIn6hUg7+vs8tTdm7Bb2hK8MoWkhtNFki4FHR0NoiCBkdiy2aqGsqdfKvrAfVmF2onJnn+E8pup56zCUiwNT8V8WH7GU1+5zKNjXVZjX/LA0ZbCp5RTM+ksC6fsiJaCmY6ygfYJBj/Ym4qUY7wTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202105; c=relaxed/simple;
	bh=Az2Pl7f1QwhQKoRNPr+QTqcoARhJrySgPolWHdwi4M0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mvTwahaIrxfUv/B2eExd9jKfHSWYoiihsiOFQm7ezCXEbMzuVbExfehOSXRGgGOBq25tyoonEdy/HpXfkl8amCsPWfjJE6l5gKW5tldsgfVLjaMq5cTkau6Lu93ok1RRrlK6QLMiV8ajG1BAIPURPrWY0KNXzCkpHuyx8fftS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=nhMN4Gg3; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="nhMN4Gg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1788202095; x=1788461295;
	bh=hHFk5EVxfr8xhwx4V530sofgTok9YiDl5MjT46/MXxM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nhMN4Gg3fIryM/gC0UK7ZgkH1TKtOy2IGKrPE1vHeCT9/XWkWD8P2PEsyrriaxipT
	 rzXLLdEu8gwpKOCGE/Inr/a0ha8cueXlaO6uoK9oaS9Ut1L4MZDuwj8FlBVQCpV9aG
	 t7deCN50cWhAzN6HhEUybytkGavsXgk5zdfzaAqHM18HDOl9BevPjj2COzBCvVdxcd
	 T+7y6kh3Mvomf/seQxgN2qVo7JBoBxSm0MIz+a8YjIh8FH2Y1oWq1hYmuwETbsEvAq
	 GYs4pH6m01+CcDk393fx7+J4ZdqbvYu3n4aMifWahSp3AKnrg0eOXS3BRVzO8z48Nk
	 InqnqH9D1ypmQ==
Date: Mon, 31 Aug 2026 18:48:08 +0000
To: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Nir Yehoshua <nir@ciphersecuritylabs.com>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH v2] platform/x86: asus-wmi: validate custom fan curves on enable
Message-ID: <20260831-fan-curve-validation-v2-1-7274ca16c8fe@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 94db74f0edd852b9a8cb4a700b5a0e1a0afbb9de
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Custom fan curves reach firmware unchecked, so a curve whose temperature
or PWM decreases from one point to the next is accepted. The firmware
does not respect such a curve: a first point of 100% followed by 50%
leaves every point running at 100%. The kernel keeps reporting the
points that were written, so sysfs stops describing what the fans are
actually doing.

Check the curve when enabling and reject it if it is invalid. Validation
is done on enable rather than on write because fan curves are written
one point at a time and are inconsistent mid-write.

Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan cu=
rves")
Reported-by: Nir Yehoshua <nir@ciphersecuritylabs.com>
Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
Changes in v2:
- Rephrased second paragraph of commit message (Ilpo)
- Link to v1: https://patch.msgid.link/20260828160743.31957-1-yaseen@ghoul.=
dev
---
 drivers/platform/x86/asus-wmi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wm=
i.c
index a65090429ca7..3b743fec5c64 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3714,6 +3714,33 @@ static int fan_curve_write(struct asus_wmi *asus,
 =09=09=09=09=09 arg1, arg2, arg3, arg4, &ret);
 }
=20
+/*
+ * A fan curve is a set of points the firmware interpolates between, so it
+ * only makes sense if neither temperature nor PWM ever decreases along it=
.
+ */
+static int fan_curve_validate(struct device *dev, struct fan_curve_data *d=
ata)
+{
+=09u8 *percents =3D data->percents;
+=09u8 *temps =3D data->temps;
+=09int i;
+
+=09for (i =3D 1; i < FAN_CURVE_POINTS; i++) {
+=09=09if (temps[i] < temps[i - 1]) {
+=09=09=09dev_warn(dev, "fan curve: temperature decreases at point %d (%u <=
 %u)\n",
+=09=09=09=09 i, temps[i], temps[i - 1]);
+=09=09=09return -EINVAL;
+=09=09}
+
+=09=09if (percents[i] < percents[i - 1]) {
+=09=09=09dev_warn(dev, "fan curve: pwm decreases at point %d (%u < %u)\n",
+=09=09=09=09 i, percents[i], percents[i - 1]);
+=09=09=09return -EINVAL;
+=09=09}
+=09}
+
+=09return 0;
+}
+
 static ssize_t fan_curve_store(struct device *dev,
 =09=09=09       struct device_attribute *attr, const char *buf,
 =09=09=09       size_t count)
@@ -3798,6 +3825,11 @@ static ssize_t fan_curve_enable_store(struct device =
*dev,
 =09}
=20
 =09if (data->enabled) {
+=09=09err =3D fan_curve_validate(dev, data);
+=09=09if (err) {
+=09=09=09data->enabled =3D false;
+=09=09=09return err;
+=09=09}
 =09=09err =3D fan_curve_write(asus, data);
 =09=09if (err)
 =09=09=09return err;

---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260831-fan-curve-validation-991770300ff3

Best regards,
-- =20
Ahmed Yaseen <yaseen@ghoul.dev>


