Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05B1F4E4F
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Jul 2025 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858730; cv=none; b=ucfXupK5sqGEUWUmCzd/NAEL3NQ1b7UCfJ2zDpaBdsCQnoHKbqpAmLRHUh4+xqbef49j9KcM3ZXfaeSLHx85KiReituv02TkSNRjRcfZ8WQOkiIXk/JHHSiXZqBKBSOio7cTewJLs1C9jhfHMQ10DC2sfm4NjHzWyp+ZkSX4zGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858730; c=relaxed/simple;
	bh=mPusrFYSQiHD8L35q+kON894pah0XjZlaI24vkkOr+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPMVHiOmCISkyvDeRLkcQTY47/yfuB10kUZbOxHPLJYNS8JLt3GJC7Z68cVKX9RUQh3kviq/HiFfdh8d0NtS0ESQgnKyZhtPEqvmWffVDmnkr2UxVaHQPegWFjmGyG3ibpqib3JCqBBN45U6kH/aR6sg+9ne5Ar48MhfUldKfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEs2r/uX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEs2r/uX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753858728; x=1785394728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mPusrFYSQiHD8L35q+kON894pah0XjZlaI24vkkOr+M=;
  b=GEs2r/uXD/Eq0tbRUDp0hXONODxjVxwnd9Gpr/Qnc0lpWa72lQVx4ZHb
   sIb2bNvxfDv3sFbgNEdTnE75ywRw4KKPv4zRBG2XAJKB9wCEvOiZOsoqJ
   TzXap4F1SL77rT/q4lxHGl9sLXGfvIUv5N1ljs1oq2982wZaxd7p+lvud
   V2q83pla6OAtSinlmK+pUoGE32bFj/8/fQFgr95Lx8bdYL5WkTLhyJNos
   UN543IVk67DhP8VOyrgEU9cEb8ous2PQRRyLw3WWt6kgevFOevd3Ovg02
   uAWByWrfqT4aIzfHXbVM09CIa65HxOyZx8jqNAwiL3m1UUFpuCooSizFr
   Q==;
X-CSE-ConnectionGUID: ctngHCI8Q3WTMVH5TyRmYg==
X-CSE-MsgGUID: u9fs3MZnQBiAjtp+qj+AJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56084734"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56084734"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 23:58:48 -0700
X-CSE-ConnectionGUID: ctm/r5k7REm+oiJrxdRuIQ==
X-CSE-MsgGUID: xONUjMSWTOiwLVc0FDUGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162494766"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.47])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 23:58:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0EE7F11F90E;
	Wed, 30 Jul 2025 09:58:44 +0300 (EEST)
Date: Wed, 30 Jul 2025 06:58:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 0/3] platform/x86: int3472: Increase ov08x40 handshake
 GPIO delay to 45 ms
Message-ID: <aInCo6_0qW-8Ao6I@kekkonen.localdomain>
References: <20250725215259.402796-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725215259.402796-1-hansg@kernel.org>

Hi Hans,

On Fri, Jul 25, 2025 at 11:52:56PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of the patch-series to fix ov08x40 based cameras not working
> on several HP laptop models.
> 
> Changes in v2:
> - Convert int3472_gpio_map to use C99 initializers
> - s/enable_time/enable_time_us/
> - Move enable_time above con_id for better struct packing

Thanks for the set.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
