Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622123;
	b=GsPB5FUidJcYRrcOELgYpB0oA2854h20Ljk+hvpXT5ng7sX5en+0Z1tOADruZG7o1RUf
	 KE+zTnKcGAxODgwZG8BC57AI2plQ013w54+dxe9kU28in8W0n+//3chwfUCRG+l1BW0Nw
	 boTI1hk5T3kSYh9EBpiqEh6t6tGj043LIG9U7GfkKfv3UU/K1If/WpTWGtevN1dBOy3bw
	 lc6mx64va6rK1QlfoNoxnainV7RkBrojZ1fiIOF35v0vFzdqnWB/K5SIkNMlQY9VR9guN
	 4OUyu6jdMkt4UNE44FGNmgCsnTSa5Xhq0Y/LGhGDk1YKtIrilas0x1pH+5lVYK2sFPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZGkZpk0UhbWYdvmK6ljec05bEAFSMa8iCteL7C7cNpM=;
	b=wWTFfOBKnyGvErnohXF9mIE85RWU2i8UEPxmFruQCr7/DcccXa55KVkAX2UdAlms8+EO
	 4i6+WOa9rEkn7CmHku0y/9ePdHEqVZYfj3XGBK7DnJe73Zc1nwZo/DS3c5c17k/gNXDCq
	 yjCgXH1OydEm2ZvmEiNd7vmF1OZmLYBHHl8Fslxcx9ypN8EDKC1uwyURwQLHUsbhQgBeJ
	 RcaXz+SJbII9qB0bf9IbXKJIPJ8tOBV47fn74diaziqKeO/FCSF0d+OnLPMmXGRz+DwRu
	 YFHuls/+/guXInsDvpQdJt0PT4zd8W3oPbWO9XUEQf21kA7wAQxY7libgEcbqvC2+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ox7iAW40;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE12606A88F
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 02:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE12606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ox7iAW40
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so4681070eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 18:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622116; x=1795226916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGkZpk0UhbWYdvmK6ljec05bEAFSMa8iCteL7C7cNpM=;
        b=ox7iAW40OCh1QgNR3VKgHnqFmya9hhTvBDrUeT84BeqdQwrxrr7YCwU1b2LIUNAaK7
         T6tpapiB+nglo3h+Uo95DYBaZ97W3nvwk4y66PZpt0fi5r5QYqZBMerOq1j8RPM5ZwuR
         c8mOoOvdImhsjXPdzltysHqU7yf1AYJgcaDZie2YQ4eRvAQZF1xW8LRpZQzM4hHPlwXq
         LkrUFSYRQ/gV42fSZKw+WYdFtUYXVVsjS0qfNomoNbUzDix244Azp70lEPJSb+uu9Mlg
         Ybtk3VZPH2WBsnt5xPiYTnm7ElDCrL1pldEurgBdU3s2Uexdslj2bInhC0lRhUufyL/S
         yy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622116; x=1795226916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGkZpk0UhbWYdvmK6ljec05bEAFSMa8iCteL7C7cNpM=;
        b=bxUkDNhPFsodrPs5Nk1v0XWIwWV5zCuKjxk2Q69h8D5Z4KYliRw9WU/vJv4PWAZ44B
         XibnMoMN+LWW3RCyrs787LEx/arWk1hS9NVyPgkIFXbvncUydT+kIoEx+ejdObzad9lK
         ktteYZ5hVisSMhweAGv5gGPgAO4XJDmcBuZ1kv7llHxChhShT0QJkPCe+BlIMzVbeId6
         Y28tJ6EZ/ONSnW0SakS+6EzSXT4RQrOGFTJFiKKKOXG/+iwW1thv+Bvd3akbHLj5oiOn
         iC14vvMZ4peK+tXu1DcNgllkLMk2nHsgbZIkMJN2LSYfPh6pHuAdU0QlKv8KX8OwtD7n
         uMhg==
X-Forwarded-Encrypted: i=1; AL+hErEOyiUGdQE+gFGOl71HzeakXEVD1gH/Nl7uzv0HSi/JCVqOO8reGLLglyZ/wp8e+qfgKgwHnhPUqPIok9y9nnfgsgmp@vger.kernel.org
X-Gm-Message-State: APuU4Z+3dr2r595O9mjGe8Iiu7zEp++3DLplNVmVHEABPtenTUzOaPq7
	sabWKNDPgvVDEzWx+X85p7kqTL2koXHu2GhXfZdfDRPUPPTQZggIzavN
