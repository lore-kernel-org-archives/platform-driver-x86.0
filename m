Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BC82A1BF;
	Sat, 28 Feb 2026 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772262070; cv=none; b=XazqRY1+V5jCZJKtWVFpyNAkAisFqnMfxwTqPDCDbusXNEB2lvZ7Socjd9WcxLAJMkULyk4RSp/xhHh1iQo92F7sStu9Q8wVWWUT3n3QtOKv1BAJ57575/lmFcmYh1xCRJxG85S2kuLJZTtzmmYGb4imCZz1UEIn9wcVXovxiDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772262070; c=relaxed/simple;
	bh=mbSMsyX8p/mNHOT/5pUzde5JmxOUjVtIu3dYB71GBzI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XAE//eBBL6G9jQUAcTow0f0RTrjlP+ONbbULDyNsISbpq7CTJrlCpkoyj80z/0gnvRTJgKvWagBJCwyM6PJYhomKDQKcU3vMnLktUUOjvE6G52FXvRvIHpw0iD/lmG4NdKNrr0IajwP1CKK4iRv+WnBkH1hx6vAg+PVnRy5/B0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2zaAcwi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2zaAcwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772262068; x=1803798068;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=mbSMsyX8p/mNHOT/5pUzde5JmxOUjVtIu3dYB71GBzI=;
  b=Y2zaAcwieut81yZjv3HEjqZv+NodHQRaOa14vu0HCYXAeWNnvXQ4FTi8
   igzFhIMHwOYsOnM66yo1TJ1S+iDCe74LEICpLM0/lI5pRoXZ/P9VQcqrg
   mmtKLI2V8y/6kSCet6FjCZb0HaU/M3IlGrnfvO60X7sHK+QOm4N5D+ywF
   DyRned8BvaF/AaI2hXVoKXdzDnuflgvOyx/p98Kq46cNMM9tdzPbHNUnD
   I+Wz69Ls131+tF3Rv5LlEZ6aKY1ko0GLRPPSU3BKV79YFomKSHfuWw/eZ
   vKtN23/N9GV5LHnE1T490riHwlMxCJUtqKk1VEB5mwZa+ctYSKaX6wMu8
   A==;
X-CSE-ConnectionGUID: cpy6iovmReOEibq5crr3dQ==
X-CSE-MsgGUID: 5IBBfUpyQBCYnfKMHOwlLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73451039"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73451039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 23:01:07 -0800
X-CSE-ConnectionGUID: x17abINuS/KAbumVCYBhcw==
X-CSE-MsgGUID: 1LaMPtqCT4aM6kRbhrJMeg==
X-ExtLoop1: 1
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.125.111.246]) ([10.125.111.246])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 23:01:07 -0800
Message-ID: <fa10ba0b396d5c67bf1762e06869950496d85280.camel@linux.intel.com>
Subject: Re: [PATCH][RFC] platform/x86: intel_speed_select: Use
 static_cpu_has for HWP check
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: lirongqing <lirongqing@baidu.com>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Feb 2026 23:01:06 -0800
In-Reply-To: <20260228035108.2543-1-lirongqing@baidu.com>
References: <20260228035108.2543-1-lirongqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-02-27 at 22:51 -0500, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>=20
> The current implementation of disable_dynamic_sst_features() reads
> MSR_PM_ENABLE to check if HWP is enabled. This can be optimized by
> using static_cpu_has(X86_FEATURE_HWP), which is the standard way
> in the kernel to check for HWP support without the overhead of
> an MSR read.
>=20
> Replace the MSR read with static_cpu_has().
>=20
That is not same. Presence of HWP feature means that HWP can be enabled
on this SoC. But user can boot with option to not enable HWP by
intel_pstate driver.
If HWP is not enabled, then SST features can't be enabled.

Thanks,
Srinivas

> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
> =C2=A0drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 5 +--=
-
> -
> =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git
> a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index b8cdaa2..416620b 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -556,10 +556,7 @@ static struct tpmi_per_power_domain_info
> *get_instance(int pkg_id, int power_dom
> =C2=A0
> =C2=A0static bool disable_dynamic_sst_features(void)
> =C2=A0{
> -	u64 value;
> -
> -	rdmsrq(MSR_PM_ENABLE, value);
> -	return !(value & 0x1);
> +	return !static_cpu_has(X86_FEATURE_HWP);
> =C2=A0}
> =C2=A0
> =C2=A0#define _read_cp_info(name_str, name, offset, start, width,
> mult_factor)\
