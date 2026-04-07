Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A525F98A;
	Tue,  7 Apr 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560034; cv=none; b=eWNmKxJkWT6bpV806M+nLMZxvWoK0MaOnMMah+dww9y8ZRzM90VuDtfUeFuwXPSYSuBZlTUUNhMN1tJMAqi6Z3LAlipPlosfvNRuDEn75YFDhwK4r6AxQI/83MxAgGVRaHYBwvXTOGFKXd09mksStR3BB0s9kU5pomnFw8tYEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560034; c=relaxed/simple;
	bh=Tp33ovDIGasGDf7p9Zt0dZd4n0nEfdDGy4BGZe9qN64=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Yhy/j4sMLfOaikLKAVqfAV4NwoeUkvGfwOZcEao1m+zcQglqgqqE2oXTKGymmADZnVbNPzp8KzzJa8FSrzED59bjfBl8c9DnYI56GxQXueGa4ql46b41lLabj80L1BeRxvwKxzixMUFLcsF3Db/avjTNRWvd2WmV2ztEaqBLn3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anA1/QG0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anA1/QG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775560034; x=1807096034;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Tp33ovDIGasGDf7p9Zt0dZd4n0nEfdDGy4BGZe9qN64=;
  b=anA1/QG0yh4kN6BJvpymxVclUxPK+w9SCJYRP1TOqUfdzvZNhI+R9IcE
   uidBG+Q0WILTw3rM7N4OQcRRU2+AFZSUG/f2lRlC78eZS3sdU8kK/h1K4
   HEwy6vSzfA/PIU1Di3kDbxay6X+ud/svqgHHis2OiMov2zHAExncYsVsB
   EgEtmuqC9ROSgLZY3Han5wTSrJ1mrJntFhQPIj31OSLoZzVyd/9eTedsz
   m4WrKfCFkhjc73M+FmskulWlwdJhPCtrpmRxYBVZrrOToSW4jCeILDluG
   j4p9uRo5czps+d0CwOLcKTVKta2UGPOFr6qhRKn4M9pCbjT6Q0EoOsYOl
   A==;
X-CSE-ConnectionGUID: WXM9x6G0TauoyLB8TtiZ2g==
X-CSE-MsgGUID: Q2tdPbbWS32bdbjvDNsDNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87970988"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="87970988"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:07:13 -0700
X-CSE-ConnectionGUID: xcQk8QEmTNeASTg0VcxY4Q==
X-CSE-MsgGUID: mcj9b2uLR4O0XB2/AN0fVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="229812873"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:07:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 14:07:07 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 05/17] platform/x86/intel/pmt: Pass discovery index
 instead of resource
In-Reply-To: <20260325014819.1283566-6-david.e.box@linux.intel.com>
Message-ID: <973bb020-d814-e726-5396-87295c3aa67b@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-6-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1352535220-1775560027=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1352535220-1775560027=:983
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, David E. Box wrote:

> Change PMT class code to pass a discovery index rather than a direct stru=
ct
> resource when creating entries. This allows the class to identify the
> discovery source generically without assuming PCI BAR resources. For PCI
> devices, the index still resolves to a resource in the intel_vsec_device.
> Other discovery sources, such as ACPI, can use the same index without
> needing a struct resource.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>=20
> V2 - No changes
>=20
>  drivers/platform/x86/intel/pmt/class.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index d652b21261f0..3fcea6a6e763 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -207,11 +207,12 @@ EXPORT_SYMBOL_GPL(intel_pmt_class);
> =20
>  static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  =09=09=09=09    struct intel_vsec_device *ivdev,
> -=09=09=09=09    struct resource *disc_res)
> +=09=09=09=09    int idx)
>  {
>  =09struct pci_dev *pci_dev =3D to_pci_dev(ivdev->dev);
>  =09struct device *dev =3D &ivdev->auxdev.dev;
>  =09struct intel_pmt_header *header =3D &entry->header;
> +=09struct resource *disc_res;
>  =09u8 bir;
> =20
>  =09/*
> @@ -236,6 +237,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_=
entry *entry,
>  =09=09 * For access_type LOCAL, the base address is as follows:
>  =09=09 * base address =3D end of discovery region + base offset
>  =09=09 */
> +=09=09disc_res =3D &ivdev->resource[idx];
>  =09=09entry->base_addr =3D disc_res->end + 1 + header->base_offset;
> =20
>  =09=09/*
> @@ -412,7 +414,7 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entr=
y, struct intel_pmt_namespa
>  =09=09=09return ret;
>  =09}
> =20
> -=09ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, &intel_vsec_d=
ev->resource[idx]);
> +=09ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, idx);
>  =09if (ret)
>  =09=09return ret;
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1352535220-1775560027=:983--
