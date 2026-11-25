Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598578;
	b=Vg9dKfgaeJbirsdenI8blrZMl65EqDLId1Nv/XNwhNUhW1xhBiJu89YlmTwe3ie4tw26
	 ptLtY3L3QazREyrLIwbTzVRH/F1aDgU/3p8fWCJhZKsQcPZANUBMJ0YffeeP2CSTEL9O1
	 mYGonTeyROajyo+770W855a7pYEMwuQCj1N71nugkcASr0xMgm23AUGqovkWHT68iGJqH
	 w60VCyvX88U9OMwoKkYsCSRLLs19zZnGCDLMJbi8+k/WogYLqHV+TTlbaOWFMY80x0GyE
	 f7tYlqbM9BJo7qVJip7yuKLPktl4X4896tFCFwMXTZ2XJn07vQ3y61ucrTWU1n+QjGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598578;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BrTyBepLET1NNfXQSjEbrYhrmTOO7yqTn9L93XTRixU=;
	b=q1iE7pjfjV8gdTWCYmYT9ITKvi4uiEGrz4rRhrQsH4DI7nuXIicWfS1sheHBKsdInbuL
	 3tYNmEyFMsgA3v8p3d6D2RWDVTKEEAnFie6hs98PXw5U5E3j6n+Eokf1INUoKcl58iNpH
	 3cmcshE7WqukuxpKhDWf9fscpNN3r4ucaM59Q1Rboe+ObPzvshWxniksdU57p1B9HvUoe
	 5OX3imiQ3GFQx9xgzCO8/nxA4yrkvB3bHYDUuv2UN6+v/+C62C0g6Vf6dzLm93fOG6XOi
	 7h8kesT70lWOSIVMnktLWnvdGn1WOppYtq7cM+QL5W76P5tFovM/+TbWTiz9H4sBWSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Tw8cWe66;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7B606A68E;
	Wed, 25 Nov 2026 09:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE7B606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Tw8cWe66
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795598566; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BrTyBepLET1NNfXQSjEbrYhrmTOO7yqTn9L93XTRixU=;
	b=Tw8cWe662OYezpcg3scg6jRaizqg1SWa0jT5aCWBgQ4tAdM/eOTonjGTjl/4fOWll5YBoq+CN5gVX/k62tyrug8iHjLYwXoimzielsPCOwWaSt7F13qd0bj7CTJ+FPG2O9Yf6CRIQPzLT1BjvGUKUKa/JO35Vlfz2LLedOxkyzw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XFR4B-a_1795598565;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XFR4B-a_1795598565 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 17:22:46 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xlpang@linux.alibaba.com,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on partitioned systems
Date: Wed, 25 Nov 2026 17:22:44 +0800
Message-ID: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

When a package has multiple TPMI partitions, PLR can report the same
CPUs in more than one partition. For example, on a single-package
system with 72 logical CPUs and two TPMI partitions, both partitions
list CPUs 0-35 in their PLR status files. CPUs 36-71 are missing.

Each partition numbers its PLR resources from zero. The driver compares
that index with the CPU's power domain ID from MSR_PM_LOGICAL_ID, which
is unique within the package. As a result, both partitions select the
same CPUs. A mailbox read or clear on the second partition then uses a
module ID taken from a CPU in the first partition.

Use the partition's cdie_mask to map each PLR resource to its package
power domain. For compatibility with older platforms, keep using the
resource index for partition 0 when no mask is available. Skip per-CPU
mailbox accesses if the resource has no valid CPU mapping.

Fixes: 9e9397a41b7b ("platform/x86/intel/tpmi/plr: Add support for the plr mailbox")
Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
---

Notes:
    Tested on a single-package system with 72 logical CPUs and two TPMI
    partitions. The PLR status files now list the CPUs belonging to each
    partition.

 drivers/platform/x86/intel/plr_tpmi.c         | 31 ++++++++++++++++---
 .../platform/x86/intel/tpmi_power_domains.c   |  2 --
 .../platform/x86/intel/tpmi_power_domains.h   |  2 ++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/plr_tpmi.c b/drivers/platform/x86/intel/plr_tpmi.c
