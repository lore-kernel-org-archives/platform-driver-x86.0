Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC64963B6
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377985; cv=none; b=D0RZZ4rFlI9fOavFrki/VGfOw0b6hOFgdNHM/rrWcxLhmcBJP2cGpD8Tu/6VBJTbmFEsThOzv3RIzMbn04NyP6BGR79YrwcYsWRePDsiY+h9Td1ougM6lubT6cTRobhrYVESHARvMzGSq0Tng4BIVCd7hrB8u2kk6o7Rcad9F8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377985; c=relaxed/simple;
	bh=/X/KBuBOM3/E6J6/v5uz/PKk4nRhs0zMBff1arpy70E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jkc7DPAkQtP99nUlKvbFHVHidwPQL6xpBH8cHxi2j2OcuM1NPgP710oWXuI3cNJHb0WPJrjeg5C1frElkCwd7G+YcuHxfoeBRMl9UWfB+jmSPql2VL2WlLfeOCzlXMnueanBRhaYY0LavPm8cl7NlYczx9aE+zKmG+93fZhEKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8TRhf0z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8TRhf0z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so38844055e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791377967; x=1791982767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNUGIxKXdpWR1uylCexR+eBicNyzTZLNBgLDGsmxmcM=;
        b=Q8TRhf0zlSK6TD30clx1IAzI1ctcTlpXTu8xDU61f1KDqTuKnmuOc1Pjc2yKyEDQPZ
         QSQhPZd2Xdqq65TXoYMwvrdmq6Zt90Z6aTVxLjwiHks6Z/IqSsbHOVttQV5SNJTRBcRK
         OafwNoVdlEE49F22JFauSipDQAYjFKqmZfWZwaYBfoFA9aneUF9zUYD7OQjTG27xEAHt
         K/wu5lVoTHqYeZUTj1ffmVCzfxSa3FMjwLLe2AZOnzvln8grTQATLpQtXlaWMIE0oS7Y
         gl4spRULtZS5mTudsYoY8TLgvFi7s5JSjxlloJ5S2tdlUsqIAg1d0HwC/KgpyD0X7XUl
         9ZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377967; x=1791982767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNUGIxKXdpWR1uylCexR+eBicNyzTZLNBgLDGsmxmcM=;
        b=I06MYd9sm8rtNRBXGw4a0t7sGGsk/cI4EemCI4zwOx30GhdI04CfpMxhoCJy1Qs+Ha
         2kXdZCGjAmI+EMTZz22pMBzCOXPH5ufbqyaeNm7aIxlvBUPY2IftBeziucXXn4rvJVle
         g5JLHJ/28uhwO0UkZ1uCNj6f42ub80nd42RL8W47HDTHBgmDvyzT/GZmvfENbVU1VM9k
         Axy/moMiqOJgdRto+/Cua3u/SPQa2h7anVLT8HIR9aZfmg+HYvGyCJCSuK8ux/FJEC+c
         JrGBVnX5hJ6KLpyG0tXkD5pLVBhTVVMOPLb/RG9+UTyGYl1zk8pQvpMMpvfz0po4fA6X
         CGJQ==
X-Gm-Message-State: AFuF++npccUcYybqHM4SiMwg836GznVrPSJ7z1iMC2F163hz28uF0ia3
	1jGiRAZy5WTmFSnz5Ysh0xdxMpzzrFLYOvqq0qWQSF3l+dMKKUV4X+4c5i+zbo0G
X-Gm-Gg: AYBFou3L13+bTR2MUeTZ/ub5eqF2ANDhped74ad7v7brPj57PCaA7wMOwmByPDraMTM
	d14qx8UjUzb0JCL8yAL7Xw7qHLsT0Of+PLTdGByLFnzmADIY3LqpNkYdyy1AiAyw7zI9iPJiIlj
	6MENr14RSqZ1z/fcw0Soh5tINDcJ+U12Xt0HiDS+ye3lyhPDWlewAPer1I2BlTJwcH95xfZmsM4
	CQOWTt3EV2ZB+YLxJqAF3Sa+VzCpTpudccUoVushdl1r2Ux1hGPw6oMDn3Tu54KRatqqZS+sB56
	rj4V2ZV5aD/F6O4uwuVp4a/KsTfAAr7tgD2rPQISCI43CPpVbSwtRz+n4st66uU8WBtn0acx5GT
	SqaLTwUOcXJoEMhbt8FCuwqeSVtedYUU6h2kK0WlGqeWxTxgdR7xGUkcPcIH6xVKKuv57P097X6
	c1pQNgPV99rTydmK5FqBXB5RT7CsMZtaN/FlJVpyWVoo4xEi8ASBOUzrO332m/mrrsEI+5GwfeB
	1pjV8/KGGjSRolhU277EHoB1eyqChSrlalHCP+UtRM=
X-Received: by 2002:a05:600c:4ece:b0:4a1:6916:798 with SMTP id 5b1f17b1804b1-4a18043c09dmr32381595e9.14.1791377967217;
        Wed, 07 Oct 2026 05:59:27 -0700 (PDT)
Received: from PF5R4XJL.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm105304145e9.2.2026.10.07.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:59:26 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] platform/x86/amd/hsmp: Move per-socket sysfs attributes to common code
Date: Wed,  7 Oct 2026 14:59:05 +0200
Message-ID: <20261007125908.321186-2-erwanaliasr1@gmail.com>
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

The per-socket telemetry attributes (c0_residency_input, ddr_max_bw,
pwr_current_active_freq_limit, ...) are implemented in acpi.c, so only
the ACPI driver can expose them, although they are plain HSMP messages
the platform driver can send as well.

Move them to a new sysfs.c in hsmp_common and export the attribute
groups as hsmp_sock_groups, so they can be shared by both drivers. The
ACPI driver keeps exposing them on its socket devices via dev_groups.

No functional change.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 321 +----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   1 +
 drivers/platform/x86/amd/hsmp/sysfs.c  | 338 +++++++++++++++++++++++++
 4 files changed, 341 insertions(+), 321 deletions(-)
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
index ddd7a04ee753..d76979baffa8 100644
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
@@ -270,252 +261,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
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
-	 */
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
-		return battr->attr.mode;
-
-	return 0;
-}
-
-static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
-					     struct attribute *attr, int id)
-{
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
@@ -572,70 +317,6 @@ static int init_acpi(struct device *dev)
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
@@ -793,7 +474,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.acpi_match_table = amd_hsmp_acpi_ids,
-		.dev_groups = hsmp_groups,
+		.dev_groups = hsmp_sock_groups,
 	},
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 8dbff16a87b1..692721e2e6d3 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -80,6 +80,7 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
 #endif
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
+extern const struct attribute_group *hsmp_sock_groups[];
 
 /*
  * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
new file mode 100644
index 000000000000..b1db3b4d77b9
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -0,0 +1,338 @@
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
+	 */
+	if (get_hsmp_pdev()->proto_ver >= HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
+}
+
+static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
+					     struct attribute *attr, int id)
+{
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
-- 
2.53.0

