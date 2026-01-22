Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE89258CD9;
	Thu, 22 Jan 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096555; cv=none; b=GcbrOuK3m9zkrrnWARlhfGn7AHgqc6XY3K0/6iraFicqEC3R9e+BDksSNAneOgChuZjJZL13t/4KUBwwgsutqw1gLDwe3OqND0B+TuWLW4ni8wecx7WsedT0vP4AO+bhu7wxlU6VI348eZu0cJoBxh5GeZimMXRkurbsL6w0Yqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096555; c=relaxed/simple;
	bh=qxJnXYH7CkQdWMctZgubrkG6zIcN8YKKvbgciP9Zb4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AC1kHasuljorkJ7bLsE5nEQRkOPFaspCZk/vSLU3eiPZ2amFYfoFxiQH/EbB99qxHRSNdzBeGS5/t5tJd4nof/FsQ3jVWJhMvEtx8C4UCiC81u+76NCZQzJoEf2f+qrYMHOrIobhUXK5kF0k/5nQPOKjrZu5qoJCBZC4C6JNl0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RubTmf5Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RubTmf5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769096552; x=1800632552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qxJnXYH7CkQdWMctZgubrkG6zIcN8YKKvbgciP9Zb4s=;
  b=RubTmf5Z3Ex0fxdFz2/6pEN78tETF8iKHEyynAOort+j1vZXNrO2pLxm
   v30sqExCLinqOPWat/NvRR8xVtHbNokhY3f32fXH0ijWF0WGgUd856tJc
   143o3WGyowj5OluHADRNgjunEaAxMnxLhFjIG3g5vquhwk1r4G5xLaJwA
   vrj/Q1J8OuNizjGHAi0oKJZD8BkJGRtrz+qnyc9k0ljIlQISFVF84CVi3
   UmjLUy5xX6bh1022+0fqKtcuBdpbCSJl0vR2Gs69voK/G+i+mHxPcEQvt
   A9OiXX7Ww4lGar6BT13iEDY91zRAEFazKfEI5Er//NOrdz1zuFXLkiN9J
   g==;
X-CSE-ConnectionGUID: 5J5Dajg7TjunEBW2NiiUqA==
X-CSE-MsgGUID: X8fPqMFFRMq3PrXBA/WWLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81713811"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="81713811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:42:16 -0800
X-CSE-ConnectionGUID: RnLqXDEFR0KIT8euSM82gw==
X-CSE-MsgGUID: BckXCKegSxaHUfHWKxkzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="237432533"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:42:15 -0800
Date: Thu, 22 Jan 2026 07:42:15 -0800
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
	irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com, 
	Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 6/6] platform/x86/intel/vsec: Plumb ACPI PMT discovery
 tables through vsec
Message-ID: <tuitjp3fhclpfu4qhf7zz37yqaltqgca45ibsyhycgi7kqtzlx@i7dkq3gjwi4c>
References: <20260122030903.3247167-1-david.e.box@linux.intel.com>
 <20260122030903.3247167-7-david.e.box@linux.intel.com>
 <a2ad65a0-7c90-45ae-bb13-e4a3e8a58dae@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2ad65a0-7c90-45ae-bb13-e4a3e8a58dae@linux.intel.com>

