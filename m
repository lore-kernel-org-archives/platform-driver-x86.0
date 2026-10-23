Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723122;
	b=MPg6X4NaLy4hUgREKzZDJi+wRpO6t+dNOCMNOXkwg0jqQ0VtAzFyPkha2GtIif7Nmcj2
	 YJKOQ8Ci6AbcnuEm72950Jzr+aqiWTkPCEZZU3SO53Ln7JjPAFe5SZeMIOVsUpXW0oYOo
	 UP1U4odXjrvhGv1QG1xj5Oo+G1KPcDjKnT+GUBMdcuFOQL+Op6wLrRuXPyEUNuXNOSAY+
	 SPaRWBrlb6DipTOwgHbbsPifqw7tgmSqnXOKr/YZNS/B6uLkRSVA24QTXggJsBvy0/fQp
	 qMFjGhBfqJvk13EWLKI1QC1kTzhgVgI5bWqSBz4yr616Hx7RbRvilX3kWEK2X0HgxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723122;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hHKxGT7swwB8/X1LwBtc7lFDWey/fBbw4RDr/+OI86c=;
	b=iZjrHJS4Z6Wr5LSHGQi+DV3ShKB7vZVXC9R78rLEyljBXKUpyLYPcKZQ+S70csTOodKu
	 Ph3v+9rtB86VD+DZm1C7Ez+gCOFe8Fwapk5HfhI8WEcISmdMvdrWyWkblgZ0jbuGOyS05
	 9755KeoabXAwr9B1I8Ahpf7uky7Yk5bEhKi55CxXZXNRAmJmk2sBLOz44nJilH4OixGEe
	 54l0qUqM/r3TNQOvE40uRI3NEWOqpJJ//nFcMV5Whs12lg7RhYjKpWirGJLLO9AkVKSRd
	 4AaYxnlPBEfWdxYqBykby6zv959QsK/1TCHfOi6KQo9BMmYBUL3xTEsSOCfN4zPMZCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tl72OpbN;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A122606A31D;
	Fri, 23 Oct 2026 02:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A122606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tl72OpbN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792723122; x=1824259122;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XD5THp9BlYM9lSBR08JsRNCcOLMeJudstF9CD6m5vMs=;
  b=Tl72OpbNpi0lPlSeje7lFZ8KeVgjOUZFVUDHYm8isl3FVcuM7PqEjW3N
   FhkzOV4YIRseUmC1vLAVNRR0g3gHUk22FXlv3kqx2442WZmXnUlMLLenG
   m3+KtcwdeQSBBRtYA/weXE/AIzl1LJQxYBj7QtkBn8jWhFLophPSbs8yI
   ReklYPHp3QNaLoc5cL+xAJS/9oChceGTuK0PAbWXFgg8UxnaJUxh83HhJ
   /zE62sM/TSO89iUPYuKp5Tj+9aKkWdtTHBwFfx+T9WVAWkgrW8tCAkJCK
   fng60KZH7wm+SBt7Tz+zw8QtrrlvghlqFrY3iWdIqih2q/qWYpACDEpuI
   g==;
X-CSE-ConnectionGUID: ScW65FwcQGqWU1ZavRePDQ==
X-CSE-MsgGUID: ZxHeCTJhTlKqwg7VuyBcxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1356813"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1356813"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:38:40 -0700
X-CSE-ConnectionGUID: rCEgal3wSqqVfIz28OIP0g==
X-CSE-MsgGUID: B+WEBNSISVCfwoB0ZTCqbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3461559"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:38:41 -0700
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
Subject: [PATCH v2 1/1] platform/x86/intel/pmt: Notify userspace when crashlogs complete
Date: Thu, 22 Oct 2026 19:38:32 -0700
Message-ID: <363a32e2e37d5fa62983bc9e280fc87dbf4ed214.1792721526.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792721526.git.david.e.box@linux.intel.com>
References: <cover.1792721526.git.david.e.box@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A crashlog may already be complete when the driver binds, or it may
complete asynchronously after userspace requests a manual trigger.
Userspace otherwise has to poll to discover that data is ready.

Emit a KOBJ_CHANGE uevent on the per-instance crashlog device when a
completed log is found at probe. After a manual trigger, poll the
completion bit at 100 ms intervals for up to 5 seconds and emit the same
event when capture completes, or when the poll window expires without
completion, so userspace is not left waiting. A clear or rearm while
polling ends the poll without an event. The poll runs on the freezable
workqueue so it does not read the device during suspend. The event
carries INTEL_PMT_CRASHLOG_COMPLETE set to 1 or 0 accordingly.

The class device's attributes are created after its KOBJ_ADD, so the
probe-time event is also the first point at which userspace can reliably
read a log that was already captured.

Initialize the work items before the device's sysfs attributes are
exposed, and reject manual triggers until setup of that crashlog
completes so a trigger cannot queue work against a device torn down by
a later probe failure. Disable and drain the work items during removal.

Document the new uevent in the sysfs-class-intel_pmt ABI file.

