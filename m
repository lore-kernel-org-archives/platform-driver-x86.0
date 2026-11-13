Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536984;
	b=RmcxHOoxyLBQcGq6Qy6nLDLQd9Tmmc4nrSGFW5NnopK4Rm18+e003WE4Jl9xm0mIAJNe
	 Mr7/T62C2FJxJ8cx+qk7J1HhjpCtP0BB48zi2rmLwN6FNHFg/WPs76F9UY+tPwLSPyMsc
	 UtKAas4klhYYSGlqUnni/YzIPOGX4emXsUq728k5+jNSiS9RziXL88OXJ5hT/D8dvtFl5
	 Q7+pZPrDrAstcEH7fdomMIMZhBMEhT/gYs4h4PmdlGTBkB2BWpSp8eTUzGYHI+2uA1oHN
	 GTF2iQXiprn6oMv9xi1K/+hEUO5/qhW+OnNHdKMTB8xTWlgw6iSinW959UXSh2NU1NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uDx3QXV13JGuIpjRQ0OV+D6x+l2ABszc9Xk6Hk+7MWA=;
	b=Z70e82/Ares2uDZbYfngFFIs7RstQiMhIw2W0O4HFB7J9s/cb9Sox9iehB5sccY9/Pq4
	 hz5aIkEiSweMOYTF9Gpvz3nHJCP2jhaoj9TuEA8qvAGTUGgcYNRlcn2Re6QYBVRbomx7K
	 n1IzoWUHNOnJFDlY9a32Up+GKGHvzLBhHRCpCCjv2uX+sOSFr/MhF7joqIDCGkUhmnww1
	 gqfWSX4UavojRlJzz1vpg8CIDKLcR8PaXSeMQwFI9iCdQVo2DizrTnCHYlemSmr3pGolT
	 vQmp/oqkJgXKGUtVnhxWrqoSLvUtvYIxjd0jWIQCF9qRMZmrpJHkn9/Yc321PDnhzlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9ZNtN+c;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E6F606A887
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 02:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E6F606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9ZNtN+c
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a058315c79so347361b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 18:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536983; x=1795141783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDx3QXV13JGuIpjRQ0OV+D6x+l2ABszc9Xk6Hk+7MWA=;
        b=W9ZNtN+c83+LJXITyz+JvRMPGAu12mQN+kefo556qAM12XMIbFOiGoxgzaPc3hRrde
         iiEs4Itd0opDrpUN+1FS0b4xIQb5aiMTg7klO9bgLoluMgAiT95r67G+6lHgVLmrx6Tb
         YUJyxeAAn+PyoT04xIo41/TsVj7qqT0Mmt0WPZiv5ijOPaNxS0H0CyXpF1Szlu8vA740
         bbg858U/UN/YbOMVPfzwxXzcvvXcrjPNiSz6yRPcXmgRIpO2BJYlO1HDW8o/MEARC0fA
         39VPyIV8LWu0uNItDBXA1HxoFa1YEAjJC9nGv0TNFppFlu4CvOKCgnWpyw0q+SWKbxq+
         Vvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536983; x=1795141783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDx3QXV13JGuIpjRQ0OV+D6x+l2ABszc9Xk6Hk+7MWA=;
        b=CLQcSZi3TjslFjMT8Yd1wfZAuLq7hPnmLRg6dT8AgHK4IdkCpuyfAJ37ljiDFIBU+G
         Rcb2qB52r+nvWxdDFRAHvljYZRtKMZa7UWtQO0PpPUusftDboCbCIV/WmMC5jSp14nyR
         ZPdFR7lSj7ddXlt48JtK8B5KQGU9q6ruzuE2pjqPcmvJFr1ImwwD9WKGOJUvFJ6YVEEO
         J1QG2TXSg+xCZOCrxJQgXngZ/cxqwmCCD58htge88dyqwSq5N/lrhlH4dZrNodS/f1vL
         mZdmvijKww7M29yb0iPT7PsQJ8Eo7eFdgbo2ZBrbnkcQazgl7TWV8qIHZ/oh6ZZwl26R
         DYAw==
