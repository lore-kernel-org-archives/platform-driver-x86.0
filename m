Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52B5388E58;
	Thu, 16 Jul 2026 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784180046; cv=none; b=Fwgt8rJcklHBM5/HViV+lN1rctwCwcOAMQeBQSI5CwgvSVt+QzQ8IvkHyjS2O4YXtOAi1KB4v+5dGY/r+TF/LM4mmKVEeK8tBS5CAsH/Hgx8H35QrwFQ6ArlTTcmc4F6t2qFv8brO46z2HDlSh0Xp/rVLc0VzqTZ5Hj9vVZ2b4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784180046; c=relaxed/simple;
	bh=dY8rw6MUH+xwZ4RsvR6t0ht359vzmaEYuAmR+mAxAd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g3jN0BPkxLMSG8yUeVV6pziD6q/giv1DQ+T9m5dDO8d92KTR/AcIUDsqINVOz8yuJYbuANcvscFLzI6hcbtAM2AYr03uWm05/MXdTjbp32VwxbHH1Qh/KalXuHb3w9eg9cBqI3XcClQQShGCbYW4CaqwKqKrzrNarWocbhli2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Gx1NENMv; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Gx1NENMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784180025; x=1784784825; i=w_armin@gmx.de;
	bh=SmamIwnRxEyHtCNglfpfBhFgRhp9YRIk5wmLewufYo4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Gx1NENMvBJVB8QPJc9CmtXnCGqTzOgfsJHhKsAE4XE2s6tY1obslPgeulzweTTZN
	 2gzsFKs2bZ7S2jhXAqbgAz4Ik9DrLCeQV3Wkp86qiYbB0+s3uyxsIJHCPFiaZazYp
	 aY0b8lPJll6m8OfXVF47AeluiCU6irAn1PXNiGZxKDfXhrTZWc+C5q7oyci/TLQDb
	 NieyqDj9iMSBmeI5TBX5iZHLe3oNMc4ccxUysp6tN+D+6JY8M97ax+VkqgVOe8J7a
	 +Sa4oNLM9adQrXcEUo3Ng18a1nqVwvTyWTrZQ5btCsSWXwvblyS2KVEa6XJhd6GOK
	 Ksj5E7SBjlxi7jYwGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGVx-1wNLcL3heP-00MPL4; Thu, 16
 Jul 2026 07:33:44 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH 3/3] platform/x86: dell-smbios-wmi: Replace global list with single item
Date: Thu, 16 Jul 2026 07:33:37 +0200
Message-Id: <20260716053337.112533-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260716053337.112533-1-W_Armin@gmx.de>
References: <20260716053337.112533-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ojju9k/BcStugkQiceu1giiVnJ/zsCKMqFYmi6oNqyqZiiPFTNB
 LNmQGt/1mki4Z4ITKJweyv1JMpel9v8LedjGutAs0o8b12kKwN/eY5tU/pEJ1wbXHxxqqeo
 xlxHg3fGVkWz1qLURMPexLddUo7W0+C4cnFHsbop2oiCVTc3dxLsEtdIe77lZdicCiswE4l
 O4y5fxFRDIhT3IOzYnueA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SrICmNCaVKw=;4Hff5qxJEH3TOiBFwB+oWyluTt2
 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

There can only exist a single instance of the dell-smbios-wmi driver
at the same time because of naming conflicts with the character
device ("wmi/dell-smbios"). Having a global list for all instances
thus makes no sense.

Replace the global list with a single item used by the character
device. This simplifies the driver and allows us to mark it as
being multi-instance safe.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-wmi.c | 67 ++++++++++-----------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index 552b80429688..f9443ddfff55 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -10,7 +10,6 @@
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/fs.h>
-#include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -21,7 +20,6 @@
 #include "dell-smbios.h"
 #include "dell-wmi-descriptor.h"
=20
-static DECLARE_RWSEM(list_lock);
 static int wmi_supported;
