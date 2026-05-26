Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2076D3DCDBD;
	Tue, 26 May 2026 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791741; cv=none; b=ui2t76+NVdTOPdVSyz9Fp9+CPAcFgr+rQRuOUheGFgm4zlw5OFqCjJ3VaQwFUT58P2w1Ax0NZ678ypKCBy/jWSTRt2dcyGNTVsEQJkIYq/xg8ODEOL4mkUZYov4/hjgFstmv0cmqEETUiSSM3uSQtaDgk4tFBo+KsruqY6hODQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791741; c=relaxed/simple;
	bh=dUCvL0bKKT9OxRtuKITwYLT8R8ADxzgWo0OL8ybpCjM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SKoIPSLNIOIcdm2kBD13/JUYWc6xNTVLl86V2Hxom7kOjrnj0SWHQHDMfy7NjXlxOBvYO1ldgUCSL+Ev2RXq50ZaZ6GfZ2SgK9NPvtFYz1sOugntUKIvzaq8G7Crr/6S/No/BELIylDKXaMIF3smi4Dr9pHXdbs41RdxqsrWBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIVL3zpU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIVL3zpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779791739; x=1811327739;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dUCvL0bKKT9OxRtuKITwYLT8R8ADxzgWo0OL8ybpCjM=;
  b=EIVL3zpUFBYI/GjiwiedW1lyzkjdYikgaMXKVsb9Si1xHohLe0zYMJur
   Mq4CetYQpQZ0bUwwpU5lyMepiNqV50f9YU32273yyKfq/mg64fMqbMg3z
   W7LEIvGS6UNiGlUcrmVDbBq73MEZQLXPmkTODkG8Gil3/6lLTLMBsBq9q
   n8kvc6mNtBIllfIMe/LibpRalaCvdJL23fjBWIwmQSm1ywBFqUJ/2Ospj
   tEdwtyE/fdgl+70Q9OLANfNkgMI7yhckW+XnHVKVbJwKGfbInDz0rGh0W
   +FTO8fJhQV5dX3dE6BP6Uwwk85nBt2qdlfuiqqTQj/H/Q9xC8DXOX+BKF
   Q==;
X-CSE-ConnectionGUID: 9lqj6CtpSViiEib+cZpqtw==
X-CSE-MsgGUID: Udnyl7JZRqWY8TeRIrmQNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="103277580"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="103277580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:35:39 -0700
X-CSE-ConnectionGUID: Di09ZCXnRo2wYmXLJU4mRQ==
X-CSE-MsgGUID: TsZ6XXacSGyhM+3abdr5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="280006052"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:35:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 13:35:33 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 05/17] tools/arch/x86/pmtctl: Add libpmtctl device
 enumeration backend
In-Reply-To: <20260526014719.2248380-6-david.e.box@linux.intel.com>
Message-ID: <01e25d19-0d9d-d3a4-08b1-dc9ca7b22438@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com> <20260526014719.2248380-6-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 May 2026, David E. Box wrote:

