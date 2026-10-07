Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7739E16B
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377981; cv=none; b=jrmiq5XuCOntc8i8I7P1iiCwbYkGjE2I1CiJDuhL4iKcSvd6XOtpJh55TJv702eh2F9ivSE9c0STzGYzjtAzZb3PQNY+8SKPgSXdYAvhBcl3OgnGiTD2G1udFzFTKmgxusSb1g3f6vs1V8PaxtZ7CwHq4WXHyEanpiGkxZUXumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377981; c=relaxed/simple;
	bh=1qPu40jVRlgqGXl9oLWcs3J+f0Tog8KscvYQKLtvlOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIFlignToXiRpUCcBirxbTBGR8oXUiKoi6C0DtW5HWwouThGcqKwDBm1GoLT5ir3884jUDk/IiZBbVSn32D9BrMhZvMAMklP/9J8oQ8abUQg4esZcfQb9Pad+if9OTGCTf/265U9kaSgz8hGZs1kTZBPlzhLjy3deKBaWYYfYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1QN2raL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1QN2raL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so29596575e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791377968; x=1791982768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8LcpKVyjkwbjrKFPYPjAUZa6j+RokFGZ6gECHDFtMQ=;
        b=E1QN2raLZs24dIRttfhwEiKLFeV2s9Pp21sQpKY0Xt7STFaFMgB7K5e019tTNolnYO
         TAmwxKadg7mibEXCcd8UPaGbj+8XC8lU9JUAqkkMcFDlQLVbL1ZtG5WxZwNONnd3KXN0
         AKqyOCfjn1replP2nnVg0r/1tCoppvYOCURvay1u5/n+PB7wyxbYM5HGoOD1s3KJcTY4
         R+RasnyZ/PjCRrKY13/h7zcySkQ1iVurGgOD9r5ZCVvL+p4c79kM3DHBDef4QjSthpza
         bTlIlAmcaCf0SmvERotMgBhJY8s40UIAqB29Dzdp8sWNfUFrK+pyteT+q+zBh1ojzHJ9
         tMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377968; x=1791982768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8LcpKVyjkwbjrKFPYPjAUZa6j+RokFGZ6gECHDFtMQ=;
        b=pAeiUTIXoTdQKza8J/OZjDVk83lTxxrnghw67LVKPYJ8qcewCJBV4dS/FEXQ+gKHKs
         dywx/dhbZIJ4mbqpu1MF5oA/gxA1x3ZozqZhEGVsBdRpFOc8lTwD1QupvjAkGdWGUOUe
         VgfOAzRgIeM1+8mLMrK0kgxX2/Fp+wNqsJ431kVRBOulR/kgMYLaBlU9hedLDM8yVvbY
         vY0SCb3RM15w2hbzyqCxQsJkePJbjAtmkElRnrY0fNUTtIed4y4TkoK/QNcF1dVAGeZt
         G43SHB3Cm3Mpduf84BNCHspKalnBLySBrlXWr03OAMrChVcemKyCoqKzUZo8cEUYqXIK
         FzJw==
X-Gm-Message-State: AFuF++mRytzSp2st+aEzhOC0BvOhj/mkxYQUyY40DQkWqgvYS/eIZcu9
	bc9I6dLhEFTyeI5iB6R3Kcpd4ixsb5fjfyUIfkv5zzILS6L8LsQyk/BYTiLfZ/lu
X-Gm-Gg: AYBFou1NJaIo3ghZqyAxo5qxUrMME5+Crcu6wF3/oJe6ut+bu0QLsqR+afQ0UfDxLPO
	35erv+xHTVUpXeCFxXZSmcn4vv0FO7CEEANjhxpysAkx7PkMF5QyrbpNtK2ub1vR0n72MGzVv/f
	wsOS+3JLAy47NcWaf/1g7PUeDmWkQNcEtJ/3RJEBs6U32X48WO+LAQTSV6a2T9OqqKuYxUkMpG1
	5pR6okPABy0UchuIi6lVtbsPwbavfwICjwdSzZx63CEFmaPloVyXLZAi4FQAWfZVaqloLBdQT1X
	PUIzaxnoWNuqvl61B2HSkj/7KKLWCzpzgfsGAS2/L0b5Pwk5gS5gS34Pn2pNjqhBk12Tb2O1dHZ
	AjszVdNaPn26c/QwCTFvDdu9NGDU6/mlHZgI8WdQ6V1H8rnYcM9DckqrGItXz/67y/VY19AEUwc
	65r4tGbTeWJTf0zyqWqraDwTqVw4htLLUwbyDUiyDMpaDt9j89KiSeSBFj2hL67evwaq5TX4GTO
	ET6X6JOrqAXC2vfzZGsMtB1fGZjG9PDoVhivffwzKQ=
