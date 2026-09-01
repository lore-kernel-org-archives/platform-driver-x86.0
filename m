Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA74314AC;
	Tue,  1 Sep 2026 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275059; cv=pass; b=jpjqmHsL5yR270nna0G7Y0evM+WfoxMeSg7ZSn/T0cUP09A7rx4qbEZxodxI8vN4l0CTSUVgNZjq6A56s4wsCwZMMSlgF3LdpSu8FcIzo4HX9uo3kQWMot60N3rN00+kSbFEgQF4zVSNF5vZWwbOAodT303vRLEBT5p666Ed6fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275059; c=relaxed/simple;
	bh=WIVrSCGubNS5SrdEUAu9E90widxgLFCniRl75K+uePI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCffN9PsCOlKg6kcMhVWECvmicuk6nqoXmw6OoBJMyKQcLCzd5eRpJMKEQNPGJ/Bs2485/M/Ht75zQR8OcKZ7Kp1oBIvWahOa6XpR3vZVw9EfXaT5Cg0rB5/eAZdBTjM7wB0qMW4xs3OpkUON5gFUQpRHGcDnd8v1F6rkbx5srk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KqV8dLGm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KqV8dLGm"
ARC-Seal: i=1; a=rsa-sha256; t=1788275027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hUXOMyGiHsfrQ+fPiYrMalvmwLzgkveK/qE8knN5qaIw2dd2PImuQ2cE1aA2QtByfip0Meb5QB5qqygMwrbMGl+5uskl4uKQpXZPRar3TA7vPvzon0Jb5lEnYDpQW8AmR8jL6dJ2s3uUUGwvcR/P0trr0eZXGStZRG4/ToIGVTc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275027; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pAhnomRGs0QwW1tbP+IFT6U4T6KEU9KEhOhzxjPrQtM=; 
	b=cFuF6npcjshoiNWh/eG/7ob/F6hrllwnAYS/TQIg6/p/Dg3Fv23inyjXK7qwR6j4hMHsCNsB05IhYX60+mUEAtoHiJNm/jRI5pus1VA8IsgIzTqUHlLxQMoq/Y2CjMH/M11MqK4gvC+2FYINVzxVmRM9GI4RYn3ep2AOK5yMKDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275027;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=pAhnomRGs0QwW1tbP+IFT6U4T6KEU9KEhOhzxjPrQtM=;
	b=KqV8dLGmCuYYYyvNtUUG3jKW0Uvo98c4ItuI4CvI8YMu5+SkGH1oURf03TWHc2PO
	u3E03xo6YHQKoaNy5QmVxJYtWjeUzlbVex8wJoPMh6fg+9yCoK0rl9B5S8v3hKs5dqh
	3kAlqerRMD8eicIJY9ffXVO1iTHhFskOURPaUG4L/hIXbbpwLuZ+zvE+btJ/vabURGJ
	yap+6cEedRYCGfKgt/5wJCytT7Qz6QTwX1Z88BUYI7KBG6MU0hjJNzpAMthhdaPATpk
	iAsR4T5VLwehWNg/j+IR2ENsIv+jeSsaq0k6vrnIzSvoHXr4TNQuKpKByPWEInYqZhm
	4sJVfnURhA==
Received: by mx.zohomail.com with SMTPS id 1788275025848446.0862335774882;
	Tue, 1 Sep 2026 08:03:45 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 01 Sep 2026 23:02:14 +0800
Subject: [PATCH 4/5] platform/x86/amd/pmf: Inline simple helper function of
 Smart PC TA interfaces
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-amd-pmf-fix-outlining-v1-4-b54ff94d3d45@rong.moe>
References: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
In-Reply-To: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sanket Goswami <Sanket.Goswami@amd.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The Smart PC TA interfaces have a simple and dumb helper function
defined as a global symbol, which is used by other layers and becomes a
symbol against linkage. This bloats the size of the module.

Convert it into a static inline function to get rid of the overhead of
function outlining and linkage, and shrink the module
(!CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT) size by 208 Bytes
(GCC 16 -O2):

      text       data        bss      total filename	(before)
     26341      31392       2768      60501 amd-pmf.ko

      text       data        bss      total filename	(after)
     26261      31264       2768      60293 amd-pmf.ko

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/amd/pmf/pmf.h | 13 ++++++++++++-
 drivers/platform/x86/amd/pmf/spc.c | 13 -------------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4a4c3aeadecc..6d9963677a46 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1171,7 +1171,18 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
-u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index);
+
+static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
+{
+	switch (index) {
+	case 0 ... 1:
+		return in->ev_info.bios_input_1[index];
+	case 2 ... 9:
+		return in->ev_info.bios_input_2[index - 2];
+	default:
+		return 0;
+	}
+}
 
 #ifdef CONFIG_AMD_PMF_DEBUG
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index ea11d29633c8..c939c5379151 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -17,19 +17,6 @@
 #include <linux/units.h>
 #include "pmf.h"
 
-u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
-{
-	switch (index) {
-	case 0 ... 1:
-		return in->ev_info.bios_input_1[index];
-	case 2 ... 9:
-		return in->ev_info.bios_input_2[index - 2];
-	default:
-		return 0;
-	}
-}
-EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
-
 #ifdef CONFIG_AMD_PMF_DEBUG
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {

-- 
2.55.0

