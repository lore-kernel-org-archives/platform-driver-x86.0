Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4213AA2D;
	Thu, 16 Jul 2026 05:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784180042; cv=none; b=o7J5KY/cVoMQTCnTxYmfahyj1hGPeBZh0e3er3q2PoV4OdoScKexvm4e7MA81mavgZJPKcsgMJqqu3Q3bKzmC/IB3dkok31o6102qFh0jAvjr7Kvuns5/gV11ieVTsUkSoMyJyPBFG/hp4iCebu5TtDdzkQxLzaYP7KWBWMTV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784180042; c=relaxed/simple;
	bh=QPwS3ZCnXCqzKSL4Mi0GbB1RA0JgWiGgmL6cAJErlkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lZ8dUQ8Ke2Jz4yF9w8Dl/S/OEyCoIKyG6OKsSzgWYO6kYyTSvkCGShg+6uHTjM6WM5vSXC/61WjMaBFhAmLdCqIqfY4SCscEBdD8CuO9DiOvHrHb5GM8mGG7NSwAVeQtTnoeoHl362b6/wvo6jh8UiUiy2sq1pWMaP5dFFupXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uFgzkgRy; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uFgzkgRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784180023; x=1784784823; i=w_armin@gmx.de;
	bh=QNuY1cOFmaP1vfzrRRQRH84sgRvJlImJ5flmZGY1o7o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uFgzkgRygXohd1sVg4TTGABJubs+CWgU+rYdpbiIb5d1Uia8VSzyQLi03jShgpI6
	 z908hyhMayVyn3SX0q2GVDCg4y1ZI0uy94W8Olh/oDzxLp2gftDzIOPBb/xaXPTon
	 IZHXAgfxlSmzL+e8iCLgjqBCmjhi9H4F+M16FDz7v3IqqtMf95ltgxhHjibDtEmvC
	 rQ88cYV8XFyx3fAHtX+FA2XlTd3Lk6HiAmXAbwP5vG9phC8CXhjY4DEB38gEFAHd9
	 7k7BbyKiKSIqHxiOlGTlmDFpkdtsSreb6KCvJ9qTFQjjZeRAagUhdC6MvHmSp021a
	 WJT2QDnj40ezn02fng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9QC-1x30671GhY-00tEGh; Thu, 16
 Jul 2026 07:33:43 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH 1/3] platform/x86: dell-smbios-wmi: Fix chardev resource management
Date: Thu, 16 Jul 2026 07:33:35 +0200
Message-Id: <20260716053337.112533-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:ZiVxCvsO0l35vAPbLds7a6eCF3TPQLsE7ps4vh5Vfjv4stXeTGR
 TvVde+tMYQrvkNzg1QmiqfNfjJLWnfefMamKZvxBHADB2l9RNpsL+BBmOFy3Y0INl5AP2Cv
 EOEuMAmlNMfjTCM0pDoyj8pNUdQSPV/iYzVFGBGzbj+iEMLqW6Un78JBNECv940QwdHuSVZ
 t27xAimvD8zf17N0ekTnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LAGRNcr5d+U=;8YXEwj+DAH7RvOj9oOWCCA5Jbmd
 +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

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
Fixes: 93885e85a77f ("platform/x86: dell-smbios-wmi: Stop using WMI charde=
v")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-wmi.c | 66 ++++++++++-----------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index 64d0871b706e..c8a6e711283d 100644
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
@@ -13,14 +14,14 @@
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
+static DECLARE_RWSEM(list_lock);
 static int wmi_supported;
=20
 struct misc_bios_flags_structure {
@@ -32,6 +33,7 @@ struct misc_bios_flags_structure {
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
=20
 struct wmi_smbios_priv {
+	struct mutex call_lock; /* Protects the content of the SMBIOS buffer */
 	struct dell_wmi_smbios_buffer *buf;
 	struct list_head list;
 	struct wmi_device *wdev;
@@ -87,40 +89,35 @@ static int dell_smbios_wmi_call(struct calling_interfa=
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
@@ -167,22 +164,24 @@ static long dell_smbios_wmi_do_ioctl(struct wmi_smbi=
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
@@ -254,6 +253,10 @@ static int dell_smbios_wmi_probe(struct wmi_device *w=
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
@@ -262,9 +265,8 @@ static int dell_smbios_wmi_probe(struct wmi_device *wd=
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
@@ -273,12 +275,10 @@ static void dell_smbios_wmi_remove(struct wmi_device=
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