X-Gm-Gg: AYBFou3iMku43ChSKYWWCKbRGJvytOiaF4+FKWn2VvxOsBjd8d1aYr3KQK6n58cmZJc
	FJOWjJfF2adH4UW8nMR6F/zwWnnmgyJnVD+wH4Zw8e5MoAtsqSp7/PQKQZYMurE0XokoCLWXAEj
	ONXK+uVpSeF3fM1hoayWZPPbwKkWRnp3enpnqqrw+fUiARrXwUYLoMwywEF6X5tggFOF6iq+Uvu
	iLsjVBbtUfZG09xF0VF0p8VOMapq9RohKETM460uAaZfha0AOGJguuU8b9DAbUiLDchnviuprAu
	KEXMMMZ7ItLnWLKGM9gyNI6RX5M6zxdCseIJWkm+K4sJSpAjwFhVgpqNbnUYy+QXNez0gvAK+ja
	WP1JNLq8CIPxAbryrwioFoBgoqOImKqrC/ZcKfXPctTcJccCPPXchaGtuUjfarip4PjxdrWTe4l
	gSEHXBjXuvMKdBCRwe4uJxFuMgD76FuDVSog6Id2M1j+i+wLEfs4sATqm1UGwUJ/cucF3WsDOAQ
	dYouMeQjvNgGTitRetpmABA1BoPZDS22h7zBkkiyL3ZtlhrH54EmvXMEEr+jGKYPowhynotdfxo
	vFzgqlWJGKSkv4MNdrDNpdk7UhrVl1FBtgHTBaTAFbEcz+qCwIRfonThjzDV5eKfjg3dsi3hEbA
	hpBKWalSiwzresvXrNpppELQ4v+RMMAAgx7EZXHk+aDUdeEBn3ZBznKIjdjBM0g32kV/rn+7QQv
	wMvg==
X-Received: by 2002:a05:7300:8812:b0:379:24d9:cb98 with SMTP id 5a478bee46e88-3796048149dmr4538505eec.0.1794622115562;
        Fri, 13 Nov 2026 18:08:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm18875218eec.21.2026.11.13.18.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:08:34 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: dell_rbu: Use the firmware upload API
Date: Fri, 13 Nov 2026 18:08:14 -0800
Message-ID: <20261114020815.75539-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114020815.75539-1-rosenp@gmail.com>
References: <20261114020815.75539-1-rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dell_rbu receives the BIOS image through the legacy firmware sysfs
fallback: writing "init" to image_type calls request_firmware_nowait()
with FW_ACTION_NOUEVENT, and userspace feeds the image through
/sys/class/firmware/dell_rbu/{loading,data}. This is why DELL_RBU
selects FW_LOADER_USER_HELPER, an option most distributions disable.
On such kernels the driver cannot be enabled at all.

The firmware upload API (FW_UPLOAD) was added for this use case and
provides the same /sys/class/firmware/<name>/{loading,data} interface
without the user helper. Register a firmware upload device at module init
and move the work done in callbackfn_rbu() into the prepare() op,
which receives the whole image. The BIOS picks the image up from memory
on the next reboot, so write(), poll_complete() and cancel() have
nothing to do.

The upload entries now persist for the lifetime of the module, so
the "init" image_type workaround for recreating them and the
entry_created tracking are no longer needed. "init" is still accepted
and frees any downloaded image, as documented. Allocation or
packetizing failures are now reported via the error attribute instead
of being silently dropped.

The upload device is registered from module init and unregistered from
module exit, so pass a NULL module to firmware_upload_register():
otherwise the reference it takes would pin dell_rbu and make it
impossible to unload. firmware_upload_unregister() cancels and flushes
any in-flight upload before returning.

The userspace sequence documented in dell_rbu.rst (echo 1 > loading,
cp image > data, echo 0 > loading) is unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/admin-guide/dell_rbu.rst |  25 +++---
 drivers/platform/x86/dell/Kconfig      |   2 +-
 drivers/platform/x86/dell/dell_rbu.c   | 107 ++++++++++++++++---------
 3 files changed, 81 insertions(+), 53 deletions(-)

diff --git a/Documentation/admin-guide/dell_rbu.rst b/Documentation/admin-guide/dell_rbu.rst
index 2196caf1b939..d33927b0d52d 100644
--- a/Documentation/admin-guide/dell_rbu.rst
+++ b/Documentation/admin-guide/dell_rbu.rst
@@ -47,6 +47,10 @@ The driver load creates the following directories under the /sys file system::
 
 	/sys/class/firmware/dell_rbu/loading
 	/sys/class/firmware/dell_rbu/data
+	/sys/class/firmware/dell_rbu/status
+	/sys/class/firmware/dell_rbu/error
+	/sys/class/firmware/dell_rbu/remaining_size
+	/sys/class/firmware/dell_rbu/cancel
 	/sys/devices/platform/dell_rbu/image_type
 	/sys/devices/platform/dell_rbu/data
 	/sys/devices/platform/dell_rbu/packet_size
