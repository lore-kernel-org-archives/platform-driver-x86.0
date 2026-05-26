Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B73D1CB2;
	Tue, 26 May 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790014; cv=none; b=YTOsFiL6Nf4RAtQLbFlRM4o634H6LriYjs80E1EBzYP11vg4SAWYtWDzEVEq9dIGT1C/OE8vy1Lyiak498AFVxQQrBCCMXjxbH07saKwBHWdytqSHatzt5fzq2nKKcCuK3bSKIZn97S3AHfKBhasJP2UChB9VR/rOiUxk7ebXFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790014; c=relaxed/simple;
	bh=syiIo+51FIKNr0lfBEct4aoRhdwMWGgDkMhekt7LarU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZGNwkDCVWQdzuZXz0f6t4e98QkejcKoesjl9Vs98CcGsrD+R1vgianyIfv2LIKO84g8jeFiiacrBJbhJ7hYjxgj/aCoct6A3QZko5m87F+dWZcahY8l7NU5BX5i5/n8zo303kz15iQxbHHIYkPE6GgTF3WaziT5j60CeAGJvy2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CniVa78q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CniVa78q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779790013; x=1811326013;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=syiIo+51FIKNr0lfBEct4aoRhdwMWGgDkMhekt7LarU=;
  b=CniVa78qMe5r1YuWCYGFAHxdLvFxlxDrM8fNWDfSz9lHdHioEKYjVDGW
   DAzXPWveRDTT0Vh6C+5gTAzAlEnYDFzHhM0t4c34K9eKyB3Tp2+0yEZNb
   kmV3lru5A3KBaH50gPmGnBzoufSJbViMN3D4GsjRhL1ODxikgdi8oUQ6C
   qxafd9iCBiKTnIY/gcnCS9PvDX6j6kbJXUnAB3UCts07brFlq+vLXQYNL
   hkDzcCNFIncvuBSdhXp2Ll+IcwbpGqTkNWwaAJgRSeHorj5Fm5o7B0Kms
   yOhpp/fa7Llt5m1M8UdaCMlznj4pNo55eYwrVNiD6vJRlwe3r5G0stUKD
   g==;
X-CSE-ConnectionGUID: rH59cWj1TwCjG19CBNUR7w==
X-CSE-MsgGUID: jew4KCEtTdK31ixktDYDiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80713356"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80713356"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:06:52 -0700
X-CSE-ConnectionGUID: zbkhK4kVSZCeRx8KlRGuqg==
X-CSE-MsgGUID: /rBbNbuCTZKHsgMNAlIrOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="279999970"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:06:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 13:06:46 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 04/17] tools/arch/x86/pmtctl: Add libpmtctl metric
 definition database
In-Reply-To: <20260526014719.2248380-5-david.e.box@linux.intel.com>
Message-ID: <2927c82d-e4fc-8a6a-41d3-fd182b40b997@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com> <20260526014719.2248380-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 May 2026, David E. Box wrote:

> Add a growable container for PMT metric definitions to support loading and
> querying hardware metric descriptors at runtime.
> 
> PMT metrics vary by platform and are discovered dynamically from sysfs. A
> block-based database allows metric definitions to be appended as they are
> parsed, without requiring the final size to be known in advance, while
> bounding individual memory allocations.
> 
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  .../arch/x86/pmtctl/include/lib/metrics_db.h  | 69 +++++++++++++++++++
>  tools/arch/x86/pmtctl/lib/metrics_db.c        | 62 +++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/metrics_db.h
>  create mode 100644 tools/arch/x86/pmtctl/lib/metrics_db.c
> 
> diff --git a/tools/arch/x86/pmtctl/include/lib/metrics_db.h b/tools/arch/x86/pmtctl/include/lib/metrics_db.h
> new file mode 100644
> index 000000000000..9dff27d8785a
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/metrics_db.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_METRICS_DB_H
> +#define PMTCTL_METRICS_DB_H
> +
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +
> +#include "lib/pmt_guid.h"
> +
> +/* Metric definition from builtin or JSON */
> +struct pmt_metric_def {
> +	const char *event_name;
> +	const char *description;
> +	const char *group;
> +	const char *platform_group;
> +
> +	const struct pmt_guid *guid;
> +	uint32_t sample_id;
> +	uint8_t  lsb;
> +	uint8_t  msb;
> +};
> +
> +struct pmt_metrics_block {
> +	const struct pmt_metric_def *defs;
> +	int count;
> +	bool is_builtin;
> +};
> +
> +struct pmt_metrics_db {
> +	struct pmt_metrics_block *blocks;
> +	int nblocks;
> +	int total;   /* sum of all block->count */
> +};
> +
> +/* Treat DB as a flat array [0..total-1] */
> +static inline const struct pmt_metric_def *pmt_metrics_at(const struct pmt_metrics_db *db, int idx)

