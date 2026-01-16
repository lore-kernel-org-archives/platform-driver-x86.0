Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCA13A35B2;
	Fri, 16 Jan 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596115; cv=none; b=hZZNHdhzgImH/20KGQJh/Mc5QXSiWgwDkVOc0Dg/ERV/OyxfbF39PG7dqzKOeCb8Or8nYVm6Qq1Blx0FgMr54Js6Blc8FvaE82gim2ipi/tlA3e0uOpVhtduRzjkncvNF9mvu1iGwKDQpBGiMXLYxzasr3FOXaFMqRWtwroOjvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596115; c=relaxed/simple;
	bh=xQFPf4e4pS/ERkYL/pEVTkOjn8tcKqY6C3zLhawflTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zx0K27obBYjph7YRRCG06TfeV66uFgRJOKY75RLOyW+WujkIC92IFHSn1cJ9VKbplrf1JKqgoQhgTQvTRk/7Pf9396RVwf0zZt83wBhIoyRsSKDHZbocM2g2wj8a+9VBItZGhUDBRU1LUEsQwm55pxc+E7fjZuZKK9zNjRqKP5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=T5D3Nqks; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="T5D3Nqks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596102; x=1769200902; i=w_armin@gmx.de;
	bh=XYhVRH57FDe5woEGMVrFL7y5wNkLwPKSbUKNJXBd9hM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T5D3NqkslLWgmpaFJsRvyIQ+daocIUwV+FCEyyVXd+ldugR0boRMPodyA+AC12r4
	 jCGgb9Qrr4YxYhwNA45iIxZzhYc60GQpqBmnJAW6DDIlSKU19lV+B7+TFdyH80vFW
	 n9QFmcGOe96WxNSYjf5CcGcYPR6TdfR3qLUplVE8Uz44dplAQ22TFYvw3ETr+5rWQ
	 61LUC/FE8WQRcgAe44KJoFkORPExbDnuj0iZ04Sbw2mxhoEDt/vqETgF41vrufggU
	 Bv/A12/+cisW2zCm0WSFQch8WNqudKy+mDVFujOhb7gtjx9Xu7MhuYzri2m90nE+V
	 xDkomGRJahHNQZlMeg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MXGrE-1vJGKB2Eow-00RoUc; Fri, 16 Jan 2026 21:41:41 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
Date: Fri, 16 Jan 2026 21:41:12 +0100
Message-Id: <20260116204116.4030-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116204116.4030-1-W_Armin@gmx.de>
References: <20260116204116.4030-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:izR2mGXqcirua9qvMvy3zoCgFLQDx5UFkKVZBE9SwrpIkzp4ofO
 j00RESisRTg3w9P7fwpmOBo682sVsfR71oN/FIBCZDcTLiWjOFztXdTEb4ZFolFrFXnGVWz
 0vMXCQxvcpxKQ5JoqpahTM4GNKc6qr7wZ6ouVPwlIrq2Obr0R1hHcNuMquxF3cvmQQQie6V
 WV6TfnK9htX0TRorUXffw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I2dbwOX1ARM=;IZvKfBvzgYRB1FF5OSsFuNPrSzb
 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
 kNWTTljiCbn

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

