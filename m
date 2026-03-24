Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2043F361DAC
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388535; cv=none; b=dRm755LoRSDeRqUrFdlIWrQ5fW983Ap3R6f8qqjUWleU2y13do0XSQUZSPw4ICwcOQ+rlEd/TzCb4+5zi31zIg8SitnzVMY0sCKOhtMFH6N+0pDcYcqI/DCskqImP9F4MUf9VlkNUUdpcmUF2TJXnLhRIRouTByhlLzF9SGU59M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388535; c=relaxed/simple;
	bh=la0HE0qtz7Pv2g0oEQay0X0IsfysA07UfreUabqV8LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDsYhooCdoGdyULqX9c36HcqTsfgTqiI6ETt4nOVqxRWL6+8pnB3Z3g67Lv8XIvEYFOBSefu8rv1wkqlojkfi/dPX4TP4h5kefVwFdwXxXIEB52BJ/4w2iM3rhB93/QPLxgn2rTY8jUzJ22bTJCK7I+jI36iKre6HI114xvy5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAO5yOFR; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAO5yOFR"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0bb213b16so10433742eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388531; x=1774993331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/PGeCZ0MB+zM0M8BNi4C8mQnbwNTKvleFT37RyQ3oo=;
        b=VAO5yOFRivRDWeCqSGcKEoAgQ3wAG7h0HQJ0SGhDmOZQM9GoxQJpp/xdFNaXI1Rkcc
         symzExbUa4giLYw+SLJfqpvqsum+QFVM6AEz9KUy9GifeZ4KzKCiJ55VVRxsW1VfgIwM
         BkmH01zAjSJEETIKQlToAAUCt8OPSxIGXA02FWX1AZp0EgbKBVjH7kSxp3n+zCRdbrgy
         PFP1+OU+q5ITg6dC2IuScY4GJiCTB4L1DhTW3fTqBhh7QYcJQEW5WW6+i0YUGOBAQ+iq
         pMg7EAGp9a8MEE5yRLNN9l7GeyFcLFu+J1Si0V4kEt2TG9PZK9h/IwWkTtcY4B++fBFH
         p6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388531; x=1774993331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/PGeCZ0MB+zM0M8BNi4C8mQnbwNTKvleFT37RyQ3oo=;
        b=aDEenoL5lAyEOV3IG/P5vDjLCtIormF7fQYil8iScrlXmB/DjMdccwCPZJ8LvKg8Ft
         Tifr7YClA7GECq1HwDdaW/ivG7NlDAfYnlb81NEGH1Wjce7VH8jd9SQkUwoC6d66UvQn
         ONIS7orqY3icCUD5wwTCSA71I6coe/W0Ff4sbqnO8PFnHmzY4OQ3dPfD2W9Q2SNIIH5G
         tHzq/LwFiS1X/dO3h/uwuIHK4LuPqFueyk1iXCjVD5V9UFXMiHHOzuJ+Jk3ZNE+9KcVm
         8jjZW5X4FPDFCIgzPeyRvvCrsSuUlJ5FJUQ+OvcloxHKBV5O95mYsmd6n7k2XAEPqP8R
         2nxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq8jVMAQJCHloAouqX2FV0nLOTDs48UYD1ef3W0/QE2sj4PW/ZAObcEH408qNyjz0CFHt4zKb+POmwBslNK9U4zcZa@vger.kernel.org
X-Gm-Message-State: AOJu0YxWCCMD04JfmcMJVUM9TyPEVLr+qgfEcs0VC6kl+GHTDY7ijcVu
	git82nAbHcAmZcmuWTQXBEe98VEgm9Zb06FQ4STiBIIKh56IWHuS/x/W
X-Gm-Gg: ATEYQzwAu1QmI+VQl/XOjFRBHTHrAkHvLnyBKGLQU7lsMZrqQ83N+BGfg6jus1khAYe
	7Gv965ApRcmTP0SQdvXkGE5Cl6DeaGld7oKeF1EHdvDyS9uobZwMud0QZwiVoPzUVF9LsUgiInS
	pVMe0oF9rsnAhkTfjKEtaHF175YS0PxxsuwjVMMKn86TqmYDPOObzHVeMfvT/AkuKPUUumwK3FW
	wVe0SQFuyAzY5PO9B4RGeHzng+ru+sWNzDf7qe82qPG1ttjv8zmitVLL1pMZHfB3henokbL0B1O
	JjTCdpSAYdMU59wSnbFhpe8hmfwyOGLfESp7oPpD7G2t7fJfKnpuWgOwyhkt6mbduxiAI/1b1yz
	GnAWEqEatfBGket9v8K6vzLsOwWd3GEP9aVhiOiW0wlFQNMnEZlcCYN1mQx7G3lZ15c5HutGuBj
	bUMpbqyCe1UQuy4xdPnRr3tw==
