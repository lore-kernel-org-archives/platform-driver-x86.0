Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449306;
	b=cLFG0Zzslt9qe3THKAUh6+Be0/KDNKFoWu6fHBribK/yCwkMJegnQU2lVmitUXIffORL
	 IoxqDUeU8aDdjT4my/oo1DHF6R1ko61DnWVfqmM0kBtizLBSwk0Eltn1pquIqEvnJB4ww
	 ImPVCgAHjdk+45tgHJcVFhXpvOce7G45q5qWM3XJJZMDvMvzwY8pSTXAbNT2gx/V8QdD1
	 cRpkPgm9Au7ABXaAzmNumf2ajElfVgKJXUvX7SqMjZCq5P5+k6NkqM6FR7pmnye53vGlX
	 AD6NyNAiJr8Q2OJH69l8N3ZkmU0+zpJaOxAR++CP7R4iMZPGofhZUWs9scmhb0tmiJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449306;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g/xKUEcY5H4PAvkhiRS8OXTNWFY31ZjXM8A0lBgOMF0=;
	b=RphI66kmMl3gNxrIYgeK8Y/GfpsxT5ks+/uv2uK0o1xloDQruLzXabHchUK0QUTyuEWA
	 xriW3MvYnd3cgTDWVA+kY8PcgSxlJ1uCBScuYjkvmAAu39AMLPY5mfUmDxxR0J7aCSHiv
	 WYmOs/IshXd8zdUZQoMJHR9/1dbfSuFqFyUepKHsClwcyNMpg+IaEkRRc/hpv5NIlGQ8D
	 OrnlabtZ49C6vGjUDjwc6Ha9YhMNJAI8FFGDt9j0m6yEpr8AI/+bdqlCGp6YeCBAVQkQc
	 PoVb/v5wkNWYcnsY9dXVbWlCsHpFiOeA8f8GBhaNGy9riBhBkklAFlJ6rHZqmdu2/Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="XLcwgc/W";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839BD606A323;
	Thu, 12 Nov 2026 02:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 839BD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XLcwgc/W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794449306; x=1825985306;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tyayiFDgoXUppYsuip8PGd6rbfb2+Uapjz34ACM5RtQ=;
  b=XLcwgc/Wlks61tWu1ftWu703tJUxVmvNhLXJadeFJtyDgaApZUduZPx8
   QkC2GHm6hf7jw/FqRrETO1qEeVqZQacdpqCdBjp8tAjy66XiVt7QAwMXi
   vymmDofcY+x2jntmKJlde7OihxuL4bRxRA678uuA4hJPHvRLrP767CTp4
   duJX+6frGTmTYPUyFeTWIb57feSFRy7yXQooC4YetxxsPZ0rjRNL2gJVm
   KG7TkuN2GTdPi3lZ/NP+ie+qmW55QWlTSxjP/gZBKuJFKFXFNESZD32kv
   j2Yjs7hv9Qq4NV4GeUIOTuUMzQX+nCK5CdoENf9AyH7MQOLCL/ysQeQws
   Q==;
X-CSE-ConnectionGUID: pBN4Ib8iQA2LoYBi5WVkIw==
X-CSE-MsgGUID: hdJmqhdaSYygwhv1K7Z16w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3106752"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3106752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 18:08:24 -0800
X-CSE-ConnectionGUID: PV9bcCWpTC6XRBfwdr7wgw==
X-CSE-MsgGUID: X5Y7EnfCS6aU/OU4WpEQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8622631"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 18:08:24 -0800
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
Subject: [PATCH v3 1/1] platform/x86/intel/pmt: Notify userspace when crashlogs complete
Date: Wed, 11 Nov 2026 18:08:18 -0800
Message-ID: <c265bd093c23d96417cb5c6504938c90adc36ac9.1794444671.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794444671.git.david.e.box@linux.intel.com>
References: <cover.1794444671.git.david.e.box@linux.intel.com>
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
complete asynchronously after a manual trigger. Userspace currently has to
poll the status attributes to find out when data is ready.

