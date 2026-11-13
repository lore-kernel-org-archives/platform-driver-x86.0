Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536986;
	b=U1XVgA6Zopiq31wajFHFcCxvrN+4xv2p3IrHTxpNPuxW7GEt+rxmCe7WSzyDadNDjHaN
	 EVLyGHgKAcKmxF6XbRyJtBLuVBhz+S2uqrgZWdJitIULYw3pg/NnEM9UnIiJmzzXhzuK7
	 Ibxvx97/8+seEzR3vBjvi+aPYKhT4CavDu0WxtKRvQaDoIdM3FfHnITOe+tgUUBy5Iho6
	 TwwGkw5d7w+YikQSRn0ExSjb3JqUIH4BC8e9OsxButbETWVQgXagDK+3BD11PPP0Y5+ma
	 W3P2gc2Dbv1aF5ssBzsV+BRkWKMfQmnzXEE4TdY2SiKHbyEWI33z4BP+QcfWIGF4pzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7I35fCoKkVfk5KSv8b+fmiXqz9ZRpBgphgxQccwd6TU=;
	b=XGpVB9GMYfhbc5shHGyC79wgIfAX9+KAhb69xfny5+2Huwj5nn6ZgwHZqE555EEjYOcq
	 QQqDHpLkHdeEvciivc3iWjYuy2uD9CzH3v51fntS7ilXMFovDP26kzc6gQYWLN7Jst8yF
	 dcVWQ13+QrWugnGyyfxcve8iZxazhQ999Y095vmGDBXMhAWAep3rHEIP3B9CcyI5//gH6
	 D5zP8yVovDx4SzHn97L0kKUcrEvqmVzR9WaCXqrzW3usTTRoALEfAj8iI5Ruf96Ir1K/P
	 Rf/8naLmSyyDNG/MeTgsMbMjvQjPciq1jFwoLWwVi/oy0J22sYwowPy4EF3ksbMnC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEe0gk9r;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637AD606A89D
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 02:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637AD606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEe0gk9r
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a07078200fso167103b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 18:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536985; x=1795141785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7I35fCoKkVfk5KSv8b+fmiXqz9ZRpBgphgxQccwd6TU=;
        b=BEe0gk9rJJ/sCix7PNHn8gpFi2QFKUvMayh5qS4PioR+eiEtn4ZoOu9CULd/95dokj
         Wlf80o950cLiMHjUwJk5Dwjuh1ggHVwObo2kRFNXwKEzyck5lOJzCezS2W6SL2L0BsAa
         MaHeaPYM6LTYVPuVUECBkKc7XG8BjHKOBoCg5ETRKE6708q/37g+TxQzOO6wzEGl65jR
         hr5NoFh56rtHi7K6MG+rCVuQiXBFG8xY9E+kyOnTAw0k5nE8BzFSqRceUoz3Kb7SUn8t
         kf4X9jPVoikGWft+7yggmKMmkBOt9Ukg1iVw5PT5dYZ62dktmDOY2jxf0+UvtzM44t8g
         zbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536985; x=1795141785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7I35fCoKkVfk5KSv8b+fmiXqz9ZRpBgphgxQccwd6TU=;
        b=M0DTlaIQ76pJys3YCJVBZkXsq9wRL+fXS4lPW7wJhczgkcqjjf+1Ge3XWio2y+Niae
         +7ZjeZQiqrCixLOdeWLXEhUlyjJWgG+azzY4X5eOewYCPzHaVEbd3UONcCIDdMeV0QMy
         bJ3StZIMil9mGX9gZRnhm6iboleKGOxiRnnD7uaNKky1tPBnE1+QADnnmc3pCHO2TF86
         tjSSXlnBruIKdoyHN+x+ZOCZRSb9gufDXrCzpstfFFVVaL7KyyFTcv6CApdM7ezBh+zn
         QJ2NrTPPhcQOvsT3SPG/POeAio3BIFDI0wfG50rbGIWjIez/bI/9WJXBClLW5HT4gxzS
         RceA==
X-Forwarded-Encrypted: i=1; AL+hErF/sPb7wrIQGkpCYIov4TEjO+TyV8CREJ2H78dC457C3nSnfllcAn9gkpvGh+nxAaznzI3TbHWTQs7t1KqtgCoaWwlm@vger.kernel.org
X-Gm-Message-State: APuU4Z+mgUraSd6s10XDg5Xs20qgqMZWPwPaLW0qazphotKQPuGQUu79
	GnWEMgb02HwW4VGF8SDy00YRyYEaDO6QD0QLnrhPHTNUImD6XEV7bxSU
