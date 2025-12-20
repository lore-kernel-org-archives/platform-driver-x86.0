Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6173128A3;
	Sat, 20 Dec 2025 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263624; cv=none; b=jkIT4Krepr+wtyjXwWqd7lGWpL1XBz/getgZHQlJ364LnXenxzHJ7y2ZTi/KIqenj6J2zKi5bzxQ8Ix0O+0wNdP1bncP8PsjB0R1lZp0tZNrqZvU/W6WN27up7cp/BPu8Fi9/JOnfPlRmHxiLzovR0akbURXCNPBe3kor45FFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263624; c=relaxed/simple;
	bh=xQFPf4e4pS/ERkYL/pEVTkOjn8tcKqY6C3zLhawflTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b2iWDf8jPXBZYGd6GGbAUhSBxsLnL/uK+imstKT4BWksRITNXmvlWevkXfJOyUF/JQJzniVD5uXd/0iTOGmgoO8xd68NHDlS/fdNWGU+hT06A+x6UjiPiYBAObOv+YrllsFKooeIFb766xFQA6BliGtUVoqZjINHGzMv2rOd0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CPNM3+TU; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CPNM3+TU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263620; x=1766868420; i=w_armin@gmx.de;
	bh=XYhVRH57FDe5woEGMVrFL7y5wNkLwPKSbUKNJXBd9hM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CPNM3+TU1z2ry2lNkhOu4K/C/htCnBMWeZ/ea3nXhNeif1+Xj27ZSaiKwMjE0JO5
	 JFx3meZRdiXJ/xfpiufnmGASqfBzthFsMFTjNfmWdYdkuCtJQf/mOOS9iidyWd+rR
	 OP2I1OQi41WOsM0T3bQnr2/QLw8WXUjHOhpk2CzzOhKY3lnYdwVvsz4qs483pVgf5
	 z93FlrErbBz/uWgXK4gt21jjpiYKG19WTbcd7bNWsUuDSptXgDT1zLpdEnLgxECGw
	 hMUFNFDpp1cYxIb+Gv8y25KoPZyjfOYuzoX9DWmSsksRqcSr42R26hxrslaeitbOW
	 50G5VJhWNiC9TdDacQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MOiHf-1vKDP91Pnb-00MJ0w; Sat, 20 Dec 2025 21:47:00 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
Date: Sat, 20 Dec 2025 21:46:18 +0100
Message-Id: <20251220204622.3541-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251220204622.3541-1-W_Armin@gmx.de>
References: <20251220204622.3541-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6JK9w47MK5ph4TXLwub8WQ/fkQ+ijnBvxYtYxWSVOlqKJ1qqU3d
 I+lj1vTlGKa+mFO+6mzRiUAR1JOOLiUFEEQpfi2XhU7r8DtRwoPP3Jew0BfViFaD5mXRbZt
 FoRa6qwfi3qLnu43dwwX41T5pv1HKyTYjF54sc06n1RqDHADFIpj+OBZDYjnPAXSQUaSvVY
 VYyO0hknTNFYL3iuaQz7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nlxhYBSnoBM=;DK0MAnU4B/mmQE/LVq3HGx2fAIM
 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

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