Emit a KOBJ_CHANGE uevent on the crashlog<x> device carrying
INTEL_PMT_CRASHLOG_COMPLETE:

  - at probe, set to 1 if a completed crashlog is present
  - after a manual trigger, set to 1 when the capture completes, or 0
    if it has not completed within 5 seconds

Writing 0 to trigger, clearing, rearming or disabling the crashlog while
the trigger poll is running ends it without an event. Because the class
device's attributes are created after its KOBJ_ADD, the probe-time event is
also the first point at which userspace can reliably read a log captured
before the driver bound.
=20=20
Trigger completion is polled every 100 ms from a delayed work item. The
probe-time check also runs from a work item, queued at the end of probe,
rather than from probe itself. This is because register access may go
through the parent's read_reg() callback, and the upcoming xe support for
Crescent Island (CRI) holds the lock that callback takes across
intel_vsec_register() when it registers late, after its firmware is ready.
With pmt_crashlog already loaded, probe runs synchronously within that
call, so reading a register from probe would deadlock on the lock the
caller already holds. Both work items run on the freezable workqueue so the
device is not accessed during suspend.

Manual triggers are rejected with -EBUSY until probe has set up all
entries, and the probe-time check is skipped once a trigger has been
accepted, so each capture is reported once. The work items are disabled and
drained on removal.

Document the uevent in the sysfs-class-intel_pmt ABI file.

Tested-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../ABI/testing/sysfs-class-intel_pmt         |  35 ++++
 drivers/platform/x86/intel/pmt/crashlog.c     | 180 +++++++++++++++++-
 2 files changed, 209 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt b/Documentatio=
n/ABI/testing/sysfs-class-intel_pmt
index ed4c886a21b1..71896e17a507 100644
--- a/Documentation/ABI/testing/sysfs-class-intel_pmt
+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt
@@ -66,6 +66,41 @@ Description:
 		can be determined from an XML file of specified GUID for the
 		parent device.
=20
+What:		/sys/class/intel_pmt/crashlog<x>
+Date:		November 2026
+KernelVersion:	7.5
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
+		it has not completed within the poll time. Writing 0 to
+		trigger, writing clear or rearm, or disabling the crashlog
+		while polling ends the poll without an event.
+
+		The status may have changed by the time the event is
+		received, the same crashlog may be reported more than
+		once, and events sent in quick succession may be merged
+		into one carrying the latest status. Consumers should read
+		the status attributes before acting. Consumers that start
+		after the device was probed should check the complete
+		status of existing devices, for example when handling a
+		coldplug add event, since an event emitted before the
+		uevent listener starts is not replayed.
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
index d7018b495217..1796023a2f0e 100644
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
@@ -115,6 +118,14 @@ struct crashlog_entry {
 	struct intel_pmt_entry		entry;
 	struct mutex			control_mutex;
 	const struct crashlog_info	*info;
+	struct work_struct		pending_work;
+	struct work_struct		uevent_work;
+	struct delayed_work		uevent_poll_work;
+	u8				uevent_poll_tries;
+	bool				uevent_polling;
+	bool				uevent_complete;
+	bool				trigger_ready;
+	bool				triggered;
 };
