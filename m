Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844365;
	b=lY7s/vCxT+sAm7TvY0f4tM6M4f0yhy2uz5C0NVeV+iRy41RrRjEPz4wdYS/uAp7eJM8m
	 iTRGcmCtwYNIminQEjEV9GGB95Ngc07EcwJtdi0h0OymtoGWdGahxczAjAM5ARlzZ+HuU
	 3hcMo3sHm/aa0J6MlotqgUqVRG8pICEH0jPD66K8WqDADkko5wfc/pwI/DrXU59+yl4Lf
	 qkmzwJ3p2zMrMrN4y1Zgzcnw4PyU1ez2Gw5SMos207LuVj2G6vI5D2SLL/C18vqJfQfXt
	 XYoWnfeN1syPemRAKChxDA4GIZxVA03dwkg0DqK3ZAYMMVqseYeWtN0CCQRvCZ+gloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QDyYkUmfpanWYfs1xNZAc9qQPy7rIkSttuybi4FRhxU=;
	b=4Rpu7xLpr4X1LvFWzCTBGD0nj9nbyunq742noXZQ7gER4iOnPjEDc77HeKWHeCZrqKKm
	 qhwf5BUIMkkGQN7OzDlwArMXygqO4UKuIEu1Vcs6XM66BqkWpI7rGzqF0XZxuQxDzNBSD
	 3zbfRrcej/C37sxG+elH3kR+jL7I14kZ4aH1S3ClJF7DM+j45aSZsVvWjz3MigvyQsI7I
	 iz3j24H7ovC+bH3up/4f/2uvz4VDQrFoVmCwaB2T/cl+Ol8qy6TmXLM/B6XWB8c3K0zy/
	 IC8YMMdmoVPB7txUAlO67tA0umRV8Ap4NY4IjGI9NuiItzmDukI6NUHKlezbWSNPUYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPuBUv59;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409E606A886
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7409E606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPuBUv59
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so23270185e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 07:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844363; x=1795449163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDyYkUmfpanWYfs1xNZAc9qQPy7rIkSttuybi4FRhxU=;
        b=TPuBUv59aP5Iek4e+LZRbmINU5X2lwItOeX97cr0zQ7tCCg4EmShKPR1bQ439G86Re
         btTcFmrzUj9diZFRcdVIPfGyDYXP3jFzX6NUgYpFc9FPncJO2KnizSxdvHxCSPoMqQxU
         11Lr82gGUPtSefS/5xcAqq7oSjMFOM+IPorE3O4+0/qBp2JThFdm54l/0mMbp/QdbmlX
         iXrNAQMHx3totq6jo+EXCNreVU3b56/09LOam3kLv3nMTG6Sa7ciAXVNAuee+i3E/sHG
         UVxTG17Cb7MapVAfnc+qFAgSLpsF/KhlMIJ867FGPwIzEXpqST/dVtjSj4GMHZROc9WE
         xjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844363; x=1795449163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDyYkUmfpanWYfs1xNZAc9qQPy7rIkSttuybi4FRhxU=;
        b=qx8Ra3MtK7GYyGf6g5tRLCeBQyJ1CRZMotJXP/H0/KtcRHL6mMo7FOtm6+eDB4OXtl
         3oqAa3U2WyEWeZScwqC067S+pJEb3kIflS7zm49eSbGrsf4Im4Xx/NoRCxwjA3EkSsmN
         tdBeiDW3N95AisX0creunvwfzlcBBVbVaidDaoibWQxaGT8C64hRg1p2z5pJdGXMpjd0
         UZdhFj937fOtBBNfKC0Q0NM6xj0sTY/Jpq0oEJW8FcN0Y4ZQqCtPpjHMIMhPlo/jZ97u
         CilRt5rRpLg2QR38fjSmIKgA6gmZEquU4Or/sgAo+bh5uFJ7Fbm66t8N9qQ+npvB6xkW
         wkmg==