X-Gm-Gg: AYBFou3YyPzGy6TCJ6wBejQ5MOXx+H4iCug7Ktx0nhtcQLG/iW2JiAqh8QmWgP4UgZD
	HhBykUsq0kXsridYrRlVF73ulaqW62Ht5nw1hhgtV6bra35QltCqtS/aOJAYQkcoNhJ2tFAJ2LE
	1R+SUvfTl1nkmOYOv+2TbItlUmMsmv5KoqpegVKhZ+p0CqBQ0Jpw0got+N0kZTwoCBrUntbqrJ7
	0FIUrXMjAT8q89n+LNWGz3zHGkTa4o707E80MrMJKNaEcBWstgEJ27aujTJM+yptDTVdHoSnY7g
	FMUu75ukcg6gsqIqShVo82IHMpvKuz+DoCptcGEgcjJ8CyRxujMxMXRlVZa4WBBOTpOekXfgBmC
	EiiC1Zd2a/8IlxyilmEmguKSaLsXb36/StKGFhBTEpdjlQDq8DMzQqOqxLW95ok+y/8UgoJukWf
	gxZurhZuJwEcNUCduBZ/XrFYls/+GFiF9I4xkNtEpbRvcoBFI+UTWME6bk5BXw+35GFSQGpqaPN
	yofd4kkKyNWG+GXnzsOSDVEnCAtns7PVNVmoWEcgW3SDhFvFn/JvGhm0a6qmjKryB1qA6YmqbzP
	jx4xVD9McS2va/W7KZzdFju4X6D0GkpDIxrNgUEj
X-Received: by 2002:a05:6a21:6444:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f7a9bfa3c6mr670282637.61.1794536985497;
        Thu, 12 Nov 2026 18:29:45 -0800 (PST)
Received: from fedora ([2601:600:cb86:7af0::c952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm335547b3a.10.2026.11.12.18.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:29:45 -0800 (PST)
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
Subject: [PATCH v2 2/2] platform/x86/amd/hfi: Rank SMT siblings below primary cores for ITMT packing
Date: Thu, 12 Nov 2026 18:29:34 -0800
Message-ID: <20261113022934.13397-3-heckeraiden@gmail.com>
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

On heterogeneous AMD processors (X86_FEATURE_AMD_HTR_CORES) with 2-way
SMT enabled on both Zen 5 and Zen 5c cores, amd_set_hfi_ipcc_score()
assigns identical ITMT priorities to primary threads and their SMT
siblings.

Scale secondary SMT sibling ITMT priorities slightly below their primary
thread sibling (7/8 of the primary IPCC score) using
topology_sibling_cpumask(). This preserves the SMT > dense-core advantage
of classic Zen 5 SMT siblings ahead of Zen 5c cores while guiding
SD_ASYM_PACKING to prefer idle physical cores first.

Developed with coding assistance from Antigravity (Google DeepMind).

Tested-by: Aiden Hecker <heckeraiden@gmail.com>
Signed-off-by: Aiden Hecker <heckeraiden@gmail.com>
---
 drivers/platform/x86/amd/hfi/hfi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index 86a7f4332..d7e35a2bf 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -12,6 +12,7 @@
 
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
@@ -261,11 +262,26 @@ static void amd_hfi_remove(struct platform_device *pdev)
 
 static int amd_set_hfi_ipcc_score(struct amd_hfi_cpuinfo *hfi_cpuinfo, int cpu)
 {
+	const struct cpumask *sib_mask;
+	int prio;
+
 	for (int i = 0; i < hfi_cpuinfo->nr_class; i++)
 		WRITE_ONCE(hfi_cpuinfo->ipcc_scores[i],
 			   hfi_cpuinfo->amd_hfi_classes[i].perf);
 
-	sched_set_itmt_core_prio(hfi_cpuinfo->ipcc_scores[0], cpu);
+	/*
+	 * Rank secondary SMT siblings slightly below primary threads so
+	 * SD_ASYM_PACKING fills idle physical cores first while still keeping
+	 * classic Zen 5 SMT siblings ordered ahead of dense Zen 5c cores.
+	 */
+	prio = hfi_cpuinfo->ipcc_scores[0];
+	if (cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES)) {
+		sib_mask = topology_sibling_cpumask(cpu);
+		if (!cpumask_empty(sib_mask) && cpumask_first(sib_mask) != cpu)
+			prio = (prio * 7) / 8;
+	}
+
+	sched_set_itmt_core_prio(prio, cpu);
 
 	return 0;
 }
-- 
2.56.1