inline???

> +{
> +	if (!db || idx < 0 || idx >= db->total)
> +		return NULL;
> +
> +	for (int i = 0; i < db->nblocks; i++) {
> +		if (idx < db->blocks[i].count)
> +			return &db->blocks[i].defs[idx];
> +		idx -= db->blocks[i].count;
> +	}
> +	return NULL;
> +}
> +
> +static inline const struct pmt_metrics_block *
> +pmt_metrics_block_for(const struct pmt_metrics_db *db, int idx)
> +{
> +	if (!db || idx < 0 || idx >= db->total)
> +		return NULL;
> +
> +	for (int i = 0; i < db->nblocks; i++) {
> +		if (idx < db->blocks[i].count)
> +			return &db->blocks[i];
> +		idx -= db->blocks[i].count;
> +	}
> +
> +	return NULL;
> +}

Code duplication.

> +
> +int pmt_metrics_add_block(struct pmt_metrics_db *db, const struct pmt_metric_def *defs,
> +			  int count, bool is_builtin);
> +void pmt_metrics_free(struct pmt_metrics_db *db);
> +
> +#endif
> diff --git a/tools/arch/x86/pmtctl/lib/metrics_db.c b/tools/arch/x86/pmtctl/lib/metrics_db.c
> new file mode 100644
> index 000000000000..82e8121a1b98
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/lib/metrics_db.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <errno.h>
> +#include <limits.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "lib/metrics_db.h"
> +
> +int pmt_metrics_add_block(struct pmt_metrics_db *db, const struct pmt_metric_def *defs,
> +			  int count, bool is_builtin)
> +{
> +	struct pmt_metrics_block *blocks;
> +	size_t alloc_size;
> +	int new_cap;
> +
> +	if (!db || !defs || count <= 0)
> +		return -EINVAL;
> +
> +	if (db->nblocks > INT_MAX - 1)
> +		return -EOVERFLOW;
> +
> +	if (db->total > INT_MAX - count)
> +		return -EOVERFLOW;
> +
> +	new_cap = db->nblocks + 1;
> +
> +	if ((size_t)new_cap > SIZE_MAX / sizeof(*blocks))

Casts like this likely indicates some typing issue in your code.

> +		return -EOVERFLOW;
> +
> +	alloc_size = (size_t)new_cap * sizeof(*blocks);
> +
> +	blocks = realloc(db->blocks, alloc_size);

So this reallocs + 1 every time??

> +	if (!blocks)
> +		return -ENOMEM;
> +
> +	db->blocks = blocks;
> +
> +	db->blocks[db->nblocks].defs       = defs;
> +	db->blocks[db->nblocks].count      = count;
> +	db->blocks[db->nblocks].is_builtin = is_builtin;
> +
> +	db->nblocks++;
> +	db->total += count;
> +
> +	return 0;
> +}
> +
> +void pmt_metrics_free(struct pmt_metrics_db *db)
> +{
> +	if (!db)
> +		return;
> +
> +	if (db->blocks) {
> +		for (int i = 0; i < db->nblocks; i++) {
> +			if (!db->blocks[i].is_builtin && db->blocks[i].defs)
> +				free((void *)db->blocks[i].defs);
> +		}
> +		free(db->blocks);
> +	}
> +
> +	memset(db, 0, sizeof(*db));

-- 
 i.

