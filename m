Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD8D387375;
	Tue,  7 Apr 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559961; cv=none; b=NvLDrhCgMR16M/O57qt/fkoVMvEB8SkWtOeJXlGK9/VSwkUMo57FZMEE4XiU+Hr+3/5uRgbV7Vp5wKGZ3pEGZxFr3j3KkuHv7NXTEqPse0DGQHyNe2UJcjM052aJQPVUCIXjsad4CAxyQNICA/Y7zc1e7CCmfzHQAEdapnHAfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559961; c=relaxed/simple;
	bh=OWz2f0MOZnLsWCvhdQGjjHCYizkpmW/DrLHKH2YFWrs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s8fdIfVuRRN8DImw+iOr4Yy2FS2fn11fngA708Jph4t28FIvMEXujxC5gP9RkWZvOlXbYKHvHgO4GCzgX3erhNvSAckBTrWIW4r8zhsHUam0sKZpAYBUUmfjnF5+3y6HVQNsY4iZXlghNnUMCANstxYK7MCPYp9q5watAbuBgCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTpZeW9B; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTpZeW9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775559961; x=1807095961;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OWz2f0MOZnLsWCvhdQGjjHCYizkpmW/DrLHKH2YFWrs=;
  b=PTpZeW9Bl9KaYH1MOKjSQTNxMDM/3Qc135cbsXXDiJ/f4qykWA4RDMYN
   48/xwWQHzi+fw9HwAWBx7uAH2EIk1+wZomVMSSYanRC8peGnYgNVvnslF
   k0bLQjTbQHqa6XlkZ2y0culHOQFdvMLMTf2kRst2t/EwdBuEb/0UkJ/VM
   V7epS9+SLUhRJWLJZnUBd98QUVnpwB+uwjWzxkvGoh+urr8lRvtYZ7cG1
   BxfcD3ogqkKWfLy3gCgwx6XgSDofQ7QQOQN2tNk3WK+RxsQzc+o2Jz+Fq
   +QC+NfqD6J23GjPxEoOTwqJOBXd7oqB5pjRRdHo56Jq+9/w+b+F3+GDSC
   g==;
X-CSE-ConnectionGUID: 1TuGUu+wTvi9tYwKp4v3Rw==
X-CSE-MsgGUID: 2mLlP+BaSsGHxJ2dk+ebXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80115005"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80115005"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:06:00 -0700
X-CSE-ConnectionGUID: IzMRSFq7ReWViTs21g19AQ==
X-CSE-MsgGUID: yQa0lH5kQP+LHvF51TYGlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228410021"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:05:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 14:05:53 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 03/17] platform/x86/intel/pmt/telemetry: Move overlap
 check to post-decode hook
In-Reply-To: <20260325014819.1283566-4-david.e.box@linux.intel.com>
Message-ID: <5d5b717f-2448-62a0-6c6e-b9899d64c64e@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-4-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2105932385-1775559953=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2105932385-1775559953=:983
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, David E. Box wrote:

> Update the telemetry namespace to use the new PMT class pre/post decode
> interface. The overlap check, which previously occurred during header
> decode, is now performed in the post-decode hook once header fields are
> populated. This preserves existing behavior while reusing the same header
> decode logic across PMT drivers.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

For patches #1-#3,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> ---
>=20
> V2 - No changes
>=20
>  drivers/platform/x86/intel/pmt/class.h     |  1 +
>  drivers/platform/x86/intel/pmt/telemetry.c | 24 ++++++++++++++--------
>  2 files changed, 16 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index ff39014b208c..8a0db0ef58c1 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -37,6 +37,7 @@ struct intel_pmt_header {
>  =09u32=09size;
>  =09u32=09guid;
>  =09u8=09access_type;
> +=09u8=09telem_type;
>  };
> =20
>  struct intel_pmt_entry {
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platfor=
m/x86/intel/pmt/telemetry.c
> index bdc7c24a3678..d22f633638be 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -58,14 +58,9 @@ struct pmt_telem_priv {
>  =09struct intel_pmt_entry=09=09entry[];
>  };
> =20
> -static bool pmt_telem_region_overlaps(struct intel_pmt_entry *entry,
> -=09=09=09=09      struct device *dev)
> +static bool pmt_telem_region_overlaps(struct device *dev, u32 guid, u32 =
type)
>  {
> -=09u32 guid =3D readl(entry->disc_table + TELEM_GUID_OFFSET);
> -
>  =09if (intel_pmt_is_early_client_hw(dev)) {
> -=09=09u32 type =3D TELEM_TYPE(readl(entry->disc_table));
> -
>  =09=09if ((type =3D=3D TELEM_TYPE_PUNIT_FIXED) ||
>  =09=09    (guid =3D=3D TELEM_CLIENT_FIXED_BLOCK_GUID))
>  =09=09=09return true;
> @@ -80,15 +75,25 @@ static int pmt_telem_header_decode(struct intel_pmt_e=
ntry *entry,
>  =09void __iomem *disc_table =3D entry->disc_table;
>  =09struct intel_pmt_header *header =3D &entry->header;
> =20
> -=09if (pmt_telem_region_overlaps(entry, dev))
> -=09=09return 1;
> -
>  =09header->access_type =3D TELEM_ACCESS(readl(disc_table));
>  =09header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
>  =09header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
> =20
>  =09/* Size is measured in DWORDS, but accessor returns bytes */
>  =09header->size =3D TELEM_SIZE(readl(disc_table));
> +=09header->telem_type =3D TELEM_TYPE(readl(entry->disc_table));
> +
> +=09return 0;
> +}
> +
> +static int pmt_telem_post_decode(struct intel_vsec_device *ivdev,
> +=09=09=09=09 struct intel_pmt_entry *entry)
> +{
> +=09struct intel_pmt_header *header =3D &entry->header;
> +=09struct device *dev =3D &ivdev->auxdev.dev;
> +
> +=09if (pmt_telem_region_overlaps(dev, header->guid, header->telem_type))
> +=09=09return 1;
> =20
>  =09/*
>  =09 * Some devices may expose non-functioning entries that are
> @@ -131,6 +136,7 @@ static struct intel_pmt_namespace pmt_telem_ns =3D {
>  =09.name =3D "telem",
>  =09.xa =3D &telem_array,
>  =09.pmt_header_decode =3D pmt_telem_header_decode,
> +=09.pmt_post_decode =3D pmt_telem_post_decode,
>  =09.pmt_add_endpoint =3D pmt_telem_add_endpoint,
>  };
> =20
>=20
--8323328-2105932385-1775559953=:983--
