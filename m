Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F637207D
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201958; cv=none; b=lruNFV4uSzfPvPX8PnJhH17+xw+NeG7tdN1iTpeHMUj4yXx3yzCpjN7J2sv7qqBi7CxiVziN8oKBxeQ0tP3mxAz+Qzgdrw1nzBK5OwET7Mcr/eA68tQ4j/B0wLJ/8DvWwtEIqN2FJakp8+IW95M/3psJWeruA1xxLEgFkw4JWRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201958; c=relaxed/simple;
	bh=Az2Pl7f1QwhQKoRNPr+QTqcoARhJrySgPolWHdwi4M0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SffoRZneXEhCPn0pYjPYxV17BJRPYk1mJeU/9+IKIAzJ427h2odxEaNgPKbuzoVAYIZjFY3WYzy87DvMOQqJ5PIKg8aveggq3m/FVS6bTjPG/yCTy32N79HngFqGMZshMM2/0cR4BddffnQi7vHDVeqAlLiQ04B9iqSrJNgtT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=ALamzQIs; arc=none smtp.client-ip=109.224.244.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="ALamzQIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1788201950; x=1788461150;
	bh=hHFk5EVxfr8xhwx4V530sofgTok9YiDl5MjT46/MXxM=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ALamzQIsEuHqJzHfGYHDjRpjNMp4wXbJGQbwbxzWQfhiJ1eeVCknZdz8FR2Ek5+Gc
	 OOzyRHmZLAzTPqpGpEfjpinBpSeXWH5Q2BuEgO2xrRWlWaz67E3N/aTVvWU+LSfaKJ
	 VbApG1OmA34NRJWhvVs8yGcJVxv5AYkqk9wiNszBer9ofN+XhdcMk6mX55roA3rJjm
	 ox4bhq8+r2y55E2llV0FE64ggt0tk6z0DXUES06V9wzPXCIwnGqDmYqd7B/RyzCdM1
	 ljGwSk7X2wDH2u/p98EWQwE/eS9uhSdP7RsyOlC26xWwf/Ya8LkuSg8YGloB83i7bl
	 qb7j/JrkPAk7A==
Date: Mon, 31 Aug 2026 18:45:44 +0000
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Nir Yehoshua <nir@ciphersecuritylabs.com>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH v2] platform/x86: asus-wmi: validate custom fan curves on enable
Message-ID: <20260831-fan-curve-validation-v2-1-36f4223aedf6@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 06014c918ac4eb6db907ce9912256e96113176cf
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


