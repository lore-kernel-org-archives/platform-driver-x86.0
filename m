Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A438398F;
	Wed, 14 Oct 2026 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983487; cv=none; b=rHcpbWbD5lEOSfyFUFrzHihpmdnuVeNdlAo4SZgip6eAaDOdmDKPR5fGt3a8YhrPUBLkADyj93Dyq16ultIWYJuXQ9LTVpWvZMMzthS8Xq6HRQR5hXjxJXwFBvzEhqlXbQBxsGcohslYRmsPLz+BTZE4wuQnyc/zr5ryD5Vqcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983487; c=relaxed/simple;
	bh=NlVped7DszNaeoo3FtXYIKX34/l5EV3iTsXiUuiAZcs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mf5JA+cOLoOMSKuyPtKCxd4GDdw0Rk774QcPGfykyZ40Yz08177JjobiON097Pnd6I7jVaKpmyDgIKsZkrkGlgUS0jCyhturXmcUbux9Q9cnqCwTjDUq24WvR6Ros80D5W/fs+zG7PfrzvA2A7ywXHQnCHhxMTh2LXuQcuFJWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MexPzQaF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MexPzQaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791983487; x=1823519487;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NlVped7DszNaeoo3FtXYIKX34/l5EV3iTsXiUuiAZcs=;
  b=MexPzQaFiJHA5rhQoj1+SyqL91AO4TbbZRDdW3IknRoXtG0mAzFUXYEF
   9jGFKwxAn2DHjAru/g11CF5gBSrA9AxQxaAb3eYm8v4dsHI6U2OFIhh7S
   VUEm2aGtHKqgZj1ApRylROy0DoCq1r1aXFFeYiucUydEuxSAqOBquXU+P
   2IULQp4twQIgexfdCp+nSouaHpwCjqYITiIibl2JlOFVEaZtoGs32qSqQ
   f/mHMKPYHxdmN1F11ha2rfodqf/UI485qI8SsPD0KzYovpTYbjcEtmK94
   Gb3N4PMC1AdIW7xy5twjbIzf4XsbzH+kpUJjqXht9eXXuPPjWzETLLJ7I
   Q==;
X-CSE-ConnectionGUID: DzeDYJpPSXeTF2qlJowT9g==
X-CSE-MsgGUID: gGCHqVpKQfKFKrcnti1v9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="737892"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="737892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:11:26 -0700
X-CSE-ConnectionGUID: 5J602CYiTECG6UVqsJniIQ==
X-CSE-MsgGUID: XdGamVSuS5O7mPu+96t/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1754314"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:11:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 16:11:18 +0300 (EEST)
To: Muhammad Bilal <meatuni001@gmail.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/9] platform/x86: hp-bioscfg: buffer handling fixes
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
Message-ID: <c1a76394-9c56-3cf2-ea4d-e35f0f9320cf@linux.intel.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Oct 2026, Muhammad Bilal wrote:

> Buffer handling fixes for hp-bioscfg.
> 
> Patches 1-2 fix hp_get_string_from_buffer(), 3-5 the password
> handling, 6 the single line input check, 7-9 SPM and integer parsing.
>
> Changes in v5:
>  - Fix the multi-line comment style in patch 1 (Andy)
>  - Reword the changelog of patch 4 (Ilpo)
>  - Limit the scan in hp_enforce_single_line_input() to the string
>    instead of copying the input past its first NUL in patch 6 (Ilpo)
>  - Include array_size.h in patch 7 (Ilpo)
>  - Copy the token with kstrndup() in patch 8 (Ilpo)
> 
> Changes in v4:
>  - Add patches 4-9
> 
> Changes in v3:
>  - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
>    and declarations (Andy)
>  - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
>  - Drop a blank line in the declarations in patch 1 (Andy)
> 
> Changes in v2:
>  - Split the hp_get_string_from_buffer() fix in two (Ilpo)
>  - Drop the lib/string_helpers patch, use @only of string_escape_mem()
>    instead (Andy)
>  - Add patch 3
> 
> Muhammad Bilal (9):
>   platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: fix non-ASCII truncation in
>     hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
>   platform/x86: hp-bioscfg: allow clearing current_password
>   platform/x86: hp-bioscfg: fix off-by-one in password length check
>   platform/x86: hp-bioscfg: fix heap OOB in
>     hp_enforce_single_line_input()
>   platform/x86: hp-bioscfg: validate SPM state returned by firmware
>   platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
>   platform/x86: hp-bioscfg: fix oops on short integer attribute buffer
> 
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 82 ++++++-------------
>  .../x86/hp/hp-bioscfg/int-attributes.c        |  7 +-
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 18 ++--
>  .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  9 +-
>  4 files changed, 53 insertions(+), 63 deletions(-)

I took patches other than patch 6. Some tweaks to the tags were made.

-- 
 i.

