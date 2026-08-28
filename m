Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA82E737E
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933285; cv=none; b=GohYYjgYggvTe73fLOzEpUByYE6a+ldcQcQ+PQIQSHAuKsPhumJ9bi15qmsYdOeDe6RlcUsumbCrlrMm865Z/orltD3xaBfE+92B/AzG8lEgg82mFWU25B5iSnnuBmWjfuru6HuZp24FJQ/d7mZc17dbPa3BBisQYE2Qos/lCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933285; c=relaxed/simple;
	bh=El6eduJDviCKkDnqtlBare5p9hMhasbCq56T7DPYEGY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XKk8nzaFBM9POiQCqay1zqQoHEgAqDIr5AZbpOouFh/xnHOEWx3K/JP8aH1NJabDrGEX2E0r1zUjf8YFkeBXt3qBuyTCqB3YBNgV+2MBrRJiY9ykqDodKkjS906sIVHKrpem06eVN8kzx+wMQOzFx9/7UVYG/u2QWQSWfvmlt0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=JhAwYVps; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="JhAwYVps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1787933277; x=1788192477;
	bh=rmiVJNZ1uNGkCaiKCXdHNv3jP0Dr/SN01JscirGjtrk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JhAwYVpsR2xSgcCS2PI7QP7bcqUtAlX8usExYEdYmROCEN51J2yU4stvU4K0Z0dWt
	 ljW7kKPmUjXDfIy57JdXBUbOTfpiFlWiHaS5Vj4L/4zSgmWfjwii1ejvk+onOdYbAl
	 wT+lPMdiP+eF5TvCVDwjBcrr0AQSsbF6aSLxwJ8C6lW0xZ/o2xZRZ+9bW9Ga9zAjQ6
	 mbt9Pkemi3+Mgeju1/qNjHEh0bGH3BtnU6H/DOXoysCNgKAHR9cMg+wLz8gPVBa1iN
	 9GcuvNMwmXDRPTZZ/8jqK92bGQo6miCYN3tYtKvNY9bCxgjAeWu0oGjydX5Z16fSHi
	 5TidpFsL02+5Q==
Date: Fri, 28 Aug 2026 16:07:51 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: Nir Yehoshua <nir@ciphersecuritylabs.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH] platform/x86: asus-wmi: validate custom fan curves on enable
Message-ID: <20260828160743.31957-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 9028eccc52cb5ff53aa712b03ef09c96021593eb
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

Reject the curve when it is enabled. Validate on enable rather than on
write because fan curves are written one point at a time and are
inconsistent mid-write.

Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan cu=
rves")
Reported-by: Nir Yehoshua <nir@ciphersecuritylabs.com>
Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
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

base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
--=20
2.55.0


