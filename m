Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3862E03FD
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Nov 2025 18:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146426; cv=none; b=t1fpL0Ov9dGbvUuEDkmAYrJqihrMO/FNdED8R+jRfS0bEHr0ob1PRBiXkAjhXls1NpgUg7e8yVq7DTnPcxYcIzCko6H9oBBKnFWAMU9jr+qrNF9/V01OjemJJA4Gjv+DKTJ4O8/zju8YQqZa79xnd6bfVxZlXqmOXJW9D6i1StQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146426; c=relaxed/simple;
	bh=Z1KI1c9HE6KmH41eHNkiwd0JeitvaLgIx/2SEZ1HDBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QdDxrZJd9H+AjhdujMOr5GK0kPWg6jXLzWeJkGDDC50p8dS5UB35VaX+qY5qgjSY/6RDILzpDLLWDst46vWsiDKfPcLD/LSzCXja5D4pfh6kAtER6AVONHWX3y1DAth7RCdCWPnrD63UX3O+q7oXx0k/Y48mK1sxbAzqzYM1HxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ex8IEGWx; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ex8IEGWx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763146422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F7X+TXzz6yIsYy6VK9GhVIkXx5eCXlbgBNwS3nhB3Rc=;
	b=ex8IEGWx/W7K4QbrrN/Dehv1WtYeXbdjKnIndNigKeo851KgPzGhxFZjY6PpuB/z0/J5I7
	YVLRY2dMA/iBVXiByrZyu0RId12PLwB+xoyCJMPmuAA5aw/UmKmIJHOSlKVzXuAtA+h/9M
	3+d0Hsaszbfop0VwHPheV/wlY7H5ZEo=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: do not abort probe on unexpected CPU cores count
Date: Fri, 14 Nov 2025 19:53:37 +0100
Message-ID: <20251114185337.578959-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Until now the CPU cores count was only available for
Intel hardware, however a few weeks ago an AMD hardware
that provides aforementioned interface appeared on the
market and data read from the interface doesn't
follow the expected format and the driver fails to probe.

Avoid failing on invalid cores count and print out debug information.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 34 ++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 9f67218ecd14..6355ec3e253f 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -818,10 +818,23 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
 	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
 	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
 
+	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
+		pr_err("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
+		       cores_p->min_perf_cores,
+		       cores_p->max_perf_cores,
+		       cores_p->cur_perf_cores
+		);
+		return ERR_PTR(-EINVAL);
+	}
+
 	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
 	    (cores_p->min_power_cores > cores_p->max_power_cores)
 	) {
-		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
+		pr_err("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
+		       cores_p->min_power_cores,
+		       cores_p->max_power_cores,
+		       cores_p->cur_power_cores
+		);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -841,6 +854,11 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
 {
 	u32 cpu_core_value;
 
+	if (asus_armoury.cpu_cores == NULL) {
+		pr_err("CPU core control interface was not initialized.\n");
+		return -ENODEV;
+	}
+
 	switch (core_value) {
 	case CPU_CORE_DEFAULT:
 	case CPU_CORE_MAX:
@@ -875,6 +893,11 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
 	if (result)
 		return result;
 
+	if (asus_armoury.cpu_cores == NULL) {
+		pr_err("CPU core control interface was not initialized.\n");
+		return -ENODEV;
+	}
+
 	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
 		if (!asus_armoury.cpu_cores_changeable) {
 			pr_warn("CPU core count change not allowed until reboot\n");
@@ -1389,16 +1412,17 @@ static int __init asus_fw_init(void)
 		return -ENODEV;
 
 	asus_armoury.cpu_cores_changeable = false;
+	asus_armoury.cpu_cores = NULL;
 	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
 		cpu_cores_ctrl = init_cpu_cores_ctrl();
 		if (IS_ERR(cpu_cores_ctrl)) {
 			err = PTR_ERR(cpu_cores_ctrl);
 			pr_err("Could not initialise CPU core control: %d\n", err);
-			return err;
+		} else {
+			pr_debug("CPU cores control available.\n");
+			asus_armoury.cpu_cores = cpu_cores_ctrl;
+			asus_armoury.cpu_cores_changeable = true;
 		}
-
-		asus_armoury.cpu_cores = cpu_cores_ctrl;
-		asus_armoury.cpu_cores_changeable = true;
 	}
 
 	init_rog_tunables();
-- 
2.51.2