X-Received: by 2002:a05:7301:d19:b0:2be:2b8d:399b with SMTP id 5a478bee46e88-2c15d2800b5mr570130eec.5.1774388531176;
        Tue, 24 Mar 2026 14:42:11 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:10 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/3] platform/x86: int3472: tps68470: fix GNVS clock fields for Dell Latitude 5285
Date: Tue, 24 Mar 2026 14:41:26 -0700
Message-ID: <20260324214129.17300-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 5285 BIOS leaves the GNVS fields C0TP, L0CL, and L1CL
at zero at boot. The TPS68470 clock driver reads L0CL and L1CL to select
the output frequency; with both fields zero the clock outputs are disabled,
and neither camera sensor can communicate over I2C.

Additionally, when C0TP=0 the ACPI _DEP method on INT3479 returns PCI0 as
its dependency instead of CLP0 (the INT3472 device), causing ipu_bridge to
never create the i2c-INT3479:00 client for the front camera.

Add a DMI-gated fixup that runs at TPS68470 probe time and writes 0x02
(19.2 MHz) into C0TP, L0CL, and L1CL.

The GNVS physical address is discovered at run time by scanning the raw
AML of the DSDT (and any SSDTs) for the GNVS SystemMemory OperationRegion
definition (opcode sequence 0x5B 0x80 "GNVS" 0x00). The parsed address is
then mapped with acpi_os_map_memory(), which is safe because ACPI NVS
memory is reserved by the firmware and already mapped by the OS. No
hard-coded physical addresses are used.

Field byte offsets within the GNVS region (verified against DSDT
disassembly on this platform, region size 0x0725 bytes):
  C0TP: 0x43A   L0CL: 0x4F7   L1CL: 0x549

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603211747.Z6xudmNd-lkp@intel.com/
---
 drivers/platform/x86/intel/int3472/tps68470.c | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..c9686426f 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -2,8 +2,10 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps68470.h>
 #include <linux/platform_device.h>
@@ -140,6 +142,203 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 	return n_consumers;
 }
 
