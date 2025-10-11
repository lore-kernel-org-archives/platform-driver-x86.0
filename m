Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9922259B
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Oct 2025 06:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760164744; cv=none; b=WpH3ZFFF5GctG8mx/lTedSbNZO9I/j9gfK8RCRf2UrcK8e8BV7q6dYkDo14EyNXZwi1aTOAkhoys32486FytaDOCl85r/SrW5YHuE2jlMtmtY6qNQ6M+cVcuJ67v/OkQDVc4cfN9yhKJGC/zR6J10M/jK7TsYLwPKsc8Ubs18BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760164744; c=relaxed/simple;
	bh=g+jmgjmrR4/YskSIPfMmE2GQi0643yZ1iVOqd15YojA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S023yO1hzyZHMAvG6ONNL1ovEiwFbYzouf7jkwTDXjjoJsHesDbXPgdvweRrOmhUl3Vev7LeuRygS3ShSHoK0dGEKE18QYFsjhLJkyBGa9Fch0NtdjTE536QZjTrJ0JQ4qHs1u7sljNoFIpxwQ9xYJ+q2zbNhm/s5UKJ8Bb5Nxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft0tDwcy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft0tDwcy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2681660d604so32119825ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Oct 2025 23:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760164742; x=1760769542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shA8rePJ19wVlfjQPju/k0dhMI8bALDCoGiOWjrRyo0=;
        b=Ft0tDwcyQEFH5MP3p/bwbjW6tCR2ChKkxtiqgcrCNot+RrY8fgSo6C+KCDqCZESjqO
         Ac8a52rhgZRO+6XU99CsHEZhHZcE/d4LZQJ7nY5BY1rmjGMqmsD0WCxaSVrR588eyB7i
         ildADbIdRZU+23aonjY8nVRsksH3kglvBB46bbZd3tJFBIjH6GRfM2bqiRgBaVmk9TXW
         v3jHNgnJb1QNK4FMFrt8Fa8Vh+24zZPShbxpr/uesRxm9CMPLbod1BN5gkqIYeMRosjO
         sZqyaxWAq1Fzbp8LxHeUjdqyLcIGw07ZfWQeQ+qJNMKi/44ddsjV/Vcrbg4CLY+92n+7
         qV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760164742; x=1760769542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shA8rePJ19wVlfjQPju/k0dhMI8bALDCoGiOWjrRyo0=;
        b=hwLYUMX9A28fjsvDGmVobIP67XL3LzHEewRJ/XAH1qNSraN36RjCs7o1VjpFI7EGo+
         VN/iy1pau5te3vK7uVcR7t1qPbfuU7677l/Z+OXoUPSHi2ooOhlIiUsCPii+Zt+H9+Kz
         U9podkk2LU2s0SLuREXzgf/nwV7AyzWN9O3diqY8Gg16KjN7B9Ha+yX5KYIz1+Cx32No
         +qxTZyH1iFypZw3t+q1oy6+wobxfnN1g/+xIGFm3zl49Xac94Pi5O49OZ9TVL0y2U9nN
         QacXxtWBufdysfinehuC/hUdoy/527AlQM4ssOsQQgnWtnj/eDZ551kb6VOvWI762NxS
         0PHg==
X-Forwarded-Encrypted: i=1; AJvYcCXmG8hh5YSKYqBbxVSEECRBGom6DRuThtOnF8pgYhjM0iLDwD09Tc8ZY2jwdKPNp5iKdX3vtjiA3kLKISksl/S6X6Sb@vger.kernel.org
X-Gm-Message-State: AOJu0YyDW0p+IWronpaV8tXb2NOm07JgrxdOTLBGDuPqxX5/proc/mhX
	wWPMwT+nPYTFVH5MLkbLwI6zkbQykVfk2z2bnkdT3ZdawjLO5sY+ib34
