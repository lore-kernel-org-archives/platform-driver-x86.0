Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=180.76.5.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762863;
	b=InB+t0m/WWsQobU3LTvqLnmfbmzb6y8zvfFxPui8FUuP0xLiTN/gOew0ZN/wabnmvQjo
	 ak0XwlMRA4X72SQEgqdcqsWFcLTK+5xmhwhzBB0iFGdUoo0AYm3w8fcRL8L0I2+Pe3s79
	 xGl1yHtEgfZURKvZhKvrPago/c/ZPZyA0Rw2XmyGYUL61EOGFLsgcRJIKwVJWdQRTapzw
	 pavYAAUVsILwCcC3tQWC6x0M18LGaQk+di+Tf2Xa/sfjZU/wnB47VBpdOJbbZLWlF/s8P
	 e1Kz+IjtNvFL6DocL+/YrWBBCEhxpusrljZk6kwAJByo+qmX8rrKo2r4yDohEq9X9kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762863;
	h=DMARC-Filter:X-MD-Sfrom:X-MD-SrcIP:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 DKIM-Signature;
	bh=viVVzkC8NSMYgoB03HU//cwy7wO7RE7Q9NlLJUdPBOA=;
	b=LAqzd8MtYizYyM76qYhtRQkT2oY+vB9jIM/bD2UwmyoKqNIHjSRWTpD9+cYpi2DkTAk9
	 OQn+dBDbCQp4t7lBpyJejPd8u7Zv4D8jgPX+dDLBhswunofY+pdMA5oFcuTpGQxy0LN6J
	 Or+FEbfOpMwLZ7Fy7cc1wHrWRB8IACMj1kdLKX10pqq6+CwaR0vUxlBUwU1h9kB9uu7+f
	 3+LoQC4DTHL1rz6sAgkPyqn7jn71RMskD5bN7h2zTa8szk7yO76IKf5nvDQXGeowTgUMD
	 c7jOR7lX+a+6rcYra5Vmm9YxOOLw1xouDP75aBUPSr8S2JQYriBoM9GUpvXsd7YyhbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baidu.com;
	spf=pass smtp.mailfrom=baidu.com;
	dkim=pass header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=i4Ia7dJG;
	arc=none smtp.remote-ip=180.76.5.236
Received: from outbound.baidu.com (outbound.baidu.com [180.76.5.236])
	by smtp.subspace.kernel.org (Postfix) with SMTP id DA851606A33E
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 03:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA851606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=i4Ia7dJG
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Kristen Carlson Accardi
	<kristen.c.accardi@intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Li RongQing <lirongqing@baidu.com>,
	Tero Kristo <tero.kristo@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: TPMI: clean up CPU mappings on offline
Date: Wed, 4 Nov 2026 11:27:24 +0800
Message-ID: <20261104032724.1824-1-lirongqing@baidu.com>
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
X-ClientProxiedBy: bjhj-exc11.internal.baidu.com (172.31.3.21) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1793762853;
	bh=viVVzkC8NSMYgoB03HU//cwy7wO7RE7Q9NlLJUdPBOA=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=i4Ia7dJGdyObaBZrmGDWdQY6yTrehawen1YMaxQp3u2VbAKYb4JXNGcirrXfYPlw2
	 d5eutYVxtULFDgCKyPxlZ9ca1IgVkKBno9/GfJ4DjQleOXQEKmovn1rLF6Kvyg/9zs
	 av+109Og+O+8trMy64hY6pbpdPgBDnmnzBSDv7+qjbgOEcrvHrT57VkiFgjaqodNhQ
	 FsPamxsfz/tMqfiGYmG+nLAtfNsYqgLLsfKr3q2h5h3eES9x1PHTma77FBTt6bII+6
	 NneGQH+ZUz09X6Gm1RvCnmZatOteaklCvKp+rOoCTHf3MjktdNXD48PtGRssNR3BNM
	 D01mXj8KgrM7g==

From: Li RongQing <lirongqing@baidu.com>

The TPMI power domain driver adds each online CPU to a hash table and
its power domain mask, but does not remove either entry when the CPU
goes offline. Bringing a CPU back online can therefore insert the same
hlist node again and leave stale CPU mask state.

Register an offline callback that removes the hash entry and clears the
CPU from its power domain mask.

Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU mapping")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 drivers/platform/x86/intel/tpmi_power_domains.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index d89b989..c3fd1bd 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -220,6 +220,23 @@ static int tpmi_cpu_online(unsigned int cpu)
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
+	cpumask_clear_cpu(cpu, &tpmi_power_domain_mask[index]);
+	hash_del(&info->hnode);
+
+	return 0;
+}
+
 static int __init tpmi_init(void)
 {
 	const struct x86_cpu_id *id;
@@ -249,7 +266,7 @@ static int __init tpmi_init(void)
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/tpmi_power_domains:online",
-				tpmi_cpu_online, NULL);
+				tpmi_cpu_online, tpmi_cpu_offline);
 	if (ret < 0)
 		goto free_domain_map;
 
-- 
2.9.4

