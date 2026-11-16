Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844359;
	b=WBY3qIHPYm3eoYW1cWk6zezIZvZ4+1Ruj21Hr6DatchdDGhmp/ZRyMJowUTfKaS7KehC
	 9Hq79hXcLDyW3qFReuTeNecmN9VLZ/cGPwBhf4AJa9GrVQuNeMhhXq4mHT445jKfq9YwX
	 7N/+h3lJco4Xq+QSFYQHcDAUzZFT6HGFzcuNAcK8IRuGlSeJUnw82NBKPNfat/HlxRzbc
	 Ejg03dtz4UmESSXIxowOB7LbZP2H+u8xBrOo2Thw1vjzhb9cC9pYhlMzlFVWDhXoWfX3/
	 RUN8r40fgUG0cnDrHK//JaeWq/hqnNIVtB7BoxhOS06OgFA/Qp9k1CccEx2Gty6n7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/jmAse/nXpg22et2TT3BCaD1tUokDIRAMdasm8SKXqw=;
	b=QMyJeDKweBZW6nnAMMbLpcgXcfKzmDts/xI0JgVKTiESyBy51yHk4qmm+qCBJ+R7lPvb
	 OFGCRQJV2w5BiG9ZlHTAC38Yd4i4diLXCA26wz0giLuMzWpeL/x2gRvVzIDfKOYS1LErK
	 WcUZ6/2q1PQIB3IA4NXS3Fay0SeooXSeD+9jekEYwOwBvywH6N0scH/MZhhuT3avgw8tW
	 6bSDjyCyS09OVND2RaRVM4M9zPPsFXEsNilBoN6eehaiAwVNHeJsebWh3GrEJBY6JXw51
	 1P7m6a+dsVvJspeZSkHylUo6BH/hmfi+vOgWoxygA3PjA9249Ljw3nbrkTZVmz8d+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSOtCNyY;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BAE606A322
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BAE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSOtCNyY
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb606491faso11564595e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 07:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844356; x=1795449156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jmAse/nXpg22et2TT3BCaD1tUokDIRAMdasm8SKXqw=;
        b=OSOtCNyYYYp4f4uyOL1UD4QfRKFr4ZM2M/ja25y+B7ShZI3ZKk5+DD2CZyKB8mszER
         RUxMuSu10skSJrM1oVggl4G4IHoseiGsVSoGV1kZy3KUj+nVAGMqN70i6CZWegmYct7r
         EOGd1fQydb51RKd70atB/NV4AOwcQ4sVdSKQN17RLdOjOj6ZsIQVH47aEvpnQ8WWTyh4
         dOC6Vw0nHRm0Zr+MtoR4sADSq4bxV46PW96796MqhuuVBebzCwRrKBobQKqIHVI7Ge55
         0YM/PtUGk072QzjWor8Qf6mRGCmq+/IlZdM9lSS+DGbPtNwH3hZ9663cXmcUAmwJTAB+
         +BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844356; x=1795449156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jmAse/nXpg22et2TT3BCaD1tUokDIRAMdasm8SKXqw=;
        b=1iSyvEjXdDwWQKB50W2drWb3SA/zA3DHDltE960tyydH+fimrtCjq0yTSHn1bMQoLp
         0Eoj30u3YthV0mz1dLOrsue1OtrbZR3s9E5UuVHeC7iA3E6TFJv784dM6mUzTqCkkjhE
         vSpofcRO01aVKUKMw6cfCBL4PBUjhtwH+9r0/6sM+z6IiUZGuHUJvNRhbgU0N3bhDQxQ
         wtlF5jLTdXYjcu0g3Mjf0eFvSNHnPJY4DX7O2hOMXZijHl6izPo1MKEdcZ3ybYsQJIPA
         nxWE13eynXwA7N8ASnv5lUA2k9DOPXv9Kbvf64HmlYqUropknUA1KIARjGuGZEQ1hKaW
         niew==