X-Forwarded-Encrypted: i=1; AL+hErEQkmW3H9VL2Vm/yq/OVxD/maTLQQbD+okbToIqZnVtru4+Ow9Pte/1XQrAwLQXpdy8NYiA9MiK4aUtd0uR7GPOWiLH@vger.kernel.org
X-Gm-Message-State: APuU4Z8IIqYB+oPR1Iv0jOr/ARYk+n/XrkUqzXyQk/DxOW8W4vI1MXVa
	UuR8s9zCQzTkg63AsbdUHvPlLPQ99VmwQ/J4CwRSbiTv3+ZJDcqHwIzD
X-Gm-Gg: AYBFou02gkvidJ9nH6HS07GPjGoIyyBC4FGRLssWNELbAK2LIO/nobzXoCe+0WDPwP4
	8Dn5tlcaIdj6D37OQozmGMtKa0CEuTtiCv2M6QkLVptumNFMvkVor6/ZMPLb+bsFYEf8OpSIdZ4
	dUD4SDjHECCCI/3cKD8MxhZ2aEV6WbDd+M7LtLy5qRNjiYZllgVVsXEWBHpBUs97n2cMjHkPWzL
	Mq1KxA1gRFFHMr4Nv8bXAL9qMKvyvGJfMTN31VTdYa3ULeUMaT7rFmdFUQSyQorrB0OGheK1mRE
	UMYiqQUNQhYw0oBvVyFhO6KLoo4HJWMG0X1jPKZET9HJLsJ2F5fWylthx1Vboxhiiawf1t58Tgf
	jhJK2Itn9SUbVkftiD/hgsOuocxgzTwwpgJFfzPsCh/CzRFcelc032JhQCjCZN43/dSW4pFYcwa
	sfgD2w7p2fI81D2BYSMcWtTCkioZvk9fDA0RnlcbMYewdNuM9EE00dYcJXhAv7N0e9nD/6zpIz4
	DOCiLaEqOy5S8fgj8pmRBzXrArLP7PuIMd+8xOCah/ReGHfSk+/K2zxHo2xg0M/b5GSE/Gnzdk9
	hFmOc4ExVJpvOmD2jt1AwoUTh0xWuWT92A0REEkM
X-Received: by 2002:a05:6a00:aa07:b0:880:4b56:dc2c with SMTP id d2e1a72fcca58-8beb696f1f1mr1344865b3a.34.1794536982925;
        Thu, 12 Nov 2026 18:29:42 -0800 (PST)
