Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898452765DF;
	Mon, 17 Nov 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400655; cv=none; b=PIOxwk+NZ+kCH7VaDtyS13X9W/E0Czw0Hox/XpIcQwjxbuaSvfBHRI5ZPSoum6iyqNQmtyugvjcSdW8bZ7r869RELYDkYrpJ8FBMEMXt1eXg4glQmEqASSLNWLM3gJiuVw4dneZtzJU6dWDD37wUnHPri9dvhFKymh+zVInTIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400655; c=relaxed/simple;
	bh=qmaGR0CuQMJwRq8RAlhly0AYWX6qvV8IN7X2Xoh8XxU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dxEcy/pV7k5Ct2dDAGcKOzy+K10+GfF/sv4kyAkU5vHXEicwk5dzSGNvZ8NwL7DMgnj9cZBqIkk+pGGivZvblbTzNlJnSjvnYG6QdrQbENp3fT1Z7fFrQSBK0uao2J2iGgIT8KynF0fSnCe36o5LIL+P2s7NNsSpyIV3BvirYZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M27bQ+Eg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M27bQ+Eg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763400654; x=1794936654;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qmaGR0CuQMJwRq8RAlhly0AYWX6qvV8IN7X2Xoh8XxU=;
  b=M27bQ+Eg1yHheU9lioHCH3x6w7pbhLSYOF8pYKIwaFFzYM+1VbNeWfuZ
   2ti0uNc7esV6vbylUBNenSOs1i22fvak/JxHCR3ot5Z3zFwfgxZRfy6U6
   lG/RVTTClbWxskYDVCnJqSijwmd65Q6hpXwzfQ5UrUo4wKYuJqDmWVVCv
   L6m9UJgkBdXGKtcnCcv0O4kHex3AOMeXhTEgF0EcMc30b6ifWqObETVyf
   NJwnSw8/wlyvCb92fwbtzvyvOUKlZiomGhxzws4sWpWDiocNTr9A1L4vc
   UleDVcFlmaLnlFfllBwpJnxB2rktuh+0E+Fj+FCWq/jsNpL8FmN+gGQtg
   g==;
X-CSE-ConnectionGUID: ZBCctfrBS/OF7GClcXIhaQ==
X-CSE-MsgGUID: U33qWBw5SvaC3+WhGTnJfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76757987"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76757987"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:30:10 -0800
X-CSE-ConnectionGUID: F3s/dIQYRuGTuGWgJ2GbDg==
X-CSE-MsgGUID: vT4OOuoQRkqe9626lkCROQ==
X-ExtLoop1: 1
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:30:10 -0800
Message-ID: <7383cdac5f30f374ee928fdb9b4f5d6e97e93607.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/speed_select_if: Convert PCIBIOS_*
 return codes to errnos
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 17 Nov 2025 09:30:09 -0800
In-Reply-To: <20251117033354.132-1-vulab@iscas.ac.cn>
References: <20251117033354.132-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-11-17 at 11:33 +0800, Haotian Zhang wrote:
> isst_if_probe() uses pci_read_config_dword() that returns PCIBIOS_*
> codes. The return code is returned from the probe function as is but
> probe functions should return normal errnos. A proper implementation
> can be found in drivers/leds/leds-ss4200.c.
>=20
> Convert PCIBIOS_* return codes using pcibios_err_to_errno() into
> normal errno before returning.
>=20
> Fixes: d3a23584294c ("platform/x86: ISST: Add Intel Speed Select mmio
> interface")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git
> a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
> b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
> index 3f4343147dad..950ede5eab76 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
> @@ -108,11 +108,11 @@ static int isst_if_probe(struct pci_dev *pdev,
> const struct pci_device_id *ent)
> =C2=A0
> =C2=A0	ret =3D pci_read_config_dword(pdev, 0xD0, &mmio_base);
> =C2=A0	if (ret)
> -		return ret;
> +		return pcibios_err_to_errno(ret);
> =C2=A0
> =C2=A0	ret =3D pci_read_config_dword(pdev, 0xFC, &pcu_base);
> =C2=A0	if (ret)
> -		return ret;
> +		return pcibios_err_to_errno(ret);
> =C2=A0
> =C2=A0	pcu_base &=3D GENMASK(10, 0);
> =C2=A0	base_addr =3D (u64)mmio_base << 23 | (u64) pcu_base << 12;