X-Forwarded-Encrypted: i=1; AL+hErHzqZiV7Am4d1x/qR67UVw1uY8uJmBBsQHz4KZYvfBWx7XL5oezXo0L9Mj85Cj9PKDy3ATZ9fqkh9Amx9O1yoXwEodq@vger.kernel.org
X-Gm-Message-State: APuU4Z84hp4DkfRIDy4ouELqfE8p1aKbBngGeg6hAUVIRcfyva/REE7m
	79UunVXqAxf5rXN1Uxh1tH3ZFuc8BSqdWxviu3sXFpf5fSRFA8oQ7TPT
X-Gm-Gg: AYBFou3qUJAYGnloUlRlco2zpc665wLi4EIpiV41G7PkjPNURiY78EJIXWz8s11hYfa
	tdrX/o0xY6ZzZJIWGAW3prsgfsTjvuSq0F1raWkguDbChsydqj+oow0T5t2LCc5aPM5WZbDzYhX
	t9Ng0VX0dVD/MBODcUVazXm2ApygGuJfpXby7F7dcVg62jwyEz8y+iTdAuj3heQqZ98zicmfelM
	Mce78CdEa25BHHPpYFPqyV0rt+I18vFMgRaORWGgI0syS3B8dFbH+iIbI9WxaBMhal7dTdynq3i
	HgcgnIWWpfjO/PwSKmNQl44dIiu1Q2znQ9JyUSE1AFrafT5lo4aUI+mjEXhCypeXCD8JAMAG7iE
	3odGT8uGkoVPWZrs0bNetsk2wK3nt6fr/bMkyYiq/VdiY0RB4CcmqP4CR+kr4iHvhk1C5OXW6ek
	7nCgSEqa9ZEcsiKg1W/0lpWH+ANR9OdMWS9QSM7bxHIMV7SlLSAvv9inQI7ngaOB4YTMaS4MbsJ
	JSqPx5MiEwOwtzubITQWKZ5rSnFG3PTn5HNfF4EQ9GcQz9bh9H7MLJ1aWSZi9FVIuCl3VuZj6bn
	igkGxoFqXwQUNR/Qknkk/hwWelqFRSNuD/O4f+rSmp3exIW+YqvFr2wKWmFRCQasPuBaLSoDoi0
	f+cgGTV6tsn7dkBU2a2fNVi2iquZxWo1srdDxiwa2
X-Received: by 2002:a05:600c:1993:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb659cb9e8mr149452915e9.12.1794844355635;
        Mon, 16 Nov 2026 07:52:35 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm321279415e9.10.2026.11.16.07.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:35 -0800 (PST)
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
Subject: [PATCH v2 1/5] platform/x86/amd/hsmp: Move per-socket sysfs attributes to common code
Date: Mon, 16 Nov 2026 16:51:43 +0100
Message-ID: <20261116155147.769630-2-erwanaliasr1@gmail.com>
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

The per-socket telemetry attributes (c0_residency_input, ddr_max_bw,
pwr_current_active_freq_limit, ...) are implemented in acpi.c, so only
the ACPI driver can expose them, although they are plain HSMP messages
the platform driver can send as well.

Move them to a new sysfs.c in hsmp_common and export the attribute
groups as hsmp_sock_groups, so they can be shared by both drivers. The
ACPI driver keeps exposing them on its socket devices via dev_groups.

No functional change.

Assisted-by: claude-opus-5-5
Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 331 +----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   1 +
 drivers/platform/x86/amd/hsmp/sysfs.c  | 348 +++++++++++++++++++++++++
 4 files changed, 351 insertions(+), 331 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c

diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index ce8342e71f50..21fc1d185550 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -5,7 +5,7 @@
 #
 
 obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
-hsmp_common-y				:= hsmp.o
+hsmp_common-y				:= hsmp.o sysfs.o
 hsmp_common-$(CONFIG_HWMON)		+= hwmon.o
 obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
 amd_hsmp-y				:= plat.o
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 167c76c13ad0..a1e13aff9c86 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -12,9 +12,6 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
-#include <linux/array_size.h>
-#include <linux/bits.h>
-#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
@@ -27,7 +24,6 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/sysfs.h>
 #include <linux/topology.h>
 #include <linux/uuid.h>
 