X-Forwarded-Encrypted: i=1; AL+hErFfle3zwQpUgegWNyjLoPrMWJkQ1Okw2Jzxb+qtRK9rAkYtYe7B6n/+iMlJXIP2H8pASojfHrLzCaco3FtykN2GE6GS@vger.kernel.org
X-Gm-Message-State: APuU4Z96XE32NRn1ZMWXrcSMEDtA241t+3RL4flHJSpxOEODx9D+q5OO
	k06l9CaF+/I106FkyN4WPQZ2YIWuVyrAxR3mzV3Ea7K2tF8hfdVglZ6s
X-Gm-Gg: AYBFou3EV8f/f5JkPhS7AdpNBKRYdtAXaNk6gVoJ+W6bC9i3rzdJJS43LB4LBeFcyzz
	ypZJMgstcfTNXUvuRTqzOVnErOOk8062xcB2sPiFnTMgLiT9XmeN6Vw4n+1eujcvBoUoGNSuTCj
	nDJq+Z0xcz/LWwsLDA08IRwJtnyytFts3NS3UtNMVYcC0yD5YuTvEcEb901qr+1+c8axmhO1sEe
	raMAcZjkk0+HA1K/dCfvpSuD7cmFjra50LeFOqBdW9CGGsQ525a/OmpgK8qs8kNXUzzm9HUAvm+
	s577jfoafKDwfeWB379X2SzFay8+cUwXsxoXXB37l2pIomjyaL7xtJC0Z9zgZdOHMNt4fdLkw15
	zH2mwtkIMoWpRo7RwQUfdrQzYgbWNnADasAUqG/akb/adihdUkx0Vk1WzWHh9uGf3Us8iXZRKsA
	AaLZA/u097pxQPOnUC9qTZL3JeYANkm3p++QExrtZM6qV2Sg0oN2XSoiHhCAfvCQ6PSeLxTugmf
	BnxHKw+3ZTvHdjqZyT+D0ggf4Py6Doqw74arxRZKkE49QuBsfXOYPu9vRCpqIW65NgwRkt9Utnc
	FiK/ysPkZUnbRjA8tOSuzNzdUf7pcHl3++21vqXi3wgWdtvwSJm+Qn1olBJunXq5bBfUnZ8MkfT
	gOHPjU1gCZd/yseOiXTrb78f0fqlxxr0pvs8XgUiE
X-Received: by 2002:a05:600c:1daa:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb55a481ccmr224438855e9.14.1794844362733;
        Mon, 16 Nov 2026 07:52:42 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm321279415e9.10.2026.11.16.07.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:42 -0800 (PST)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>,
	Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: [PATCH v2 3/5] platform/x86/amd/hsmp: Expose socket attributes from the platform driver
Date: Mon, 16 Nov 2026 16:51:45 +0100
Message-ID: <20261116155147.769630-4-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155147.769630-1-erwanaliasr1@gmail.com>
References: <20261116155147.769630-1-erwanaliasr1@gmail.com>
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

From: Erwan Velu <e.velu@criteo.com>

The platform driver creates bare socketN attribute groups on the
amd_hsmp platform device, which only hold metrics_bin. On systems
without the HSMP ACPI object, attributes such as
pwr_current_active_freq_limit are therefore missing, although the
driver can send the same HSMP messages as the ACPI one.

Register the amd_hsmp class socketN devices from the platform driver,
as children of the amd_hsmp platform device, and drop the socketN
attribute groups they replace. The socket devices carry
hsmp_sock_groups, metrics_bin included, so all the per-socket
attributes are now available under /sys/class/amd_hsmp/socketN/.

As class devices, they are placed by the driver core in an amd_hsmp
glue directory below their parent, i.e. in
/sys/devices/platform/amd_hsmp/amd_hsmp/socketN/. To keep the existing
/sys/devices/platform/amd_hsmp/socketN/metrics_bin path working, add a
socketN symlink from the platform device to each socket device.

