Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5D14F119
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715603319; cv=none; b=NGTdZvbbXJMcWMJO3kw1L6soq9dVHt8u0a8gRKKLjUo7rKCiRg3DJZLxBtFZyXKzLjMfLytEhHvx0woXZxZO9R6zqyVWX0XLOyJM8ETSafK04J/XzhXPlBsrXMyKZxbVdvy/jdaM4BXDbRdvtCm4l6coP6EgPdSzEyEUMSqVsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715603319; c=relaxed/simple;
	bh=7AbXUYyFUgK88e7xg8TfXFAdCsnmlv0SPtOf8zsOY9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9HHzag7v9ySqvK3wPud8Bo8c/Ir7QAgPtiYv0+OSAVozDeeyrynBoWTMaJxGX+lTp5FvUi+scLGDd5+xU7oI4ZR7qEpuYZKxBXYx3t6kKxHiwlLRK/2W1kMamyRJwlUkOMnhnvXPy5/nQNGuoHOjaXzCkl37Xe3UfZM3FDvooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: 30z69yTERrK9ngNDAZlDcg==
X-CSE-MsgGUID: Bd9NNBACR7OIJJghROJSug==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11666337"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11666337"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:28:37 -0700
X-CSE-ConnectionGUID: lMaZ8Q6lR0mJX4qjNGV/Cg==
X-CSE-MsgGUID: zIvRErhiQvWqhrtPy6tlsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="53531936"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:28:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s6UnB-000000078E6-0mDK;
	Mon, 13 May 2024 15:28:33 +0300
Date: Mon, 13 May 2024 15:28:32 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
Message-ID: <ZkIHcGkhB6qHsyyz@smile.fi.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com>
 <20240512162353.46693-2-hdegoede@redhat.com>
 <CAHp75VeMT+Pcvf-T9-iVqchSx1tppaeORWMmFhP66ZMg-ybmPw@mail.gmail.com>
 <796db4c0-e81f-4067-9deb-bef8b36979c9@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <796db4c0-e81f-4067-9deb-bef8b36979c9@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 12:01:55PM +0200, Hans de Goede wrote:
> On 5/12/24 9:35 PM, Andy Shevchenko wrote:
> > On Sun, May 12, 2024 at 7:24 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > 
> > How is this being used?
> 
> #include "../serdev_helpers.h"
> 
> uses this.

Yet another evidence why C code in the *.h is not a good idea.

-- 
With Best Regards,
Andy Shevchenko


