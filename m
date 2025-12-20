Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA9B313543;
	Sat, 20 Dec 2025 20:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263635; cv=none; b=PrrgAs3zrTxMASbBpfVxEQe2j0AhJNuXVWiuXP7PzmdmCPOoClsX/PITDA2jZfCGaUgg38YqXG4uo54cOdY/OUcgv3BdG8cy9YDzLFC/GK5to5mzKnPIqDPKILnwPLLrWeBebRCp3eJnhANzvWk0kASgpgphEf9Zg5e7CWgpP6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263635; c=relaxed/simple;
	bh=O8IGx/qdPLgHwXwdToL4OtW7b6tvLndNcTwk+PuIHqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g7BuHKi3KexV+phz+h9n+npB+Jrcj0+95ejlg8HiNrcI8nafLSbB1aidbwAFy3sUCIVTQFyux9rLi3SdKA4XBNK8fdnnEqhW6CBbNSpk65FXGMB0jSN9qAJx2ZFgdEFuq3e6iWWWzDKWRREKTFI647/njT2lCkc7FuL6fpPvat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DC05EYho; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DC05EYho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263626; x=1766868426; i=w_armin@gmx.de;
	bh=FjbEbbK7ftoEL6GHoK2TTMmVOSXJ0BAlCyi8mVntI9c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DC05EYhomHyJ87XahONEd1FU2tGpfhOTGE2RxA11zOgrM2SmcBz0iQiMKHpp5Fvb
	 u3sYAsHLPgJ4wxnsLN229GjjzmwY6/gctOj4X2ap3NpEk184VgdN8PtRzM+GaS5Yq
	 1tPRLyq0UCFe1twpAI1eE+OM8/2sYUngrq9c9hMzXx3WIr+jgTM2oZofL9J+NkagN
	 UAucwdCHKV0vRA0KGmq339O++MDt7l3aJQWOdMPyEmMAfqmSSYBiXEQXmi3whufnA
	 9ubPd56bQgcXOygNCbTZWmfwHFon3Jqd9sy3IuC+1hWwyqOiELgu7MXcFtWuHsbEB
	 tZNXgtGIY3DrWvMZIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MS3mt-1vPjBR21IR-00Rovs; Sat, 20 Dec 2025 21:47:06 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
Date: Sat, 20 Dec 2025 21:46:21 +0100
Message-Id: <20251220204622.3541-9-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:znMtZ12B6OcM82rj4yq3BUq34a3rcldGFpqSiFlSElBkJXBWY2S
 gDaVHr63OfZjsqiGcQxerALwNc4Y6cyld4B5emFSczNOHtlSBtBAS76cfqmYw12lgVPwhRq
 qsqStZjm9w7oZ5p23e9med3aflsvakMUFFAu18MxutCBMYhDHp9R9/+8GtGnheQE0ajCWt1
 WcjXeL7U5hk7NotvV94AA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EScRA6vRrXQ=;hKG4vcgiRZTkWzvH1c6jZhNwQ9T
 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
 fMhbShfBJ+fPJhDqWH7D

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