As the socket devices and their symlinks are now the only way
metrics_bin is exposed, failing to create one fails the probe. They are
torn down by a devres action added after hsmp_pltdrv_release(), so they
are gone before the socket array they reference is released.

Systems running HSMP protocol version 7 or later with the platform
driver (Family 1Ah model 0x00-0x0F without the HSMP ACPI object) now
see metrics_bin, as with the ACPI driver: reads return -EOPNOTSUPP and
point userspace to HSMP_IOCTL_GET_TELEMETRY_DATA, as the version 7
table does not fit in a sysfs binary attribute. It used to be hidden
there.

On a single socket Zen4 (Family 19h) server probed by the platform
driver, this gives:

  $ ls -l /sys/devices/platform/amd_hsmp/
  drwxr-xr-x amd_hsmp
  ...
  lrwxrwxrwx socket0 -> amd_hsmp/socket0
  $ ls -l /sys/class/amd_hsmp/
  socket0 -> ../../devices/platform/amd_hsmp/amd_hsmp/socket0
  $ cat /sys/class/amd_hsmp/socket0/pwr_current_active_freq_limit
  3100

This system runs HSMP protocol version 5, so metrics_bin is not
visible, as before this change.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c | 155 +++++++++++----------------
 2 files changed, 67 insertions(+), 96 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index f145ea12af99..c4459a9dddc6 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -75,14 +75,18 @@ e.g. /sys/devices/platform/AMDI0097:00/amd_hsmp/socket0/. For backward
 compatibility, the files are also available directly under
 /sys/devices/platform/AMDI0097:0X/.
 
+With the plat driver, the socket devices are children of the amd_hsmp
+platform device, i.e. /sys/devices/platform/amd_hsmp/amd_hsmp/socket%d/.
+For backward compatibility, /sys/devices/platform/amd_hsmp/socket%d is a
+symlink to it.
+
 1. Metrics table binary sysfs
 
 AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
 most of the system management information from SMU in one go.
 
 The metrics table is made available as hexadecimal sysfs binary file
-under per socket sysfs directory created at
-/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
+/sys/class/amd_hsmp/socket%d/metrics_bin
 
 Note: lseek() is not supported as entire metrics table is read.
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index c3dc7c9f45ac..edcfe82aab2a 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -12,7 +12,6 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
-#include <linux/build_bug.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
@@ -48,98 +47,6 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 	return amd_smn_hsmp_rdwr(sock->sock_ind, sock->mbinfo.base_addr + offset, value, write);
 }
 