X-Gm-Gg: ASbGncueOFAVnoS83wvL4/vwNZXeLGXvFTkGzkYON3Y/hsO92ELGzxGwFMA2v4akY61
	wBfUL2CD1Lk22EkCPF/AXYXKrfJTO1vnhF2GTVHgD0OGEpNBXeVoeT3cEHq/K/IGe0tKDlQbxro
	m+lM+X7Wjn19cR5YzFYXqQ3I/ge20Ef2B394JgfGKxy7EGCdYk9ta8lVNx3wr1eYIc2VrlNVbxN
	xkBk+sA52oeidLxlwJlUGj8Y1qOaCqA9jKUpWBfoY/aLEeZljokf8xgH5fTAPgK6lQiCN0++LhP
	xSuAulOEraX0PACQxwmgdquibmbqDoATZf+OngYemkh6eicufLVVU0uRwmOo4kCm931n7USzbHb
	hY7KgfOORhSKSZ+9hr2caDZBHFQX1n1C/fJWjQz5NfU21L223/2CK0oXMWWKZW/flmpbRi7K31b
	nMENSB8w==
X-Google-Smtp-Source: AGHT+IG/jpwa1wPZmeP/lKNRuLiyl56EQ08bY9BGkYBnOH/Qya4CL3BuCNt+6P0B7CVbFnypfO2IcA==
X-Received: by 2002:a17:902:fc4f:b0:280:fe18:8479 with SMTP id d9443c01a7336-290272e0ac5mr167833545ad.51.1760164741832;
        Fri, 10 Oct 2025 23:39:01 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f362efsm75647005ad.89.2025.10.10.23.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 23:39:01 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: mario.limonciello@amd.com
Cc: perry.yuan@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jserv@ccns.ncku.edu.tw,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/2] platform/x86/amd: hfi: Remove unused cpumask from cpuinfo struct
Date: Sat, 11 Oct 2025 14:38:36 +0800
Message-Id: <20251011063837.2318535-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251011063837.2318535-1-visitorckw@gmail.com>
References: <20251011063837.2318535-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpus field within the struct amd_hfi_cpuinfo was allocated and set
in the amd_hfi_online() CPU hotplug callback, and subsequently freed in
the amd_hfi_offline() callback.

However, after being initialized, this cpumask was never read or used
for any purpose within the driver. It represents dead code that serves
no functional role.

This change has no impact on the driver's functionality as the removed
code was entirely superfluous.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only.

 drivers/platform/x86/amd/hfi/hfi.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index a465ac6f607e..5d5d2cf23a75 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -12,7 +12,6 @@
 
 #include <linux/acpi.h>
 #include <linux/cpu.h>
-#include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
@@ -95,7 +94,6 @@ struct amd_hfi_classes {
  * struct amd_hfi_cpuinfo - HFI workload class info per CPU
  * @cpu:		CPU index
  * @apic_id:		APIC id of the current CPU
- * @cpus:		mask of CPUs associated with amd_hfi_cpuinfo
  * @class_index:	workload class ID index
  * @nr_class:		max number of workload class supported
  * @ipcc_scores:	ipcc scores for each class
@@ -106,7 +104,6 @@ struct amd_hfi_classes {
 struct amd_hfi_cpuinfo {
 	int		cpu;
 	u32		apic_id;
-	cpumask_var_t	cpus;
 	s16		class_index;
 	u8		nr_class;
 	int		*ipcc_scores;
@@ -295,11 +292,6 @@ static int amd_hfi_online(unsigned int cpu)
 
 	guard(mutex)(&hfi_cpuinfo_lock);
 
-	if (!zalloc_cpumask_var(&hfi_info->cpus, GFP_KERNEL))
-		return -ENOMEM;
-
-	cpumask_set_cpu(cpu, hfi_info->cpus);
-
 	ret = amd_hfi_set_state(cpu, true);
 	if (ret)
 		pr_err("WCT enable failed for CPU %u\n", cpu);
@@ -329,8 +321,6 @@ static int amd_hfi_offline(unsigned int cpu)
 	if (ret)
 		pr_err("WCT disable failed for CPU %u\n", cpu);
 
-	free_cpumask_var(hfi_info->cpus);
-
 	return ret;
 }
 
-- 
2.34.1

