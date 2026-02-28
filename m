Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B58F25EFBE;
	Sat, 28 Feb 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772262125; cv=none; b=miBKG+e3xDGEraJK9/DbFrelXWmrCkBLCHA0usib2gHk6D/Zoo0W+PQ6FsfkK9FmVNakdKuRiKYV2WpzHnOGSCTlwuazbQQ11aUSHo89Cp8RbR0kiI818bwd6PRDl2+XxwGWg7IxcWYQuChKVIN5+76FeNvNXjf34PNbauk6fS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772262125; c=relaxed/simple;
	bh=uUAUJ/SEYhixx1AJbJBupM8reL9/nEbLspuifeMY9WM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gn7rXW8+SxP2HBXx6ixCvs+zNt56VXg/HwXremtTRU/qTS6pZV0L3tp6LkOnema9YeSavd1Kc2m+i7buTwx99JfD6NuBVevwb6Huv9FGsCX9wnXd+TmojxunXaPMBTfTg5ZvBv9tStMPb0L83NBDPHBn83o7ZuJE16DGGMxOIls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVD5wY52; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVD5wY52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772262125; x=1803798125;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=uUAUJ/SEYhixx1AJbJBupM8reL9/nEbLspuifeMY9WM=;
  b=jVD5wY52c+6wEcgKeIFe6nYsiVmjXs+PMwk9v1NsEn0zeDaMFLbyJiJO
   J8zxcIT4it8qTosEzFtqATDmTSa2wqGkKON1OUdJpj6od0/yOWF0RChNx
   CGf/R7bnk3GR2nhP7ZqD0CMlR6hxS+eiqeaANcjhX1mUBJS5Wuk8A06yG
   ERET/oIupDJ1TTxzEUZtYn2mItiLqyQd/s5ARvtLS80H9PECH7GhGLq1P
   1H731dm14SshQvMf32uC98VE5m7DN/d8bGASgJ/UoiG69WZGpjMxjS91m
   KePMW+M1/z/40y58hJK/qGpGjXUaO7/cMPxrjQoPUu4FWOUg/8rTVRjZ5
   w==;
X-CSE-ConnectionGUID: qcfUWrrzReSfGqVkp6ORiQ==
X-CSE-MsgGUID: jN7hgNrdRTqP32dcHZBdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73408296"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73408296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 23:02:04 -0800
X-CSE-ConnectionGUID: rFqkrEcGQ3SsBBfqOuVaUQ==
X-CSE-MsgGUID: iOOOKWgZT4umD/7Hyy7yVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="222091311"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.125.111.246]) ([10.125.111.246])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 23:02:04 -0800
Message-ID: <14c6d1ec06bde185c928e433c3d1fa2341be86b9.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E7=AD=94=E5=A4=8D=3A?= [PATCH][RFC] platform/x86:
 intel_speed_select: Use static_cpu_has for HWP check
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 27 Feb 2026 23:02:03 -0800
In-Reply-To: <ad6453bb815f4445bd80239e96c827e5@baidu.com>
References: <20260228035108.2543-1-lirongqing@baidu.com>
	 <ad6453bb815f4445bd80239e96c827e5@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-02-28 at 06:57 +0000, Li,Rongqing(ACG CCN) wrote:
> > =C2=A0static bool disable_dynamic_sst_features(void)
> > =C2=A0{
> > -	u64 value;
> > -
> > -	rdmsrq(MSR_PM_ENABLE, value);
> > -	return !(value & 0x1);
> > +	return !static_cpu_has(X86_FEATURE_HWP);
> > =C2=A0}
> >=20
> > =C2=A0#define _read_cp_info(name_str, name, offset, start, width,
> > mult_factor)\
> > --
>=20
>=20
> static_cpu_has(X86_FEATURE_HWP) is different from value of
> MSR_PM_ENABLE, when intel_pstate=3Dno_hwp is configured in kernel
> cmdline
>=20
> Sorry for the noise, please drop this patch;
>=20

No worries.

-Srinivas

> [Li,Rongqing]=20
>=20
>=20
> > 2.9.4
