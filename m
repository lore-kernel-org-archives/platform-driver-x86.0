Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674536D4F2;
	Mon, 24 Nov 2025 07:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763968666; cv=none; b=mY1MxvPcK37rUIYbOsEWfy/T1XrDXWp7zQKuuKsAMbrVwN+SgpFpBATw9xj+d2MrKyVuMiy3ZsHy+kJylFy4+dQhctc2MmstR281xxXWbN2HowK05y6MVppOjJ9Q7qPhLp4ucT3U9COSX94OKmeBxiOhA+hthY+9x2UrBgXCYAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763968666; c=relaxed/simple;
	bh=WwNd/0ef7jRQxaCIuFLj5/dg9MgHWMgivzKN6GdtNH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhjfCHpLJGKjtPF1B6jDkN97dkwfWpXOG2nxWVChNUwlnH45YKBbzwDA0YjWh1GquFY1Foxx2SgRlJsHgoY5i0kwoei04+yeOtz7gpczJh6BUx5kXluuHIvQGvU5Ssa7HElTNL6S8hLj3/scyWfNMC2/mEYU1cDczIJHPa3QcTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mx7r6i2+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx7r6i2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763968664; x=1795504664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WwNd/0ef7jRQxaCIuFLj5/dg9MgHWMgivzKN6GdtNH8=;
  b=mx7r6i2+xFuY8u7WND/NNp2dWQa9QkBJgYYy3b0XLrPzDluPqChs291S
   ykxICfEYVpTECuXWlzQN/uo4cyAqtK7LeJ6snYL14Ben/vQ6U+H0LyDj2
   8SOGm8GjkikZcihlfnaP3BwQm/d6F6z4kdU6XqvNSjsUARD3GYTiumBDx
   3dc3xFl89HK3WMpms03NVM5w21G1E6opwC681WC7djC/NsFUHyTiHtZev
   B3i3xLVKtsanSeDC7z/1K7wh4z9Xj+lM6cf/oGANMzX3L1ZzBdDhwp0XK
   6RZwG9gC3qh1TU+qpEdZULMsXU+b1Ua2ln9kgsQHS5ab4F3n/1GEqzXGz
   g==;
X-CSE-ConnectionGUID: 15NKRoNOT72G0nJUAwpIFg==
X-CSE-MsgGUID: ECHbhM1gQ+ec0qScq5myLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65992227"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65992227"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:17:44 -0800
X-CSE-ConnectionGUID: 4D5BEi6HQeWYE7KajjjuEQ==
X-CSE-MsgGUID: A1G+x7k0R7i5sBLKm/2KBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196541620"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:17:42 -0800
Date: Mon, 24 Nov 2025 09:17:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Qipeng Zha <qipeng.zha@intel.com>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel: punit_ipc: fix memory corruption
Message-ID: <aSQGlLXYTWzus5e-@smile.fi.intel.com>
References: <aSBqXtt8hJb7WYIc@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSBqXtt8hJb7WYIc@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 04:34:22PM +0300, Dan Carpenter wrote:
> This passes a stack address to the IRQ handler, "&punit_ipcdev" vs
> "punit_ipcdev" without the ampersand.  This means that the:
> 
> 	complete(&ipcdev->cmd_complete);
> 
> in intel_punit_ioc() will corrupt the wrong memory.

Good catch, now the question, how this driver was ever tested?..

-- 
With Best Regards,
Andy Shevchenko


