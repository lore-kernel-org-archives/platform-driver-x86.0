Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612D19C56A;
	Thu,  3 Oct 2024 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971417; cv=none; b=LRlM23OjDS2YZuhDLp0FLd2rQm/bGk3AKdvoSLojO7vtmrdSkZV0aQIIbXOPaqSf7tn7LbesNJD2fikSZoyfUIEn07XJK2FNwv9s7FgCBtk0TKDcjS1rMy88jpnIJcCZeGu5GWLZMppSac8hbXdJLkQE1GE+218hd6JeHmhPI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971417; c=relaxed/simple;
	bh=3Oul6k2Gcg61VyyXjrrG7JbnVR+FCjlGRm+L8aDQ8dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY8MpI0MKw6SR5D2pFqtjled5OYPQoP2IdP8zK7FN24nHSh0dHCWOMrmB1GQ0yhlTBZ3IbWyFqp/qHoEzbFgjDNvUajae6rH2WuszLK9FrnzaxsH7UJYCe30My/qzyHS3GiTjvcJC5C4oMueDu8xt6+V1yOKDO/tU6saaROgodM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN6YH4sQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN6YH4sQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727971415; x=1759507415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Oul6k2Gcg61VyyXjrrG7JbnVR+FCjlGRm+L8aDQ8dg=;
  b=RN6YH4sQk8TQTbF2wdKYkZSsfrEKx4odnypm4boYRBmzixCML9scpkNX
   e6NVHwlowzZ2KFwAYLWfvhmvJzGd/O6LmJMHKne0xS0pTniC9bEEriVE3
   1VaeCbUP/UYmtXwu4XBoP6hneqH/Qe9cpdGlufgWhSMRoLYrPiJ+x1VaG
   unDU4e6mpDEMDleGtaTQ2NQSHsbk6b+mHwSLzXSHdxZPqVTrXrNYHZndT
   YztOupsSvXYrlWeoGWYCj+TlR8Ut4w/2yZ/aZy2Z62g7nmAldlKU2tz6r
   +l/H2yRMQAnsONBdD5lHODxx4R4ZuiqtPlthDtyHWb4dV3wNrFwYXRNOl
   w==;
X-CSE-ConnectionGUID: jFWnoM/iTdWww3wSvRniMw==
X-CSE-MsgGUID: aYa2ytbXQQaOLjuyGTdi5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37772208"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="37772208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 09:03:34 -0700
X-CSE-ConnectionGUID: 10keF7bcSMeasDwe5ABPwg==
X-CSE-MsgGUID: WKwKq/DBQjCPy2/5l/zo6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="75198114"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Oct 2024 09:03:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1925437D; Thu, 03 Oct 2024 19:03:32 +0300 (EEST)
Date: Thu, 3 Oct 2024 19:03:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86: intel_scu_ipc: Don't use "proxy"
 headers
Message-ID: <20241003160331.GP275077@black.fi.intel.com>
References: <20241003154819.1075141-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241003154819.1075141-1-andriy.shevchenko@linux.intel.com>

On Thu, Oct 03, 2024 at 06:48:19PM +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.

Is this some new Coding Style thing?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Fine by me,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
