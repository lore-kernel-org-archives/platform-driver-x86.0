Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FD361DDF
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772319718; cv=none; b=NmSQz/Q/h3PDN113FhO+AwgDvqFv1gQ+ioRbyKnPbke/al+72RHdnxVbsa3gdyhSFLhwTOnQscQyGYxI3lMG6qV/ko9H+e9vMDNWSdvzp1JTFmSfvPWuxizOKO0jAzbQo4uRNPQouAiUKqtNzrXwVjeN7R5K8PbwEFpb7eZCHgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772319718; c=relaxed/simple;
	bh=hv2IPK471gAwfud3SVuplnWKG6v6Ov2fiKRG1ISd4hc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lm4r+kN5XAuPEyptc+EGml5f0e8AcZl5gqy10aVvknyJi2XGCgm5kT3Hn+k2qu7M+cj41wt1e62zO7e6Vx4g/9sfNHB3PX0rgbWKkIdf1fbrUVi23joWqx/CMrznwyRDS5jBWjTkm692UKndwRPAsTqB8nnWQTgMv+HqAmNdF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO13zOAd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO13zOAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772319717; x=1803855717;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=hv2IPK471gAwfud3SVuplnWKG6v6Ov2fiKRG1ISd4hc=;
  b=YO13zOAdYiOQUugmcAmPn0Q3XjJ2BU7qTD4qAU7+5AESSOtFy8W2Hlbq
   lid6VsNlyJYCCeLQ0tguadh9JOu7HQfACiRW6ouaOUctW1qlZCvRMxuPq
   paKIOOiWasSlWC/kf4rkx1YN9uM5XxoyY1l+Fgp5nT6jckc7Wkna76Lxa
   c1P+jPFbNdmjNdUkKhICqk9qZW8b+8jL5PqcQrY/sPFbvmbbhrxtb4Kn+
   kPnGOjfAWGBLKvgInvHvOcBOjEZYrv8zX1V3FAKn3ta2k4Mj71nkl1Bm7
   jd89bCRGCIZFFI27uyyig7CiW0rMveEN3yZhlVFTjbK1s5kZIlMtU7YqB
   g==;
X-CSE-ConnectionGUID: mGU+KnUXSuibf4A2Jp21hQ==
X-CSE-MsgGUID: FKxceOvKTESGBKK/j9G3FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73275824"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73275824"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 15:01:57 -0800
X-CSE-ConnectionGUID: 9fYTDWsWQGSBi4Lr2jAzBA==
X-CSE-MsgGUID: wwcBoLIlSaq2sOY8GnpyOQ==
X-ExtLoop1: 1
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.125.108.21]) ([10.125.108.21])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 15:01:56 -0800
Message-ID: <30ec4399cc038ee2471a7ba158a0139637103756.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: Check HWP support before MSR access
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: lirongqing <lirongqing@baidu.com>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Date: Sat, 28 Feb 2026 15:01:55 -0800
In-Reply-To: <20260228122441.2284-1-lirongqing@baidu.com>
References: <20260228122441.2284-1-lirongqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-02-28 at 07:24 -0500, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>=20
> On some systems, HWP can be explicitly disabled in the BIOS settings
> When HWP is disabled by firmware, the HWP CPUID bit is not set, and
> attempting to read MSR_PM_ENABLE will result in a General Protection
> (GP) fault.
>=20
> [=C2=A0 426.715441] unchecked MSR access error: RDMSR from 0x770 at rIP:
> 0xffffffffc33db92e (disable_dynamic_sst_features+0xe/0x50
> [isst_tpmi_core])
> [=C2=A0 426.715450] Call Trace:
> [=C2=A0 426.715453]=C2=A0 <TASK>
> [=C2=A0 426.715454]=C2=A0 ? ex_handler_msr+0xf6/0x150
> [=C2=A0 426.715461]=C2=A0 ? fixup_exception+0x1ad/0x340
> [=C2=A0 426.715462]=C2=A0 ? gp_try_fixup_and_notify+0x1e/0xb0
> [=C2=A0 426.715466]=C2=A0 ? exc_general_protection+0xc9/0x390
> [=C2=A0 426.715470]=C2=A0 ? terminate_walk+0x64/0x100
> [=C2=A0 426.715474]=C2=A0 ? asm_exc_general_protection+0x22/0x30
> [=C2=A0 426.715477]=C2=A0 ? disable_dynamic_sst_features+0xe/0x50
> [isst_tpmi_core]
> [=C2=A0 426.715480]=C2=A0 isst_if_def_ioctl+0xece/0x1050 [isst_tpmi_core]
> [=C2=A0 426.715484]=C2=A0 ? ioctl_has_perm.constprop.42+0xe0/0x130
> [=C2=A0 426.715489]=C2=A0 isst_if_def_ioctl+0x10d/0x1a0 [isst_if_common]
> [=C2=A0 426.715495]=C2=A0 __se_sys_ioctl+0x86/0xc0
> [=C2=A0 426.715498]=C2=A0 do_syscall_64+0x8a/0x100
> [=C2=A0 426.715500]=C2=A0 entry_SYSCALL_64_after_hwframe+0x78/0xe2
> [=C2=A0 426.715503] RIP: 0033:0x7f36eaef54a7
>=20
> Add a check for X86_FEATURE_HWP before accessing the MSR. If HWP is
> not available, return false safely.
>=20
> Fixes: 12a7d2cb811dd8a ("platform/x86: ISST: Add SST-CP support via
> TPMI")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
> =C2=A0drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git
> a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index b8cdaa2..6f46cbb 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -558,6 +558,9 @@ static bool disable_dynamic_sst_features(void)
> =C2=A0{
> =C2=A0	u64 value;
> =C2=A0
> +	if (!static_cpu_has(X86_FEATURE_HWP))
> +		return true;
> +
> =C2=A0	rdmsrq(MSR_PM_ENABLE, value);
> =C2=A0	return !(value & 0x1);
> =C2=A0}
