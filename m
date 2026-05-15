Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C733F9A00;
	Fri, 15 May 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869046; cv=none; b=CRVdqXST/aeS18hLjVXuU4A8IrbGbAg1BCDJ3MzYvulSPVG9lC/SekSsrF2/RFsuDdVnGlq9e8G0GmF1aB9c6AQcAu6Pt4/eHDvmzdgkap5vpZIduLI9j2JbJtsKL98RR6hRjUvBc4m+oz37I5gzPFeA6vDfk3fCJGiLehrC/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869046; c=relaxed/simple;
	bh=3LXl/REku9TApzZj5gcOHCk7X3e8t2rP72+dKRfkf5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7YOE8++ynt2BONknv9Wpdacgg8jvprL4lgdo4xsMAADY/8nC22aLYDxbhgX1bzS1DjPk7KcQJJkY/+iS9NJG5CXNHbH+wtaWbbRpKGrDwIIeIQw2g33XU8PaMMxFOqIvDRwcbwnawLzuvv7Du8LWYgWga958iqOY7gIpEVkatE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn90FaEd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn90FaEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778869045; x=1810405045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3LXl/REku9TApzZj5gcOHCk7X3e8t2rP72+dKRfkf5g=;
  b=fn90FaEdjwVd3egYdhROhp/J61h8YAJ+VM9HGdid3kOW9Rn/zk5ptI9W
   KOO+2ZT4ZCwQTfunTKnY5DCZ4ZiWSEEBf9o2zhekL1A2goXJKPctznhoD
   XfqphaHs7/HzK3+n/YLu7r9dAMZI+QiSuWgElRp0745FuUJD7PSqA+doC
   JIaWHWM1DQqem/TP4JM62sRRdvyMGCSYLMp4TlduLmZQKfBQVkVVTEL7r
   5+BYJ4InxT8yzKo87weLxk8wDzfbfgIg2Gvc7/I/ZHiENo9nb2Hk2F4hE
   +2x4UUhDyVz7oD1LbX7fEiOenp2W4iK2c/HeX/7TTxK1feysqNzw4h2wK
   w==;
X-CSE-ConnectionGUID: ohnSN9ftQD+Y+8Wmu6L+3g==
X-CSE-MsgGUID: 9TMVfrMrQnCSzq5M/+91zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90524502"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90524502"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:17:24 -0700
X-CSE-ConnectionGUID: TSQGIgeZQm+C00OHHgBb1g==
X-CSE-MsgGUID: 4pjvYKiJQIWFkoIg/NoY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237765552"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.89])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:17:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 66B2D120CFA;
	Fri, 15 May 2026 21:17:21 +0300 (EEST)
Date: Fri, 15 May 2026 21:17:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	dan.scally@ideasonboard.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH 1/2] platform/x86: int3472: Match MSI laptop board name
Message-ID: <agdjMY2kJNsp9stV@kekkonen.localdomain>
References: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319155031.1989179-1-antti.laakso@linux.intel.com>

Hi folks,

On Thu, Mar 19, 2026 at 05:50:30PM +0200, Antti Laakso wrote:
> Ensure MSI system is correct by checking board name too.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Thanks!

I've merged these via the media tree, with the 16-inch model board name
fixed as reported by a user.

-- 
Kind regards,

Sakari Ailus
