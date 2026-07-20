Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0D63EDE6E;
	Mon, 20 Jul 2026 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553579; cv=none; b=JiC+qzsVwuoQc+L7Q2X4iqfEAnL3ubk4xXUZMfGt9WOECh3U8RkEViNrGx/YCBA5yPajTllc6EtFWMXfwKxvl2gfyI5gBqVYX+eksminhksapJFLxKYUG/L2BtPXySsqhJ1RAGBlCdxANer0IqjlK5ebcAPQcc+2nKUrQCjuRGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553579; c=relaxed/simple;
	bh=roqcI6qBkrYRcrD255PxQS3G41nNB3/L1U3OZsgS0jE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c+rodI5s8T6QOuRjjGyzyqc/M8ZYe2Hmv3D+LWCOu8O0dpFgI2NTlbKvCWxRZ/VknipngBp+Adzt6iudMM1Cqdih3lJysGwobIV1MdRDvtiVvshHytvs4TpbduW46P1xkuUTTAA+tSzHDOqelqZ5Ct3N6I6zX/31UOObanGOmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bu5IiVPM; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bu5IiVPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784553574; x=1785158374; i=w_armin@gmx.de;
	bh=l+vOtzTYv81KSVPEu1cCp0ABc59A+YNwUP5WNrbz+yo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bu5IiVPMAvztv1jlXZsv1c82ixPqExS9Sz78CedeF1Kq8KMjssoG4G+MVRvyl8B6
	 BUgy6ZNEaDaWMPc4t8qi57l/VDL42DJIBnsk4dw1krMhsVvAGLUGEvqQM6WMnORDv
	 MzNSmEwVzPQ2MUINBfRx7QehazuMIPpQmzX/CGZ8tQ7G9R7Ey6ZfHJd+A5fHVGW84
	 dSZosy5PT/O/0lELZDIwHyt63DeVGNYTxKT5ga1YbEKLTEaDiAOEp7ACT8gytZ720
	 oGEbtk5CjqmO0r7oFV3L9Kz5YkVlV1r4jfuFwJ2cQdYgmLs2Ll4n9g3OOmZNbUzL9
	 FLUuNuGGifI6Nvkf3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7GS-1wrpVc2OBm-008ZBX; Mon, 20
 Jul 2026 15:19:34 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH v2 1/3] platform/x86: dell-smbios-wmi: Fix chardev resource management
Date: Mon, 20 Jul 2026 15:19:19 +0200
Message-Id: <20260720131921.368000-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720131921.368000-1-W_Armin@gmx.de>
References: <20260720131921.368000-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KTAQsS+K0NM5VgRbn38F6LeTEap/iQsz74S+0wEgGl0sSC7RZ/U
 lw9goFArrVAjBxxZvLen1D4UEm5a5jKndkQEwfID43kqR22eb2oAv7NhikVHBv5t///G/ZH
 nE+XeS0zdJqnqyyp1OAHDNoMdcxOnlFsQh46YBmqZ57DIfGCo6gbm8VTzq4jxh2hV07VaC5
 EZukZZqZcI8W0JuCdr+Ow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yN6dp1is1Wg=;w+vy9D4cf2Qo8K2KvjIw4+JfGbI
 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
 VfUpmO0KUaVe

When unbinding the WMI driver while a userspace application has
an open file descriptor for the character device, a UAF occurs:

KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-=
wmi

The reason for this is that even after calling misc_deregister(),
userspace appications can still call read() and/or ioctl() on open
file descriptors associated with the already unregistered character
device. This causes a UAF by attempting to access the already freed
state container of the WMI driver.

Fix this by no longer storing the state container inside
filp->private_data. Instead retrieve the state container using
get_first_smbios_priv() and return -ENODEV if the state container
does not exist anymore.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/178144969601.60470.133=
96800403157907003@gmail.com/
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-wmi.c | 67 +++++++++++----------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index 64d0871b706e..231fc90878bc 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -6,6 +6,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/fs.h>
@@ -13,14 +14,13 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 #include <linux/uaccess.h>
 #include <linux/wmi.h>
 #include <uapi/linux/wmi.h>
 #include "dell-smbios.h"
 #include "dell-wmi-descriptor.h"
=20
-static DEFINE_MUTEX(call_mutex);
-static DEFINE_MUTEX(list_mutex);
 static int wmi_supported;