On Thu, Jan 22, 2026 at 12:29:04PM +0200, Ilpo Järvinen wrote:
> On Wed, 21 Jan 2026, David E. Box wrote:
> 
> > Some platforms expose PMT discovery via ACPI instead of PCI BARs. Add a
> > generic discovery source flag and carry ACPI discovery entries alongside
> > the existing PCI resource path so PMT clients can consume either.
> > 
> > Changes:
> >   - Add enum intel_vsec_disc_source { _PCI, _ACPI }.
> >   - Extend intel_vsec_platform_info and intel_vsec_device with source enum
> >     and ACPI discovery table pointer/
> >   - When src==ACPI, skip BAR resource setup and copy the ACPI discovery
> >     entries into the aux device.
> > 
> > No user-visible behavior change yet; this only wires ACPI data through vsec
> > in preparation for ACPI-enumerated PMT clients.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > 
> > v3:
> >   - Re-send with all changes intended for v2 which was sent without them
> >     being applied.
> > 
> > v2:
> >   - Improve comment to clarify BAR resource setup doesn't apply to ACPI
> >     discovery
> >   - Add missing #include for kmemdup()
> >   - Use array_size() for overflow protection
> >     (review comments by Ilpo Järvinen)
> > 
> > 
> >  drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++++++++++++
> >  include/linux/intel_vsec.h        | 20 +++++++++++++++++++-
> >  2 files changed, 43 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> > index 4aeb0728b435..b1465e67feef 100644
> > --- a/drivers/platform/x86/intel/vsec.c
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -24,7 +24,9 @@
> >  #include <linux/intel_vsec.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/overflow.h>
> >  #include <linux/pci.h>
> > +#include <linux/string.h>
> >  #include <linux/types.h>
> >  
> >  #define PMT_XA_START			0
> > @@ -109,6 +111,7 @@ static void intel_vsec_dev_release(struct device *dev)
> >  
> >  	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
> >  
> > +	kfree(intel_vsec_dev->acpi_disc);
> >  	kfree(intel_vsec_dev->resource);
> >  	kfree(intel_vsec_dev);
> >  }
> > @@ -320,6 +323,13 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
> >  	 * auxiliary device driver.
> >  	 */
> >  	for (i = 0, tmp = res; i < header->num_entries; i++, tmp++) {
> > +		/*
> > +		 * Skip resource mapping check for ACPI-based discovery
> > +		 * since those tables are read from _DSD, not MMIO.
> > +		 */
> > +		if (info->src == INTEL_VSEC_DISC_ACPI)
> > +			break;
> > +
> >  		tmp->start = base_addr + header->offset + i * (header->entry_size * sizeof(u32));
> >  		tmp->end = tmp->start + (header->entry_size * sizeof(u32)) - 1;
> >  		tmp->flags = IORESOURCE_MEM;
> > @@ -338,6 +348,20 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
> >  	intel_vsec_dev->base_addr = info->base_addr;
> >  	intel_vsec_dev->priv_data = info->priv_data;
> >  	intel_vsec_dev->cap_id = cap_id;
> > +	intel_vsec_dev->src = info->src;
> > +
> > +	if (info->src == INTEL_VSEC_DISC_ACPI) {
> > +		size_t bytes;
> > +
> > +		bytes = array_size(intel_vsec_dev->num_resources,
> > +				   sizeof(info->acpi_disc[0]));
> > +		if (!bytes)
> > +			return -EOVERFLOW;
> 
> Is this correct as array_size() is documented to return SIZE_MAX on 
> overflow?

Yep. Went with array_size() but was thinking check_mul_overflow(). Will
update. Thanks.

David

> 
> Other than that, this series looked very straightforward now.
> 
> -- 
>  i.
> 
> > +
> > +		intel_vsec_dev->acpi_disc = kmemdup(info->acpi_disc, bytes, GFP_KERNEL);
> > +		if (!intel_vsec_dev->acpi_disc)
> > +			return -ENOMEM;
> > +	}
> >  
> >  	if (header->id == VSEC_ID_SDSI)
> >  		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
> > diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> > index 4eecb2a6bac4..1fe5665a9d02 100644
> > --- a/include/linux/intel_vsec.h
> > +++ b/include/linux/intel_vsec.h
> > @@ -33,6 +33,11 @@ struct device;
> >  struct pci_dev;
> >  struct resource;
> >  
> > +enum intel_vsec_disc_source {
> > +	INTEL_VSEC_DISC_PCI,	/* PCI, default */
> > +	INTEL_VSEC_DISC_ACPI,	/* ACPI */
> > +};
> > +
> >  enum intel_vsec_id {
> >  	VSEC_ID_TELEMETRY	= 2,
> >  	VSEC_ID_WATCHER		= 3,
> > @@ -103,6 +108,10 @@ struct vsec_feature_dependency {
> >   * @parent:    parent device in the auxbus chain
> >   * @headers:   list of headers to define the PMT client devices to create
> >   * @deps:      array of feature dependencies
> > + * @acpi_disc: ACPI discovery tables, each entry is two QWORDs
> > + *             in little-endian format as defined by the PMT ACPI spec.
> > + *             Valid only when @provider == INTEL_VSEC_DISC_ACPI.
> > + * @src:       source of discovery table data
> >   * @priv_data: private data, usable by parent devices, currently a callback
> >   * @caps:      bitmask of PMT capabilities for the given headers
> >   * @quirks:    bitmask of VSEC device quirks
> > @@ -113,6 +122,8 @@ struct intel_vsec_platform_info {
> >  	struct device *parent;
> >  	struct intel_vsec_header **headers;
> >  	const struct vsec_feature_dependency *deps;
> > +	u32 (*acpi_disc)[4];
> > +	enum intel_vsec_disc_source src;
> >  	void *priv_data;
> >  	unsigned long caps;
> >  	unsigned long quirks;
> > @@ -124,7 +135,12 @@ struct intel_vsec_platform_info {
> >   * struct intel_vsec_device - Auxbus specific device information
> >   * @auxdev:        auxbus device struct for auxbus access
> >   * @dev:           struct device associated with the device
> > - * @resource:      any resources shared by the parent
> > + * @resource:      PCI discovery resources (BAR windows), one per discovery
> > + *                 instance. Valid only when @src == INTEL_VSEC_DISC_PCI
> > + * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
> > + *                 in little-endian format as defined by the PMT ACPI spec.
> > + *                 Valid only when @src == INTEL_VSEC_DISC_ACPI.
> > + * @src:           source of discovery table data
> >   * @ida:           id reference
> >   * @num_resources: number of resources
> >   * @id:            xarray id
> > @@ -138,6 +154,8 @@ struct intel_vsec_device {
> >  	struct auxiliary_device auxdev;
> >  	struct device *dev;
> >  	struct resource *resource;
> > +	u32 (*acpi_disc)[4];
> > +	enum intel_vsec_disc_source src;
> >  	struct ida *ida;
> >  	int num_resources;
> >  	int id; /* xa */
> > 

