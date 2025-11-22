Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05B2D879B;
	Sat, 22 Nov 2025 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843931; cv=none; b=sM/djqk2WeKC4T8YDe15lw2w3tMb/KOS6Z8/tDh0Oa3Kl7MUQpqoCMqv9bnRAbrTjBqlGu7XWfSScEQbpH7C6IY7cbHdbr+k5Pfc3k/xCge6sa1uUoPPi1FHfFxRoGej93twdBoiuBkjD1AqM9QgRJaDKDOm7bybbDjwTMUBCbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843931; c=relaxed/simple;
	bh=O8IGx/qdPLgHwXwdToL4OtW7b6tvLndNcTwk+PuIHqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5Ysb7H/hvO+PrLYY7M8SLqeUJCvsFIM3Za7jZY5UuwteIklntwm4grs5HneQGEDotMOe0+pav2kPXmPmJ80rkXVJxXXncI2ZyDxAHfu9p+v2Zg4uWtK1Bjc+1lY2iZ2vnPcbCzAdtUjdmFpsusLOmwf96Od6piw/+Ne0SEAT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=q0SzeYXq; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="q0SzeYXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843921; x=1764448721; i=w_armin@gmx.de;
	bh=FjbEbbK7ftoEL6GHoK2TTMmVOSXJ0BAlCyi8mVntI9c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q0SzeYXqevDmtH+CBOvTt3FGIharULkEafMKQSbJ3H8xK9OZnKrFwAC2tYKta8nh
	 k2xMeKxvRlOLrIXY52CvF6h1NyPPNCVLFcQg1isK1mRXmBXvaNnIxBxMNBwwiBldI
	 lpLbb7vo1S6x8ItythW1CcoHh4Ex2QEzGj8UgfI+KCt931A40eAfl64yM7Hfu6zmV
	 MfYqFD37Pd+B1ITAy0/N/n4V76BMMdr1B4xD/LA/dixJXTE5mpt8IDfYFeOVi4cKR
	 isOVZeqgu5obpbahXHiAngpNKqrfIvvfj+/DDD009qzfjp0OFIxCVMWfcJJxTfFPl
	 ORaGlIcHQDILYgx4KQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M3DJl-1vQT9Q2jQT-008R0T; Sat, 22 Nov 2025 21:38:41 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
Date: Sat, 22 Nov 2025 21:38:02 +0100
Message-Id: <20251122203803.6154-9-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:DfwgPnpZa92k7daNkgknoFDP8Q8z5BTa5oeL5rJIFb9jPNdLmlA
 O43QScR9GWjgrLTPX2vizYa6/VjB7UmGlXCodNCe2EekN2r09SP7zieQpcyPhGzcnVo3XKN
 VtFsNXvnAbWBLG0Xzix8t0dAH9gafYEGR9vhOPvw9Ntnu1VT8Ls3f8fWUhfJ603TSinxNp2
 KwAfVa6NQSpw0XBH7ySMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qd1FpESbgPg=;JGH54gvWVyvVsDNDrhheK/Cq+ei
 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
 MA7GH2Pl4eaBDeZ7ssUM8zdOMA5pgvA7/h+64n

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