@@ -95,26 +99,21 @@ Do the steps below to download the BIOS image.
 2) cp bios_image.hdr /sys/class/firmware/dell_rbu/data
 3) echo 0 > /sys/class/firmware/dell_rbu/loading
 
-The /sys/class/firmware/dell_rbu/ entries will remain till the following is
-done.
-
-::
+The /sys/class/firmware/dell_rbu/ entries are provided by the firmware upload
+framework (see Documentation/driver-api/firmware/fw_upload.rst) and remain
+for as long as the driver is loaded. Once step 3 is done,
+/sys/class/firmware/dell_rbu/status returns to "idle" and
+/sys/class/firmware/dell_rbu/error is empty if the image was accepted.
+A download in progress can be aborted with::
 
 	echo -1 > /sys/class/firmware/dell_rbu/loading
 
-Until this step is completed the driver cannot be unloaded.
-
 Also echoing either mono, packet or init in to image_type will free up the
 memory allocated by the driver.
 
-If a user by accident executes steps 1 and 3 above without executing step 2;
-it will make the /sys/class/firmware/dell_rbu/ entries disappear.
-
-The entries can be recreated by doing the following::
-
-	echo init > /sys/devices/platform/dell_rbu/image_type
-
 .. note:: echoing init in image_type does not change its original value.
+   It is kept for compatibility; the /sys/class/firmware/dell_rbu/ entries
+   no longer need to be recreated.
 
 Also the driver provides /sys/devices/platform/dell_rbu/data readonly file to
 read back the image downloaded.
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index f6acf1cc2a2f..1672ed04a36a 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -89,7 +89,7 @@ config DELL_RBU
 	default m
 	depends on X86
 	select FW_LOADER
-	select FW_LOADER_USER_HELPER
+	select FW_UPLOAD
 	help
 	 Say m if you want to have the option of updating the BIOS for your
 	 DELL system. Note you need a Dell OpenManage or Dell Update package (DUP)
diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 768b15f406d3..a121f59a215d 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -60,12 +60,11 @@ static struct _rbu_data {
 	unsigned long num_packets;
 	unsigned long packetsize;
 	unsigned long imagesize;
-	int entry_created;
 } rbu_data;
 
 static char image_type[MAX_IMAGE_LENGTH + 1] = "mono";
 module_param_string(image_type, image_type, sizeof (image_type), 0);
-MODULE_PARM_DESC(image_type, "BIOS image type. choose- mono or packet or init");
+MODULE_PARM_DESC(image_type, "BIOS image type. choose- mono or packet");
 
 static unsigned long allocation_floor = 0x100000;
 module_param(allocation_floor, ulong, 0644);