Assisted-by: LLM
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../ABI/testing/sysfs-class-intel_pmt         |  32 ++++
 drivers/platform/x86/intel/pmt/crashlog.c     | 138 +++++++++++++++++-
 2 files changed, 165 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt b/Documentatio=
n/ABI/testing/sysfs-class-intel_pmt
index ed4c886a21b1..cf95d1dcd4d6 100644
--- a/Documentation/ABI/testing/sysfs-class-intel_pmt
+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt
@@ -66,6 +66,38 @@ Description:
 		can be determined from an XML file of specified GUID for the
 		parent device.
=20
+What:		/sys/class/intel_pmt/crashlog<x>
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	David Box <david.e.box@linux.intel.com>
+Description:
+		The driver emits a KOBJ_CHANGE uevent for the crashlog<x>
+		device with the following environment variable:
+
+		INTEL_PMT_CRASHLOG_COMPLETE
+			The crashlog complete status at the end of a check:
+			1 if set, 0 if not. It reports the status only, not
+			what caused the crashlog to be captured.
+
+		The event is currently sent when a completed crashlog is
+		found at probe, and after a write of 1 to trigger. It
+		returns 1 when the crashlog completes, or 0 for trigger if
+		it has not completed within the poll time. Writing clear
+		or rearm while polling ends trigger without an event.
+
+		The status may have changed by the time the event is
+		received, and the same crashlog may be reported more than
+		once. Consumers should read the status attributes before
+		acting. Consumers that start after the device was probed
+		should check the complete status of existing devices, for
+		example when handling a coldplug add event, since an event
+		emitted before the uevent listener starts is not replayed.
+
+		Other KOBJ_CHANGE events may be added in the future with
+		different variables. Consumers should match on
+		INTEL_PMT_CRASHLOG_COMPLETE and ignore variables they do not
+		recognize.
+
 What:		/sys/class/intel_pmt/crashlog<x>/crashlog
 Date:		October 2020
 KernelVersion:	5.10
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x=
86/intel/pmt/crashlog.c
index d7018b495217..2d006abce5bf 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -13,13 +13,16 @@
 #include <linux/intel_vsec.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
+#include <linux/workqueue.h>
=20
 #include "class.h"
=20
@@ -115,6 +118,12 @@ struct crashlog_entry {
 	struct intel_pmt_entry		entry;
 	struct mutex			control_mutex;
 	const struct crashlog_info	*info;
+	struct work_struct		uevent_work;
+	struct delayed_work		uevent_poll_work;
+	u8				uevent_poll_tries;
+	bool				uevent_polling;
+	bool				uevent_complete;
+	bool				trigger_ready;
 };
=20
 struct pmt_crashlog_priv {
@@ -122,6 +131,9 @@ struct pmt_crashlog_priv {
 	struct crashlog_entry	entry[];
 };
=20
+#define PMT_CRASHLOG_UEVENT_POLL_MS		100
+#define PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES	50
+
 /*
  * I/O
  */
@@ -271,6 +283,80 @@ static int pmt_crashlog_set_rearm(struct crashlog_entr=
y *crashlog)
 	return pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
 }
