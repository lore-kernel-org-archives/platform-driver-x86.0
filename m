Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE23126D0;
	Wed, 26 Nov 2025 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764191631; cv=none; b=iOzPvcdYbYf5h4pNmIycbrgvgBNXeljdnsMEue4ukaHhZZi1s4M+NrUvfNGmM/nPvbZaP6SE/fTNNguJ2vFW1MEtyNNbagUina1nRoZtBdu4zdLNkllXBN+QSIifXzPFlAQZITSH5oRwePEWDj57zToAYGOtwvc2vD3jPrxTFdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764191631; c=relaxed/simple;
	bh=XCGWybB7R3Oiw5oB02Hn57dHUkk3gtxTY2Q+91vbxA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2fWK3+YYOi4YiFmbtQWltgjVDdKLh0sFFGgNMn3uWYYKMprGh9hLye8j2f4U01ocs9wa5QZe/uv55ZrYm5yUyityVnG3TficiyviapPsmjENpTClZYXuFeQCYfwuSGpy/6FQJJUqjezg6MvOuewTWhMFLZbxwlzWTzszOv59nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bk/yvDRO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bk/yvDRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764191630; x=1795727630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XCGWybB7R3Oiw5oB02Hn57dHUkk3gtxTY2Q+91vbxA0=;
  b=Bk/yvDROXTcTNUi5vyU6T0EXoJLZsps9hJ+LMG4TvyOctpjf5HIU3VOc
   Ns7B6XQnLsvG6f1FbR/CNrygzhCBJQxdRRVO9annmwZFa3WfwS3ZbsrAG
   uv3ssMbBiRAOBjgqGkdb+GJRL8LJJq5DptUxc7bwlCvy6PeJjbYFYMp7M
   xgPpRH1YrW42Oc+c2mG9CgJzBF5RMjvH67BiMulB6S0HpT7szB1UPeNHN
   LXZpenFHf6+8ierK4Bz/jd7GMFyjLzUMiuzVVPkQpLGvYErZUAJLDPkiS
   XGGZP4B3GHwcVmNospqKhJi6BpP1WHyZ0AzublISYnOT8TgT8tDFh3YWu
   A==;
X-CSE-ConnectionGUID: IBw8QASUSlKKFAKhALXEGQ==
X-CSE-MsgGUID: qAzOK+ASTpijBf/mg/PUEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65947043"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65947043"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:13:50 -0800
X-CSE-ConnectionGUID: vzQUks2PR42zABLsBgMoOw==
X-CSE-MsgGUID: 2flkTIh9S1qMGjtzeP65mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="230328052"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:13:49 -0800
Date: Wed, 26 Nov 2025 23:13:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/nls: Fix inconsistency between utf8_to_utf32() and
 utf32_to_utf8()
Message-ID: <aSdtinICsqilW22N@smile.fi.intel.com>
References: <20251126204355.337191-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126204355.337191-1-W_Armin@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 09:43:55PM +0100, Armin Wolf wrote:
> After commit 25524b619029 ("fs/nls: Fix utf16 to utf8 conversion"),
> the return values of utf8_to_utf32() and utf32_to_utf8() are
> inconsistent when encountering an error: utf8_to_utf32() returns -1,
> while utf32_to_utf8() returns errno codes. Fix this inconsistency
> by modifying utf8_to_utf32() to return errno codes as well.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


