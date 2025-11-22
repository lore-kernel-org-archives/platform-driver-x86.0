Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469E2D6E72;
	Sat, 22 Nov 2025 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843925; cv=none; b=k0cuLYSnqlf9gAwYlxmHfmFQQKsR0/w4O/VMaAJhdMu4hHw4mQMzLp5wKhtkBJxsn6QmA0L1g+QgTrMvZzYprgHonOwiqimMnwZXiAD5J1wWS9CNW1o9lWW8Fo/Njekvp3IQx0Je4RrQzbr4BjH1xalJm5aVXX/h6vQxu21gWkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843925; c=relaxed/simple;
	bh=xQFPf4e4pS/ERkYL/pEVTkOjn8tcKqY6C3zLhawflTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SQYxhhwMrRkqktyomgJsoiA0YyDgTqoveavxheeaMsU7oOkq5TqHaBSTCp2dkRBxawWTFuG5kwGsAPLDU9lnQIEz7uSVvoKa0mwzc9vM3Q8duNxDXXZjL2e4ge4WlhGP5hvoeoIkBm3unYZI6pqgEYI164TsdQve+gird46AgSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JYD0D2PT; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JYD0D2PT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843914; x=1764448714; i=w_armin@gmx.de;
	bh=XYhVRH57FDe5woEGMVrFL7y5wNkLwPKSbUKNJXBd9hM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JYD0D2PTaauk8jMbnuawn78StUD1Fq57rw51PmC6ZyXIhFVX1WwpI2jXiwwRZBKr
	 v1jL5wL9iN1oZw9LBC1w3gEXeEA51BJaEM+HAaYdNHmBvtGj3qr3kMpHMjMDw1OZ9
	 3rjzheCwAyNfXONkE7qvEQr+shseIiwmRCAov7g3V/+MNTNVJjSbax5sqN8IxoxKz
	 XjNxPnhIqC6n4eq/bpfdC7vPfNpe+P10HZ8ItFSvY/SNoMz8Dng/yrXreOEzzGGeO
	 wydGYA6h7oVUITqvpY2XG0XQG7Miza8iFcBHmkJKjOWBgwg8vB8Wx3x4MRsqekRtP
	 bUBDTdyx5PzvJe/7WQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MkHQX-1vpwbj1awL-00iCOk; Sat, 22 Nov 2025 21:38:34 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
Date: Sat, 22 Nov 2025 21:37:59 +0100
Message-Id: <20251122203803.6154-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122203803.6154-1-W_Armin@gmx.de>
References: <20251122203803.6154-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:viJsEIOzVESAmuawZjaHdX/MUEadanGIjLp7QiUFAxJlLaJpQJX
 LVFVThEUZs31TnOFS3U6Wpfah5UGlfppJ0wtAdD8iuBIdx+sTNbqd9PUlV5m2GGKScPeJG4
 M85CyA45uRj19C9jUyxS87+uhuu0lR/lsOISaP2rRLCyfXYve8Qs3hnXG3bv2MWxjh8YJPV
 nICr1FOaSPg47bzIrFUqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DqbXuNA9+Ps=;aAZpP8Apy44sJaCtgTHQZRM8OY+
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