=20
 struct misc_bios_flags_structure {
@@ -35,20 +33,14 @@ struct misc_bios_flags_structure {
 struct wmi_smbios_priv {
 	struct mutex call_lock; /* Protects the content of the SMBIOS buffer */
 	struct dell_wmi_smbios_buffer *buf;
-	struct list_head list;
 	struct wmi_device *wdev;
 	struct device *child;
 	u64 req_buf_size;
 	struct miscdevice char_dev;
 };
-static LIST_HEAD(wmi_list);
=20
-static inline struct wmi_smbios_priv *get_first_smbios_priv(void)
-{
-	return list_first_entry_or_null(&wmi_list,
-					struct wmi_smbios_priv,
-					list);
-}
+static DECLARE_RWSEM(chardev_lock);	/* Protects chardev_priv */
+static struct wmi_smbios_priv *chardev_priv;
=20
 static int run_smbios_call(struct wmi_device *wdev)
 {
@@ -105,16 +97,13 @@ static int dell_smbios_wmi_call(struct device *dev, s=
truct calling_interface_buf
 static ssize_t dell_smbios_wmi_read(struct file *filp, char __user *buffe=
r, size_t length,
 				    loff_t *offset)
 {
-	struct wmi_smbios_priv *priv;
-
-	guard(rwsem_read)(&list_lock);
+	guard(rwsem_read)(&chardev_lock);
=20
-	priv =3D get_first_smbios_priv();
-	if (!priv)
+	if (!chardev_priv)
 		return -ENODEV;
=20
-	return simple_read_from_buffer(buffer, length, offset, &priv->req_buf_si=
ze,
-				       sizeof(priv->req_buf_size));
+	return simple_read_from_buffer(buffer, length, offset, &chardev_priv->re=
q_buf_size,
+				       sizeof(chardev_priv->req_buf_size));
 }
=20
 static long dell_smbios_wmi_do_ioctl(struct wmi_smbios_priv *priv,
@@ -158,20 +147,18 @@ static long dell_smbios_wmi_do_ioctl(struct wmi_smbi=
os_priv *priv,
 static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd, un=
signed long arg)
 {
 	struct dell_wmi_smbios_buffer __user *input =3D (struct dell_wmi_smbios_=
buffer __user *)arg;
-	struct wmi_smbios_priv *priv;
=20
 	if (cmd !=3D DELL_WMI_SMBIOS_CMD)
 		return -ENOIOCTLCMD;
=20
-	guard(rwsem_read)(&list_lock);
+	guard(rwsem_read)(&chardev_lock);
=20
-	priv =3D get_first_smbios_priv();
-	if (!priv)
+	if (!chardev_priv)
 		return -ENODEV;
=20
-	guard(mutex)(&priv->call_lock);
+	guard(mutex)(&chardev_priv->call_lock);
=20
-	return dell_smbios_wmi_do_ioctl(priv, input);
+	return dell_smbios_wmi_do_ioctl(chardev_priv, input);
 }
=20
 static const struct file_operations dell_smbios_wmi_fops =3D {
@@ -188,10 +175,29 @@ static void dell_smbios_wmi_unregister_chardev(void =
*data)
 	misc_deregister(char_dev);
 }
=20
+static void dell_smbios_wmi_clear_chardev(void *data)
+{
+	guard(rwsem_write)(&chardev_lock);
+
+	chardev_priv =3D NULL;
+}
+
 static int dell_smbios_wmi_register_chardev(struct wmi_smbios_priv *priv)
 {
 	int ret;
=20
+	scoped_guard(rwsem_write, &chardev_lock) {
+		/* We can only have a single chardev at a time */
+		if (chardev_priv)
+			return -EBUSY;
+
+		chardev_priv =3D priv;
+	}
+
+	ret =3D devm_add_action_or_reset(&priv->wdev->dev, dell_smbios_wmi_clear=
_chardev, NULL);
+	if (ret < 0)
+		return ret;
+
 	priv->char_dev.minor =3D MISC_DYNAMIC_MINOR;
 	priv->char_dev.name =3D "wmi/dell-smbios";
 	priv->char_dev.fops =3D &dell_smbios_wmi_fops;
@@ -255,24 +261,12 @@ static int dell_smbios_wmi_probe(struct wmi_device *=
wdev, const void *context)
 	if (ret)
 		return ret;
=20
-	ret =3D dell_smbios_register_device(&wdev->dev, 1, &dell_smbios_wmi_call=
);
-	if (ret)
-		return ret;
-
-	guard(rwsem_write)(&list_lock);
-	list_add_tail(&priv->list, &wmi_list);
-
-	return 0;
+	return dell_smbios_register_device(&wdev->dev, 1, &dell_smbios_wmi_call)=
;
 }
=20
 static void dell_smbios_wmi_remove(struct wmi_device *wdev)
 {
-	struct wmi_smbios_priv *priv =3D dev_get_drvdata(&wdev->dev);
-
 	dell_smbios_unregister_device(&wdev->dev);
-
-	guard(rwsem_write)(&list_lock);
-	list_del(&priv->list);
 }
=20
 static const struct wmi_device_id dell_smbios_wmi_id_table[] =3D {
@@ -310,6 +304,7 @@ static struct wmi_driver dell_smbios_wmi_driver =3D {
 	.probe =3D dell_smbios_wmi_probe,
 	.remove =3D dell_smbios_wmi_remove,
 	.id_table =3D dell_smbios_wmi_id_table,
+	.no_singleton =3D true,
 };
=20
 int init_dell_smbios_wmi(void)
=2D-=20
2.39.5