=20
 struct pmt_crashlog_priv {
@@ -122,6 +133,9 @@ struct pmt_crashlog_priv {
 	struct crashlog_entry	entry[];
 };
=20
+#define PMT_CRASHLOG_UEVENT_POLL_MS		100
+#define PMT_CRASHLOG_UEVENT_POLL_MAX_TRIES	50
+
 /*
  * I/O
  */
@@ -271,6 +285,93 @@ static int pmt_crashlog_set_rearm(struct crashlog_entr=
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
+/* Probe-time check for a crashlog completed before the driver bound */
+static void pmt_crashlog_pending_fn(struct work_struct *work)
+{
+	struct crashlog_entry *crashlog =3D
+		container_of(work, struct crashlog_entry, pending_work);
+
+	guard(mutex)(&crashlog->control_mutex);
+
+	/* A trigger since probe owns the notification for its capture */
+	if (!crashlog->triggered)
+		pmt_crashlog_notify_pending(crashlog);
+}
+
 /*
  * sysfs
  */
@@ -309,8 +410,12 @@ clear_store(struct device *dev, struct device_attribut=
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
@@ -399,8 +504,13 @@ enable_store(struct device *dev, struct device_attribu=
te *attr,
 	guard(mutex)(&crashlog->control_mutex);
=20
 	ret =3D pmt_crashlog_set_disable(crashlog, !enabled);
+	if (ret)
+		return ret;
=20
-	return ret ?: count;
+	if (!enabled)
+		pmt_crashlog_end_poll(crashlog);
+
+	return count;
 }
 static DEVICE_ATTR_RW(enable);
=20
@@ -454,8 +564,12 @@ rearm_store(struct device *dev, struct device_attribut=
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
@@ -502,9 +616,17 @@ trigger_store(struct device *dev, struct device_attrib=
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
@@ -513,8 +635,23 @@ trigger_store(struct device *dev, struct device_attrib=
ute *attr,
 		return -EEXIST;
=20
 	ret =3D pmt_crashlog_set_execute(crashlog);
+	if (ret)
+		return ret;
=20
-	return ret ?: count;
+	crashlog->triggered =3D true;
+
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
@@ -640,6 +777,9 @@ static void pmt_crashlog_remove(struct auxiliary_device=
 *auxdev)
 	for (i =3D 0; i < priv->num_entries; i++) {
 		struct crashlog_entry *crashlog =3D &priv->entry[i];
=20
+		disable_work_sync(&crashlog->pending_work);
+		disable_delayed_work_sync(&crashlog->uevent_poll_work);
+		disable_work_sync(&crashlog->uevent_work);
 		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
 		mutex_destroy(&crashlog->control_mutex);
 	}
@@ -661,7 +801,14 @@ static int pmt_crashlog_probe(struct auxiliary_device =
*auxdev,
 	auxiliary_set_drvdata(auxdev, priv);
=20
 	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
-		struct intel_pmt_entry *entry =3D &priv->entry[priv->num_entries].entry;
+		struct crashlog_entry *crashlog =3D &priv->entry[priv->num_entries];
+		struct intel_pmt_entry *entry =3D &crashlog->entry;
+
+		/* trigger_store() rejects triggers until trigger_ready is set below */
+		INIT_WORK(&crashlog->pending_work, pmt_crashlog_pending_fn);
+		INIT_WORK(&crashlog->uevent_work, pmt_crashlog_uevent_fn);
+		INIT_DELAYED_WORK(&crashlog->uevent_poll_work,
+				  pmt_crashlog_uevent_poll_fn);
=20
 		ret =3D intel_pmt_dev_create(entry, &pmt_crashlog_ns, intel_vsec_dev, i);
 		if (ret < 0)
@@ -672,6 +819,27 @@ static int pmt_crashlog_probe(struct auxiliary_device =
*auxdev,
 		priv->num_entries++;
 	}
=20
+	/*
+	 * Don't read crashlog registers from probe. The read may go through the
+	 * parent's read_reg() callback, which can take a lock that the parent
+	 * holds across intel_vsec_register() and so across a synchronous probe.
+	 * From a work item, the read just waits for registration to finish.
+	 *
+	 * Enable triggers and queue the work only once every entry is created.
+	 * abort_probe waits for the work items in pmt_crashlog_remove(), which
+	 * would deadlock if one were already blocked on a lock held by our
+	 * caller. For the same reason, a parent must not hold that lock while
+	 * removing the device.
+	 */
+	for (i =3D 0; i < priv->num_entries; i++) {
+		struct crashlog_entry *crashlog =3D &priv->entry[i];
+
+		scoped_guard(mutex, &crashlog->control_mutex)
+			crashlog->trigger_ready =3D true;
+
+		queue_work(system_freezable_wq, &crashlog->pending_work);
+	}
+
 	return 0;
 abort_probe:
 	pmt_crashlog_remove(auxdev);
--=20
2.53.0

