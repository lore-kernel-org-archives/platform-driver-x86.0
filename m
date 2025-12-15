Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CED32B9A2;
	Mon, 15 Dec 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807846; cv=none; b=iDir2tnOHvD+ZFW3HICGRNGHbCF0JWo0ULX4csu85C+wofW4ftfdvtcyucTPoNoVd37NKOiq29Yu7Mw0NcfuDIY0JNgXGgPHTUDtjgffPIMPKhI1MyN+RlkcnsmfhCejkf56ypSlmYwZXx+qECvXn9HnxuUVlWtg7Ra9cTzQE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807846; c=relaxed/simple;
	bh=E59ZlLISsx6OmCw7JFRLzUpGnvBCd7jUCEC4oRDHjX0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CUL5ZVlij+Nd0xx3Vy8N1kvR5oFhZGLZTOKh1L5OIfQsO6c2Pag3x5vLhsO18sp+PNNMCo/mhj3GngjfGIHgI90a50azlWOpGCJL6Xatow+7fNggletK78qLXOI8Agvtbs9xcwwOgM+akbR5g0HCm6I7OvzlrLR+jK7nM9VLngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLE/KGMC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLE/KGMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765807844; x=1797343844;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=E59ZlLISsx6OmCw7JFRLzUpGnvBCd7jUCEC4oRDHjX0=;
  b=CLE/KGMCEFoXqhTnNzAmsLxqPpR+VDXZyKanpKLzYjURDUWlw3n2Mynd
   AGMax47n56EXY02SKtutE1W88tNkI3B497tkMu9tgMi/gyof7me5X5ctr
   cLB2qjBdenKlDihcPv5VBeKH3kbsX4LF8u+CJZfXaJHIEa1gZYjYpwGbd
   oDJffjlMDUkevp7oXqZwbbail65RYUY5lo9q4j/OdXbgbuSGmXSPT1Rzu
   /6qd976Gqnj6Csk9xaO9CgCbMMNhQty+FXMYNVOWXVSXEE5iuzKkNPAiS
   i/H1OkcgvY1hirDoBdGoCGVMnI8Ez+YC5pn4skkHTOVrF1UPtHmoy5Z2p
   g==;
X-CSE-ConnectionGUID: MITz9bScT0WKmYwKs9m0+Q==
X-CSE-MsgGUID: 0NjVWYa1QuWd4AplZcU5NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78346957"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78346957"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:10:43 -0800
X-CSE-ConnectionGUID: G9jvto3ARAefJCSQN2dMvg==
X-CSE-MsgGUID: FT0asRlhRueTLTPaJ2+cEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197615787"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:10:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Dec 2025 16:10:37 +0200 (EET)
To: Randy Dunlap <rdunlap@infradead.org>
cc: LKML <linux-kernel@vger.kernel.org>, 
    "David E. Box" <david.e.box@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/vsec: correct kernel-doc comments
In-Reply-To: <20251214201959.2195863-1-rdunlap@infradead.org>
Message-ID: <cac479ad-e258-fb20-8005-3155e4a7f901@linux.intel.com>
References: <20251214201959.2195863-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1341046452-1765807837=:1225"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1341046452-1765807837=:1225
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 14 Dec 2025, Randy Dunlap wrote:

> Fix kernel-doc warnings in intel_vsec.h to eliminate all kernel-doc
> warnings:
>=20
> Warning: include/linux/intel_vsec.h:92 struct member 'read_telem' not
>  described in 'pmt_callbacks'
> Warning: include/linux/intel_vsec.h:146 expecting prototype for struct
>  intel_sec_device.  Prototype was for struct intel_vsec_device instead
> Warning: include/linux/intel_vsec.h:146 struct member 'priv_data_size'
>  not described in 'intel_vsec_device'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: David E. Box <david.e.box@linux.intel.com>
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  include/linux/intel_vsec.h |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> --- linux-next-20251201.orig/include/linux/intel_vsec.h
> +++ linux-next-20251201/include/linux/intel_vsec.h
> @@ -80,8 +80,8 @@ enum intel_vsec_quirks {
> =20
>  /**
>   * struct pmt_callbacks - Callback infrastructure for PMT devices
> - * ->read_telem() when specified, called by client driver to access PMT =
data (instead
> - * of direct copy).
> + * @read_telem: when specified, called by client driver to access PMT
> + * data (instead of direct copy).
>   * @pdev:  PCI device reference for the callback's use
>   * @guid:  ID of data to acccss
>   * @data:  buffer for the data to be copied

Is it correct for kerneldoc to have the rest as @pdev, @guid, etc.,
they are parameters to the callback, not members of this struct?

> @@ -120,7 +120,7 @@ struct intel_vsec_platform_info {
>  };
> =20
>  /**
> - * struct intel_sec_device - Auxbus specific device information
> + * struct intel_vsec_device - Auxbus specific device information
>   * @auxdev:        auxbus device struct for auxbus access
>   * @pcidev:        pci device associated with the device
>   * @resource:      any resources shared by the parent
> @@ -128,6 +128,7 @@ struct intel_vsec_platform_info {
>   * @num_resources: number of resources
>   * @id:            xarray id
>   * @priv_data:     any private data needed
> + * @priv_data_size: size of private data area
>   * @quirks:        specified quirks
>   * @base_addr:     base address of entries (if specified)
>   * @cap_id:        the enumerated id of the vsec feature
>=20

--=20
 i.

--8323328-1341046452-1765807837=:1225--
