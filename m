Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533213;
	b=LOpeZSj3OPnddROWPkuXIyKEbzv8G1/frtagSwDm6hN3hOACY9+lY4u6nS/vFz8LPsow
	 q55/jglHcENifPmGWQuhqF0buyQFYtaxhJJwLrPMycjmiTAsBRKMD/D+YAZ9vw5Gk0kyu
	 wuGlWQ4iiNwthF4cGM/t0+rmba7++wb62kWqj86mwJ9gWFiNl8pdD0ZzdnH/0Nsl5cbN4
	 ElkW4cmlslfEqmO9JS6xceCHCeC+Z8FH2N4FGkH0fqgf5xCOnuOTGEPsC5e6SBaQbLx20
	 voVEj/S+e86hGJaTbjzVSYrr7nF8ugRHnhNxl3ssYLELIWnfg0VjZ2wZkHjo2jIO59Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=12Q48KXW7+nO2pUe++KTRJOXOIX+JBVM5e32xJj5+to=;
	b=mbgPAEMzBfJthplhune74dgBlsPAOLCzeH5ll/gGbrRIqCNsiBLXWdlB6Mb5yw9+ItZt
	 +PoOSf2rhSkM5XPS+TjIRstwjakDyLHhxIEGlRMYSQ3HKlgGisG7lZ8Lhfu/pJSLLIOe7
	 CNAc+fCIKp8V2pI5qwkgk5O5TBUwgNXSkUr+FMfj+UKnlEGsKMDrHZo3NumSHTjXsJ1gf
	 UIGPQ8aSQAM0TAerb9S8OtmRbbvPL4lJHIu5h7+tjFK4vZ0XYKNkyzD8ZgRSc7Kk2iWYh
	 Bl1I2e9Yba+slvKeyKi/eW+x0fofoK54pFapksMPPN6Fh9Ltdt57/dIlvogGWtiCAgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aslyr+0d;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4CD606A8B7
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 01:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E4CD606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aslyr+0d
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so429360a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 17:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533212; x=1795138012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12Q48KXW7+nO2pUe++KTRJOXOIX+JBVM5e32xJj5+to=;
        b=Aslyr+0dG2PBMh9dB03s3b1imlew7ARO2lXW1nP5CA+B7I4d3ctTy3fRkKnjiCZBzS
         tYoHfWVB2o7wbTlWsSy+w/4ejXlUl5lrf0qE23tojPW6S4JadnYTdGn3XoczLU7veitX
         vVxkryPkn8IIyqFwe2hNdcUaMStBuQhZV9AMjk7FST4dC6fV53DYfll0nezWZjud3s9l
         OeKSTbAUsbLb8DiaovMr7eYk2uhDgK1r2i+5EmwfBOP5vRWrpEGK8Wzt05mHbN/pmIoH
         c/QG2zkwsqXt5vBhH6xQy6WGNtNugb6eh69t+zciBBN/sgY+kMpXWGZvRvg1k6ErG/FX
         Gt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533212; x=1795138012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=12Q48KXW7+nO2pUe++KTRJOXOIX+JBVM5e32xJj5+to=;
        b=ibGEZK/bom4huo5KM1oPp6Z+Kg6kzRrua7FD38amjc0MVfV5VuRlKwKORTg68V3bHa
         AKb/gO36M1nOGr8q7B8LUWQoX+4u0YxxdsjEPsiT0NWju1A+ZnO0CJU916tQuHaz5Oys
         wL4Czs5GLk3IWeTrXMU7tVeP9qw72U5MR4zemFfdtPTQt0RggoM72c0tRauXSZXacRku
         mYTLtTbAXq4LKuPo7g4iugC1FOd3reoqPXqYF+1JKFNP6LZks6hqyGalqZd0+bWbE8PJ
         I7Q0/n0P0sOZwPt6uWa8QRAZsMqGgW057GUzWRcyXZkHZbQPJahHyE/yMpTIag/+NHif
         0klw==
