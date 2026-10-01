Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBDD3FE359;
	Thu,  1 Oct 2026 22:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892248; cv=none; b=XwSJoYigjpo3YHddpccFrkTR8aCl+T4gHgLAZ4WgNDqP0aXt+B1fj8OlMyo2K6k6Bcxv2zEqi4Iyc8pDmkRlJBcq8p7yxbF38gm3WgTRDOOmapsACdFcc9pDA4FEwlvrBYwHjE7yAjp1VJz6cSLeRh2Q7QQN8JRDgPL/0JetC74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892248; c=relaxed/simple;
	bh=CMaYmjvXutgM8mqzQofYQp/0qRYlf5oKXmw6GOHm0/M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUq1pd4Nj2NxF2/PbjInuTWIF73Z2BGnY4vogX+iDy79RClNLWWqiIpcr6w9Ar3tI0B220sOy/K8CD1Yypfsaby6Y2kbY5dCwbkEUbA8Zji5CADe0z/DEDoW5RtcUDG3+sBzbNIDeMkPouC+Ew2xlHDUTjf2wmFvkTvFBq/5tIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5QnDSVl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5QnDSVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790892247; x=1822428247;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CMaYmjvXutgM8mqzQofYQp/0qRYlf5oKXmw6GOHm0/M=;
  b=n5QnDSVlxzV89J4QZ+fwnNmLD+nTXc2VlUhu71HCW6+NM42J6qmDZce/
   3yly2kyK2jsQd7Fq18hxgPYlsMmiPWzRH8YDLNo0HH00cPWRCTXBEdviz
   bw6adNY2/JBtYU+0g+D0nkW4SxKOkicEZdeSmHmGpv2tVK+XEVRfYvAJ/
   ubXw7r2Ll8WuhYxXLPhxUr56z3hC1Qd7krgKJ5jgtzkFco162XuwiDRCw
   wlDICaRhB/jceTMHECPg0pHHLsmdink057oEyK+NZ+tEz8DiKH2l5o8UD
   wXZoOYxhKxx17E5emmuWOaqiYThtFSSiLgv7L+VZpxNa/B/0jJk8afQ2w
   w==;
X-CSE-ConnectionGUID: nx3zPpTkQbepbFxVS8Dk0w==
X-CSE-MsgGUID: /3kJvS7CQxCMdWLF3CwR+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91684110"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91684110"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:04:03 -0700
X-CSE-ConnectionGUID: NMOPUDzHRFyFMcwOn84O+w==
X-CSE-MsgGUID: cAhOxqHRQMOaL5WZDCpbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276206253"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:04:02 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	david.e.box@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	rodrigo.vivi@intel.com,
	michael.j.ruhl@intel.com,
	ayaz.siddiqui@intel.com,
	syed.abdul.muqthyar.ahmed@intel.com,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org
Subject: [PATCH 3/3] platform/x86/intel/pmt: Notify userspace when crashlogs complete
Date: Thu,  1 Oct 2026 15:03:48 -0700
Message-ID: <20261001220351.1592138-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001220351.1592138-1-david.e.box@linux.intel.com>
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A crashlog may already be complete when the driver binds, or it may
complete asynchronously after userspace requests a manual trigger.
Userspace otherwise has to poll to discover that data is ready.

Emit a KOBJ_CHANGE uevent on the per-instance crashlog device when a
completed log is found at probe. After a manual trigger, poll the
completion bit at 100 ms intervals for up to 5 seconds and emit the same
event when capture completes. The event carries two environment
variables:

  INTEL_PMT_CRASHLOG_EVENT=3DPRESENT
  INTEL_PMT_CRASHLOG_COMPLETE=3D1

Initialize the work items before the device's sysfs attributes are
exposed, and disable and drain them during removal.

Document the new uevent in the sysfs-class-intel_pmt ABI file.

Assisted-by: LLM
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../ABI/testing/sysfs-class-intel_pmt         | 14 ++++
 drivers/platform/x86/intel/pmt/crashlog.c     | 84 ++++++++++++++++++-
 2 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt b/Documentatio=
n/ABI/testing/sysfs-class-intel_pmt
index ed4c886a21b1..c0b0d123afdf 100644
--- a/Documentation/ABI/testing/sysfs-class-intel_pmt
+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt
@@ -66,6 +66,20 @@ Description:
 		can be determined from an XML file of specified GUID for the
 		parent device.
=20
+What:		/sys/class/intel_pmt/crashlog<x>
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	David Box <david.e.box@linux.intel.com>
+Description:
+		When a crashlog device is probed with a completed crashlog
+		already present, or a manual trigger completes, the driver emits
+		a KOBJ_CHANGE uevent for that crashlog<x> device.
+
+		The following uevent environment variables are added:
+
+		INTEL_PMT_CRASHLOG_EVENT=3DPRESENT
+		INTEL_PMT_CRASHLOG_COMPLETE=3D1
+
 What:		/sys/class/intel_pmt/crashlog<x>/crashlog
 Date:		October 2020
 KernelVersion:	5.10
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x=
86/intel/pmt/crashlog.c
index f936daf99e4d..21e8e2199bdc 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -12,12 +12,14 @@
 #include <linux/cleanup.h>
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
+#include <linux/workqueue.h>
=20
 #include "class.h"
