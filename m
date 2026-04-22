Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8335535F614;
	Wed, 22 Apr 2026 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842023; cv=none; b=Jpe/5ftH278Nd/UHO/czzUZb9J/AW4M0uHBMa3lFT7gQp8vCXg3BoqlMlYLGFneG9sVIijWp4ZwQuooNq6PdUojL24atXCjfK/P6lTx2P2Lm/A4NiCVlsUIdSv+O0ky+Jp+5bk25Sl8PgPNlqDJkj70MMnC9NFhxorNQWU3cMyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842023; c=relaxed/simple;
	bh=zJThN6CCrg0yBpAKFznkn6JNXyXDzAanrn9Jmi6AdMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+2krkPZKG6YMR1zWHwjyD7Z0Pn91gOb44OBMyeEkRobikrNrYFIAV4XhIcOLKtWViaDNHT1jvEfGFWZmrZWV125YsoNF788aNDG1T+PsOQOQRthANdGS8OOyffHcUc64d1kWw39gQBLgiI9yYlEQuBbOwC8qdtzrCP4IdJN0Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxpehRBU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxpehRBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776842022; x=1808378022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zJThN6CCrg0yBpAKFznkn6JNXyXDzAanrn9Jmi6AdMc=;
  b=mxpehRBUH1Mb04SVm2SZBQftZUakOECCv6igUV+v6umXfOUwRcnNzykJ
   4yOU839ogz7Mz7d3cE3lQRL9tIS6ZQsctTShCakG5yv3IEIVHWChJ1U90
   AD+VGHR6EVwlH8z3mSIc8cx26Kgcd3hpJqmz6sq31h7uK0ivH3x+4DYJo
   J5woQmveAOoEI3LoayWBRv+krtaEFNSJzglp3wMjyYEH7fCY6dmX3XGWp
   FeBO392LYGVZChmcSomDqyouuTWR9NlEA6kCsFTTIlgKDO/WHOdbuxO4/
   xbkyQDYxhJwbJnBQRFMvCKNQT9ozNajVHKABZwzHIoObgnvsmBxk0Q+GO
   g==;
X-CSE-ConnectionGUID: NXKEA6KKSJWJ4QdHIIiIwA==
X-CSE-MsgGUID: 8jgPGB6HQP+hMqZAHXC4lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89258039"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="89258039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:13:42 -0700
X-CSE-ConnectionGUID: /YRFOL2kQJ+h8fNcAKT2QA==
X-CSE-MsgGUID: MlU4f/77SFON+p+fDr6LZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229106453"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:13:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 62C491201FC;
	Wed, 22 Apr 2026 10:13:38 +0300 (EEST)
Date: Wed, 22 Apr 2026 10:13:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v4 3/5] platform/x86: int3472: tps68470: add board data
 for Dell Latitude 5285
Message-ID: <aeh1Is5T5Ml356yj@kekkonen.localdomain>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
 <20260421225217.12472-4-tchatard@gmail.com>
 <aeh0hAqjwJXq2c3M@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeh0hAqjwJXq2c3M@kekkonen.localdomain>

On Wed, Apr 22, 2026 at 10:11:00AM +0300, Sakari Ailus wrote:
> That is not what the datasheet says.

Please ignore the comment; I briefly mixed this with another regulator.

-- 
Sakari Ailus