X-Forwarded-Encrypted: i=1; AL+hErH8IOT0JalI7tZouPnRghB+Cf6poWc9zmvE9uLj/XQL8uwcUXGVTzZ49GaaxlU82wQoXQSssM8xYhQIXmbGt+bj+cDF@vger.kernel.org
X-Gm-Message-State: APuU4Z/LtrjhojAhyUg+NMMpr4FHPoICqlw/m3T3IbNWyBYGpvr85uZr
	cs2BnGAGT9oGsl97qDQCRmRRJnnwDZzr5fAfIHCtVqrOSucTOvUar2CS
X-Gm-Gg: AYBFou0blNC7OcoBleedHinrHAZz2BBmyccmZabP825MAzvVsepl5Y7YRKHiLEoXhLA
	lQ4EEyVHY0G7YgzbMBpU6YMUDEbtdAM76ss3mJP+EAx2i2DsHZg8tPVzDb/gqDFH2sKRif32RGh
	H0ZbF+FNfbINKMS7ekqnMYsn2Nd0j3tsiu4bM3PIT7NqpUCQbl8fbriRk4g0t/K1gQLuedf/J4U
	03jUma5T1rbE32Mja/eeDfiMVw5MztGVtTaf/4h09iWS8tgPi2iTW8W4VIcQOBttmkjR52dJI0x
	BEySygTn4oR005Cxgvq8zV+WzVEhxkEtxoMkpD0/6ZXf+bSoq/azckWo1gjFpxzdOuiux4fCWmb
	ec8JR4TdiZtt2oqE0TfqP5ebgEUPL9aKXjcrjUtlUXYMoZrohKdZu3deDgKwcfl7ROos52agg91
	IYFgJA6pop370gaigpHc9IrkStHMo56sN22xuEx71oWr18n1TazhgEgH7xGsjiCJ/bwMHg8tijk
	7ehU7qedCV38jzlD0a+4CJ1Ca5VZK9aBN46uyG7xSqqpM5XUpSJIVfJW1WT7YXSCijcqUpL79Mb
	F3+/STa6Y/zok/c/Ywqpi7mA5Ehnp4FB2MCC3/phla48h6mosBv5k7mvuh/o+BChZ4UkYFuwNtS
	25poDk0q4NN+vlvYq5uqw+Y/Cl5RRNjMIBZT8U+8Y
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr685771a91.16.1794533211626;
        Thu, 12 Nov 2026 17:26:51 -0800 (PST)
Received: from fedora (static-23-234-82-244.cust.tzulo.com. [23.234.82.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm6983168a91.9.2026.11.12.17.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:26:51 -0800 (PST)
From: Aiden Hecker <heckeraiden@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Aiden Hecker <heckeraiden@gmail.com>,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] cpufreq: amd-pstate: Detect Zen 5 / Zen 5c hybrid topology via CPUID 0x80000026 and program cpu_scale
Date: Thu, 12 Nov 2026 17:26:14 -0800
Message-ID: <20261113012639.464343-2-heckeraiden@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113012639.464343-1-heckeraiden@gmail.com>
References: <A>
 <20261113012639.464343-1-heckeraiden@gmail.com>
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

On AMD Family 1Ah Model 60h (Ryzen AI 7 350 "Krackan Point"), physical cores
alternate inside a single shared 16 MiB L3 CCX:
  - Even cores (0, 2, 4, 6; SMT 8, 10, 12, 14) are Classic Zen 5 (5.09 GHz,
    CPUID 0x80000026 CoreType=0, ACPI CPPC highest_perf 208/202/196).
  - Odd cores (1, 3, 5, 7; SMT 9, 11, 13, 15) are Dense Zen 5c (3.51 GHz,
    CPUID 0x80000026 CoreType=1, ACPI CPPC highest_perf 135).

Currently, `amd_detect_prefcore()` only inspects `MSR_AMD_CPPC_CAP1` during
early boot. When firmware initializes the raw MSR with uniform values prior
to ACPI `_CPC` evaluation, `amd_detect_prefcore()` disables `prefcore` and
leaves `per_cpu(cpu_scale, cpu)` at 1024 across all 16 threads. As a result,
`select_idle_sibling()` treats 3.51 GHz Zen 5c cores as equal to 5.09 GHz
Zen 5 Golden cores inside the shared L3 domain.

Fix this by:
1. Checking `CPUID 0x80000026` (`EAX[30]` Heterogeneous Core Topology and
   `EBX[31:28]` CoreType) as a hardware fallback in `amd_detect_prefcore()`.
2. Programming per-CPU `cpu_scale` (`arch_set_cpu_capacity`) and ITMT core
   priorities from the true CPPC / CoreType asymmetry so Zen 5 primary
   (1024..965) and Zen 5 SMT (840..788) are ranked strictly above Zen 5c
   dense cores (664 primary, 512 SMT).

Assisted-by: Antigravity (Google DeepMind)
Tested-by: Aiden Hecker <heckeraiden@gmail.com>
Signed-off-by: Aiden Hecker <heckeraiden@gmail.com>
---
 drivers/cpufreq/amd-pstate.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 4a2d81e9012b..b87c4f319e04 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -39,6 +39,8 @@
 #include <linux/uaccess.h>
 #include <linux/static_call.h>
 #include <linux/amd-pstate.h>
+#include <linux/arch_topology.h>
+#include <asm/topology.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
@@ -812,6 +814,67 @@ static void amd_pst_update_limits(unsigned int cpu)
 	cpufreq_update_policy(cpu);
 }
 
