Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A81A2C0B
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468216; cv=none; b=uAb1TyFoTl+seQkPVm0J/lfMbQYMXPbcWxXixPzPqo4/q3xI0jAR61s8fB6Xe2TnaASxv3zY1UTkKLYg1MNhxG0BDfmY7nueqtM9gLg7JQuOuBmiUVIIrGuTBCUZIavrZgqU834Fi3gATPaTP7YExip2ROuOxW5oCJitdX2iIfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468216; c=relaxed/simple;
	bh=611EiaKpXMxVns229GJRl8GnChsrYN11L5yq4ur7dxo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ieTaj0xyFj3FV5XY7dlex8TCNmlpE0exJkAF0eOefxOgdZqycrEk+uweUZ4Pwt/xZk1hHVflmALuwBtYGSjaH7QAsipAH9/SO/zY6K+MLiVIHvGsztZLxnBFEpAy2HGW9iEAGlKWGAH4F2XbzJGNDU0v15ugEV2gUpKG71UhZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cues/0IA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cues/0IA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772468211; x=1804004211;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=611EiaKpXMxVns229GJRl8GnChsrYN11L5yq4ur7dxo=;
  b=cues/0IAF4nS9lwlVT9rqHHMm9G8SlkdmnbVh7DUN+ebX/NuZXyw3gEc
   cY9yci9Ad2aG7fbRu7onDFidh1Ui3QRtJYkos+hSzlN70is+u77SV8Mks
   6Q5OcGq6NjJrMOO75XuUkeGc6pvR5x6tGgwr2sdXo6A0nCsRQuUTYN/IY
   J1Pz7/02mj4i0NBH/UcCH+AGdKvUC5BKADt6TowcHFn3Tb5ls8GP0/MoS
   orMQGmG7bvJyUxWMNJR+mLFnpMru/ZA5/1VyebzKbk23DuPgyiYuNS8Hy
   i2hnwHyBDdlBu+qd2irp0xry2b5IqDK2ItuWLNkWEqGkeNQR+EXrb3zpc
   Q==;
X-CSE-ConnectionGUID: 12q2fsXpQce8uXI/86YDGQ==
X-CSE-MsgGUID: CxH1RcLoQAyLkcXrlytmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73387883"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73387883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:16:49 -0800
X-CSE-ConnectionGUID: zB0kpQX7T1qDHG+rcx/GvA==
X-CSE-MsgGUID: 4YbhfAB3QsCUAb3JIVxHEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="221847642"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:16:49 -0800
Message-ID: <67b387d94df512d77991f370bda8384e3fd4da9f.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E7=AD=94=E5=A4=8D=3A?= [PATCH] platform/x86: ISST:
 Check HWP support before MSR access
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>
Date: Mon, 02 Mar 2026 08:16:49 -0800
In-Reply-To: <2c70039312544a68adafe670b422e2bd@baidu.com>
References: <20260228122441.2284-1-lirongqing@baidu.com>
	 <2c70039312544a68adafe670b422e2bd@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-03-02 at 02:20 +0000, Li,Rongqing(ACG CCN) wrote:
> > On some systems, HWP can be explicitly disabled in the BIOS
> > settings When
> > HWP is disabled by firmware, the HWP CPUID bit is not set, and
> > attempting to
> > read MSR_PM_ENABLE will result in a General Protection
> > (GP) fault.
> >=20
> > [=C2=A0 426.715441] unchecked MSR access error: RDMSR from 0x770 at rIP=
:
> > 0xffffffffc33db92e (disable_dynamic_sst_features+0xe/0x50
> > [isst_tpmi_core])
> > [=C2=A0 426.715450] Call Trace:
> > [=C2=A0 426.715453]=C2=A0 <TASK>
> > [=C2=A0 426.715454]=C2=A0 ? ex_handler_msr+0xf6/0x150 [=C2=A0 426.71546=
1]=C2=A0 ?
> > fixup_exception+0x1ad/0x340 [=C2=A0 426.715462]=C2=A0 ?
> > gp_try_fixup_and_notify+0x1e/0xb0 [=C2=A0 426.715466]=C2=A0 ?
> > exc_general_protection+0xc9/0x390 [=C2=A0 426.715470]=C2=A0 ?
> > terminate_walk+0x64/0x100 [=C2=A0 426.715474]=C2=A0 ?
> > asm_exc_general_protection+0x22/0x30
> > [=C2=A0 426.715477]=C2=A0 ? disable_dynamic_sst_features+0xe/0x50
> > [isst_tpmi_core]
> > [=C2=A0 426.715480]=C2=A0 isst_if_def_ioctl+0xece/0x1050 [isst_tpmi_cor=
e]
> > [=C2=A0 426.715484]=C2=A0 ? ioctl_has_perm.constprop.42+0xe0/0x130
> > [=C2=A0 426.715489]=C2=A0 isst_if_def_ioctl+0x10d/0x1a0 [isst_if_common=
]
> > [=C2=A0 426.715495]=C2=A0 __se_sys_ioctl+0x86/0xc0 [=C2=A0 426.715498]
> > do_syscall_64+0x8a/0x100 [=C2=A0 426.715500]
> > entry_SYSCALL_64_after_hwframe+0x78/0xe2
> > [=C2=A0 426.715503] RIP: 0033:0x7f36eaef54a7
> >=20
> > Add a check for X86_FEATURE_HWP before accessing the MSR. If HWP is
> > not
> > available, return false safely.
>=20
> It returns true, not false. Could you revise this commit message in
> the merge?

You should submit V2.

Thanks,
Srinivas

>=20
> [Li,Rongqing]=20
>=20
>=20
> >=20
> > Fixes: 12a7d2cb811dd8a ("platform/x86: ISST: Add SST-CP support via
> > TPMI")
> > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > ---
> > =C2=A0drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 3
> > +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git
> > a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > index b8cdaa2..6f46cbb 100644
> > --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > @@ -558,6 +558,9 @@ static bool disable_dynamic_sst_features(void)
> > =C2=A0{
> > =C2=A0	u64 value;
> >=20
> > +	if (!static_cpu_has(X86_FEATURE_HWP))
> > +		return true;
> > +
> > =C2=A0	rdmsrq(MSR_PM_ENABLE, value);
> > =C2=A0	return !(value & 0x1);
> > =C2=A0}
> > --
> > 2.9.4
