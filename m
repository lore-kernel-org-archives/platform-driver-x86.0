Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A21422E24;
	Tue,  1 Sep 2026 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275033; cv=pass; b=Qd5fll++u/Vw45iH2jkAa+ZSy1SzxUhf2wPNthYO6O31I2+LWgne5toKfKV8acVs/4ZAB+iSR1ARG5VZXNt2fA7wOO8pU4S08wtFa51e0+93L63qxNuP7XNkN9oLhbP6P3ZTibbUoZ+BjFNwiOBwx2SYZw16TB1JaTnX5hfdF7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275033; c=relaxed/simple;
	bh=mUpaf0raCV9B+PigKm8XLOQbTAqE74duSPsPL7NSSms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPAxiSKheEel2NtX4NWCJOqgfp4ApNtAlSPb/ncWGy+1BsVCRq7kkrVGGwCDe5DEVvnm49GLGGJZdLWBdoGjMW+OIZOJrIIZgmosJpCrwb0SRKeR4px7nIg9j4POm806JaCQZedtW5KEJLcoHDoMj0BOb97XhlTme0NjNCln7Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=iEbnTV3t; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="iEbnTV3t"
ARC-Seal: i=1; a=rsa-sha256; t=1788275019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k+ZqaOD0y5AdfAcA9miiSnfAwaSMWOQGbC7/DIS/rnmOlk+bGROXmLq1vPs9gmADwYUtgH8E5rSSen96G7qNqyho+02mkZciZwAoqd3gzmGVBsgNZ4I0qVT0HQqnTgaJgvClQwfM1/HgwH/yREihOdospLd/fn4gEJnqBMcpTBQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=28yVsE48nO1Rwm8Crw6x8vedbXiSJCnUdbmgKCm6es0=; 
	b=M7qMbIe9kqkq2I6aatlZRGVOLk5oWRxv7qdyUOIsRTYb6dxfejEwET6IgHdybgJGIrpnu9L3ec1GEOREEp+S+8qZQSwbi6qzkXOnl5yK1sVlNGtsJwMWsx6qLIoe7MIIE98MH19Ahr/GnDTiJocoWuE++c37IgMMn95lXuU47Nw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275019;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=28yVsE48nO1Rwm8Crw6x8vedbXiSJCnUdbmgKCm6es0=;
	b=iEbnTV3tMxHzMZlxl+W6g+wIIdapeoUvD4WudPYzL0sN+w0DFIbNBqf/zwlqUvk3
	G2rY7xnpz9vW83yIpgOFel89ZI+/n9ax9QEwb6FLogPOqGGq4OTubFivHvPJ0pwq7s3
	G25faCtslw6SgZcKDiG/w8XcRV+M7l/1BIR0B/4zgOciAdDT/mRNDzj6DRLLU12tQ/a
	MkzUnC0Iox4M4LP0jZXSWUx1vGnNOCv8iWrE0GksSJISVLoSguUX0RM4sxdW2iBtkoU
	IqQpBej7UgpOR4kdxc5VQ2FAlAzyXUOo6m73/tUgW2lfTVAW0/6QmmRAT9tgo4An5uY
	VJ+nE5/cww==
Received: by mx.zohomail.com with SMTPS id 1788275016990645.3035016759047;
	Tue, 1 Sep 2026 08:03:36 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 01 Sep 2026 23:02:11 +0800
Subject: [PATCH 1/5] platform/x86/amd/pmf: Inline !AMD_PMF_DEBUG stub
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-amd-pmf-fix-outlining-v1-1-b54ff94d3d45@rong.moe>
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

A !CONFIG_AMD_PMF_DEBUG build compiles amd_pmf_dump_ta_inputs() as a
stub. However, the stub is implemented as a global function and becomes
a symbol against linkage. This bloats the size of the module.

As a best practice, convert the stub into a static inline function to
get rid of the overhead of function outlining and linkage, and shrink
the module (!CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT) size
by 65 Bytes (GCC 16 -O2):

      text       data        bss      total filename	(before)
     26810      31672       2768      61250 amd-pmf.ko

      text       data        bss      total filename	(after)
     26781      31636       2768      61185 amd-pmf.ko

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/amd/pmf/pmf.h | 7 ++++++-
 drivers/platform/x86/amd/pmf/spc.c | 2 --
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 07ec00684233..4da2ef1abb50 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1137,10 +1137,15 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
 
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
-void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
 u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index);
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+#else
+static inline void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
+#endif
+
 int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
 void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
 int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 592ba4de4c7f..ea11d29633c8 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -60,8 +60,6 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 			amd_pmf_get_ta_custom_bios_inputs(in, i));
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
-#else
-void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
 /*

-- 
2.55.0

