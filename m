Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844E33EB0A;
	Fri,  9 Jan 2026 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995226; cv=none; b=UbRKuDkNmNE3Gk8huINVbCYqwLUPqI3tDT6uj9wrbzia//pE5o2d9DthrWhKufcby/RLSANzVPAjusH6QhdZHq3aPhLz+1FtYhwgDp64ns8/zJVF/safvq7KbkN7PnYbIkmtAZNUgZNg6mWu7A7/1lSIa0uMM9IpqEPPo9EFpdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995226; c=relaxed/simple;
	bh=xQFPf4e4pS/ERkYL/pEVTkOjn8tcKqY6C3zLhawflTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gv++DF7Dw1q10d6hUu5WV+fs3UHwXtGznI65UMbY+spoxA6/tnGajyNSmCVtjkyYGd2IJ+pmvjsGWDp+NY11kJW849m/SrG8B+4l956R2vNW+oGlxEaAvFV3M7fe3XaoQp2ChHddW8ZHNM3U0i5t7P6+KPHtaE7EVJYRFf/kkvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WN0jQjbs; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WN0jQjbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995211; x=1768600011; i=w_armin@gmx.de;
	bh=XYhVRH57FDe5woEGMVrFL7y5wNkLwPKSbUKNJXBd9hM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WN0jQjbs83hPqOOtr8IeJ3kEBWD3O9SvSn7Ssj2+ssuPoaHIFhhyVdEKoLuef2Ox
	 YMM9RNskriWygF74Yq2wkmzi1WGYCwdG8ZT2rk4W/nqRLqZpdakduI8iYEERqAXuS
	 7D8ZeAaRYqur1PL8pVd4D2Y5f1/8lXH35sgWWUNXQCegOxsig0+59dj146MLZdFTr
	 2HJkxIcYqtY9jtb5Qc/e3UT/3vxxY1O6HWvN5hdd24blntRglUbk29hXEcJsc0lLJ
	 AFwNcu0SiHlKBRprMIksyp9K89Sgq7bPa9p21zknxQv6OudrWKeHSBbW4EkYwkH8B
	 y0Di6Q/RkvmZGxqiCg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MybKp-1w3PBa0bcL-00tf47; Fri, 09 Jan 2026 22:46:47 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
Date: Fri,  9 Jan 2026 22:46:15 +0100
Message-Id: <20260109214619.7289-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260109214619.7289-1-W_Armin@gmx.de>
References: <20260109214619.7289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BJN/dBnHL4OnOvl3/E/zCQe2r1D5+D6Y7gatxXZIAsIqvCA3mtV
 8uEawEfok6ANqG1KdgrF5uswia6iNoN3ROzEgsgDLVOmxhEkizj9ZVnZNJq/H/g08P1bs5P
 zDe1ob4+7f/NXGffvgro26B/bl1XQ87LO17bixSLgsUL/5OJeY0kLMrrcdQx0QiAFLh2dOd
 esVXP7UxvIa4x9NIN8ftg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yn7JqgIxPJM=;DxdAXhmyQ7msAqtZvbNLNbG1ist
 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
 iGqKfs=

Use the new buffer-based WMI API to also support ACPI firmware
implementations that return a ACPI buffer instead of a ACPI integer.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../platform/x86/intel/wmi/sbl-fw-update.c    | 43 ++++++++-----------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/plat=
form/x86/intel/wmi/sbl-fw-update.c
index 75c82c08117f..3716ccaaed6a 100644
=2D-- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -14,7 +14,6 @@
  * https://slimbootloader.github.io/security/firmware-update.html
  */
=20
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -25,41 +24,35 @@
=20
 static int get_fwu_request(struct device *dev, u32 *out)
 {
-	union acpi_object *obj;
+	struct wmi_buffer buffer;
+	__le32 *result;
+	int ret;
=20
-	obj =3D wmidev_block_query(to_wmi_device(dev), 0);
-	if (!obj)
-		return -ENODEV;
+	ret =3D wmidev_query_block(to_wmi_device(dev), 0, &buffer);
+	if (ret < 0)
+		return ret;
=20
-	if (obj->type !=3D ACPI_TYPE_INTEGER) {
-		dev_warn(dev, "wmidev_block_query returned invalid value\n");
-		kfree(obj);
-		return -EINVAL;
+	if (buffer.length < sizeof(*result)) {
+		kfree(buffer.data);
+		return -ENODATA;
 	}
=20
-	*out =3D obj->integer.value;
-	kfree(obj);
+	result =3D buffer.data;
+	*out =3D le32_to_cpu(*result);
+	kfree(result);
=20
 	return 0;
 }
=20
 static int set_fwu_request(struct device *dev, u32 in)
 {
-	struct acpi_buffer input;
-	acpi_status status;
-	u32 value;
-
-	value =3D in;
-	input.length =3D sizeof(u32);
-	input.pointer =3D &value;
-
-	status =3D wmidev_block_set(to_wmi_device(dev), 0, &input);
-	if (ACPI_FAILURE(status)) {
-		dev_err(dev, "wmidev_block_set failed\n");
-		return -ENODEV;
-	}
+	__le32 value =3D cpu_to_le32(in);
+	struct wmi_buffer buffer =3D {
+		.length =3D sizeof(value),
+		.data =3D &value,
+	};
=20
-	return 0;
+	return wmidev_set_block(to_wmi_device(dev), 0, &buffer);
 }
=20
 static ssize_t firmware_update_request_show(struct device *dev,
=2D-=20
2.39.5

