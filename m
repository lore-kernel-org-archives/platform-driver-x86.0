Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518193A35AC;
	Fri, 16 Jan 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596115; cv=none; b=qaooaycJjTfWh5qbv9CenjqR6BXyss5jNitaRjc5yJy5H2dwM7LHZ09zClhQqg3dTLynioXZX/WFMRqe8gOn7bh3y9gn4vHfRwEoyQTYtjN5OSpxoyFbK61ug2+LimMdx6wuZzkJXCGnodp651bExjfhk/00o8tPC2RdToFF5bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596115; c=relaxed/simple;
	bh=O8IGx/qdPLgHwXwdToL4OtW7b6tvLndNcTwk+PuIHqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kkNcPHcCns5UlObjD4i2ZXydTlBeegvn8wOHbN1cfGV+rRJEVAJkKQnrpKivuyPD1gV80DeEp8ei0RjL4JAyV0yV/BFm2lg451HDN9RMP7X0080RjT0KnLBgg97HnHEvBionly/wwtktxj7GAvtql+OkC3ngJqHnNYfO8/lzCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qMNYGbuJ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qMNYGbuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596108; x=1769200908; i=w_armin@gmx.de;
	bh=FjbEbbK7ftoEL6GHoK2TTMmVOSXJ0BAlCyi8mVntI9c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qMNYGbuJKZcCOFMBhAZmJskOHxdFF2k2+2og+JMWCrNUEUaXNOvsVIi30l2nsQ9n
	 30aYALk9dkVv2n/hriF964QAlX+zs/gSRPX0aKvHK4sdTR3875w0qrQBvKlXrQLU1
	 lHBM9Ncl7I7q5yGTCF9hMcnO2OTvmGNwxiM0WahHg4+UNlp6U6ns2Krx2+r/1oR17
	 jirpeASi8gcVFTSuh/ExFtEJMkwMi9USMNwC52VAvOUgMKFelmVNd8w1RIrXJdurW
	 Es5IkjFdXJwMd6IbmZzy7zyLmNMSxR3HYWV0rkQzULQITu1I4XKppmNZO3nBy0JYZ
	 lvyZ/YFgnO1NQqCirQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MVvPD-1vHrg648Yf-00YhTF; Fri, 16 Jan 2026 21:41:48 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
Date: Fri, 16 Jan 2026 21:41:15 +0100
Message-Id: <20260116204116.4030-9-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:wDT5M9zW2s72uiFqNxerTY4qs7rg0tmmR0yH/N5lCuwIHOgQNtg
 QHwSXevaVQuSsChh0/TgRcQHUAfYxnMVew5WPzJ7AS0BMNY5Z/s073akdPeyaiDmhzqSttF
 pa/EQwqpVAAMkwFXBhZIi+t4SQ0a0ErqaTHE07nlKZ0lUmPoTy3v4ZLmiCrQoxwjsJwZL1q
 oVbJY7SAYrZklZMQ8Oe6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nq2h6dG3Nj0=;buk70z8iIocuxsxtJuE91ZpuXpR
 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
 P0qwy7muEvjIdIj9dqNR

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