=20
+static void pmt_crashlog_uevent_fn(struct work_struct *work)
+{
+	struct crashlog_entry *crashlog =3D
+		container_of(work, struct crashlog_entry, uevent_work);
+	char *envp[] =3D {
+		READ_ONCE(crashlog->uevent_complete) ?
+			"INTEL_PMT_CRASHLOG_COMPLETE=3D1" :
+			"INTEL_PMT_CRASHLOG_COMPLETE=3D0",
+		NULL,
+	};
+
+	kobject_uevent_env(crashlog->entry.kobj, KOBJ_CHANGE, envp);
+}
+
+static void pmt_crashlog_uevent_poll_fn(struct work_struct *work)
+{
+	struct crashlog_entry *crashlog =3D
+		container_of(to_delayed_work(work), struct crashlog_entry,
+			     uevent_poll_work);
+	bool complete;
+	int ret;
+
+	guard(mutex)(&crashlog->control_mutex);
+
+	/* The cycle was ended by a clear or rearm */
+	if (!crashlog->uevent_polling)
+		return;
+
+	/* A newer trigger_store() re-armed us; that cycle owns the notification =
*/
+	if (delayed_work_pending(&crashlog->uevent_poll_work))
+		return;
+
+	ret =3D pmt_crashlog_complete(crashlog, &complete);
+	if (!ret && complete) {
+		crashlog->uevent_polling =3D false;
+		WRITE_ONCE(crashlog->uevent_complete, true);
+		schedule_work(&crashlog->uevent_work);
+		return;
+	}
+
+	if (++crashlog->uevent_poll_tries < PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES) {
+		queue_delayed_work(system_freezable_wq, &crashlog->uevent_poll_work,
+				   msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
+		return;
+	}
+
+	/* Trigger did not complete within the poll window */
+	crashlog->uevent_polling =3D false;
+	WRITE_ONCE(crashlog->uevent_complete, false);
+	schedule_work(&crashlog->uevent_work);
+}
+
+static void pmt_crashlog_end_poll(struct crashlog_entry *crashlog)
+{
+	lockdep_assert_held(&crashlog->control_mutex);
+
+	crashlog->uevent_polling =3D false;
+	cancel_delayed_work(&crashlog->uevent_poll_work);
+}
+
+static void pmt_crashlog_notify_pending(struct crashlog_entry *crashlog)
+{
+	bool complete;
+	int ret;
+
+	lockdep_assert_held(&crashlog->control_mutex);
+
+	ret =3D pmt_crashlog_complete(crashlog, &complete);
+	if (!ret && complete) {
+		WRITE_ONCE(crashlog->uevent_complete, true);
+		schedule_work(&crashlog->uevent_work);
+	}
+}
+
 /*
  * sysfs
  */
@@ -309,8 +395,12 @@ clear_store(struct device *dev, struct device_attribut=
e *attr,
 	guard(mutex)(&crashlog->control_mutex);
=20
 	ret =3D pmt_crashlog_set_clear(crashlog);
+	if (ret)
+		return ret;
=20
-	return ret ?: count;
+	pmt_crashlog_end_poll(crashlog);
+
+	return count;
 }
 static DEVICE_ATTR_RW(clear);
=20
@@ -454,8 +544,12 @@ rearm_store(struct device *dev, struct device_attribut=
e *attr, const char *buf,
 	guard(mutex)(&crashlog->control_mutex);
=20
 	ret =3D pmt_crashlog_set_rearm(crashlog);
+	if (ret)
+		return ret;
=20
-	return ret ?: count;
+	pmt_crashlog_end_poll(crashlog);
+
+	return count;
 }
 static DEVICE_ATTR_RW(rearm);
=20
@@ -502,9 +596,17 @@ trigger_store(struct device *dev, struct device_attrib=
ute *attr,
=20
 	if (!trigger) {
 		ret =3D pmt_crashlog_set_clear(crashlog);
-		return ret ?: count;
+		if (ret)
+			return ret;
+
+		pmt_crashlog_end_poll(crashlog);
+		return count;
 	}
=20
+	/* reject triggers until probe has finished setting up this entry */
+	if (!crashlog->trigger_ready)
+		return -EBUSY;
+
 	/* we cannot trigger a new crash if one is still pending */
 	ret =3D pmt_crashlog_complete(crashlog, &complete);
 	if (ret)
@@ -513,8 +615,21 @@ trigger_store(struct device *dev, struct device_attrib=
ute *attr,
 		return -EEXIST;
=20
 	ret =3D pmt_crashlog_set_execute(crashlog);
+	if (ret)
+		return ret;
=20
-	return ret ?: count;
+	/*
+	 * Use non-sync since uevent_poll_fn() takes this same mutex, so
+	 * cancel_delayed_work_sync() here could deadlock against it.
+	 */
+	cancel_delayed_work(&crashlog->uevent_poll_work);
+
+	crashlog->uevent_polling =3D true;
+	crashlog->uevent_poll_tries =3D 0;
+	queue_delayed_work(system_freezable_wq, &crashlog->uevent_poll_work,
+			   msecs_to_jiffies(PMT_CRASHLOG_UEVENT_POLL_MS));
+
+	return count;
 }
 static DEVICE_ATTR_RW(trigger);
=20
@@ -640,6 +755,8 @@ static void pmt_crashlog_remove(struct auxiliary_device=
 *auxdev)
 	for (i =3D 0; i < priv->num_entries; i++) {
 		struct crashlog_entry *crashlog =3D &priv->entry[i];
=20
+		disable_delayed_work_sync(&crashlog->uevent_poll_work);
+		disable_work_sync(&crashlog->uevent_work);
 		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
 		mutex_destroy(&crashlog->control_mutex);
 	}
@@ -661,7 +778,13 @@ static int pmt_crashlog_probe(struct auxiliary_device =
*auxdev,
 	auxiliary_set_drvdata(auxdev, priv);
=20
 	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
-		struct intel_pmt_entry *entry =3D &priv->entry[priv->num_entries].entry;
+		struct crashlog_entry *crashlog =3D &priv->entry[priv->num_entries];
+		struct intel_pmt_entry *entry =3D &crashlog->entry;
+
+		/* trigger_store() rejects triggers until trigger_ready is set below */
+		INIT_WORK(&crashlog->uevent_work, pmt_crashlog_uevent_fn);
+		INIT_DELAYED_WORK(&crashlog->uevent_poll_work,
+				  pmt_crashlog_uevent_poll_fn);
=20
 		ret =3D intel_pmt_dev_create(entry, &pmt_crashlog_ns, intel_vsec_dev, i);
 		if (ret < 0)
@@ -670,6 +793,11 @@ static int pmt_crashlog_probe(struct auxiliary_device =
*auxdev,
 			continue;
=20
 		priv->num_entries++;
+
+		scoped_guard(mutex, &crashlog->control_mutex) {
+			crashlog->trigger_ready =3D true;
+			pmt_crashlog_notify_pending(crashlog);
+		}
 	}
=20
 	return 0;
--=20
2.43.0