=20
 struct misc_bios_flags_structure {
@@ -32,6 +32,7 @@ struct misc_bios_flags_structure {
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
=20
 struct wmi_smbios_priv {
+	struct mutex call_lock; /* Protects the content of the SMBIOS buffer */
 	struct dell_wmi_smbios_buffer *buf;
 	struct list_head list;
 	struct wmi_device *wdev;
@@ -39,6 +40,8 @@ struct wmi_smbios_priv {
 	u64 req_buf_size;
 	struct miscdevice char_dev;
 };
+
+static DECLARE_RWSEM(list_lock);	/* Protects access to wmi_list */
 static LIST_HEAD(wmi_list);
=20
 static inline struct wmi_smbios_priv *get_first_smbios_priv(void)
@@ -87,40 +90,35 @@ static int dell_smbios_wmi_call(struct calling_interfa=
ce_buffer *buffer)
 	size_t size;
 	int ret;
=20
-	mutex_lock(&call_mutex);
+	guard(rwsem_read)(&list_lock);
+
 	priv =3D get_first_smbios_priv();
-	if (!priv) {
-		ret =3D -ENODEV;
-		goto out_wmi_call;
-	}
+	if (!priv)
+		return -ENODEV;
=20
 	size =3D sizeof(struct calling_interface_buffer);
 	difference =3D priv->req_buf_size - sizeof(u64) - size;
=20
+	guard(mutex)(&priv->call_lock);
+
 	memset(&priv->buf->ext, 0, difference);
 	memcpy(&priv->buf->std, buffer, size);
 	ret =3D run_smbios_call(priv->wdev);
 	memcpy(buffer, &priv->buf->std, size);
-out_wmi_call:
-	mutex_unlock(&call_mutex);
=20
 	return ret;
 }
=20
-static int dell_smbios_wmi_open(struct inode *inode, struct file *filp)
+static ssize_t dell_smbios_wmi_read(struct file *filp, char __user *buffe=
r, size_t length,
+				    loff_t *offset)
 {
 	struct wmi_smbios_priv *priv;
=20
-	priv =3D container_of(filp->private_data, struct wmi_smbios_priv, char_d=
ev);
-	filp->private_data =3D priv;
+	guard(rwsem_read)(&list_lock);
=20
-	return nonseekable_open(inode, filp);
-}
-
-static ssize_t dell_smbios_wmi_read(struct file *filp, char __user *buffe=
r, size_t length,
-				    loff_t *offset)
-{
-	struct wmi_smbios_priv *priv =3D filp->private_data;
+	priv =3D get_first_smbios_priv();
+	if (!priv)
+		return -ENODEV;
=20
 	return simple_read_from_buffer(buffer, length, offset, &priv->req_buf_si=
ze,
 				       sizeof(priv->req_buf_size));
@@ -167,22 +165,24 @@ static long dell_smbios_wmi_do_ioctl(struct wmi_smbi=
os_priv *priv,
 static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd, un=
signed long arg)
 {
 	struct dell_wmi_smbios_buffer __user *input =3D (struct dell_wmi_smbios_=
buffer __user *)arg;
-	struct wmi_smbios_priv *priv =3D filp->private_data;
-	long ret;
+	struct wmi_smbios_priv *priv;
=20
 	if (cmd !=3D DELL_WMI_SMBIOS_CMD)
 		return -ENOIOCTLCMD;
=20
-	mutex_lock(&call_mutex);
-	ret =3D dell_smbios_wmi_do_ioctl(priv, input);
-	mutex_unlock(&call_mutex);
+	guard(rwsem_read)(&list_lock);
=20
-	return ret;
+	priv =3D get_first_smbios_priv();
+	if (!priv)
+		return -ENODEV;
+
+	guard(mutex)(&priv->call_lock);
+
+	return dell_smbios_wmi_do_ioctl(priv, input);
 }
=20
 static const struct file_operations dell_smbios_wmi_fops =3D {
 	.owner		=3D THIS_MODULE,
-	.open		=3D dell_smbios_wmi_open,
 	.read		=3D dell_smbios_wmi_read,
 	.unlocked_ioctl	=3D dell_smbios_wmi_ioctl,
 	.compat_ioctl	=3D compat_ptr_ioctl,
@@ -254,6 +254,10 @@ static int dell_smbios_wmi_probe(struct wmi_device *w=
dev, const void *context)
 	if (!priv->buf)
 		return -ENOMEM;
=20
+	ret =3D devm_mutex_init(&wdev->dev, &priv->call_lock);
+	if (ret)
+		return ret;
+
 	ret =3D dell_smbios_wmi_register_chardev(priv);
 	if (ret)
 		return ret;
@@ -262,9 +266,8 @@ static int dell_smbios_wmi_probe(struct wmi_device *wd=
ev, const void *context)
 	if (ret)
 		return ret;
=20
-	mutex_lock(&list_mutex);
+	guard(rwsem_write)(&list_lock);
 	list_add_tail(&priv->list, &wmi_list);
-	mutex_unlock(&list_mutex);
=20
 	return 0;
 }
@@ -273,12 +276,10 @@ static void dell_smbios_wmi_remove(struct wmi_device=
 *wdev)
 {
 	struct wmi_smbios_priv *priv =3D dev_get_drvdata(&wdev->dev);
=20
-	mutex_lock(&call_mutex);
-	mutex_lock(&list_mutex);
-	list_del(&priv->list);
-	mutex_unlock(&list_mutex);
 	dell_smbios_unregister_device(&wdev->dev);
-	mutex_unlock(&call_mutex);
+
+	guard(rwsem_write)(&list_lock);
+	list_del(&priv->list);
 }
=20
 static const struct wmi_device_id dell_smbios_wmi_id_table[] =3D {
=2D-=20
2.39.5

