Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654412F12D1;
	Tue, 30 Dec 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098443; cv=none; b=J05kA/NYB4Cxmjeovp54fzos+cxOmoUXBkZwuNfJA4Drg4YcZE+NGqGDfdIekD7HVDMIbdVJY699wU/dRN190PA/U179XKJ8HfJqnAmoZrpwreHIz6t0oi55n2RBcPu4RIWhTKtUCVtSLsx2g3y+Hvk33WFFAURIXN/C7J83014=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098443; c=relaxed/simple;
	bh=z+68Hjmns/ybdca/2x2LzXYXvz5wqPjazz3Jgajx3NI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G196KNSI8MDBvvTcbjLw7ahBtlN2F/1HM8oe+cyPeYAwWQE4eWJBHERiznvXiUFG/jH4ce0XkPVCD3RkDRkFOHdn5fPtLltQ2wCjjeiQPkn94JFTuiyaEXEW3eMPCFjwlC7EAfIkC9f5AdPOYUUUu+2Y6R/E0MreaDy4bD+PMKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5sR4vIi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5sR4vIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767098441; x=1798634441;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=z+68Hjmns/ybdca/2x2LzXYXvz5wqPjazz3Jgajx3NI=;
  b=V5sR4vIif3invp0/j/dyO75Be10j1unGdvfjbNCsv0Zd3ZmWFKQD0o1V
   4gYiu4L7Xu1/BFaSQQ2jezqR3Pz+JJsTm1/KOID/hC3ePM6tyKgY+NY8O
   jLJF50Pz0e+1Mh5B6R9A/0cVvAt84oJKAg33z4x4W6NDxqf5dem1kNXFk
   J0q/6tQvYRYY3sSBL0zDLOwEXgNNldlyH8pAxfBzPWds1zW5HhLfO0myW
   +r1iQn8jx/BaAD0B3JjPLckuwix6DtUFl7v0hYSTpHTYkQ1aCkTBUG4Sg
   pc7lXT1B6uCmsK6fAhD0B/jFQ7OA9KLQ1qWNIIFHteZTxdQIH7CaC6WgZ
   Q==;
X-CSE-ConnectionGUID: Ypo2mLCjSe+dkCI42hc78g==
X-CSE-MsgGUID: qP+oH+ufT6yMFa2l8cNt8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="56260773"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="56260773"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:40:40 -0800
X-CSE-ConnectionGUID: nXR8Ufm+Qoyba5PAVNGlww==
X-CSE-MsgGUID: EfGoQukOStevi+kVptxE2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206086506"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.124.221.54]) ([10.124.221.54])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:40:40 -0800
Message-ID: <45cfb83557849d022b3b70f060c4702334f0ea8c.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Use pkg-config for
 libnl-3.0 detection
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 30 Dec 2025 04:40:39 -0800
In-Reply-To: <20251229204506.720353-1-raj.khem@gmail.com>
References: <20251229204506.720353-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-12-29 at 12:45 -0800, Khem Raj wrote:
> Replace hardcoded libnl3 include path with pkg-config detection to
> improve portability across different distributions and build
> environments.
>=20
> The previous implementation used a fixed path constructed from the
> compiler's sysroot, which could fail on systems with non-standard
> library installations. Now the build system:
> - Attempts to detect libnl-3.0 include paths using pkg-config
> - Falls back to /usr/include/libnl3 if pkg-config is unavailable
> - Maintains backward compatibility with existing build configurations
>=20
> This ensures the tool builds correctly on a wider range of systems
> while preserving existing behavior when pkg-config is not present.
>=20

Thanks for the patch. Will include as part of next PULL request.

-Srinivas

> Closes:https://bugzilla.kernel.org/show_bug.cgi?id=3D220819
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0tools/power/x86/intel-speed-select/Makefile | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/power/x86/intel-speed-select/Makefile
> b/tools/power/x86/intel-speed-select/Makefile
> index 8d3a02a20f3d..6b299aae2ded 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -13,7 +13,13 @@ endif
> =C2=A0# Do not use make's built-in rules
> =C2=A0# (this improves performance and avoids hard-to-debug behaviour);
> =C2=A0MAKEFLAGS +=3D -r
> -override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include -
> I$(shell $(CC) -print-sysroot)/usr/include/libnl3
> +
> +NL3_CFLAGS =3D $(shell pkg-config --cflags libnl-3.0 2>/dev/null)
> +ifeq ($(NL3_CFLAGS),)
> +NL3_CFLAGS =3D -I/usr/include/libnl3
> +endif
> +
> +override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
> $(NL3_CFLAGS)
> =C2=A0override LDFLAGS +=3D -lnl-genl-3 -lnl-3
> =C2=A0
> =C2=A0ALL_TARGETS :=3D intel-speed-select
