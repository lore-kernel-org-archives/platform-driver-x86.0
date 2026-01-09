Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EC333EAE9;
	Fri,  9 Jan 2026 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995227; cv=none; b=o+fciSrVCfGSPPPK7OCgJ729Z39cC86o+rW1Rp0EHEg1OXSb/ui3OR9VR7dpAPaj2G4YRjQDCdmWCHTDQojb7xBO/1+ORRYFMOAYqOJv7s3Si8frCDxBlBuo2XewNhDBJropRzXGAqnyFxXz4ZOKahRoMM8yz9jQj885ws5DJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995227; c=relaxed/simple;
	bh=O8IGx/qdPLgHwXwdToL4OtW7b6tvLndNcTwk+PuIHqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qla/kLC8+bvk8Oph1tiu1G3t5cKSWTqPmj7hLSba0DJN2+5oWvvDwPU4JkJ2fZ3H82fHvF5+eCiVjNC/KWv93X0MKFiG8E54SaXMfud6KoRvCDvGGfgr1UziysMvg385nIjAdc02335KzgXYvt9VFCyWy5XxzkPCFWt49d9CZcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DBd8pv8o; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DBd8pv8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995214; x=1768600014; i=w_armin@gmx.de;
	bh=FjbEbbK7ftoEL6GHoK2TTMmVOSXJ0BAlCyi8mVntI9c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DBd8pv8oWooainOCtUhASTNX0QRvLP2JnXNdOyQgYDlsixVAa29TLUfMJGpj5ccT
	 rLWrCUTEQwA4D4QMKPt2VI1HIyc2zG+PHzz4iJ2bLmEsAXuflPgitSVVEw7mqk8hn
	 vYGIzHpOICpEmUJpcJQEUMbdJczQZf7kkgD6RFUktihJ6ctIH8ZiUAa+XZ+O0hkGz
	 qsLXfec0pSic9/KMJhwjeMYpfWnBwlxZuPcZq2bbydXpPbgT8L69abahU8XUKQ6Bm
	 leMz6zJ6PxibrJHodbs3ZjcnMSlXyCAjqeE1BJFRoWslKPdLHqzFFY4AhrcisoQA0
	 FwFJOhMJzs5mBstLSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M5fIW-1vlSvX2yDK-003l8z; Fri, 09 Jan 2026 22:46:53 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
Date: Fri,  9 Jan 2026 22:46:18 +0100
Message-Id: <20260109214619.7289-9-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:F0wlaMqxB0v5zxJR6uG4LHUx/yuxToxiJn2bnGZ0dx+YPM1yKHW
 G/ayJ1ZEh6UUebfoLoOsTf5Cv4kydQTXTv1x1la3CS8Iw/KXuIYtZ1ngMP8Pd/fBTxDU4oo
 RMTFeFui31upTYjB2SmpJWIUf63Og4pvaVva5i10OE3Y7cUrDGaMRpp5zE5JX/FEjfeihms
 JzvKI18WEYUp7vhaAidHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:phvMPZrApMg=;CH8Ol2J8JF0rGA0HxLXQY1jNhqG
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers to return the BMOF data.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/wmi-bmof.c | 34 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bm=
of.c
index 5b00370a9a22..e3a126de421b 100644
=2D-- a/drivers/platform/x86/wmi-bmof.c
+++ b/drivers/platform/x86/wmi-bmof.c
@@ -8,7 +8,6 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
@@ -24,9 +23,9 @@ static ssize_t bmof_read(struct file *filp, struct kobje=
ct *kobj, const struct b
 			 char *buf, loff_t off, size_t count)
 {
 	struct device *dev =3D kobj_to_dev(kobj);
-	union acpi_object *obj =3D dev_get_drvdata(dev);
+	struct wmi_buffer *buffer =3D dev_get_drvdata(dev);
=20
-	return memory_read_from_buffer(buf, count, &off, obj->buffer.pointer, ob=
j->buffer.length);
+	return memory_read_from_buffer(buf, count, &off, buffer->data, buffer->l=
ength);
 }
=20
 static const BIN_ATTR_ADMIN_RO(bmof, 0);
@@ -39,9 +38,9 @@ static const struct bin_attribute * const bmof_attrs[] =
=3D {
 static size_t bmof_bin_size(struct kobject *kobj, const struct bin_attrib=
ute *attr, int n)
 {
 	struct device *dev =3D kobj_to_dev(kobj);
-	union acpi_object *obj =3D dev_get_drvdata(dev);
+	struct wmi_buffer *buffer =3D dev_get_drvdata(dev);
=20
-	return obj->buffer.length;
+	return buffer->length;
 }
=20
 static const struct attribute_group bmof_group =3D {
@@ -56,30 +55,27 @@ static const struct attribute_group *bmof_groups[] =3D=
 {
=20
 static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
 {
-	union acpi_object *obj;
+	struct wmi_buffer *buffer;
+	int ret;
=20
-	obj =3D wmidev_block_query(wdev, 0);
-	if (!obj) {
-		dev_err(&wdev->dev, "failed to read Binary MOF\n");
-		return -EIO;
-	}
+	buffer =3D devm_kzalloc(&wdev->dev, sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
=20
-	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Binary MOF is not a buffer\n");
-		kfree(obj);
-		return -EIO;
-	}
+	ret =3D wmidev_query_block(wdev, 0, buffer);
+	if (ret < 0)
+		return ret;
=20
-	dev_set_drvdata(&wdev->dev, obj);
+	dev_set_drvdata(&wdev->dev, buffer);
=20
 	return 0;
 }
=20
 static void wmi_bmof_remove(struct wmi_device *wdev)
 {
-	union acpi_object *obj =3D dev_get_drvdata(&wdev->dev);
+	struct wmi_buffer *buffer =3D dev_get_drvdata(&wdev->dev);
=20
-	kfree(obj);
+	kfree(buffer->data);
 }
=20
 static const struct wmi_device_id wmi_bmof_id_table[] =3D {
=2D-=20
2.39.5