=20
@@ -113,6 +115,9 @@ struct crashlog_entry {
 	struct intel_pmt_entry		entry;
 	struct mutex			control_mutex;
 	const struct crashlog_info	*info;
+	struct work_struct		uevent_work;
+	struct delayed_work		uevent_poll_work;
+	u8				uevent_poll_tries;
 };
=20
 struct pmt_crashlog_priv {
@@ -120,6 +125,9 @@ struct pmt_crashlog_priv {
 	struct crashlog_entry	entry[];
 };
=20
+#define PMT_CRASHLOG_UEVENT_POLL_MS		100
+#define PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES	50
+
 /*
  * I/O
  */
@@ -227,6 +235,47 @@ static void pmt_crashlog_set_rearm(struct crashlog_ent=
ry *crashlog)
 	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
 }
=20
+static void pmt_crashlog_uevent_fn(struct work_struct *work)
+{
+	struct crashlog_entry *crashlog =3D
+		container_of(work, struct crashlog_entry, uevent_work);
+	char *envp[] =3D {
+		"INTEL_PMT_CRASHLOG_EVENT=3DPRESENT",
+		"INTEL_PMT_CRASHLOG_COMPLETE=3D1",
+		NULL,
+	};
+
+	if (crashlog->entry.kobj)
+		kobject_uevent_env(crashlog->entry.kobj, KOBJ_CHANGE, envp);
+}
+
+static void pmt_crashlog_uevent_poll_fn(struct work_struct *work)
+{
+	struct crashlog_entry *crashlog =3D
+		container_of(to_delayed_work(work), struct crashlog_entry,
+			     uevent_poll_work);
+	guard(mutex)(&crashlog->control_mutex);
+
+	/* A newer trigger_store() re-armed us; that cycle owns the notification =
*/
+	if (delayed_work_pending(&crashlog->uevent_poll_work))
+		return;
+
+	if (pmt_crashlog_complete(crashlog)) {
+		schedule_work(&crashlog->uevent_work);
+		return;
+	}
+
+	if (++crashlog->uevent_poll_tries < PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES)
+		schedule_delayed_work(&crashlog->uevent_poll_work,
+				      msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
+}
+
+static void pmt_crashlog_notify_pending(struct crashlog_entry *crashlog)
+{
+	if (pmt_crashlog_complete(crashlog))
+		schedule_work(&crashlog->uevent_work);
+}
+
 /*
  * sysfs
  */
@@ -423,7 +472,19 @@ trigger_store(struct device *dev, struct device_attrib=
ute *attr,
 	if (pmt_crashlog_complete(crashlog))
 		return -EEXIST;
=20
+	/*
+	 * Only now are we actually starting a fresh crash: any stale poll
+	 * cycle left over from a prior trigger can be dropped safely, since
+	 * pmt_crashlog_complete() above proved it carried no unresolved
+	 * completion. Non-sync: uevent_poll_fn() takes this same mutex, so
+	 * cancel_delayed_work_sync() here could deadlock against it.
+	 */
+	cancel_delayed_work(&crashlog->uevent_poll_work);
+
 	pmt_crashlog_set_execute(crashlog);
+	crashlog->uevent_poll_tries =3D 0;
+	schedule_delayed_work(&crashlog->uevent_poll_work,
+			      msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
=20
 	return count;
 }
@@ -551,6 +612,9 @@ static void pmt_crashlog_remove(struct auxiliary_device=
 *auxdev)
 	for (i =3D 0; i < priv->num_entries; i++) {
 		struct crashlog_entry *crashlog =3D &priv->entry[i];
=20
+		/* Disable, not cancel: a racing trigger_store() must not re-arm */
+		disable_delayed_work_sync(&crashlog->uevent_poll_work);
+		disable_work_sync(&crashlog->uevent_work);
 		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
 		mutex_destroy(&crashlog->control_mutex);
 	}
@@ -572,15 +636,29 @@ static int pmt_crashlog_probe(struct auxiliary_device=
 *auxdev,
 	auxiliary_set_drvdata(auxdev, priv);
=20
 	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
-		struct intel_pmt_entry *entry =3D &priv->entry[priv->num_entries].entry;
+		struct crashlog_entry *crashlog =3D &priv->entry[priv->num_entries];
+		struct intel_pmt_entry *entry =3D &crashlog->entry;
+
+		/* init before dev_create() exposes trigger sysfs to userspace */
+		INIT_WORK(&crashlog->uevent_work, pmt_crashlog_uevent_fn);
+		INIT_DELAYED_WORK(&crashlog->uevent_poll_work,
+				  pmt_crashlog_uevent_poll_fn);
+		crashlog->uevent_poll_tries =3D 0;
=20
 		ret =3D intel_pmt_dev_create(entry, &pmt_crashlog_ns, intel_vsec_dev, i);
-		if (ret < 0)
+		if (ret < 0) {
+			cancel_delayed_work_sync(&crashlog->uevent_poll_work);
+			cancel_work_sync(&crashlog->uevent_work);
 			goto abort_probe;
-		if (ret)
+		}
+		if (ret) {
+			cancel_delayed_work_sync(&crashlog->uevent_poll_work);
+			cancel_work_sync(&crashlog->uevent_work);
 			continue;
+		}
=20
 		priv->num_entries++;
+		pmt_crashlog_notify_pending(crashlog);
 	}
=20
 	return 0;
--=20
2.43.0