@@ -81,7 +80,7 @@ struct packet_data {
 static struct list_head packet_data_list;
 
 static struct platform_device *rbu_device;
-static int context;
+static struct fw_upload *rbu_fw_upload;
 
 static void init_packet_head(void)
 {
@@ -497,41 +496,72 @@ static ssize_t data_read(struct file *filp, struct kobject *kobj,
 }
 static const BIN_ATTR_RO(data, 0);
 
-static void callbackfn_rbu(const struct firmware *fw, void *context)
+/*
+ * The whole image is handed to prepare() by the firmware upload core, so
+ * all of the work happens here. The BIOS consumes the image from memory on
+ * the next reboot; there is nothing to stream to hardware afterwards.
+ */
+static enum fw_upload_err rbu_fw_prepare(struct fw_upload *fw_upload,
+					 const u8 *data, u32 size)
 {
-	rbu_data.entry_created = 0;
-
-	if (!fw)
-		return;
-
-	if (!fw->size)
-		goto out;
+	enum fw_upload_err ret = FW_UPLOAD_ERR_NONE;
 
 	spin_lock(&rbu_data.lock);
 	if (!strcmp(image_type, "mono")) {
-		if (!img_update_realloc(fw->size))
-			memcpy(rbu_data.image_update_buffer,
-				fw->data, fw->size);
+		if (img_update_realloc(size))
+			ret = FW_UPLOAD_ERR_RW_ERROR;
+		else
+			memcpy(rbu_data.image_update_buffer, data, size);
 	} else if (!strcmp(image_type, "packet")) {
 		/*
 		 * we need to free previous packets if a
 		 * new hunk of packets needs to be downloaded
 		 */
 		packet_empty_list();
-		if (packetize_data(fw->data, fw->size))
+		if (packetize_data(data, size)) {
 			/* Incase something goes wrong when we are
 			 * in middle of packetizing the data, we
 			 * need to free up whatever packets might
 			 * have been created before we quit.
 			 */
 			packet_empty_list();
-	} else
+			ret = FW_UPLOAD_ERR_RW_ERROR;
+		}
+	} else {
 		pr_debug("invalid image type specified\n");
+		ret = FW_UPLOAD_ERR_FW_INVALID;
+	}
 	spin_unlock(&rbu_data.lock);
- out:
-	release_firmware(fw);
+
+	return ret;
+}
+
+static enum fw_upload_err rbu_fw_write(struct fw_upload *fw_upload,
+				       const u8 *data, u32 offset,
+				       u32 size, u32 *written)
+{
+	/* Already consumed in rbu_fw_prepare() */
+	*written = size;
+	return FW_UPLOAD_ERR_NONE;
+}
+
+static enum fw_upload_err rbu_fw_poll_complete(struct fw_upload *fw_upload)
+{
+	return FW_UPLOAD_ERR_NONE;
+}
+
+static void rbu_fw_cancel(struct fw_upload *fw_upload)
+{
+	/* Nothing in flight to abort; the image only lives in memory. */
 }
 
+static const struct fw_upload_ops rbu_fw_ops = {
+	.prepare = rbu_fw_prepare,
+	.write = rbu_fw_write,
+	.poll_complete = rbu_fw_poll_complete,
+	.cancel = rbu_fw_cancel,
+};
+
 static ssize_t image_type_read(struct file *filp, struct kobject *kobj,
 			       const struct bin_attribute *bin_attr,
 			       char *buffer, loff_t pos, size_t count)
@@ -547,7 +577,6 @@ static ssize_t image_type_write(struct file *filp, struct kobject *kobj,
 				char *buffer, loff_t pos, size_t count)
 {
 	int rc = count;
-	int req_firm_rc = 0;
 	int i;
 	spin_lock(&rbu_data.lock);
 	/*
@@ -567,26 +596,10 @@ static ssize_t image_type_write(struct file *filp, struct kobject *kobj,
 		strscpy(image_type, "packet");
 	else if (strstr(buffer, "init")) {
 		/*
-		 * If due to the user error the driver gets in a bad
-		 * state where even though it is loaded , the
-		 * /sys/class/firmware/dell_rbu entries are missing.
-		 * to cover this situation the user can recreate entries
-		 * by writing init to image_type.
+		 * Historically this recreated the /sys/class/firmware/dell_rbu
+		 * entries. They are now persistent, so "init" only frees
+		 * any previously downloaded image, as before.
 		 */
-		if (!rbu_data.entry_created) {
-			spin_unlock(&rbu_data.lock);
-			req_firm_rc = request_firmware_nowait(THIS_MODULE,
-				FW_ACTION_NOUEVENT, "dell_rbu",
-				&rbu_device->dev, GFP_KERNEL, &context,
-				callbackfn_rbu);
-			if (req_firm_rc) {
-				pr_err("request_firmware_nowait failed %d\n", rc);
-				rc = -EIO;
-			} else
-				rbu_data.entry_created = 1;
-
-			spin_lock(&rbu_data.lock);
-		}
 	} else {
 		pr_warn("image_type is invalid\n");
 		spin_unlock(&rbu_data.lock);
@@ -661,9 +674,24 @@ static int __init dcdrbu_init(void)
 	if (rc)
 		goto out_devreg;
 
-	rbu_data.entry_created = 0;
+	/*
+	 * Registered from module init and unregistered from module exit, so
+	 * don't let the upload device pin this module: that would make it
+	 * impossible to unload. firmware_upload_unregister() cancels and
+	 * flushes any in-flight upload before returning.
+	 */
+	rbu_fw_upload = firmware_upload_register(NULL, &rbu_device->dev,
+						 "dell_rbu", &rbu_fw_ops, NULL);
+	if (IS_ERR(rbu_fw_upload)) {
+		rc = PTR_ERR(rbu_fw_upload);
+		pr_err("firmware_upload_register failed %d\n", rc);
+		goto out_group;
+	}
+
 	return 0;
 
+out_group:
+	sysfs_remove_group(&rbu_device->dev.kobj, &rbu_group);
 out_devreg:
 	platform_device_unregister(rbu_device);
 	return rc;
@@ -671,6 +699,7 @@ static int __init dcdrbu_init(void)
 
 static __exit void dcdrbu_exit(void)
 {
+	firmware_upload_unregister(rbu_fw_upload);
 	spin_lock(&rbu_data.lock);
 	packet_empty_list();
 	img_update_free();
-- 
2.56.1

