Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C2424D6B;
	Mon, 12 Oct 2026 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791835835; cv=none; b=YeqmyJTYUELkrZcpAMvlWgQDYP2wooCgZpSOL23eXFv6JpHARyhhnQWNC+UtM/jRg6ENhMppOqF+fG8RfcyMEOpuu0q+DoCdPshALtgg+kjcRRKkgwSev4yJBp2eDDkl1KMzRN3CNVcby3VSXffvyUZBc+x0Q/WH/IjLRGgRauI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791835835; c=relaxed/simple;
	bh=6qVl8l0ORmU3qgYKTi/JjagxmTn0oiUeDUJ0XprazQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1PZy9t+3QP3a6uQMOLjUDGIfTXl8rzPUr1IE2eDMDkdNE+icCIxCDsADz+ey6w7V7g2wJ3IwkPk9d8gPDQoti7DlwPxmbUCMQtUx0oh0LlFj6SHw62qI6OXl03D30BPJn/BPLksYCF4Sx3zNDwez+O059heADslGKLFPgxeYX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqCHEcL9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqCHEcL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791835832; x=1823371832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6qVl8l0ORmU3qgYKTi/JjagxmTn0oiUeDUJ0XprazQc=;
  b=gqCHEcL9QNjdsy8GF1HRHd5Vo5H3k4sgBVN+C8K95TzAw80862UTFEyf
   WUv1xdNJOs6X/VLL4fjkphTGG7R19BSzy6GMv3L1OaAJ6mBc4m7D1Ia4W
   urN4twGSOb8Yq5683FfXzSNLlgMrfecYJ9AS/eP8SQc/h2qYFFTybozdv
   eX4V42u4oNzaq4ynOMfc0uUdX4MPjpXvoANArz+Bspa8zeI18N/DdqKhd
   c2UJei51r7ozXu8vYe0KmWKDjSvsHEBeFFw8BYVxl9/SIMxwahPy1toju
   BTVhh7nq+4TaHitaTMX4nNpMQuuvGd8x6yVtVsZMnczEOOkkUFSHNXmD0
   g==;
X-CSE-ConnectionGUID: l8ZQV65dSni0yzBgiFPUCQ==
X-CSE-MsgGUID: 0lQcIzVSQLiqgKdWEzNAEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="429082"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="429082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 13:10:32 -0700
X-CSE-ConnectionGUID: PwsKfzAyT9aqonhxDHp0OQ==
X-CSE-MsgGUID: eb+GyynnQTWa/6Qk4kZykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1038785"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 13:10:29 -0700
Date: Mon, 12 Oct 2026 23:10:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 17/20] platform/x86/intel/tpmi: Use scnprintf() to
 build the debugfs names
Message-ID: <as0-s6JyjfA2zY-B@ashevche-desk.local>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20261006183037.1507007-18-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006183037.1507007-18-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 06, 2026 at 11:30:34AM -0700, Kuppuswamy Sathyanarayanan wrote:
> snprintf() is on its way out in favour of scnprintf(). Neither of the two
> callers in tpmi_dbgfs_register() looks at the return value, so the
> difference in what the two return does not matter here.

I believe I asked it already: Why do we care? Do you get any compilation
warning (assuming `make W=1`)?

-- 
With Best Regards,
Andy Shevchenko


