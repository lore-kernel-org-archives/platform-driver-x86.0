Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255BE42A8A
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731314061; cv=none; b=sy4uRa2M9XjAJfHazySsS3sAPxlKSuW0RNfaebT1ShTN8Pq1Lp3ZMTt89iWpgUoRn/1HaQmag34zVH/+WywXytwjVaNL4R06lYrC0Y1GIQccl1mFDfqkd7VZW114y15l2GoLShtv+mXa+lfZ7OfXNDTXBCaycEofHTEbfUWUHkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731314061; c=relaxed/simple;
	bh=Qw0waPHKzeQvDumySVfRMRtmqdeBiISBP2VPbW8KQAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTCHb2f0JG6Xliif84JJRPYMyOVCL47DJJwLs7QY3P9MXT8ple7R4jvYzwYAGRIJKcVeUm0ckkatUwxPGxP1wp6vt676cStH3SXgotrC2cFKoi5tM52r0155DNTBPT0yUP1/5+TBd2FHT8/5lbK8somB+GV+KaBx/uQnZpTrGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4Hp0c/A; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4Hp0c/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731314060; x=1762850060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qw0waPHKzeQvDumySVfRMRtmqdeBiISBP2VPbW8KQAY=;
  b=N4Hp0c/Af/AWRfl+m4AS2u+Cb+/Q8G4ktClOD9PIEjIj1BVWRmKYZD7u
   Ni/Kb2oXweLZ3rq6RuOTc+WZfMgsk7YmvoyzIRnFyw/PVlrjS+sh7S7xt
   2WIjS9Fi9oTgixtMfpeCAf10Uxc12r5+NWDh2F8mmMi/xRdKlprkszLfC
   Onj/of30PDf5K6yY14fZ04BpOkpT/XlU1Ub9QgPWDyztucFkBalvMP+N2
   yOKNZnBNV8OXh6cfqEbOOo26QCA57faljiiIGT6jlYH7uwgE9SoPNJm/P
   jBZh9smFLsQSWL4fTkmOyvxxhs1RlamWfepqg+hdQpeR44dbRz9KPZ08X
   Q==;
X-CSE-ConnectionGUID: EV8asvAIR2yJD0If/5p1oA==
X-CSE-MsgGUID: GyX0TwWeQQevrt26E/91Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31333999"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="31333999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:34:19 -0800
X-CSE-ConnectionGUID: LghEgWQ1RoajO+Z8pKmSQQ==
X-CSE-MsgGUID: X+6Xkdf4SuKbeKmf3KhkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86771188"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:34:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAPsE-0000000DWsb-2KT1;
	Mon, 11 Nov 2024 10:34:14 +0200
Date: Mon, 11 Nov 2024 10:34:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: Re: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Message-ID: <ZzHBhsJ_J3ARhLu9@smile.fi.intel.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 03:19:53PM -0500, Michael J. Ruhl wrote:
> Usage of the telem sysfs file allows for partial reads at
> an offset.
> 
> The current callback method returns the buffer starting
> from offset 0 only.
> 
> Include the requested offset in the callback.
> Update the necsessary address calculations with the offset.

...

> -	memcpy_fromio(buf, addr, count);
> +	memcpy_fromio(buf, addr + off, count);

This will give an unaligned IO access in some cases. Is it a problem?

-- 
With Best Regards,
Andy Shevchenko


