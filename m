Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252018;
	b=tszxXAV4vm/1OfkM5YvcgVBtKBymaR6UMvS/yZDnyoF+n5VN5TIC+itA16Ut65HRDZd6
	 tNWNGL775PKXfLdc6uIAu+HeFtyKwmqCLpwQNIlw7sGPhBIM10hlKtQdE4AojVjN1Zkwp
	 sieOExZesKf0xGTu/IynQ3AZnhEbbl5FDlJVBgSO6t335S3lciWaBNm0QkxyBeHFerYWz
	 lkO2vAUrEJ6vNQYDWYl/HhdU9S0l/eeQgTAayHNGFDPKe2BMUBs5eA8KsPCk0eiFyjMYD
	 8Rb3VgX6FxXFauagzT3OuRGmKFCundd0q02JJiF0MfnECV2Lh5xXkd7nNC6qYmKT95Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252018;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:DKIM-Signature;
	bh=rFffltzZLAOUVrQE9U1o98ovRDq4hPCVWi844YQeCVg=;
	b=aTF/G5Z/jClC/Cxt416EE7wl65qycwdV7f/Dhtju3TEpVUhuWZiOiG5HeVlQ06NcBnh2
	 qeLqiPoA1L1ai6Kb7qqM7EaxBcqmJ1E/BZbhrnBgEonPadaZBYabcrTzYztO+96PMHtNH
	 GrIlQGbtyeo9cg1LGIrZx6/Qo6hVJ/E3tg06edW4Ih9Hh/eHniwCuvjz/OG5CwGsbE2mf
	 FoXm1ghknYIc88QG/qxb3qfvN39sQxJOU9FJBsbcuzDd1f45Ld48rc0lH/jZn767EQ2P6
	 wVcVwt9PQZg5/Cn2V955t20KQUzsxGj3hAN8ocFiJhn6bUa2pU/MlwygMl/l4gAqC0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=jC5byT7C;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38C606A32C;
	Sat, 21 Nov 2026 09:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D38C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=jC5byT7C
Received: from abreu.speedport.ip (p57bd9562.dip0.t-ipconnect.de [87.189.149.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5CC4B4C2C90B4C;
	Sat, 21 Nov 2026 10:06:20 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86/intel/pmc: Do not decode the summary rows in ltr_show
Date: Sat, 21 Nov 2026 10:06:11 +0100
Message-ID: <20261121090614.677144-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795251981; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=rFffltzZLAOUVrQE9U1o98ovRDq4hPCVWi844YQeCVg=; 
	b=jC5byT7Cznkg6s6tzhhHDrf2AZ5XFyGMq1Wa4Q1BtD/ETk8ck+lJEu60lXm9RuHLU9ZWF85LBYzr
	A/UgMGSWQHCcbv7dxxuKq4D3iz9MqDvDXgGSzGfJx8QuQHuYTUD9Zmfy9+UkwQrBwHynyAGZt9Jg1y
	H6TCBM5yPcVw1uhTgJIKXVUKBaDv0lOSAbVYHaaJJgjqCFFf0zuUAfakum+GMKizWhN9in0I+Cav5T
	0Uknku6JyLvHbfWNJteWWP3jPP8WPsxJjwHRjRl+CJ/MeczJTTqr+PFHFRIbh1q7/h7Wwpf4AXqIKM
	gqh+9Na8hTUrIkpfz1d+c0QK4s0/V/Ww==

On an Intel Tiger Lake laptop Dell XPS 13 9310, the first read of
`/sys/kernel/debug/pmc_core/ltr_show` after loading the driver logs:

    intel_pmc_core: Invalid LTR scale factor 7 (only 0-5 are valid per PCIe spec)

The value comes from the last row, AGGREGATED_SYSTEM (CNP_PMC_LTR_CUR_ASLT,
0x1b54). In 120 reads over 30 seconds, it read 0x7fffdff, 0x7fffc1f or
0x7fffc23 (117 times), and 0x40201ff or 0x402001f (3 times); another read
gave 0x7ffffff. Decoded as an LTR message, the snoop half of the first
group has the reserved bits 14:13 set and scale 7, and the second group is
CURRENT_PLATFORM (0x40201) shifted left by eight with the low byte filled.
So these two PMC registers do not seem to hold the PCIe LTR payload the
per-IP rows carry, and decoding them only produces the warning (the decoded
value is 0 anyway).

All ltr_show maps end with CURRENT_PLATFORM and AGGREGATED_SYSTEM, which
pmc_core_send_ltr_ignore() already relies on. Print only the raw value of
these two rows, as for rows without a requirement bit set, and keep the
warning for the per-IP rows.

With the change, 200 reads with AGGREGATED_SYSTEM bit 15 set in 199 of them
log nothing, and the CNV row is still decoded (0x89fe89fe, 522240 ns).

Fixes: 8122e7cd806d ("platform/x86: intel_pmc_core: Decode Snoop / Non Snoop LTR")
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    Claude Code (claude-opus-5-5) helped analyse the register values, write
    the patch, and test it on the Dell XPS 13 9310.

 drivers/platform/x86/intel/pmc/core.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 71be313bdf0e1..e3f7d6bc8ce47 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -631,6 +631,18 @@ static u32 convert_ltr_scale(u32 val)
 	return 1U << (5 * val);
 }
 
+/*
+ * Every ltr_show map ends with CURRENT_PLATFORM and AGGREGATED_SYSTEM. Unlike
+ * the per-IP rows, these PMC registers do not hold an LTR message payload as
+ * defined by PCIe; on Tiger Lake, for example, AGGREGATED_SYSTEM has the
+ * reserved bits 14:13 set and reads 0x7fffdff. Do not decode them.
+ */
+static bool pmc_core_ltr_is_summary(const struct pmc_bit_map *map,
+				    unsigned int index)
+{
+	return !map[index + 1].name || !map[index + 2].name;
+}
+
 static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
@@ -654,6 +666,7 @@ static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 		map = pmc->map->ltr_show_sts;
 		for (index = 0; map[index].name; index++) {
 			bool ltr_ign_data;
+			bool summary = pmc_core_ltr_is_summary(map, index);
 
 			if (index > pmc->map->ltr_ignore_max)
 				ltr_ign_data = false;
@@ -666,12 +679,12 @@ static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 			snoop_ltr = ltr_raw_data & ~MTPMC_MASK;
 			nonsnoop_ltr = (ltr_raw_data >> 0x10) & ~MTPMC_MASK;
 
-			if (FIELD_GET(LTR_REQ_NONSNOOP, ltr_raw_data)) {
+			if (!summary && FIELD_GET(LTR_REQ_NONSNOOP, ltr_raw_data)) {
 				scale = FIELD_GET(LTR_DECODED_SCALE, nonsnoop_ltr);
 				val = FIELD_GET(LTR_DECODED_VAL, nonsnoop_ltr);
 				decoded_non_snoop_ltr = val * convert_ltr_scale(scale);
 			}
-			if (FIELD_GET(LTR_REQ_SNOOP, ltr_raw_data)) {
+			if (!summary && FIELD_GET(LTR_REQ_SNOOP, ltr_raw_data)) {
 				scale = FIELD_GET(LTR_DECODED_SCALE, snoop_ltr);
 				val = FIELD_GET(LTR_DECODED_VAL, snoop_ltr);
 				decoded_snoop_ltr = val * convert_ltr_scale(scale);
-- 
2.54.0

