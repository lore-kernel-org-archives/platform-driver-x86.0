Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5906F1FDA
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Aug 2024 00:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723165024; cv=none; b=IUAx+YBvmlbcEyAlYMA+1nge5wMz8/9UqFPd3kareuT1DcEPLRCe3L63COitx48Usf+hkJnHYyVtKzuHNUgoGU5Bd9vo1sM2PyHwkMJ1zdlr0gh1irXPGvuxAQNFBwi2U5+IzfL72EpzNj8u+q4qgqRD2zcaQDJj1cv30302VCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723165024; c=relaxed/simple;
	bh=P2iIc1K/ioKDeqQQ0aKiNhSv/C3MH2KMLSuOlXGGNjU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSV5bbON3tAF6HZdCe03cVNc8domE2cf9zEV2rPEbMCheWrvdA1gkPaC2waE4P462hmp+nL/WR3iyQd6cn1pIKy/uDfHPxgJ/lZKEnlH8ec9GdrOyX0ng/p0Zd31/JriBsJXBd5iU5ikEA9AzDNoQe/sPuhq2CLI0gFKK8HW76g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjSHhuis; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjSHhuis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723165022; x=1754701022;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=P2iIc1K/ioKDeqQQ0aKiNhSv/C3MH2KMLSuOlXGGNjU=;
  b=hjSHhuisFJrNDNl+i1scmktOoAns87ev/SH50ybJrYk99auc3sgYIkbL
   Gwz19BrYJifxDJ81CsmbDg71DO2ALykW/X8+KoIl80wowpXLCSk3Y/Jvu
   ih98nO7eIwrObJEgA+3XJ0akESGSkdoBEoBceWifBQmnFWTppwuvZ75/K
   dDC7uUAbip3/n5/JtxgkBNAS+kSClHRrOr7wTTrJyk8pJkfoY3YNQcjPd
   XxsvZ5KJj2pPC9GlGDM5iNUqRFvuS4ih5BgmCMZjNXTqIqmP6u2vKkSmZ
   2ORoB7d/8c6Enxprbe8xoAuKfAgAtqmXlLEDGu5j6zA3qAA8axSaLXY2u
   Q==;
X-CSE-ConnectionGUID: KVLMF+sFRo2PnQ7QISv1UA==
X-CSE-MsgGUID: 8L2yvmrUR+WPMBaVAXSZTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21497110"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21497110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:57:01 -0700
X-CSE-ConnectionGUID: CYyjtXYaRz6QtwxgncUcUg==
X-CSE-MsgGUID: mx2EBcrFTEaDq1kJ1/EtZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="80636749"
Received: from inaky-mobl1.amr.corp.intel.com ([10.125.108.179])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:57:01 -0700
Message-ID: <fe23eb2ef30e4a867668a221f3f02dbe9d322edc.camel@linux.intel.com>
Subject: Re: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
	intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
	ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com, 
	andriy.shevchenko@linux.intel.com
Date: Thu, 08 Aug 2024 17:57:01 -0700
In-Reply-To: <ZrUyH6vZpShdacjx@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
	 <20240725122346.4063913-6-michael.j.ruhl@intel.com>
	 <e70a44a24b1404a000e302a444a41c286538f3f9.camel@linux.intel.com>
	 <ZrUyH6vZpShdacjx@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-08-08 at 17:01 -0400, Rodrigo Vivi wrote:
> On Thu, Aug 08, 2024 at 12:49:58PM -0700, David E. Box wrote:
> > Hi Mike
> >=20
> > On Thu, 2024-07-25 at 08:23 -0400, Michael J. Ruhl wrote:
> > > DVSEC offsets are based on the endpoint BAR.=C2=A0 If an endpoint is
> > > not available allow the offset information to be adjusted by the
> > > parent driver.
> >=20
> > I know I wrote the original version of these patches but I no longer li=
ke
> > this
> > solution. The s32 is too small for a 64 bit address and calculating the
> > offset
> > just to add it back in the PMT driver is unnecessary.
>=20
> yeap, 64bit sounds better indeed.
>=20
> > Instead, I sent you
> > replacement patches for 5 and 6 that allow passing the telemetry region
> > address
> > directly to the PMT driver.
>=20
> Was these replacements sent straight to PMT list or to Mike so he can
> adjust the series?
>=20
> I'm wondering if we should merge this through our drm-xe-next or through =
PMT
> channels. Thoughts?
>=20
> In any case, ack from my side to get the xe patches merged together throu=
gh
> PMT.
>=20
> But if someone prefer to get this merged through drm-xe-next, then we nee=
d
> to act fast and get this ready with the final patches and acked by you PM=
T
> maintainers,
> in the next 2 weeks because our window under drm closes much earlier.
>=20
> Around 6.11-rc5 is when we close the drm window towards 6.12
> and we are almost within 6.11-rc3.
>=20
> Thoughts?

For me Patches 1-4 are good to go for BMG support. Patches 5 and 6 add DG2
support but need some work. They should wait.

David

