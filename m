Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD8A199D8;
	Thu,  2 Apr 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134694; cv=none; b=LYO0/0AlH6NUtGXXaUs4fJzQ9Smybx+vh+A/HlIOzZJMZF1+m8sPep8BVXsZMzNoPFHYwt+22+aywIZyadRbfw/JuedPduNDGuzm4SnqTU00DAvgPuOe/2ABNH5RBnYEIo7QQRfxfmJla0PrjuwQ4yHQ5YB2L8sCPb38MWNQgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134694; c=relaxed/simple;
	bh=5By4L9q7Enuf/J/NbbF3P3YpuOblNDv8lBt2Zxs2nzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzrnIErTUzkV8QNZap00z5gIPprapUYhU3Nqu8a/ZXLJBJ2Yj765sw8vNr9VN5IZQ4v6pNtsymD5lB2anMHWvuK959flInPsFRJM2JLO7ATLd+j0PpjjYyup4vx6lWWe3kybhVafUHEYmd5rC3842ZPoHpi2R1VEb0zME5aBdfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+7ML8mM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+7ML8mM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775134686; x=1806670686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5By4L9q7Enuf/J/NbbF3P3YpuOblNDv8lBt2Zxs2nzk=;
  b=V+7ML8mMJwK1dnUkuEgcf0mUBmP/a9QYLTiv1DgvQFBElzBp1tOGC4fh
   V73IUy9xpnO/Iv8hjNW/nbYo7aSeluk1f4Hm+153SoHfNPZxJeoKxcPGZ
   05kxKlQ/5L7xFgnbY0M2NzQxplfb3jV5ynvK+gKz4VO82hz/OcBSEuAKh
   iJ9XcpfCKkfJsze4J6xR6ZPFtYWHHTXbeabcA112Ed3ULUmH3kf5UmZXb
   aBe4sAHZNJrNH8rvXiS8x7AeeCPs2Kmr96E1Lo9DCI5L7i7OQ9AxHGVqf
   i9Zn5BHB/Hb81ymRuS21Rz1dmzzjX4Nf7zcmENyz3TgoHfFQijbnNAF8L
   g==;
X-CSE-ConnectionGUID: u4h3lDJiQxG5BSU0N11n3g==
X-CSE-MsgGUID: bJMQgFfgQKeuN9bSbbkBeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93583714"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93583714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:58:04 -0700
X-CSE-ConnectionGUID: Nql9IdGBS9iTHXeqaT7Z+g==
X-CSE-MsgGUID: Lk3OMFsfSXqUPfbsj31UPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226838029"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:58:03 -0700
Date: Thu, 2 Apr 2026 15:58:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/4] platform/x86: int3472: Parameterize LED con_id in
 registration
Message-ID: <ac5n2DzT-TruO8SZ@ashevche-desk.local>
References: <20260401203638.1601661-1-mnencia@kcore.it>
 <20260401203638.1601661-4-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401203638.1601661-4-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 01, 2026 at 10:36:37PM +0200, Marco Nenciarini wrote:
> Add a con_id parameter to skl_int3472_register_led() to allow callers
> to specify both the LED name suffix and lookup con_id instead of
> hardcoding "privacy". This prepares for registering additional LED
> types with different names.
> 
> While at it, rename the privacy LED's GPIO con_id from "privacy-led"
> to "privacy" in int3472_get_con_id_and_polarity() and pass it
> directly to skl_int3472_register_led(), reducing churn when adding
> new LED types.
> 
> No functional change.

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>

Just for the information, if you got a tag from a person from Cc list, no need
anymore to have a Cc entry, any official tag is also considered as "Cc to ...".
But it's quite minor, duplications are usually got resolved also by tools.

-- 
With Best Regards,
Andy Shevchenko