@@ -55,11 +51,6 @@ static struct hsmp_plat_device *hsmp_pdev;
  */
 static struct kref hsmp_acpi_sock_kref;
 
-struct hsmp_sys_attr {
-	struct device_attribute dattr;
-	u32 msg_id;
-};
-
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -270,262 +261,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return 0;
 }
 
-static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
-					 const struct bin_attribute *bin_attr, char *buf,
-					 loff_t off, size_t count)
-{
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-
-	/*
-	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
-	 * It can therefore only carry the protocol version 6 metric table
-	 * (struct hsmp_metric_table).  The larger tables defined from protocol
-	 * version 7 onwards do not fit; userspace on those systems must read
-	 * the snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
-	 * Surface the unsupported case here as -EOPNOTSUPP rather than
-	 * silently truncating the snapshot.
-	 */
-	if (hsmp_pdev->proto_ver != HSMP_PROTO_VER6)
-		return -EOPNOTSUPP;
-
-	return hsmp_metric_tbl_read(sock, buf, count);
-}
-
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 const struct bin_attribute *battr, int id)
-{
-	/*
-	 * Keep metrics_bin visible on protocol version 7 and later as well,
-	 * so that userspace which expects the file to exist gets a clear
-	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
-	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
-	 * Hide metrics_bin on client platforms.
-	 */
-	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
-		return battr->attr.mode;
-
-	return 0;
-}
-
-/* Defined below by HSMP_DEV_ATTR() */
-static struct hsmp_sys_attr hattr_smu_fw_version;
-static struct hsmp_sys_attr hattr_protocol_version;
-
-static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
-					     struct attribute *attr, int id)
-{
-	/* Hide every attribute except smu_fw_version and protocol_version on client platforms */
-	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
-	    attr != &hattr_protocol_version.dattr.attr)
-		return 0;
-
-	return attr->mode;
-}
-
-#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
-
-static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data);
-}
-
-#define DDR_MAX_BW_MASK		GENMASK(31, 20)
-#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
-#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
-#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
-#define FW_VER_MINOR_MASK	GENMASK(15, 8)
-#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
-#define FMAX_MASK		GENMASK(31, 16)
-#define FMIN_MASK		GENMASK(15, 0)
-#define FREQ_LIMIT_MASK		GENMASK(31, 16)
-#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
-
-static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
-}
-
-static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
-				     char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
-}
-
-static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
-					  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
-}
-
-static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu.%lu.%lu\n",
-			  FIELD_GET(FW_VER_MAJOR_MASK, data),
-			  FIELD_GET(FW_VER_MINOR_MASK, data),
-			  FIELD_GET(FW_VER_DEBUG_MASK, data));
-}
-
-static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data[2];
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data[0]);
-}
-
-static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data[2];
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data[1]);
-}
-
-static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
-				  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
-}
-
-static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
-				  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
-}
-
-static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
-}
-
-static const char * const freqlimit_srcnames[] = {
-	"cHTC-Active",
-	"PROCHOT",
-	"TDC limit",
-	"PPT Limit",
-	"OPN Max",
-	"Reliability Limit",
-	"APML Agent",
-	"HSMP Agent",
-};
-
-static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
-					   char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	unsigned int index;
-	int len = 0;
-	u16 src_ind;
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
-	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
-		if (!src_ind)
-			break;
-		if (src_ind & 1)
-			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
-		src_ind >>= 1;
-	}
-	return len;
-}
-
 /*
  * Bring up one ACPI HSMP socket: parse its ACPI table, run the mailbox
  * handshake and register its sysfs/hwmon interfaces.
@@ -593,70 +328,6 @@ static int init_acpi(struct device *dev)
 	return 0;
 }
 
-static const struct bin_attribute  hsmp_metric_tbl_attr = {
-	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
-	.read = hsmp_metric_tbl_acpi_read,
-	.size = sizeof(struct hsmp_metric_table),
-};
-
-static const struct bin_attribute *hsmp_attr_list[] = {
-	&hsmp_metric_tbl_attr,
-	NULL
-};
-
-#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
-static struct hsmp_sys_attr hattr_##_name = {		\
-	.dattr = __ATTR(_name, _mode, _show, NULL),	\
-	.msg_id = _msg_id,				\
-}
-
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
-HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
-HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
-HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
-HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
-	      hsmp_freq_limit_show, 0444);
-HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
-	      hsmp_freq_limit_source_show, 0444);
-
-static struct attribute *hsmp_dev_attr_list[] = {
-	&hattr_c0_residency_input.dattr.attr,
-	&hattr_prochot_status.dattr.attr,
-	&hattr_smu_fw_version.dattr.attr,
-	&hattr_protocol_version.dattr.attr,
-	&hattr_cclk_freq_limit_input.dattr.attr,
-	&hattr_ddr_max_bw.dattr.attr,
-	&hattr_ddr_utilised_bw_input.dattr.attr,
-	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
-	&hattr_fclk_input.dattr.attr,
-	&hattr_mclk_input.dattr.attr,
-	&hattr_clk_fmax.dattr.attr,
-	&hattr_clk_fmin.dattr.attr,
-	&hattr_pwr_current_active_freq_limit.dattr.attr,
-	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
-	NULL
-};
-
-static const struct attribute_group hsmp_attr_grp = {
-	.bin_attrs = hsmp_attr_list,
-	.attrs = hsmp_dev_attr_list,
-	.is_bin_visible = hsmp_is_sock_attr_visible,
-	.is_visible = hsmp_is_sock_dev_attr_visible,
-};
-
-static const struct attribute_group *hsmp_groups[] = {
-	&hsmp_attr_grp,
-	NULL
-};
-
 static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 	{ACPI_HSMP_DEVICE_HID, 0},
 	{}
@@ -814,7 +485,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.acpi_match_table = amd_hsmp_acpi_ids,
-		.dev_groups = hsmp_groups,
+		.dev_groups = hsmp_sock_groups,
 	},
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 3302c1517369..7a0e3af67691 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -104,6 +104,7 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
 #endif
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
+extern const struct attribute_group *hsmp_sock_groups[];
 
 /*
  * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
new file mode 100644
index 000000000000..06c0a5a02ca2
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP sysfs support
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides the per-socket sysfs attributes of the HSMP interface.
+ */
+
+#include <asm/amd/hsmp.h>
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/sysfs.h>
+
+#include "hsmp.h"
+
+struct hsmp_sys_attr {
+	struct device_attribute dattr;
+	u32 msg_id;
+};
+
+static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
+					 const struct bin_attribute *bin_attr, char *buf,
+					 loff_t off, size_t count)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+
+	/*
+	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
+	 * It can therefore only carry the protocol version 6 metric table
+	 * (struct hsmp_metric_table).  The larger tables defined from protocol
+	 * version 7 onwards do not fit; userspace on those systems must read
+	 * the snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
+	 * Surface the unsupported case here as -EOPNOTSUPP rather than
+	 * silently truncating the snapshot.
+	 */
+	if (get_hsmp_pdev()->proto_ver != HSMP_PROTO_VER6)
+		return -EOPNOTSUPP;
+
+	return hsmp_metric_tbl_read(sock, buf, count);
+}
+
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 const struct bin_attribute *battr, int id)
+{
+	/*
+	 * Keep metrics_bin visible on protocol version 7 and later as well,
+	 * so that userspace which expects the file to exist gets a clear
+	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
+	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
+	 * Hide metrics_bin on client platforms.
+	 */
+	if (!is_client_platform() && get_hsmp_pdev()->proto_ver >= HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
+}
+
+/* Defined below by HSMP_DEV_ATTR() */
+static struct hsmp_sys_attr hattr_smu_fw_version;
+static struct hsmp_sys_attr hattr_protocol_version;
+
+static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
+					     struct attribute *attr, int id)
+{
+	/* Hide every attribute except smu_fw_version and protocol_version on client platforms */
+	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
+	    attr != &hattr_protocol_version.dattr.attr)
+		return 0;
+
+	return attr->mode;
+}
+
+#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
+
+static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data);
+}
+
+#define DDR_MAX_BW_MASK		GENMASK(31, 20)
+#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
+#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
+#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
+#define FW_VER_MINOR_MASK	GENMASK(15, 8)
+#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
+#define FMAX_MASK		GENMASK(31, 16)
+#define FMIN_MASK		GENMASK(15, 0)
+#define FREQ_LIMIT_MASK		GENMASK(31, 16)
+#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
+
+static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
+}
+
+static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
+				     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
+}
+
+static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
+					  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
+}
+
+static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu.%lu.%lu\n",
+			  FIELD_GET(FW_VER_MAJOR_MASK, data),
+			  FIELD_GET(FW_VER_MINOR_MASK, data),
+			  FIELD_GET(FW_VER_DEBUG_MASK, data));
+}
+
+static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data[0]);
+}
+
+static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data[1]);
+}
+
+static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
+}
+
+static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
+}
+
+static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
+}
+
+static const char * const freqlimit_srcnames[] = {
+	"cHTC-Active",
+	"PROCHOT",
+	"TDC limit",
+	"PPT Limit",
+	"OPN Max",
+	"Reliability Limit",
+	"APML Agent",
+	"HSMP Agent",
+};
+
+static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
+					   char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	unsigned int index;
+	int len = 0;
+	u16 src_ind;
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
+	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
+		if (!src_ind)
+			break;
+		if (src_ind & 1)
+			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
+		src_ind >>= 1;
+	}
+	return len;
+}
+
+static const struct bin_attribute  hsmp_metric_tbl_attr = {
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
+	.read = hsmp_metric_tbl_acpi_read,
+	.size = sizeof(struct hsmp_metric_table),
+};
+
+static const struct bin_attribute *hsmp_attr_list[] = {
+	&hsmp_metric_tbl_attr,
+	NULL
+};
+
+#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
+static struct hsmp_sys_attr hattr_##_name = {		\
+	.dattr = __ATTR(_name, _mode, _show, NULL),	\
+	.msg_id = _msg_id,				\
+}
+
+HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
+HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
+HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
+HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
+HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
+HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_show, 0444);
+
+static struct attribute *hsmp_dev_attr_list[] = {
+	&hattr_c0_residency_input.dattr.attr,
+	&hattr_prochot_status.dattr.attr,
+	&hattr_smu_fw_version.dattr.attr,
+	&hattr_protocol_version.dattr.attr,
+	&hattr_cclk_freq_limit_input.dattr.attr,
+	&hattr_ddr_max_bw.dattr.attr,
+	&hattr_ddr_utilised_bw_input.dattr.attr,
+	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
+	&hattr_fclk_input.dattr.attr,
+	&hattr_mclk_input.dattr.attr,
+	&hattr_clk_fmax.dattr.attr,
+	&hattr_clk_fmin.dattr.attr,
+	&hattr_pwr_current_active_freq_limit.dattr.attr,
+	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
+	NULL
+};
+
+static const struct attribute_group hsmp_attr_grp = {
+	.bin_attrs = hsmp_attr_list,
+	.attrs = hsmp_dev_attr_list,
+	.is_bin_visible = hsmp_is_sock_attr_visible,
+	.is_visible = hsmp_is_sock_dev_attr_visible,
+};
+
+/*
+ * Per-socket attribute groups. Every show/read handler expects the drvdata of
+ * the device carrying the group to be the struct hsmp_socket it reports on.
+ */
+const struct attribute_group *hsmp_sock_groups[] = {
+	&hsmp_attr_grp,
+	NULL
+};
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_groups, "AMD_HSMP");

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