>=20
> Thanks,
> Rodrigo.
>=20
> >=20
> > David
> >=20
> > >=20
> > > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > ---
> > > =C2=A0drivers/platform/x86/intel/pmt/class.h=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1 +
> > > =C2=A0drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
> > > =C2=A0drivers/platform/x86/intel/vsec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > =C2=A0include/linux/intel_vsec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> > > =C2=A04 files changed, 14 insertions(+)
> > >=20
> > > diff --git a/drivers/platform/x86/intel/pmt/class.h
> > > b/drivers/platform/x86/intel/pmt/class.h
> > > index a267ac964423..984cd40ee814 100644
> > > --- a/drivers/platform/x86/intel/pmt/class.h
> > > +++ b/drivers/platform/x86/intel/pmt/class.h
> > > @@ -46,6 +46,7 @@ struct intel_pmt_entry {
> > > =C2=A0	void __iomem		*base;
> > > =C2=A0	struct pmt_callbacks	*cb;
> > > =C2=A0	unsigned long		base_addr;
> > > +	s32			base_adjust;
> > > =C2=A0	size_t			size;
> > > =C2=A0	u32			guid;
> > > =C2=A0	int			devid;
> > > diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
> > > b/drivers/platform/x86/intel/pmt/telemetry.c
> > > index c9feac859e57..88e4f1315097 100644
> > > --- a/drivers/platform/x86/intel/pmt/telemetry.c
> > > +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> > > @@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct
> > > intel_pmt_entry
> > > *entry,
> > > =C2=A0	header->access_type =3D TELEM_ACCESS(readl(disc_table));
> > > =C2=A0	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
> > > =C2=A0	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
> > > +	if (entry->base_adjust) {
> > > +		u32 new_base =3D header->base_offset + entry->base_adjust;
> > > +
> > > +		dev_dbg(dev, "Adjusting base offset from 0x%x to 0x%x\n",
> > > +			header->base_offset, new_base);
> > > +		header->base_offset =3D new_base;
> > > +	}
> > > =C2=A0
> > > =C2=A0	/* Size is measured in DWORDS, but accessor returns bytes */
> > > =C2=A0	header->size =3D TELEM_SIZE(readl(disc_table));
> > > @@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_devic=
e
> > > *auxdev, const struct auxilia
> > > =C2=A0	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
> > > =C2=A0		struct intel_pmt_entry *entry =3D &priv->entry[priv-
> > > > num_entries];
> > > =C2=A0
> > > +		entry->base_adjust =3D intel_vsec_dev->base_adjust;
> > > +
> > > =C2=A0		mutex_lock(&ep_lock);
> > > =C2=A0		ret =3D intel_pmt_dev_create(entry, &pmt_telem_ns,
> > > intel_vsec_dev, i);
> > > =C2=A0		mutex_unlock(&ep_lock);
> > > diff --git a/drivers/platform/x86/intel/vsec.c
> > > b/drivers/platform/x86/intel/vsec.c
> > > index 7b5cc9993974..be079d62a7bc 100644
> > > --- a/drivers/platform/x86/intel/vsec.c
> > > +++ b/drivers/platform/x86/intel/vsec.c
> > > @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pde=
v,
> > > struct
> > > intel_vsec_header *he
> > > =C2=A0	intel_vsec_dev->num_resources =3D header->num_entries;
> > > =C2=A0	intel_vsec_dev->quirks =3D info->quirks;
> > > =C2=A0	intel_vsec_dev->base_addr =3D info->base_addr;
> > > +	intel_vsec_dev->base_adjust =3D info->base_adjust;
> > > =C2=A0	intel_vsec_dev->priv_data =3D info->priv_data;
> > > =C2=A0
> > > =C2=A0	if (header->id =3D=3D VSEC_ID_SDSI)
> > > diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> > > index 11ee185566c3..75d17fa10d05 100644
> > > --- a/include/linux/intel_vsec.h
> > > +++ b/include/linux/intel_vsec.h
> > > @@ -88,6 +88,7 @@ struct pmt_callbacks {
> > > =C2=A0 * @caps:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitmask of PMT capabili=
ties for the given headers
> > > =C2=A0 * @quirks:=C2=A0=C2=A0=C2=A0 bitmask of VSEC device quirks
> > > =C2=A0 * @base_addr: allow a base address to be specified (rather tha=
n derived)
> > > + * @base_adjust: allow adjustment to base offset information
> > > =C2=A0 */
> > > =C2=A0struct intel_vsec_platform_info {
> > > =C2=A0	struct device *parent;
> > > @@ -96,6 +97,7 @@ struct intel_vsec_platform_info {
> > > =C2=A0	unsigned long caps;
> > > =C2=A0	unsigned long quirks;
> > > =C2=A0	u64 base_addr;
> > > +	s32 base_adjust;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/**
> > > @@ -121,6 +123,7 @@ struct intel_vsec_device {
> > > =C2=A0	size_t priv_data_size;
> > > =C2=A0	unsigned long quirks;
> > > =C2=A0	u64 base_addr;
> > > +	s32 base_adjust;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0int intel_vsec_add_aux(struct pci_dev *pdev, struct device *par=
ent,
> >=20