index 785c279b4540..33066f4763ef 100644
--- a/drivers/platform/x86/intel/plr_tpmi.c
+++ b/drivers/platform/x86/intel/plr_tpmi.c
@@ -51,7 +51,7 @@ struct tpmi_plr_die {
 	void __iomem *base;
 	struct mutex lock; /* Protect access to PLR mailbox */
 	int package_id;
-	int die_id;
+	int power_domain_id;
 	struct tpmi_plr *plr;
 };
 
@@ -201,10 +201,13 @@ static int plr_status_show(struct seq_file *s, void *unused)
 	seq_puts(s, "cpus");
 	plr_print_bits(s, val, 32);
 
+	if (plr_die->power_domain_id < 0)
+		return 0;
+
 	guard(mutex)(&plr_die->lock);
 
 	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
-		if (plr_die->die_id != tpmi_get_power_domain_id(cpu))
+		if (plr_die->power_domain_id != tpmi_get_power_domain_id(cpu))
 			continue;
 
 		if (plr_die->package_id != topology_physical_package_id(cpu))
@@ -241,10 +244,13 @@ static ssize_t plr_status_write(struct file *filp, const char __user *ubuf,
 
 	plr_write(0, plr_die, PLR_DIE_LEVEL);
 
+	if (plr_die->power_domain_id < 0)
+		return count;
+
 	guard(mutex)(&plr_die->lock);
 
 	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
-		if (plr_die->die_id != tpmi_get_power_domain_id(cpu))
+		if (plr_die->power_domain_id != tpmi_get_power_domain_id(cpu))
 			continue;
 
 		if (plr_die->package_id != topology_physical_package_id(cpu))
@@ -281,6 +287,23 @@ static void intel_plr_unregister_notifier(struct notifier_block *nb)
 	tpmi_unregister_notifier(nb);
 }
 
+static int plr_power_domain_id(const struct oobmsm_plat_info *plat_info, int index)
+{
+	u16 mask = plat_info->cdie_mask;
+	int id = index;
+
+	/* Resource indices are relative to the partition's first compute die. */
+	if (mask)
+		id += __ffs(mask);
+	else if (plat_info->partition)
+		return -ENODEV;
+
+	if (id >= MAX_POWER_DOMAINS || (mask && !(mask & BIT(id))))
+		return -ENODEV;
+
+	return id;
+}
+
 static int intel_plr_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
 {
 	struct oobmsm_plat_info *plat_info;
@@ -340,7 +363,7 @@ static int intel_plr_probe(struct auxiliary_device *auxdev, const struct auxilia
 
 		plr->die_info[i].base = base;
 		plr->die_info[i].package_id = plat_info->package_id;
-		plr->die_info[i].die_id = i;
+		plr->die_info[i].power_domain_id = plr_power_domain_id(plat_info, i);
 		plr->die_info[i].plr = plr;
 		mutex_init(&plr->die_info[i].lock);
 
diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index ebe052c3bbe4..f6a46b4571ec 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -70,8 +70,6 @@ static DEFINE_PER_CPU(struct tpmi_cpu_info, tpmi_cpu_info);
 /* The dynamically assigned cpu hotplug state to free later */
 static enum cpuhp_state tpmi_hp_state __read_mostly;
 
-#define MAX_POWER_DOMAINS	8
-
 static cpumask_t *tpmi_power_domain_mask;
 
 static u16 *domain_die_map;
diff --git a/drivers/platform/x86/intel/tpmi_power_domains.h b/drivers/platform/x86/intel/tpmi_power_domains.h
index 2fd0dd7afbd2..43a80b526133 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.h
+++ b/drivers/platform/x86/intel/tpmi_power_domains.h
@@ -10,6 +10,8 @@
 
 #include <linux/cpumask.h>
 
+#define MAX_POWER_DOMAINS	8
+
 int tpmi_get_linux_cpu_number(int package_id, int die_id, int punit_core_id);
 int tpmi_get_punit_core_number(int cpu_no);
 int tpmi_get_power_domain_id(int cpu_no);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.55.0