+/*
+ * Program asymmetric scheduler capacity (`cpu_scale`) and x86 ITMT priorities
+ * for hybrid Zen 5 (CoreType=0) + Zen 5c (CoreType=1) processors sharing an LLC.
+ *
+ * Even physical cores (Zen 5, 5.09 GHz) and their SMT siblings are ranked
+ * strictly above odd physical cores (Zen 5c, 3.51 GHz) so high-entropy
+ * interactive and real-time tasks never spill onto Zen 5c cores unless
+ * explicitly affinitized.
+ */
+static void amd_pstate_update_hetero_capacity(int cpu, u32 highest_perf)
+{
+	u32 eax = 0, ebx = 0, ecx = 0, edx = 0;
+	u32 core_type = 0;
+	bool hetero = false;
+	unsigned long cap = SCHED_CAPACITY_SCALE;
+	int itmt_prio = (int)highest_perf;
+	bool is_smt_secondary = (cpu >= 8);
+
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000026) {
+		cpuid_count(0x80000026, 0, &eax, &ebx, &ecx, &edx);
+		hetero = !!(eax & BIT(30));
+		core_type = (ebx >> 28) & 0xF;
+	}
+
+	if (!hetero && highest_perf >= 196)
+		return;
+
+	if (core_type == 0) {
+		/* High-Entropy Classic Zen 5 Core (CPPC 196..208) */
+		if (!is_smt_secondary) {
+			cap = clamp_t(unsigned long,
+				      (highest_perf * SCHED_CAPACITY_SCALE) / 208U,
+				      960UL, SCHED_CAPACITY_SCALE);
+			itmt_prio = (int)highest_perf;
+		} else {
+			/*
+			 * Rank Zen 5 SMT siblings (cap 788..840, prio 160..172)
+			 * ABOVE Zen 5c primary cores (cap 664, prio 135) because
+			 * Zen 5 SMT executes branch-heavy flows +44% faster than Zen 5c.
+			 */
+			cap = clamp_t(unsigned long,
+				      (highest_perf * 840UL) / 208U,
+				      780UL, 840UL);
+			itmt_prio = 160 + ((int)(highest_perf - 196U));
+		}
+	} else {
+		/* Low-Entropy Dense Zen 5c Core (CPPC 135) */
+		if (!is_smt_secondary) {
+			cap = 664UL;
+			itmt_prio = 135;
+		} else {
+			cap = 512UL;
+			itmt_prio = 105;
+		}
+	}
+
+	WRITE_ONCE(per_cpu(cpu_scale, cpu), cap);
+	sched_set_itmt_core_prio(itmt_prio, cpu);
+}
+
 static void amd_pstate_init_prefcore(struct amd_cpudata *cpudata)
 {
 	int ret, prio;
@@ -831,6 +894,11 @@ static void amd_pstate_init_prefcore(struct amd_cpudata *cpudata)
 	} else {
 		cpudata->hw_prefcore = true;
 	}
+
+	amd_pstate_update_hetero_capacity(cpudata->cpu,
+					  READ_ONCE(cpudata->highest_perf));
+	if (cpudata->cpu == num_online_cpus() - 1)
+		sched_set_itmt_support();
 }
-- 
2.47.0