+/* Dell Latitude 5285 GNVS fix
+ *
+ * The BIOS leaves GNVS fields C0TP, L0CL and L1CL at zero after POST.
+ * With C0TP=0 the ACPI _DEP on INT3479 resolves to PCI0 instead of CLP0
+ * (INT3472), so ipu_bridge never creates i2c-INT3479:00 (OV5670 front cam).
+ * With L0CL=L1CL=0 the TPS68470 clock driver disables all clock outputs,
+ * making both sensors unreachable over I2C.
+ *
+ * Fix: at TPS68470 probe time, locate the GNVS SystemMemory OperationRegion
+ * by scanning the DSDT/SSDTs for its AML definition, map the region, and
+ * write 0x02 (19.2 MHz) into C0TP, L0CL and L1CL.
+ *
+ * Field byte offsets (verified from DSDT disassembly, GNVS size 0x0725):
+ *   C0TP: 0x43A   L0CL: 0x4F7   L1CL: 0x549
+ */
+#define DELL5285_C0TP_OFF	0x43A
+#define DELL5285_L0CL_OFF	0x4F7
+#define DELL5285_L1CL_OFF	0x549
+/* Minimum GNVS region size: last field (L1CL) is 1 byte at 0x549 */
+#define DELL5285_GNVS_MIN_SIZE	(DELL5285_L1CL_OFF + 1)
+
+/* AML integer opcodes (ACPI 6.4, section 20.2.3) */
+#define AML_ZERO_OP		0x00
+#define AML_ONE_OP		0x01
+#define AML_BYTE_PREFIX		0x0A
+#define AML_WORD_PREFIX		0x0B
+#define AML_DWORD_PREFIX	0x0C
+#define AML_QWORD_PREFIX	0x0E
+
+/**
+ * aml_parse_int - Parse one AML integer opcode at @p.
+ * @p:   Pointer to the current position in the AML byte stream.
+ * @end: One past the last valid byte of the AML buffer.
+ * @val: Output: the parsed integer value.
+ *
+ * Returns the number of bytes consumed, or 0 on failure.
+ */
+static int aml_parse_int(const u8 *p, const u8 *end, u64 *val)
+{
+	if (p >= end)
+		return 0;
+	switch (*p) {
+	case AML_ZERO_OP:
+		*val = 0;
+		return 1;
+	case AML_ONE_OP:
+		*val = 1;
+		return 1;
+	case AML_BYTE_PREFIX:
+		if (p + 2 > end)
+			return 0;
+		*val = p[1];
+		return 2;
+	case AML_WORD_PREFIX:
+		if (p + 3 > end)
+			return 0;
+		*val = get_unaligned_le16(p + 1);
+		return 3;
+	case AML_DWORD_PREFIX:
+		if (p + 5 > end)
+			return 0;
+		*val = get_unaligned_le32(p + 1);
+		return 5;
+	case AML_QWORD_PREFIX:
+		if (p + 9 > end)
+			return 0;
+		*val = get_unaligned_le64(p + 1);
+		return 9;
+	}
+	return 0;
+}
+
+/**
+ * dell5285_gnvs_from_table - Scan one ACPI table for the GNVS OperationRegion.
+ * @tbl:  ACPI table header; the AML body is scanned for the GNVS signature.
+ * @addr: Output: physical base address of the GNVS region.
+ * @size: Output: byte length of the GNVS region.
+ *
+ * Searches the AML body of @tbl for the byte sequence:
+ *   ExtOp(0x5B) OpRegionOp(0x80) NameSeg("GNVS") RegionSpace(SystemMemory=0x00)
+ * followed by two AML integers (region address and length).
+ *
+ * Returns true and fills @addr / @size if found and plausible.
+ */
+static bool dell5285_gnvs_from_table(const struct acpi_table_header *tbl,
+				     phys_addr_t *addr, u32 *size)
+{
+	/* AML: ExtOp OpRegionOp NameSeg("GNVS") SystemMemory */
+	static const u8 sig[] = { 0x5B, 0x80, 'G', 'N', 'V', 'S', 0x00 };
+	const u8 *aml = (const u8 *)tbl + sizeof(*tbl);
+	const u8 *end = (const u8 *)tbl + tbl->length;
+	const u8 *p;
+
+	for (p = aml; p + sizeof(sig) < end; p++) {
+		u64 region_addr, region_size;
+		int consumed;
+
+		if (memcmp(p, sig, sizeof(sig)) != 0)
+			continue;
+
+		p += sizeof(sig);
+		consumed = aml_parse_int(p, end, &region_addr);
+		if (!consumed || !region_addr)
+			continue;
+
+		p += consumed;
+		consumed = aml_parse_int(p, end, &region_size);
+		if (!consumed || region_size < DELL5285_GNVS_MIN_SIZE)
+			continue;
+
+		*addr = (phys_addr_t)region_addr;
+		*size = (u32)region_size;
+		return true;
+	}
+	return false;
+}
+
+/**
+ * dell5285_gnvs_find - Locate the GNVS OperationRegion by scanning DSDT and SSDTs.
+ * @addr: Output: physical base address of the GNVS region.
+ * @size: Output: byte length of the GNVS region.
+ *
+ * Returns true if the GNVS region was found in any ACPI table.
+ */
+static bool dell5285_gnvs_find(phys_addr_t *addr, u32 *size)
+{
+	struct acpi_table_header *tbl;
+	u32 i;
+
+	/* DSDT */
+	if (ACPI_SUCCESS(acpi_get_table(ACPI_SIG_DSDT, 1, &tbl))) {
+		bool found = dell5285_gnvs_from_table(tbl, addr, size);
+
+		acpi_put_table(tbl);
+		if (found)
+			return true;
+	}
+
+	/* SSDTs (instance numbers start at 1, stop at first failure) */
+	for (i = 1; i <= 32; i++) {
+		bool found;
+
+		if (ACPI_FAILURE(acpi_get_table(ACPI_SIG_SSDT, i, &tbl)))
+			break;
+		found = dell5285_gnvs_from_table(tbl, addr, size);
+		acpi_put_table(tbl);
+		if (found)
+			return true;
+	}
+
+	return false;
+}
+
+static const struct dmi_system_id dell5285_gnvs_dmi[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+	},
+	{ }
+};
+
+static void dell5285_gnvs_fix(void)
+{
+	phys_addr_t gnvs_addr;
+	u32 gnvs_size;
+	void *gnvs;
+
+	if (!dmi_check_system(dell5285_gnvs_dmi))
+		return;
+
+	if (!dell5285_gnvs_find(&gnvs_addr, &gnvs_size)) {
+		pr_err("int3472-tps68470: Dell 5285: GNVS OperationRegion not found in DSDT/SSDTs\n");
+		return;
+	}
+
+	gnvs = acpi_os_map_memory(gnvs_addr, gnvs_size);
+	if (!gnvs) {
+		pr_err("int3472-tps68470: Dell 5285: failed to map GNVS at %pa\n",
+		       &gnvs_addr);
+		return;
+	}
+
+	pr_info("int3472-tps68470: Dell 5285 GNVS fix at %pa: C0TP=0x%02x L0CL=0x%02x L1CL=0x%02x -> 0x02\n",
+		&gnvs_addr,
+		*(u8 *)(gnvs + DELL5285_C0TP_OFF),
+		*(u8 *)(gnvs + DELL5285_L0CL_OFF),
+		*(u8 *)(gnvs + DELL5285_L1CL_OFF));
+
+	*(u8 *)(gnvs + DELL5285_C0TP_OFF) = 0x02;
+	*(u8 *)(gnvs + DELL5285_L0CL_OFF) = 0x02;
+	*(u8 *)(gnvs + DELL5285_L1CL_OFF) = 0x02;
+
+	acpi_os_unmap_memory(gnvs, gnvs_size);
+}
+
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
@@ -155,6 +354,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	if (!adev)
 		return -ENODEV;
 
+	dell5285_gnvs_fix();
+
 	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
 	if (n_consumers < 0)
 		return n_consumers;
-- 
2.51.0