> Add a sysfs-based backend for enumerating Intel PMT telemetry devices,
> enabling libpmtctl to discover and access hardware telemetry data at
> runtime without hardcoded device paths.
> 
> Intel PMT telemetry devices are exposed under
> /sys/bus/auxiliary/drivers/pmt_telemetry. This backend walks those sysfs
> entries to discover device metadata and data paths, populating per-device
> descriptors used by the metric access layer.
> 
> Introduce a pmt_device_ops vtable to allow additional enumeration backends
> or PMT transport types to be added without changing the calling code.
> 
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  tools/arch/x86/pmtctl/include/lib/device.h |  53 +++
>  tools/arch/x86/pmtctl/lib/device_telem.c   | 371 +++++++++++++++++++++
>  2 files changed, 424 insertions(+)
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/device.h
>  create mode 100644 tools/arch/x86/pmtctl/lib/device_telem.c
> 
> diff --git a/tools/arch/x86/pmtctl/include/lib/device.h b/tools/arch/x86/pmtctl/include/lib/device.h
> new file mode 100644
> index 000000000000..5bee487e9b99
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/device.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_DEVICES_H
> +#define PMTCTL_DEVICES_H
> +
> +#include <stdint.h>
> +
> +#include "metrics_db.h"
> +#include "pmtctl_types.h"
> +
> +#define PMT_SAMPLE_SIZE 8
> +
> +/* --- Device representation returned by any device --- */
> +struct pmt_device {
> +	const struct pmt_guid *guid;   /* per-GUID metadata (interned) */
> +	int        guid_inst;    /* global guid instance */
> +	int        dev_inst;     /* local device instance */
> +
> +	char      *name;         /* e.g. "pmt_ep_27971628_0" or "telem0" */
> +	char      *path;         /* e.g. "/sys/class/intel_pmt/telem0" */
> +	char      *data_path;    /* readable metric data path for this device */
> +	int        instance;     /* 0, 1, etc. */

Inconsistent alignment.

These are using spaces to align.

> +	int        pkg_id;       /* Package/Socket ID if known, else -1 */
> +	int        die_id;       /* Die ID if known, else -1 */
> +
> +	int        fd;           /* telem file fd */
> +};
> +
> +struct pmt_metric_desc {
> +	const struct pmt_metric_def *def;
> +	struct pmt_device *dev;
> +
> +	const char *name; /* JSON name */
> +	int guid_inst; /* global GUID instance (matches pmt_device.guid_inst) */
> +
> +	/* raw mode fields */
> +	uint32_t raw_sample_id;
> +	uint8_t  raw_lsb;
> +	uint8_t  raw_msb;

Extra spaces.

> +
> +};
> +
> +struct pmt_device_ops {
> +	enum pmt_device_type dev_type;
> +	int  (*init)(void);
> +	void (*cleanup)(void);
> +	int  (*read)(struct pmt_metric_desc *m, uint64_t *val);

It seems pretty random when things are aligned with extra spaces and when 
not.

> +	struct pmt_device *(*device_list)(int *count);
> +};
> +
> +extern struct pmt_device_ops device_telem_ops;
> +
> +#endif
> diff --git a/tools/arch/x86/pmtctl/lib/device_telem.c b/tools/arch/x86/pmtctl/lib/device_telem.c
> new file mode 100644
> index 000000000000..4c90dc95890f
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/lib/device_telem.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#define LOG_PREFIX "telem"
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +
> +#include "lib/common.h"
> +#include "lib/device.h"
> +#include "lib/log.h"
> +
> +#define PMT_TELEM_AUX_DIR    "/sys/bus/auxiliary/drivers/pmt_telemetry"
> +#define PMT_TELEM_PMT_DIR    "intel_pmt"
> +#define PMT_TELEM_DATA_FILE  "telem"
> +
> +static struct pmt_device *devices;
> +static int device_count;
> +static int device_initialized;
> +
> +static int telem_read(struct pmt_metric_desc *m, uint64_t *val)
> +{
> +	uint64_t raw;
> +	uint64_t mask;
> +	uint8_t width;
> +	ssize_t n;
> +	off_t off;
> +	uint32_t sample_id;
> +	uint8_t  lsb, msb;

Extra space.

> +
> +	if (!m || !val || !m->dev)
> +		log_bug_and_exit("unexpected NULL parameters");
> +
> +	/* Open the telem file on first read */
> +	if (m->dev->fd < 0) {
> +		int fd;
> +
> +		if (!m->dev->data_path)
> +			return log_ret(-EINVAL, "missing data path for %s", m->dev->name);
> +
> +		fd = open(m->dev->data_path, O_RDONLY | O_CLOEXEC);

Is CLOEXEC required? (I don't know the general structure of this program.)

> +		if (fd == -1)
> +			return log_ret(-errno, "could not open telem file %s", m->dev->data_path);
> +
> +		m->dev->fd = fd;
> +	}
> +
> +	if (m->def) {
> +		sample_id = m->def->sample_id;
> +		lsb       = m->def->lsb;
> +		msb       = m->def->msb;
> +	} else {
> +		sample_id = m->raw_sample_id;
> +		lsb       = m->raw_lsb;
> +		msb       = m->raw_msb;
> +	}
> +
> +	if (msb > 63 || lsb > msb)

Isn't that 63 a bit index? It should be written without literals.

> +		return PMTCTL_ERR_DEVICE;
> +
> +	off = (off_t)sample_id * PMT_SAMPLE_SIZE;
> +
> +	n = pread(m->dev->fd, &raw, sizeof(raw), off);
> +	if (n == -1) {
> +		log_err_once(-errno, "unable to read telem %s", m->dev->name);
> +		return -errno;
> +	}
> +
> +	if (n != (ssize_t)sizeof(raw)) {

If casting after error n checking, shouldn't the case be other way around?

> +		log_err_once(-EIO, "read expected %zu bytes, got %zd (dev=%s)",
> +			     sizeof(raw), n, m->dev->name);
> +		return -EIO;
> +	}
> +
> +	if (lsb == 0 && msb == 63) {
> +		*val = raw;
> +		return 0;
> +	}

Is this optimization useful?

> +	width = msb - lsb + 1;
> +	if (width >= 64)

How can this happen?

> +		mask = ~0ULL;
> +	else
> +		mask = (1ULL << width) - 1ULL;

Is shifting by 64 undefined behavior? If it's not, then it looks to me 
that this is all you need?

> +
> +	*val = (raw >> lsb) & mask;
> +
> +	return 0;
> +}
> +
> +static struct pmt_device *telem_device_list(int *count)
> +{
> +	if (!count || !device_initialized)
> +		return NULL;
> +
> +	*count = device_count;
> +
> +	return devices;
> +}
> +
> +/* ----------------- per-GUID instance tracking ----------------- */
> +struct guid_counter {
> +	uint32_t guid;
> +	int      next_guid_inst;
> +};
> +
> +struct dev_guid_counter {
> +	int      dev_index;
> +	uint32_t guid;
> +	int      next_dev_inst;
> +};
> +
> +static struct guid_counter     *guid_counters;
> +static int                      guid_counter_cnt;
> +
> +static struct dev_guid_counter *dev_guid_counters;
> +static int                      dev_guid_counter_cnt;
> +/* -------------------------------------------------------------- */
> +
> +static int next_guid_instance_global(uint32_t guid)
> +{
> +	struct guid_counter *tmp;
> +	int inst = 0;
> +	int i;
> +
> +	for (i = 0; i < guid_counter_cnt; i++) {
> +		if (guid_counters[i].guid == guid) {
> +			inst = guid_counters[i].next_guid_inst;
> +			guid_counters[i].next_guid_inst++;
> +			return inst;
> +		}
> +	}
> +
> +	/* new guid, start at 0 */
> +	tmp = realloc(guid_counters, (guid_counter_cnt + 1) * sizeof(*guid_counters));

This realloc by +1 seems really endemic and I'm not convinced its good 
way to handle things.

> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	guid_counters = tmp;
> +	guid_counters[guid_counter_cnt].guid = guid;
> +	guid_counters[guid_counter_cnt].next_guid_inst = 1;
> +	guid_counter_cnt++;
> +
> +	return inst;
> +}
> +
> +static int next_guid_instance_device(int dev_index, uint32_t guid)
> +{
> +	struct dev_guid_counter *tmp;
> +	int inst = 0;
> +	int i;
> +
> +	for (i = 0; i < dev_guid_counter_cnt; i++) {
> +		if (dev_guid_counters[i].dev_index == dev_index &&
> +		    dev_guid_counters[i].guid == guid) {
> +			inst = dev_guid_counters[i].next_dev_inst;
> +			dev_guid_counters[i].next_dev_inst++;
> +			return inst;
> +		}
> +	}
> +
> +	/* new (dev_index, guid) pair */
> +	tmp = realloc(dev_guid_counters, (dev_guid_counter_cnt + 1) * sizeof(*dev_guid_counters));
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	dev_guid_counters = tmp;
> +	dev_guid_counters[dev_guid_counter_cnt].dev_index = dev_index;
> +	dev_guid_counters[dev_guid_counter_cnt].guid = guid;
> +	dev_guid_counters[dev_guid_counter_cnt].next_dev_inst = 1;
> +	dev_guid_counter_cnt++;
> +
> +	return inst;
> +}
> +
> +static int telem_add_device(const char *devpath, const char *devname, int dev_index)
> +{
> +	struct pmt_device dev = { 0 };

= {} is enough to initialize.

> +
> +	auto_free char *temp_name = NULL;
> +	auto_free char *temp_path = NULL;
> +	auto_free char *temp_data_path = NULL;
> +	char data_path[PATH_MAX];
> +	uint32_t raw_guid;
> +	int len;
> +	int ret;
> +
> +	if (!devpath || !devname)
> +		return -EINVAL;
> +
> +	temp_name = xstrdup(devname);
> +	temp_path = xstrdup(devpath);
> +
> +	len = snprintf(data_path, sizeof(data_path), "%s/" PMT_TELEM_DATA_FILE, devpath);
> +	if (len < 0 || (size_t)len >= sizeof(data_path))
> +		return log_ret(-EINVAL, "path too long for %s", devname);
> +
> +	temp_data_path = xstrdup(data_path);

Why you first write to stack and then strdup() instead of doing it 
directly?

> +
> +	/* Defaults */
> +	dev.pkg_id = -1; // not availeble in /sys/class/intel_pmt
> +	dev.die_id = -1; // not available in /sys/class/intel_pmt
> +
> +	/* Get guid */
> +	ret = read_u32_hex_attr(devpath, "guid", &raw_guid, PMTCTL_ERR_DEVICE);
> +	if (ret)
> +		return log_ret(ret, "unable to read guid for %s", devpath);
> +
> +	dev.guid = pmt_guid_intern(raw_guid);
> +	if (!dev.guid)
> +		return log_ret(-ENOMEM, "could not intern guid 0x%08x", raw_guid);
> +
> +	/* Compute instances */
> +	ret = next_guid_instance_global(raw_guid);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev.guid_inst = ret;
> +
> +	ret = next_guid_instance_device(dev_index, raw_guid);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev.dev_inst = ret;
> +
> +	/* Don't open telem file yet - defer until first read */
> +	dev.fd = -1;
> +
> +	/* Append to global array */
> +	struct pmt_device *tmp;
> +
> +	tmp = realloc(devices, (device_count + 1) * sizeof(*devices));
> +	if (!tmp)
> +		return log_ret(-ENOMEM, "could not add telem device %s", devpath);
> +
> +	dev.name = temp_name;
> +	dev.path = temp_path;
> +	dev.data_path = temp_data_path;
> +
> +	temp_name = NULL;
> +	temp_path = NULL;
> +	temp_data_path = NULL;
> +
> +	devices = tmp;
> +	devices[device_count++] = dev;
> +
> +	return 0;
> +}
> +
> +static int telem_scan_intel_pmt(void)
> +{
> +	DIR *aux_dir = opendir(PMT_TELEM_AUX_DIR);
> +	struct dirent *aux_de;
> +	int dev_index = 0;
> +
> +	if (!aux_dir) {
> +		log_debug("error opening %s: %s", PMT_TELEM_AUX_DIR, strerror(errno));
> +		return -errno;
> +	}
> +
> +	while ((aux_de = readdir(aux_dir))) {
> +		char intel_pmt_path[PATH_MAX];
> +		struct dirent *pmt_de;
> +		DIR *pmt_dir;
> +		ssize_t len;
> +
> +		/* skip . and .. */
> +		if (aux_de->d_name[0] == '.')
> +			continue;
> +
> +		len = snprintf(intel_pmt_path, sizeof(intel_pmt_path),
> +			       "%s/%s/" PMT_TELEM_PMT_DIR,
> +			       PMT_TELEM_AUX_DIR, aux_de->d_name);
> +
> +		if (len < 0 || (size_t)len >= sizeof(intel_pmt_path))

No emptylines between call and its error handling.

> +			continue;
> +
> +		pmt_dir = opendir(intel_pmt_path);
> +		if (!pmt_dir)
> +			continue;
> +
> +		while ((pmt_de = readdir(pmt_dir)) != NULL) {
> +			char telem_path[PATH_MAX];
> +			int ret;
> +
> +			/* only telem* directories */
> +			if (strncmp(pmt_de->d_name, PMT_TELEM_DATA_FILE,
> +				    strlen(PMT_TELEM_DATA_FILE)) != 0)

I tried to figure out if strncmp() can be replaced with strcmp() but I was 
left unsure. It seems telem_add_device() adds '/' to it which would 
indicate n variant is not required (and the comment is misleadingly 
lacking that /).

> +				continue;
> +
> +			len = snprintf(telem_path, sizeof(telem_path),
> +				       "%s/%s", intel_pmt_path, pmt_de->d_name);
> +			if (len < 0 || (size_t)len >= sizeof(telem_path))
> +				continue;
> +
> +			ret = telem_add_device(telem_path, pmt_de->d_name, dev_index);
> +			if (ret)
> +				log_warn("unable to add telem device %s (ret=%d)",
> +					 telem_path, ret);
> +		}
> +
> +		closedir(pmt_dir);
> +		dev_index++;
> +	}
> +	closedir(aux_dir);
> +
> +	if (device_count == 0)
> +		return PMTCTL_ERR_NOTFOUND;
> +
> +	return 0;
> +}
> +
> +static int telem_init(void)
> +{
> +	int ret;
> +
> +	if (device_initialized)
> +		return 0;
> +
> +	ret = telem_scan_intel_pmt();
> +	if (ret)
> +		return ret;
> +
> +	device_initialized = 1;
> +
> +	return 0;
> +}
> +
> +static void telem_cleanup(void)
> +{
> +	int i;
> +
> +	if (!device_initialized)
> +		return;
> +
> +	for (i = 0; i < device_count; i++) {
> +		if (devices[i].fd >= 0)
> +			close(devices[i].fd);
> +
> +		free(devices[i].name);
> +		free(devices[i].path);
> +		free(devices[i].data_path);
> +	}
> +
> +	free(guid_counters);
> +	guid_counters = NULL;
> +	guid_counter_cnt = 0;
> +
> +	free(dev_guid_counters);
> +	dev_guid_counters = NULL;
> +	dev_guid_counter_cnt = 0;
> +
> +	free(devices);
> +	devices = NULL;
> +	device_count = 0;
> +	device_initialized = 0;
> +}
> +
> +struct pmt_device_ops device_telem_ops = {
> +	.dev_type    = PMT_DEVICE_TELEM,
> +	.init        = telem_init,
> +	.cleanup     = telem_cleanup,
> +	.read        = telem_read,
> +	.device_list = telem_device_list,
> +};
> 

-- 
 i.

