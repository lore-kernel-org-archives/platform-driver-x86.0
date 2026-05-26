Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8D2DB781;
	Tue, 26 May 2026 01:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760067; cv=none; b=Zxd0EyvVwDC2lL8Xp+DcKX5ReJFqakdPKLL00iUTFQLvxV8ekWxiRlICypq6sl3DUkXF9uVpkFyZDPW/sX0B5LObl9jseD87cgyuj7kSM0MFpbNZmXg3sADlcxCIr0yOSutYfUhOdHLd2HYkofyi3inpiWPYSpQegO2L8D9yF4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760067; c=relaxed/simple;
	bh=pe3RJVUM0LeJjT3FRo9Kb8I5++FJ36mxWfoB75MJz+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQZY+9riCUjogqkAuoebIK3sA3HGd5pxpY9SYn5DziF0Px8/51JvgMJU7PLp/NE5acL/7mw3lwOu0SUWIhmEcA1QoKnuUzgBtVTZs8hEB7b+YsBFunP+vPmpNdjdIL2h1xBRXvdMv7JZYmHMxZDnLvqj29J3Q9jtaLTaNE7+wbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6OeOGoE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6OeOGoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760063; x=1811296063;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pe3RJVUM0LeJjT3FRo9Kb8I5++FJ36mxWfoB75MJz+Y=;
  b=T6OeOGoE5/yh8EDf/wR21+y8TiYkQXn0xAWVr7VD+ut1W+THffvXAHgS
   QyttTXm9E378gZ9DILW241Ji4ApnUQC0jyAh0NrxPSdYbP3tWMR5ZZx/v
   rszMtqBOCj8/kADiwxt6vNewMHPS0/9Rew8fhoK3rpzoTk0CDTtnNl8cW
   6nYgA1CUaSItKnvAnOykgni6s1OfzAaJjRs35CEOeG0KJLNFm3b30QFhQ
   JgW5UhtTjeNkZaefP7RX+UrP+NMjEJ/WCuwW6YDoc84cmwG3Q3BGcRjhq
   oFT8Pc8G9jvyTKex6tHluVy3ylf6dWgzLPf9HeQOQpS8cOa5r6hp0lmTO
   w==;
X-CSE-ConnectionGUID: O09pF3vsTdKyQhBL8abHSA==
X-CSE-MsgGUID: saoT4124TGOsz3MDHHZ40w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539890"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539890"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: 5K84cPQHQNKt+/SLn/VxZA==
X-CSE-MsgGUID: n6V+gag3QnybtmEDqH/Fiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074972"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 05/17] tools/arch/x86/pmtctl: Add libpmtctl device enumeration backend
Date: Mon, 25 May 2026 18:47:03 -0700
Message-ID: <20260526014719.2248380-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526014719.2248380-1-david.e.box@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a sysfs-based backend for enumerating Intel PMT telemetry devices,
enabling libpmtctl to discover and access hardware telemetry data at
runtime without hardcoded device paths.

Intel PMT telemetry devices are exposed under
/sys/bus/auxiliary/drivers/pmt_telemetry. This backend walks those sysfs
entries to discover device metadata and data paths, populating per-device
descriptors used by the metric access layer.

Introduce a pmt_device_ops vtable to allow additional enumeration backends
or PMT transport types to be added without changing the calling code.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/include/lib/device.h |  53 +++
 tools/arch/x86/pmtctl/lib/device_telem.c   | 371 +++++++++++++++++++++
 2 files changed, 424 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/device.h
 create mode 100644 tools/arch/x86/pmtctl/lib/device_telem.c