X-Received: by 2002:a05:600c:3f0c:b0:4a0:251c:fa72 with SMTP id 5b1f17b1804b1-4a1803038damr34278255e9.11.1791377967808;
        Wed, 07 Oct 2026 05:59:27 -0700 (PDT)
Received: from PF5R4XJL.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm105304145e9.2.2026.10.07.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:59:27 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp socket devices
Date: Wed,  7 Oct 2026 14:59:06 +0200
Message-ID: <20261007125908.321186-3-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007125908.321186-1-erwanaliasr1@gmail.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erwan Velu <e.velu@criteo.com>

The per-socket attributes live under /sys/devices/platform/AMDI0097:0X
with the ACPI driver, while the platform driver uses
/sys/devices/platform/amd_hsmp/socketN. Userspace has to know which
driver probed to find them.

Add a driver-independent /sys/devices/amd_hsmp/socketN device per
socket carrying hsmp_sock_groups, and register it from the ACPI driver.
The AMDI0097:0X attributes are kept, as they are documented ABI.

The socket device is unregistered before remove takes hsmp_sock_rwsem:
device_unregister() waits for in-flight sysfs reads, which take the
rwsem for read.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   8 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |   6 ++
 drivers/platform/x86/amd/hsmp/hsmp.h  |   5 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 112 +++++++++++++++++++++++++-
 4 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index fa1fc240e212..aba4a009bd8d 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -57,6 +57,12 @@ In-kernel integration:
 HSMP sysfs interface
 ====================
 
+The ACPI driver exposes its per socket sysfs files in a per socket
+directory created at /sys/devices/amd_hsmp/socket%d/.
+
+For backward compatibility, the files are also available under
+/sys/devices/platform/AMDI0097:0X/.
+
 1. Metrics table binary sysfs
 
 AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
@@ -80,7 +86,7 @@ The same is defined in the amd_hsmp.h header.
 
 2. HSMP telemetry sysfs files
 
-Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
+Following sysfs files are available at /sys/devices/amd_hsmp/socket%d/.
 
 * c0_residency_input: Percentage of cores in C0 state.
 * prochot_status: Reports 1 if the processor is at thermal threshold value,
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index d76979baffa8..468d4b1515db 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -441,6 +441,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
 	}
 
+	ret = hsmp_sock_dev_register(dev_get_drvdata(&pdev->dev));
+	if (ret)
+		dev_warn(&pdev->dev, "Failed to register HSMP socket device: %d\n", ret);
+
 	return 0;
 }
 
