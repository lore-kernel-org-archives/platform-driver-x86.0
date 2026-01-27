Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1219288C25;
	Tue, 27 Jan 2026 23:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557601; cv=none; b=m2dx/9AXoXUv+ZkRew4VMkKAmG5iKcCb0d3XZfK745PvdZ0nf1GqxeejFpa4tcmQxC+FbSMTv3adbGl1U1HPqVriLjwb40KosU4UI5GEKxI23XzFuLOOiynpKuRQwJL/k3qvRGKyS24NcFWREvl4I5b6lf/OFLoDdfaj7meAB48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557601; c=relaxed/simple;
	bh=5zvyV+Kaxt9fzZE1NBk4skQPAIrdRmlJtp+n7bRQo3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oAEus34ITk4PyLIcwWJY1kbEPHHyfZeTk+7z+24+iZx9nHwWi9vbFCWobjkFvBYnL1+GsLWoI+a+pFVNOfzwOeUP0zHoUEat84pbLuMqRYXCuVhGdZtVtlc0dIIEvk1mqWdNSBsbB+puQyVp9S760h5P4bM/Ql/ACIg0uAoR2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT1ETxaA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT1ETxaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769557599; x=1801093599;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=5zvyV+Kaxt9fzZE1NBk4skQPAIrdRmlJtp+n7bRQo3A=;
  b=BT1ETxaALzFIcRzY0bu2RAqcmxfEodjVTH7AWOMCrRn1XkG7X455rFyM
   oWrG/KZFmDSrkvOEc3pDK+/XEfOnN/t2Hda/F2P6nk42JIPxHVm4kFtr5
   UuTkqL6CauV9Mtu5IP5jhRWVZBJ4vypkA95IYCD8LNvVjx4PhLvc0XeV4
   /ecRdiH94zPCeVAU3eZp5s1wsEQC9jnmW+/k7yBsPzF2QVtSEOt+1hp1h
   Mp+SGWL0udfxlzbTmURdWRI/VHTIQDK6FT+85PPtdwTHp+UlAwEjgqlvQ
   un5b3tP/3kpeuJl/8eDUtaZAo+sVmkkxITtpCMCLGtl08vnJi8Jv5Flzm
   A==;
X-CSE-ConnectionGUID: 3A4hWwf1S4ONiEGk35M+gQ==
X-CSE-MsgGUID: S09vRlpjTiuya+M9ojBXrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74626641"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="74626641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 15:46:39 -0800
X-CSE-ConnectionGUID: c2V8gUyPR4ydUrNCQykS7Q==
X-CSE-MsgGUID: tRQhFvwST+SxRurlCEm+Fw==
X-ExtLoop1: 1
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 15:46:39 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Tue, 27 Jan 2026 15:45:40 -0800
Subject: [PATCH] platform/x86/intel/tpmi/plr: Make the file
 domain<n>/status writeable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-plr-debugfs-write-v1-1-1fffbc370b1e@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIACNOeWkC/x3MSQqAMAxA0auUrA3UKIpeRVw4pBoQLakTiHe3u
 HyL/x8IrMIBavOA8ilBtjUiTQwMc7dOjDJGA1kqbEol+kVx5P6YXMBLZWe0Li9tRX3WOYLYeWU
 n9/9s2vf9ADKd/PBjAAAA
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769557550; l=1400;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=5zvyV+Kaxt9fzZE1NBk4skQPAIrdRmlJtp+n7bRQo3A=;
 b=9AQZzapVwnx+alVJr+saMKSIoOgeCxwOhbwZDzwuOBIU8JiCmKPcWA14Gi9WKCSyzaiAg9dYf
 kOu6I66FZ11ClMorHp9W1PQmo5PkUXM7PU03JnL98lNBHX/5CdbkJCW
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

The file sys/kernel/debug/tpmi-<n>/plr/domain<n>/status has store and show
callbacks. Make it writeable.

Fixes: 811f67c51636d ("platform/x86/intel/tpmi: Add new auxiliary driver for performance limits")
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
I tested this patch in Sierra Forest and Granite Rapids-D systems.

$ echo 0 > /sys/kernel/debug/tpmi-<n>/plr/domain<m>/status
$ cat /sys/kernel/debug/tpmi-<n>/plr/domain<m>/status
cpus none
cpu0 none
cpu1 none
...
---
 drivers/platform/x86/intel/plr_tpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/plr_tpmi.c b/drivers/platform/x86/intel/plr_tpmi.c
index 58132da47745..05727169f49c 100644
--- a/drivers/platform/x86/intel/plr_tpmi.c
+++ b/drivers/platform/x86/intel/plr_tpmi.c
@@ -316,7 +316,7 @@ static int intel_plr_probe(struct auxiliary_device *auxdev, const struct auxilia
 		snprintf(name, sizeof(name), "domain%d", i);
 
 		dentry = debugfs_create_dir(name, plr->dbgfs_dir);
-		debugfs_create_file("status", 0444, dentry, &plr->die_info[i],
+		debugfs_create_file("status", 0644, dentry, &plr->die_info[i],
 				    &plr_status_fops);
 	}
 

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260127-plr-debugfs-write-0f47092b3af2

Best regards,
-- 
Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