Received: from fedora ([2601:600:cb86:7af0::c952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm335547b3a.10.2026.11.12.18.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:29:42 -0800 (PST)
From: Aiden Hecker <heckeraiden@gmail.com>
To: Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aiden Hecker <heckeraiden@gmail.com>
Subject: [PATCH v2 1/2] cpufreq: amd-pstate: Enable hybrid CPU capacity scaling on heterogeneous Zen CPUs
Date: Thu, 12 Nov 2026 18:29:33 -0800
Message-ID: <20261113022934.13397-2-heckeraiden@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113022934.13397-1-heckeraiden@gmail.com>
References: <20261113022934.13397-1-heckeraiden@gmail.com>
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

On heterogeneous AMD Zen 5 / Zen 5c processors (X86_FEATURE_AMD_HTR_CORES,
such as Ryzen AI 7 350 Family 1Ah Model 60h), physical Zen 5 cores
(5.09 GHz, CPPC highest_perf 196..208) and dense Zen 5c cores (3.51 GHz,
CPPC highest_perf 135) alternate inside a single shared 16 MiB L3 CCX.

Currently amd-pstate records prefcore_ranking and nominal_perf per CPU,
and disables amd_pstate_prefcore when amd_hfi is active, but neither
driver initializes x86 hybrid capacity scaling. As a result, all logical
CPUs remain at uniform capacity 1024 across the shared L3 domain.

Record per-CPU highest_perf and nominal_perf when X86_FEATURE_AMD_HTR_CORES
is present and program arch_enable_hybrid_capacity_scale(),
arch_set_cpu_capacity(), and topology_set_cpu_scale() once asymmetry is
observed across online CPUs. SMT siblings are explicitly synchronized to
the same capacity value so SD_SHARE_CPUCAPACITY never triggers asymmetric
SMT warnings, while rebuild_sched_domains() is deferred to a workqueue.

Developed with coding assistance from Antigravity (Google DeepMind).

Tested-by: Aiden Hecker <heckeraiden@gmail.com>
Signed-off-by: Aiden Hecker <heckeraiden@gmail.com>
---
 drivers/cpufreq/amd-pstate.c | 121 +++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 4bedfbfc1..3f4b6a2b0 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -36,9 +36,13 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/uaccess.h>
+#include <linux/cleanup.h>
+#include <linux/cpuset.h>
+#include <linux/mutex.h>
 #include <linux/power_supply.h>
 #include <linux/static_call.h>
 #include <linux/topology.h>
+#include <linux/workqueue.h>
 
 #include <acpi/processor.h>
 #include <acpi/cppc_acpi.h>
@@ -88,6 +92,23 @@ static int cppc_state = AMD_PSTATE_UNDEFINED;
 static bool amd_pstate_prefcore = true;
 static struct quirk_entry *quirks;
 
+struct amd_hybrid_cpu_cap {
+	u32 highest_perf;
+	u32 nominal_perf;
+};
+
+static DEFINE_PER_CPU(struct amd_hybrid_cpu_cap, amd_hybrid_caps);
+static DEFINE_MUTEX(amd_hybrid_cap_lock);
+static u32 amd_hybrid_max_perf;
+static bool amd_hybrid_cap_enabled;
+
+static void amd_hybrid_cap_workfn(struct work_struct *work)
+{
+	rebuild_sched_domains();
+}
+
+static DECLARE_WORK(amd_hybrid_cap_work, amd_hybrid_cap_workfn);
+
 /*
  * The numeric EPP value programmed for each named preference. First dimension
  * is CPU type (TOPO_CPU_TYPE_ANY for non-hybrid, TOPO_CPU_TYPE_PERFORMANCE/
@@ -969,6 +990,99 @@ static void amd_pstate_init_prefcore(struct amd_cpudata *cpudata)
 	sched_set_itmt_core_prio((int)READ_ONCE(cpudata->prefcore_ranking), cpudata->cpu);
 }
 
+static void amd_pstate_record_hybrid_cap(struct amd_cpudata *cpudata)
+{
+	struct amd_hybrid_cpu_cap *cap;
+	union perf_cached perf;
+	u32 highest_perf;
+
+	if (!cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES))
+		return;
+
+	perf = READ_ONCE(cpudata->perf);
+	highest_perf = READ_ONCE(cpudata->prefcore_ranking);
+	if (!highest_perf)
+		highest_perf = perf.highest_perf;
+
+	guard(mutex)(&amd_hybrid_cap_lock);
+	cap = per_cpu_ptr(&amd_hybrid_caps, cpudata->cpu);
+	cap->highest_perf = highest_perf;
+	cap->nominal_perf = perf.nominal_perf;
+}
+
+static void amd_pstate_sync_hybrid_capacity(void)
+{
+	u32 max_perf = 0, min_perf = U32_MAX;
+	bool updated = false;
+	int cpu;
+
+	if (!cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES))
+		return;
+
+	guard(mutex)(&amd_hybrid_cap_lock);
+
+	for_each_online_cpu(cpu) {
+		const struct cpumask *sib_mask = topology_sibling_cpumask(cpu);
+		u32 sib_max = 0;
+		int sib;
+
+		/*
+		 * SMT siblings share SD_SHARE_CPUCAPACITY and must expose identical
+		 * arch_scale_cpu_capacity() values to avoid scheduler warnings.
+		 */
+		for_each_cpu(sib, sib_mask) {
+			u32 p = per_cpu(amd_hybrid_caps, sib).highest_perf;
+
+			if (p > sib_max)
+				sib_max = p;
+		}
+		if (!sib_max)
+			continue;
+
+		for_each_cpu(sib, sib_mask)
+			per_cpu(amd_hybrid_caps, sib).highest_perf = sib_max;
+
+		if (sib_max > max_perf)
+			max_perf = sib_max;
+		if (sib_max < min_perf)
+			min_perf = sib_max;
+	}
+
+	if (!max_perf || min_perf >= max_perf)
+		return;
+
+	if (!amd_hybrid_cap_enabled) {
+		if (!arch_enable_hybrid_capacity_scale())
+			return;
+		amd_hybrid_cap_enabled = true;
+		updated = true;
+	}
+
+	if (max_perf != amd_hybrid_max_perf) {
+		amd_hybrid_max_perf = max_perf;
+		updated = true;
+	}
+
+	for_each_online_cpu(cpu) {
+		struct amd_hybrid_cpu_cap info = per_cpu(amd_hybrid_caps, cpu);
+		unsigned long prev_cap;
+
+		if (!info.highest_perf || !info.nominal_perf)
+			continue;
+
+		prev_cap = arch_scale_cpu_capacity(cpu);
+		arch_set_cpu_capacity(cpu, info.highest_perf, max_perf,
+				      info.highest_perf, info.nominal_perf);
+		topology_set_cpu_scale(cpu, arch_scale_cpu_capacity(cpu));
+
+		if (arch_scale_cpu_capacity(cpu) != prev_cap)
+			updated = true;
+	}
+
+	if (updated)
+		schedule_work(&amd_hybrid_cap_work);
+}
+
 static void amd_pstate_update_limits(struct cpufreq_policy *policy)
 {
 	struct amd_cpudata *cpudata;
@@ -1130,6 +1244,7 @@ static int amd_pstate_cpu_init(struct cpufreq_policy *policy)
 	if (ret)
 		goto free_cpudata1;
 
+	amd_pstate_record_hybrid_cap(cpudata);
 	amd_pstate_init_prefcore(cpudata);
 
 	ret = amd_pstate_init_freq(cpudata);
@@ -1769,11 +1884,14 @@ static int amd_pstate_register_driver(int mode)
 	if (amd_pstate_prefcore)
 		sched_set_itmt_support();
 
+	amd_pstate_sync_hybrid_capacity();
+
 	return 0;
 }
 
 static int amd_pstate_unregister_driver(int dummy)
 {
+	cancel_work_sync(&amd_hybrid_cap_work);
 	cpufreq_unregister_driver(current_pstate_driver);
 	amd_pstate_driver_cleanup();
 	return 0;
@@ -1985,6 +2103,7 @@ static int amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
 	if (ret)
 		goto free_cpudata1;
 
+	amd_pstate_record_hybrid_cap(cpudata);
 	amd_pstate_init_prefcore(cpudata);
 
 	ret = amd_pstate_init_freq(cpudata);
@@ -2149,6 +2268,8 @@ static int amd_pstate_cpu_online(struct cpufreq_policy *policy)
 		return ret;
 
 	cached_floor_perf = freq_to_perf(perf, cpudata->nominal_freq, cpudata->floor_freq);
+	amd_pstate_record_hybrid_cap(cpudata);
+	amd_pstate_sync_hybrid_capacity();
 	return amd_pstate_set_floor_perf(policy, cached_floor_perf);
 }
 
-- 
2.56.1