diff --git a/tools/arch/x86/pmtctl/include/lib/device.h b/tools/arch/x86/pm=
tctl/include/lib/device.h
new file mode 100644
index 000000000000..5bee487e9b99
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/device.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_DEVICES_H
+#define PMTCTL_DEVICES_H
+
+#include <stdint.h>
+
+#include "metrics_db.h"
+#include "pmtctl_types.h"
+
+#define PMT_SAMPLE_SIZE 8
+
+/* --- Device representation returned by any device --- */
+struct pmt_device {
+	const struct pmt_guid *guid;   /* per-GUID metadata (interned) */
+	int        guid_inst;    /* global guid instance */
+	int        dev_inst;     /* local device instance */
+
+	char      *name;         /* e.g. "pmt_ep_27971628_0" or "telem0" */
+	char      *path;         /* e.g. "/sys/class/intel_pmt/telem0" */
+	char      *data_path;    /* readable metric data path for this device */
+	int        instance;     /* 0, 1, etc. */
+
+	int        pkg_id;       /* Package/Socket ID if known, else -1 */
+	int        die_id;       /* Die ID if known, else -1 */
+
+	int        fd;           /* telem file fd */
+};
+
+struct pmt_metric_desc {
+	const struct pmt_metric_def *def;
+	struct pmt_device *dev;
+
+	const char *name; /* JSON name */
+	int guid_inst; /* global GUID instance (matches pmt_device.guid_inst) */
+
+	/* raw mode fields */
+	uint32_t raw_sample_id;
+	uint8_t  raw_lsb;
+	uint8_t  raw_msb;
+
+};
+
+struct pmt_device_ops {
+	enum pmt_device_type dev_type;
+	int  (*init)(void);
+	void (*cleanup)(void);
+	int  (*read)(struct pmt_metric_desc *m, uint64_t *val);
+	struct pmt_device *(*device_list)(int *count);
+};
+
+extern struct pmt_device_ops device_telem_ops;
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/device_telem.c b/tools/arch/x86/pmtc=
tl/lib/device_telem.c
new file mode 100644
index 000000000000..4c90dc95890f
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/device_telem.c
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define LOG_PREFIX "telem"
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "lib/common.h"
+#include "lib/device.h"
+#include "lib/log.h"
+
+#define PMT_TELEM_AUX_DIR    "/sys/bus/auxiliary/drivers/pmt_telemetry"
+#define PMT_TELEM_PMT_DIR    "intel_pmt"
+#define PMT_TELEM_DATA_FILE  "telem"
+
+static struct pmt_device *devices;
+static int device_count;
+static int device_initialized;
+
+static int telem_read(struct pmt_metric_desc *m, uint64_t *val)
+{
+	uint64_t raw;
+	uint64_t mask;
+	uint8_t width;
+	ssize_t n;
+	off_t off;
+	uint32_t sample_id;
+	uint8_t  lsb, msb;
+
+	if (!m || !val || !m->dev)
+		log_bug_and_exit("unexpected NULL parameters");
+
+	/* Open the telem file on first read */
+	if (m->dev->fd < 0) {
+		int fd;
+
+		if (!m->dev->data_path)
+			return log_ret(-EINVAL, "missing data path for %s", m->dev->name);
+
+		fd =3D open(m->dev->data_path, O_RDONLY | O_CLOEXEC);
+		if (fd =3D=3D -1)
+			return log_ret(-errno, "could not open telem file %s", m->dev->data_pat=
h);
+
+		m->dev->fd =3D fd;
+	}
+
+	if (m->def) {
+		sample_id =3D m->def->sample_id;
+		lsb       =3D m->def->lsb;
+		msb       =3D m->def->msb;
+	} else {
+		sample_id =3D m->raw_sample_id;
+		lsb       =3D m->raw_lsb;
+		msb       =3D m->raw_msb;
+	}
+
+	if (msb > 63 || lsb > msb)
+		return PMTCTL_ERR_DEVICE;
+
+	off =3D (off_t)sample_id * PMT_SAMPLE_SIZE;
+
+	n =3D pread(m->dev->fd, &raw, sizeof(raw), off);
+	if (n =3D=3D -1) {
+		log_err_once(-errno, "unable to read telem %s", m->dev->name);
+		return -errno;
+	}
+
+	if (n !=3D (ssize_t)sizeof(raw)) {
+		log_err_once(-EIO, "read expected %zu bytes, got %zd (dev=3D%s)",
+			     sizeof(raw), n, m->dev->name);
+		return -EIO;
+	}
+
+	if (lsb =3D=3D 0 && msb =3D=3D 63) {
+		*val =3D raw;
+		return 0;
+	}
+
+	width =3D msb - lsb + 1;
+	if (width >=3D 64)
+		mask =3D ~0ULL;
+	else
+		mask =3D (1ULL << width) - 1ULL;
+
+	*val =3D (raw >> lsb) & mask;
+
+	return 0;
+}
+
+static struct pmt_device *telem_device_list(int *count)
+{
+	if (!count || !device_initialized)
+		return NULL;
+
+	*count =3D device_count;
+
+	return devices;
+}
+
+/* ----------------- per-GUID instance tracking ----------------- */
+struct guid_counter {
+	uint32_t guid;
+	int      next_guid_inst;
+};
+
+struct dev_guid_counter {
+	int      dev_index;
+	uint32_t guid;
+	int      next_dev_inst;
+};
+
+static struct guid_counter     *guid_counters;
+static int                      guid_counter_cnt;
+
+static struct dev_guid_counter *dev_guid_counters;
+static int                      dev_guid_counter_cnt;
+/* -------------------------------------------------------------- */
+
+static int next_guid_instance_global(uint32_t guid)
+{
+	struct guid_counter *tmp;
+	int inst =3D 0;
+	int i;
+
+	for (i =3D 0; i < guid_counter_cnt; i++) {
+		if (guid_counters[i].guid =3D=3D guid) {
+			inst =3D guid_counters[i].next_guid_inst;
+			guid_counters[i].next_guid_inst++;
+			return inst;
+		}
+	}
+
+	/* new guid, start at 0 */
+	tmp =3D realloc(guid_counters, (guid_counter_cnt + 1) * sizeof(*guid_coun=
ters));
+	if (!tmp)
+		return -ENOMEM;
+
+	guid_counters =3D tmp;
+	guid_counters[guid_counter_cnt].guid =3D guid;
+	guid_counters[guid_counter_cnt].next_guid_inst =3D 1;
+	guid_counter_cnt++;
+
+	return inst;
+}
+
+static int next_guid_instance_device(int dev_index, uint32_t guid)
+{
+	struct dev_guid_counter *tmp;
+	int inst =3D 0;
+	int i;
+
+	for (i =3D 0; i < dev_guid_counter_cnt; i++) {
+		if (dev_guid_counters[i].dev_index =3D=3D dev_index &&
+		    dev_guid_counters[i].guid =3D=3D guid) {
+			inst =3D dev_guid_counters[i].next_dev_inst;
+			dev_guid_counters[i].next_dev_inst++;
+			return inst;
+		}
+	}
+
+	/* new (dev_index, guid) pair */
+	tmp =3D realloc(dev_guid_counters, (dev_guid_counter_cnt + 1) * sizeof(*d=
ev_guid_counters));
+	if (!tmp)
+		return -ENOMEM;
+
+	dev_guid_counters =3D tmp;
+	dev_guid_counters[dev_guid_counter_cnt].dev_index =3D dev_index;
+	dev_guid_counters[dev_guid_counter_cnt].guid =3D guid;
+	dev_guid_counters[dev_guid_counter_cnt].next_dev_inst =3D 1;
+	dev_guid_counter_cnt++;
+
+	return inst;
+}
+
+static int telem_add_device(const char *devpath, const char *devname, int =
dev_index)
+{
+	struct pmt_device dev =3D { 0 };
+
+	auto_free char *temp_name =3D NULL;
+	auto_free char *temp_path =3D NULL;
+	auto_free char *temp_data_path =3D NULL;
+	char data_path[PATH_MAX];
+	uint32_t raw_guid;
+	int len;
+	int ret;
+
+	if (!devpath || !devname)
+		return -EINVAL;
+
+	temp_name =3D xstrdup(devname);
+	temp_path =3D xstrdup(devpath);
+
+	len =3D snprintf(data_path, sizeof(data_path), "%s/" PMT_TELEM_DATA_FILE,=
 devpath);
+	if (len < 0 || (size_t)len >=3D sizeof(data_path))
+		return log_ret(-EINVAL, "path too long for %s", devname);
+
+	temp_data_path =3D xstrdup(data_path);
+
+	/* Defaults */
+	dev.pkg_id =3D -1; // not availeble in /sys/class/intel_pmt
+	dev.die_id =3D -1; // not available in /sys/class/intel_pmt
+
+	/* Get guid */
+	ret =3D read_u32_hex_attr(devpath, "guid", &raw_guid, PMTCTL_ERR_DEVICE);
+	if (ret)
+		return log_ret(ret, "unable to read guid for %s", devpath);
+
+	dev.guid =3D pmt_guid_intern(raw_guid);
+	if (!dev.guid)
+		return log_ret(-ENOMEM, "could not intern guid 0x%08x", raw_guid);
+
+	/* Compute instances */
+	ret =3D next_guid_instance_global(raw_guid);
+	if (ret < 0)
+		return ret;
+
+	dev.guid_inst =3D ret;
+
+	ret =3D next_guid_instance_device(dev_index, raw_guid);
+	if (ret < 0)
+		return ret;
+
+	dev.dev_inst =3D ret;
+
+	/* Don't open telem file yet - defer until first read */
+	dev.fd =3D -1;
+
+	/* Append to global array */
+	struct pmt_device *tmp;
+
+	tmp =3D realloc(devices, (device_count + 1) * sizeof(*devices));
+	if (!tmp)
+		return log_ret(-ENOMEM, "could not add telem device %s", devpath);
+
+	dev.name =3D temp_name;
+	dev.path =3D temp_path;
+	dev.data_path =3D temp_data_path;
+
+	temp_name =3D NULL;
+	temp_path =3D NULL;
+	temp_data_path =3D NULL;
+
+	devices =3D tmp;
+	devices[device_count++] =3D dev;
+
+	return 0;
+}
+
+static int telem_scan_intel_pmt(void)
+{
+	DIR *aux_dir =3D opendir(PMT_TELEM_AUX_DIR);
+	struct dirent *aux_de;
+	int dev_index =3D 0;
+
+	if (!aux_dir) {
+		log_debug("error opening %s: %s", PMT_TELEM_AUX_DIR, strerror(errno));
+		return -errno;
+	}
+
+	while ((aux_de =3D readdir(aux_dir))) {
+		char intel_pmt_path[PATH_MAX];
+		struct dirent *pmt_de;
+		DIR *pmt_dir;
+		ssize_t len;
+
+		/* skip . and .. */
+		if (aux_de->d_name[0] =3D=3D '.')
+			continue;
+
+		len =3D snprintf(intel_pmt_path, sizeof(intel_pmt_path),
+			       "%s/%s/" PMT_TELEM_PMT_DIR,
+			       PMT_TELEM_AUX_DIR, aux_de->d_name);
+
+		if (len < 0 || (size_t)len >=3D sizeof(intel_pmt_path))
+			continue;
+
+		pmt_dir =3D opendir(intel_pmt_path);
+		if (!pmt_dir)
+			continue;
+
+		while ((pmt_de =3D readdir(pmt_dir)) !=3D NULL) {
+			char telem_path[PATH_MAX];
+			int ret;
+
+			/* only telem* directories */
+			if (strncmp(pmt_de->d_name, PMT_TELEM_DATA_FILE,
+				    strlen(PMT_TELEM_DATA_FILE)) !=3D 0)
+				continue;
+
+			len =3D snprintf(telem_path, sizeof(telem_path),
+				       "%s/%s", intel_pmt_path, pmt_de->d_name);
+			if (len < 0 || (size_t)len >=3D sizeof(telem_path))
+				continue;
+
+			ret =3D telem_add_device(telem_path, pmt_de->d_name, dev_index);
+			if (ret)
+				log_warn("unable to add telem device %s (ret=3D%d)",
+					 telem_path, ret);
+		}
+
+		closedir(pmt_dir);
+		dev_index++;
+	}
+	closedir(aux_dir);
+
+	if (device_count =3D=3D 0)
+		return PMTCTL_ERR_NOTFOUND;
+
+	return 0;
+}
+
+static int telem_init(void)
+{
+	int ret;
+
+	if (device_initialized)
+		return 0;
+
+	ret =3D telem_scan_intel_pmt();
+	if (ret)
+		return ret;
+
+	device_initialized =3D 1;
+
+	return 0;
+}
+
+static void telem_cleanup(void)
+{
+	int i;
+
+	if (!device_initialized)
+		return;
+
+	for (i =3D 0; i < device_count; i++) {
+		if (devices[i].fd >=3D 0)
+			close(devices[i].fd);
+
+		free(devices[i].name);
+		free(devices[i].path);
+		free(devices[i].data_path);
+	}
+
+	free(guid_counters);
+	guid_counters =3D NULL;
+	guid_counter_cnt =3D 0;
+
+	free(dev_guid_counters);
+	dev_guid_counters =3D NULL;
+	dev_guid_counter_cnt =3D 0;
+
+	free(devices);
+	devices =3D NULL;
+	device_count =3D 0;
+	device_initialized =3D 0;
+}
+
+struct pmt_device_ops device_telem_ops =3D {
+	.dev_type    =3D PMT_DEVICE_TELEM,
+	.init        =3D telem_init,
+	.cleanup     =3D telem_cleanup,
+	.read        =3D telem_read,
+	.device_list =3D telem_device_list,
+};
--=20
2.43.0

