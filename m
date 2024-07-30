Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E881E49B
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722344924; cv=none; b=dtr5QcQ2dtu9iCUbKrcyuc8vIowcnEh034IzG9/C0ARCG9nLfDi7nUZUXiNI5MkZV5sgBcE+nNMmLorzIpQ7EcM9JcNKmivwOGn2H1sLfG8POjzNTMcrFPqYVscfMgT1isv1pcdvsDwAbux+kzMoIxsKFssPtGv1Upx2ZXDStso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722344924; c=relaxed/simple;
	bh=kXHsngvLMHbKUo74eaPPTn59Iw6JvDdMAWOnM4zV3js=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AaELobr4+ts5A4vy0CFpDqzX5tX7F0FEZ3Eeum+TVdOsBQin9H0ninZDk1jXVP50kvM8FoPLBmvD1N7BAFI9f3GncaF9HoGySEnXcGiM6yM8CcOyXMN9P2gSmjJshK3rzAMJJcfLycIzfgUlQCUK/ImJrW8A+fdWDAAEPqA5QFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQuJ6Z6o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQuJ6Z6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722344923; x=1753880923;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kXHsngvLMHbKUo74eaPPTn59Iw6JvDdMAWOnM4zV3js=;
  b=kQuJ6Z6oe+ViKq5ktImEaO+f5iXts1XgqM9bDD5TYZJ1ckilWwiFwDHM
   LnQVaEt00F2F4irvsTymTVNjMqOUMArnUNEF91YBaYVsbvKlyj+DqNEfV
   LanxJHP6yNGeeOYmAUACEQ5e6vMi6IvgdFVzKrsYui9bC4KwqN+eMLJ47
   JC3e1wilwh/J5QskxgCVtEUBgSwf1984263YnSHa8ZF6LvUbq3QulQc5v
   0tV9NSh7uEUVG+TlMxwDGB0B+biEPb3XZX7ZMW2YBQfA4kGfhE11MSoSv
   dvi/UQ9VPDp/GOqsQ4nElkD29FnemcoNDkQHtljj2b9x5wIeCsxILgPzK
   Q==;
X-CSE-ConnectionGUID: pghe120TSG6fgxZeA69MQQ==
X-CSE-MsgGUID: QBFP7CBwSTqTcc19lmCW4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31304809"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="31304809"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 06:08:42 -0700
X-CSE-ConnectionGUID: WLQHKpFnRp2kabf6edsWDg==
X-CSE-MsgGUID: AsiOzD1fT4679Gz/h+KeJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54315873"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 06:08:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Jul 2024 16:08:34 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, 
    "Brost, Matthew" <matthew.brost@intel.com>, 
    "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
In-Reply-To: <IA1PR11MB6418A4F423C1D099EA5A2395C1B02@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <9c8cbcf0-1f9b-64c6-9dc5-110f09f98d1d@linux.intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com> <20240725122346.4063913-6-michael.j.ruhl@intel.com> <IA1PR11MB6418A4F423C1D099EA5A2395C1B02@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Jul 2024, Ruhl, Michael J wrote:

> >-----Original Message-----
> >From: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Sent: Thursday, July 25, 2024 8:24 AM
> >To: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> >david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com; Brost, Matthew
> ><matthew.brost@intel.com>; andriy.shevchenko@linux.intel.com
> >Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Subject: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
> >adjust
> >
> >DVSEC offsets are based on the endpoint BAR.  If an endpoint is
> >not available allow the offset information to be adjusted by the
> >parent driver.
> 
> Hello,
> 
> Any further comments or questions WRT this patch?

Hi,

Please don't send take notice of my patch/series asap emails. Especially 
this close to the original sending, at minimum wait at least 2 weeks. But 
in case of platform-drivers-x86, that's hardly necessary even then as we 
don't forget patches, they're tracked in patchwork which is kept up to 
date. You can find you if your patch is still in the queue from the 
patchwork, if it is, we'll get to it eventually.