@@ -448,6 +452,8 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 {
 	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
 
+	hsmp_sock_dev_unregister(sock);
+
 	/*
 	 * Serialize the kref_put() and any release it triggers against a
 	 * concurrent probe, and drain the data plane for the whole
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 692721e2e6d3..f638edd7768b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -28,6 +28,7 @@
 
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
+#define HSMP_ROOT_DEV_NAME	"amd_hsmp"
 #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
 
 #define DRIVER_VERSION		"2.6"
@@ -47,6 +48,7 @@ struct hsmp_socket {
 	/* Size of the region mapped at @metric_tbl_addr, as reported by SMU */
 	size_t metric_tbl_size;
 	void __iomem *virt_base_addr;
+	struct device *sysfs_dev;
 	struct semaphore hsmp_sem;
 	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
 	struct mutex metric_read_lock;
@@ -80,6 +82,9 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
 #endif
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
+int hsmp_sock_dev_register(struct hsmp_socket *sock);
+void hsmp_sock_dev_unregister(struct hsmp_socket *sock);
+
 extern const struct attribute_group *hsmp_sock_groups[];
 
 /*
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index b1db3b4d77b9..e9e91b640b2a 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -4,7 +4,8 @@
  * Copyright (c) 2024, AMD.
  * All Rights Reserved.
  *
- * This file provides the per-socket sysfs attributes of the HSMP interface.
+ * This file provides the per-socket sysfs attributes of the HSMP interface
+ * and the /sys/devices/amd_hsmp/socket%u devices carrying them.
  */
 
 #include <asm/amd/hsmp.h>
@@ -12,7 +13,12 @@
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/lockdep.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 
 #include "hsmp.h"
@@ -336,3 +342,107 @@ const struct attribute_group *hsmp_sock_groups[] = {
 	NULL
 };
 EXPORT_SYMBOL_NS_GPL(hsmp_sock_groups, "AMD_HSMP");
+
+/*
+ * /sys/devices/amd_hsmp is created when the first socket device is registered
+ * and removed with the last one. hsmp_root_lock serializes that against the
+ * per-socket register/unregister calls.
+ */
+static DEFINE_MUTEX(hsmp_root_lock);
+static struct device *hsmp_root_dev;
+static unsigned int hsmp_root_users;
+
+static void hsmp_sock_dev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
+/**
+ * hsmp_sock_dev_register() - Create /sys/devices/amd_hsmp/socket%u for @sock.
+ * @sock: fully probed HSMP socket.
+ *
+ * The device carries hsmp_sock_groups with @sock as its drvdata, so @sock must
+ * stay valid until hsmp_sock_dev_unregister() returns.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int hsmp_sock_dev_register(struct hsmp_socket *sock)
+{
+	struct device *dev;
+	int ret;
+
+	guard(mutex)(&hsmp_root_lock);
+
+	if (!hsmp_root_users) {
+		hsmp_root_dev = root_device_register(HSMP_ROOT_DEV_NAME);
+		if (IS_ERR(hsmp_root_dev)) {
+			ret = PTR_ERR(hsmp_root_dev);
+			hsmp_root_dev = NULL;
+			return ret;
+		}
+	}
+
+	/*
+	 * Built by hand rather than with device_create_with_groups(), which
+	 * rejects a NULL class: these devices belong to no class or bus.
+	 */
+	dev = kzalloc_obj(*dev);
+	if (!dev) {
+		ret = -ENOMEM;
+		goto err_root;
+	}
+
+	device_initialize(dev);
+	dev->parent = hsmp_root_dev;
+	dev->groups = hsmp_sock_groups;
+	dev->release = hsmp_sock_dev_release;
+	dev_set_drvdata(dev, sock);
+
+	ret = dev_set_name(dev, "socket%u", sock->sock_ind);
+	if (!ret)
+		ret = device_add(dev);
+	if (ret) {
+		put_device(dev);
+		goto err_root;
+	}
+
+	sock->sysfs_dev = dev;
+	hsmp_root_users++;
+
+	return 0;
+
+err_root:
+	if (!hsmp_root_users) {
+		root_device_unregister(hsmp_root_dev);
+		hsmp_root_dev = NULL;
+	}
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_dev_register, "AMD_HSMP");
+
+/**
+ * hsmp_sock_dev_unregister() - Remove /sys/devices/amd_hsmp/socket%u for @sock.
+ * @sock: HSMP socket; a no-op if its device was never registered.
+ *
+ * device_unregister() waits for in-flight show/read handlers, which take
+ * hsmp_sock_rwsem for read. The caller must therefore not hold it, or a
+ * concurrent sysfs read would deadlock the teardown.
+ */
+void hsmp_sock_dev_unregister(struct hsmp_socket *sock)
+{
+	lockdep_assert_not_held(&hsmp_sock_rwsem);
+
+	guard(mutex)(&hsmp_root_lock);
+
+	if (!sock->sysfs_dev)
+		return;
+
+	device_unregister(sock->sysfs_dev);
+	sock->sysfs_dev = NULL;
+
+	if (!--hsmp_root_users) {
+		root_device_unregister(hsmp_root_dev);
+		hsmp_root_dev = NULL;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_dev_unregister, "AMD_HSMP");
-- 
2.53.0