-static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj,
-					 const struct bin_attribute *bin_attr, char *buf,
-					 loff_t off, size_t count)
-{
-	struct hsmp_socket *sock;
-	u16 sock_ind;
-
-	sock_ind = (uintptr_t)bin_attr->private;
-	if (sock_ind >= hsmp_pdev->num_sockets)
-		return -EINVAL;
-
-	sock = &hsmp_pdev->sock[sock_ind];
-
-	return hsmp_metric_tbl_read(sock, buf, count);
-}
-
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 const struct bin_attribute *battr, int id)
-{
-	u16 sock_ind;
-
-	sock_ind = (uintptr_t)battr->private;
-
-	if (id == 0 && sock_ind >= hsmp_pdev->num_sockets)
-		return SYSFS_GROUP_INVISIBLE;
-
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-
-	return 0;
-}
-
-/*
- * AMD supports maximum of 8 sockets in a system.
- * Static array of 8 + 1(for NULL) elements is created below
- * to create sysfs groups for sockets.
- * is_bin_visible function is used to show / hide the necessary groups.
- *
- * Validate the maximum number against MAX_AMD_NUM_NODES. If this changes,
- * then the attributes and groups below must be adjusted.
- */
-static_assert(MAX_AMD_NUM_NODES == 8);
-
-#define HSMP_BIN_ATTR(index, _list)					\
-static const struct bin_attribute attr##index = {			\
-	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
-	.private = (void *)index,					\
-	.read = hsmp_metric_tbl_plat_read,				\
-	.size = sizeof(struct hsmp_metric_table),			\
-};									\
-static const struct bin_attribute _list[] = {				\
-	&attr##index,							\
-	NULL								\
-}
-
-HSMP_BIN_ATTR(0, *sock0_attr_list);
-HSMP_BIN_ATTR(1, *sock1_attr_list);
-HSMP_BIN_ATTR(2, *sock2_attr_list);
-HSMP_BIN_ATTR(3, *sock3_attr_list);
-HSMP_BIN_ATTR(4, *sock4_attr_list);
-HSMP_BIN_ATTR(5, *sock5_attr_list);
-HSMP_BIN_ATTR(6, *sock6_attr_list);
-HSMP_BIN_ATTR(7, *sock7_attr_list);
-
-#define HSMP_BIN_ATTR_GRP(index, _list, _name)			\
-static const struct attribute_group sock##index##_attr_grp = {	\
-	.bin_attrs = _list,					\
-	.is_bin_visible = hsmp_is_sock_attr_visible,		\
-	.name = #_name,						\
-}
-
-HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
-HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
-HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
-HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
-HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
-HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
-HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
-HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
-
-static const struct attribute_group *hsmp_groups[] = {
-	&sock0_attr_grp,
-	&sock1_attr_grp,
-	&sock2_attr_grp,
-	&sock3_attr_grp,
-	&sock4_attr_grp,
-	&sock5_attr_grp,
-	&sock6_attr_grp,
-	&sock7_attr_grp,
-	NULL
-};
-
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
@@ -222,9 +129,49 @@ static void hsmp_pltdrv_release(void *data)
 	hsmp_pdev->sock = NULL;
 }
 
+/*
+ * The amd_hsmp class devices live in an amd_hsmp glue directory below the
+ * platform device, i.e. /sys/devices/platform/amd_hsmp/amd_hsmp/socket%u.
+ * /sys/devices/platform/amd_hsmp/socket%u used to be a plain attribute group
+ * holding metrics_bin, so keep that path working with a symlink to the socket
+ * device.
+ */
+static int hsmp_pltdrv_sock_dev_register(struct device *dev, struct hsmp_socket *sock)
+{
+	int ret;
+
+	ret = hsmp_sock_dev_register(dev, sock);
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_link(&dev->kobj, &sock->sysfs_dev->kobj,
+				dev_name(sock->sysfs_dev));
+	if (ret)
+		hsmp_sock_dev_unregister(sock);
+
+	return ret;
+}
+
+static void hsmp_pltdrv_sock_devs_release(void *data)
+{
+	struct device *dev = data;
+	struct hsmp_socket *sock;
+	u16 i;
+
+	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
+		sock = &hsmp_pdev->sock[i];
+		if (!sock->sysfs_dev)
+			continue;
+
+		sysfs_remove_link(&dev->kobj, dev_name(sock->sysfs_dev));
+		hsmp_sock_dev_unregister(sock);
+	}
+}
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
+	u16 i;
 
 	hsmp_pdev->sock = devm_kzalloc_objs(&pdev->dev, *hsmp_pdev->sock,
 					    hsmp_pdev->num_sockets);
@@ -252,6 +199,27 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * Added after hsmp_pltdrv_release() so that devres removes the socket
+	 * devices before the socket array they reference is released.
+	 */
+	ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_sock_devs_release, &pdev->dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * The socket devices and their symlinks are the only way this driver
+	 * exposes metrics_bin, so failing to create one fails the probe.
+	 */
+	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
+		ret = hsmp_pltdrv_sock_dev_register(&pdev->dev, &hsmp_pdev->sock[i]);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to register HSMP socket%u device: %d\n",
+				i, ret);
+			return ret;
+		}
+	}
+
 	ret = hsmp_misc_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register misc device\n");
@@ -272,7 +240,6 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove		= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.53.0

