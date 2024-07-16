Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C67DED8
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125565; cv=none; b=IIkScratjTvVsobhAQ3vrOneSC6/6KyXka3pjm4URrkmAhtOBfXbUNmBuEbpLp6mX/843PMuEtQoqD9/cCMNbrYxVtQguosE5+hITK5iynCEFmWpGY2oxEC2/bME5ezd83LhIT2q2kf6MACx7EgZK9V8AAVrJJ8dliH1003R/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125565; c=relaxed/simple;
	bh=7YRQ0ALWmQ9tHNrHUfYhpwoR3sHbHIbTg2yiEh4+8Fo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hARCyiMQwieE9+4aaOVN6n8FXhxJ9ED/aAL+ljTS2jPJlEYOTHJCK+9n+JCDL0dQUzTuq509lbF9CX+BD4n4Vyz43tfpLvLSZ8FOCKEo5zLnGF3ra7PmBX3oolbgukaf28jQkhdx95jg8AtVXP6gEVJYb1t19dD7jqyg7+41p7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjjcY073; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjjcY073"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721125563; x=1752661563;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7YRQ0ALWmQ9tHNrHUfYhpwoR3sHbHIbTg2yiEh4+8Fo=;
  b=cjjcY073GBOYKakq+4/QWFJ+DhJELoGgsxWlf5KtaP1r8VGDn4CYPqtG
   hz8S7T9+TE2JA5jN1R0lSGY/1i0dNwArBcnHSIWveO9Wkbs8i9Lmw/Cby
   VrJboteNt8LXuaI/ZFZ3zOQAXZ+fpXfC1qt7LPALgDqVXTC5LkKU0ZeWk
   MWxrBE0AEA4aKAoUXcb//7ghKMFlbhjIxuAHtye/8rR0BtpHUJgwMZfvV
   20hjCYZvSYb87KsWhnFFF1CstWCl9U6gGxMlrHfSbEE1OgyYvRkIA4phN
   /kWm34EbHsO2Qg0lW0WVQXzIMxTnqMCbupTT3t5YziLuoukFFmUpFK9tm
   Q==;
X-CSE-ConnectionGUID: cwmwQZUmQsKQt44A7DJ30A==
X-CSE-MsgGUID: xebqHx8qRFWmJz/pn58gPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29142148"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="29142148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 03:26:02 -0700
X-CSE-ConnectionGUID: mJMi4hgTQ1SstQQ2XWxtwg==
X-CSE-MsgGUID: HZxstTyIS1yNtcNB5yT2lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54216072"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.133])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 03:26:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Jul 2024 13:25:55 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 2/6] platform/x86/intel/vsec: Add PMT read callbacks
In-Reply-To: <20240715175452.4010751-3-michael.j.ruhl@intel.com>
Message-ID: <c76c95ae-d283-26bb-b48c-0fc453a35ed1@linux.intel.com>
References: <20240715175452.4010751-1-michael.j.ruhl@intel.com> <20240715175452.4010751-3-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-631348130-1721125555=:1037"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-631348130-1721125555=:1037
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 15 Jul 2024, Michael J. Ruhl wrote:

> From: "David E. Box" <david.e.box@linux.intel.com>
>=20
> Some PMT providers require device specific actions before their telemetry
> can be read. Provide assignable PMT read callbacks to allow providers to
> perform those actions.
>=20
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c |  1 +
>  include/linux/intel_vsec.h        | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index 2b46807f868b..7b5cc9993974 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, s=
truct intel_vsec_header *he
>  =09intel_vsec_dev->num_resources =3D header->num_entries;
>  =09intel_vsec_dev->quirks =3D info->quirks;
>  =09intel_vsec_dev->base_addr =3D info->base_addr;
> +=09intel_vsec_dev->priv_data =3D info->priv_data;
> =20
>  =09if (header->id =3D=3D VSEC_ID_SDSI)
>  =09=09intel_vsec_dev->ida =3D &intel_vsec_sdsi_ida;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 6495e37c9079..b1c1131213f6 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -67,6 +67,19 @@ enum intel_vsec_quirks {
>  =09VSEC_QUIRK_EARLY_HW     =3D BIT(4),
>  };
> =20
> +/**
> + * struct pmt_callbacks - Callback infrastructure for PMT devices
> + * ->read_telem() when specified, called by client driver to access PMT =
data (instead
> + * of direct copy).
> + * @pdev:  PCI device reference for the callback's use
> + * @guid:  ID of data to acccss
> + * @data:  buffer for the data to be copied
> + * @count: size of buffer
> + */
> +struct pmt_callbacks {
> +=09int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, u32 coun=
t);
> +};
> +
>  /**
>   * struct intel_vsec_platform_info - Platform specific data
>   * @parent:    parent device in the auxbus chain
> @@ -78,6 +91,7 @@ enum intel_vsec_quirks {
>  struct intel_vsec_platform_info {
>  =09struct device *parent;
>  =09struct intel_vsec_header **headers;
> +=09void *priv_data;

You forgot to add kerneldoc for this new field.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-631348130-1721125555=:1037--
