Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=180.76.5.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666587;
	b=bPGZ+YkpPHX+ikaxxl07gXa1jQRyc/mV5xkKi120JTNh1Jm+8Ew6o7mJ8zpvyaO5xQ5t
	 v78f4Tp598W4SOU8OZBnhxCgos8kYmg7kSR5o2I63rIHdBXq9aJjsLL0Jb/tFSXGWheW2
	 MmdcrY8cdIgQMY/d5JhbbiTkovzSGT5LALFWghk/5wj/9avAO2PAJ4lCrcg+qTsZ4R1cr
	 /YB425n/Zv4d2YnUPhW/6pZ/3pRJsn3iu2UDR0+zXkl5sQDSr7JC5HjfeesmOFoetW3Ew
	 xnR47KUe+Q46faARwlkWCoq/fubEmCwMUmlAswGBfhCPG+5enh2DoZmfhFvRrA2Vp+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666587;
	h=DMARC-Filter:X-MD-Sfrom:X-MD-SrcIP:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 DKIM-Signature;
	bh=JYNVOy/GqvW8kE8fjjHBdlZDsLmr0/eu9Y1WunOrsDw=;
	b=u8Dc4apGGnlJNiNYt4yd+7bteOBqcLUfIbJK2o8s30GzyjeLVr+cXhtVw8hQfuNm1/yg
	 sq3xvcdm4/Q8YdqpVifN77OYW/rajFhZeYTtyHfKLICGcLx1iWv/OF7imBZ1+ghPkFUkg
	 lCBasCVaHH/fPqm0BarGYkvyxQ9ZuNaOjb283hjNbIHJiUwtI5Nd2elf2zf0D5Zien+xJ
	 Xbag2wslTJ7ySRoUU8Jhqip9Fv/Z0vs0VFNsMuddEfL5chpxYQnCouOAVyMm+wkJO3rA+
	 yVuX4zyqhULcqz31HnUIqdrzb7fZHjcu6TKhrM3YeJ7/7+dLPg898TJu3/XKrZEWHPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baidu.com;
	spf=pass smtp.mailfrom=baidu.com;
	dkim=pass header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=oG0T5IyQ;
	arc=none smtp.remote-ip=180.76.5.236
Received: from outbound.baidu.com (outbound.baidu.com [180.76.5.236])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AB965606A329;
	Sat, 14 Nov 2026 14:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB965606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=oG0T5IyQ
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Kristen Carlson Accardi
	<kristen.c.accardi@intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Li RongQing <lirongqing@baidu.com>,
	Tero Kristo <tero.kristo@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] platform/x86/intel/tpmi: Clean up CPU mappings on offline
Date: Sat, 14 Nov 2026 22:29:14 +0800
Message-ID: <20261114142914.2595-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc4.internal.baidu.com (172.31.50.48) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1794666582;
	bh=JYNVOy/GqvW8kE8fjjHBdlZDsLmr0/eu9Y1WunOrsDw=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=oG0T5IyQyBn5zQIO2DZDonJ911X2e09wFkibKpuRKn19WyXZg5SB93SYSCrwpIYtT
	 sDdERH3M+Ij8xOSl0fXag9Pg5eFEzdnwumuFFAF6mk01SS5AX8utdxAB7LDIHWXjWY
	 eqVjGka26yL78l/MLYloo0tOK2aenzdAGfiB9VcvTLSvtPZj+MGZ/O3b0CUTT+ySK2
	 S3mSm6iCh1qK5rdUsInI+00J9g64S3xK2QHf7LTyiN5mltdU6AjxLy6xE3i+9CkuXJ
	 Fn3+q6chupL4ovkbZBC6xNbgneRt+gRJurxvKSBUTHgrahfoBLeg/tbQ54OV1wJQYH
	 EvjrlmCLmr0Ew==

From: Li RongQing <lirongqing@baidu.com>

The driver adds each online CPU to tpmi_cpu_hash and to its power domain
mask. Neither entry is removed when the CPU goes offline, so the next
online transition calls hash_add() on an hlist node that is still
linked, corrupting the hash list.

Register an offline callback that removes the hash entry and clears the
CPU from its power domain mask.

The TPMI feature does not depend on CPU online/offline and can update the
MMIO area while a CPU is offline. There is currently no consumer that
reads the mapping data of an offlined CPU; if such a use case appears,
retaining the offline mapping can be added on top.

Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU mapping")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Changes in v2:

- Add Acked-by from Srinivas Pandruvada
- Rename the title
- Add a new line after guard()

 drivers/platform/x86/intel/tpmi_power_domains.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index ebe052c..457abac 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -220,6 +220,24 @@ static int tpmi_cpu_online(unsigned int cpu)
 	return 0;
 }
 
+static int tpmi_cpu_offline(unsigned int cpu)
+{
+	struct tpmi_cpu_info *info = &per_cpu(tpmi_cpu_info, cpu);
+	int index;
+
+	if (hlist_unhashed(&info->hnode) || !tpmi_domain_is_valid(info))
+		return 0;
+
+	index = info->pkg_id * MAX_POWER_DOMAINS + info->punit_domain_id;
+
+	guard(mutex)(&tpmi_lock);
+
+	cpumask_clear_cpu(cpu, &tpmi_power_domain_mask[index]);
+	hash_del(&info->hnode);
+
+	return 0;
+}
+
 static int __init tpmi_init(void)
 {
 	const struct x86_cpu_id *id;
@@ -249,7 +267,7 @@ static int __init tpmi_init(void)
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/tpmi_power_domains:online",
-				tpmi_cpu_online, NULL);
+				tpmi_cpu_online, tpmi_cpu_offline);
 	if (ret < 0)
 		goto free_domain_map;
 
-- 
2.9.4