A maintainer (or some reviewer, if we're lucky :-)) will get to your 
patch/series eventually. People just have many things to do and have to 
prioritize their time. We're barely past the merge window so there's 
plenty of time in this cycle and this tends to be the busiest time of the 
cycle.

-- 
 i.

> >Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >---
> > drivers/platform/x86/intel/pmt/class.h     | 1 +
> > drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
> > drivers/platform/x86/intel/vsec.c          | 1 +
> > include/linux/intel_vsec.h                 | 3 +++
> > 4 files changed, 14 insertions(+)
> >
> >diff --git a/drivers/platform/x86/intel/pmt/class.h
> >b/drivers/platform/x86/intel/pmt/class.h
> >index a267ac964423..984cd40ee814 100644
> >--- a/drivers/platform/x86/intel/pmt/class.h
> >+++ b/drivers/platform/x86/intel/pmt/class.h
> >@@ -46,6 +46,7 @@ struct intel_pmt_entry {
> > 	void __iomem		*base;
> > 	struct pmt_callbacks	*cb;
> > 	unsigned long		base_addr;
> >+	s32			base_adjust;
> > 	size_t			size;
> > 	u32			guid;
> > 	int			devid;
> >diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
> >b/drivers/platform/x86/intel/pmt/telemetry.c
> >index c9feac859e57..88e4f1315097 100644
> >--- a/drivers/platform/x86/intel/pmt/telemetry.c
> >+++ b/drivers/platform/x86/intel/pmt/telemetry.c
> >@@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct
> >intel_pmt_entry *entry,
> > 	header->access_type = TELEM_ACCESS(readl(disc_table));
> > 	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
> > 	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
> >+	if (entry->base_adjust) {
> >+		u32 new_base = header->base_offset + entry->base_adjust;
> >+
> >+		dev_dbg(dev, "Adjusting base offset from 0x%x to 0x%x\n",
> >+			header->base_offset, new_base);
> >+		header->base_offset = new_base;
> >+	}
> >
> > 	/* Size is measured in DWORDS, but accessor returns bytes */
> > 	header->size = TELEM_SIZE(readl(disc_table));
> >@@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device
> >*auxdev, const struct auxilia
> > 	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
> > 		struct intel_pmt_entry *entry = &priv->entry[priv-
> >>num_entries];
> >
> >+		entry->base_adjust = intel_vsec_dev->base_adjust;
> >+
> > 		mutex_lock(&ep_lock);
> > 		ret = intel_pmt_dev_create(entry, &pmt_telem_ns,
> >intel_vsec_dev, i);
> > 		mutex_unlock(&ep_lock);
> >diff --git a/drivers/platform/x86/intel/vsec.c
> >b/drivers/platform/x86/intel/vsec.c
> >index 7b5cc9993974..be079d62a7bc 100644
> >--- a/drivers/platform/x86/intel/vsec.c
> >+++ b/drivers/platform/x86/intel/vsec.c
> >@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev,
> >struct intel_vsec_header *he
> > 	intel_vsec_dev->num_resources = header->num_entries;
> > 	intel_vsec_dev->quirks = info->quirks;
> > 	intel_vsec_dev->base_addr = info->base_addr;
> >+	intel_vsec_dev->base_adjust = info->base_adjust;
> > 	intel_vsec_dev->priv_data = info->priv_data;
> >
> > 	if (header->id == VSEC_ID_SDSI)
> >diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> >index 11ee185566c3..75d17fa10d05 100644
> >--- a/include/linux/intel_vsec.h
> >+++ b/include/linux/intel_vsec.h
> >@@ -88,6 +88,7 @@ struct pmt_callbacks {
> >  * @caps:      bitmask of PMT capabilities for the given headers
> >  * @quirks:    bitmask of VSEC device quirks
> >  * @base_addr: allow a base address to be specified (rather than derived)
> >+ * @base_adjust: allow adjustment to base offset information
> >  */
> > struct intel_vsec_platform_info {
> > 	struct device *parent;
> >@@ -96,6 +97,7 @@ struct intel_vsec_platform_info {
> > 	unsigned long caps;
> > 	unsigned long quirks;
> > 	u64 base_addr;
> >+	s32 base_adjust;
> > };
> >
> > /**
> >@@ -121,6 +123,7 @@ struct intel_vsec_device {
> > 	size_t priv_data_size;
> > 	unsigned long quirks;
> > 	u64 base_addr;
> >+	s32 base_adjust;
> > };
> >
> > int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> >--
> >2.44.0
> 

