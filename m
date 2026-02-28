Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93901156F45
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 23:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772319827; cv=none; b=qIqxNKz2jIf61BIQjOhjU2FZmBjSrzW353ejk3Rh6pU/uVjKE2JU07o5WIJp2cK2iWDEhJWeGylsnzPuyDBZ2Np28qsA8PxIxq2tjnGGbAJEiBD5fQg80/90z/kzU97r+dP8TeyQvoG7KX6AJvOe6es2TESmERHr5HHe/rH59ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772319827; c=relaxed/simple;
	bh=IwKQRs90TrmNWBFh4GeqC4Bcc2kxULG1QTLJiTDv2Hk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L2UG/569uuWnxBPd1rOXBcYa1ZqtySOtxTkiNrkQLUcJx+QB4ZPhIosr6P2Qv2x8kPrsycVTMIis8N7YhtJaJhbHtyz8Z4W4GlC7tdD/Oqi7j3SHZ0lnpwil8zVYqq6lVWxHT93Y/vDEr15oo3t9DAJiSFxuc5rUYKFvG5HTY8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3zMVSBV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3zMVSBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772319827; x=1803855827;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=IwKQRs90TrmNWBFh4GeqC4Bcc2kxULG1QTLJiTDv2Hk=;
  b=V3zMVSBVPFmDSVqT0tATtabPTgks3AJov90L8AQgIux08h4J7sY4hgaS
   zjS+p9WULjccj53h+9SjxjJ85UpMtAG6OaSjf43S/WmwiSU1LVDO4BiFN
   cgaFJWde3xuGK6assa6T94doitTNz2gFO3J6NEY94J1FEshtG6PVVJw+c
   +Yvv6BwygW0ARt3UUBEOqNATEpHoGk9f1AZnGYuUrro/Az4bI9cybJVqw
   6YVkXue8czQfuvb3bDhsY7rryRi4KAuKCYhhd7CqwDhiPbzoQpz14JOXk
   cHykG6HJdzddkQgUgjynSFqipgSuEoZn4fR1vUFi4EMj+ECE0FyKpZM6b
   g==;
X-CSE-ConnectionGUID: MoGgT0W0S8G4xfNHokUqAg==
X-CSE-MsgGUID: c/wi7UtPTuuql2dIXB/3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73437058"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73437058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 15:03:46 -0800
X-CSE-ConnectionGUID: kWp/3c5gRmC6OIl59Rs+ig==
X-CSE-MsgGUID: aYul2Cg0RLysbx14Ww21Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="214562562"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.125.108.21]) ([10.125.108.21])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 15:03:36 -0800
Message-ID: <9731cc3864c65a4c91447a7ba032555e1b117083.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: Check HWP support before MSR access
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: lirongqing <lirongqing@baidu.com>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Date: Sat, 28 Feb 2026 15:03:35 -0800
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

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>


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
