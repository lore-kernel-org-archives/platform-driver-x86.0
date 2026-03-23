Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9B391820;
	Mon, 23 Mar 2026 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262824; cv=none; b=AsWDpLVrfivMF9I8UTbYmQ138ynwUaGISZl0VIm9m8TvBEXRvYiEN50mXt/kyqj+GX+pl71XNGIGyIfwE2ceaE03VMcAOwNvXuxu+j90ZmZ6Gyte5v2DTMEDGmpiWu9WDZTCLt9VGNQWX7MmHITlgL6tN/ya2W/7g/TdcoApOSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262824; c=relaxed/simple;
	bh=dl2ogdlADvpLsKxRj0yJVUTmB3NbnhkqFnMdG4Jefmg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JsjqF4gl2zNybGLrQseDYIT8H2VyaRWF6xd44Z6c2gChapRysjqweHZ0oBvTIH3HoCB5adkR9Xcfmsdz1cCwy0+DhVHTPZ3XHROL+BqbTpYvP+zdMQSOMNSj/b/Zyk7lpjtGDYcJjHzTFUsajVzuBW5lrTAePDfwKYvIT88HBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/lJrQyc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/lJrQyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774262823; x=1805798823;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=dl2ogdlADvpLsKxRj0yJVUTmB3NbnhkqFnMdG4Jefmg=;
  b=V/lJrQycuMyMc6iYF8mQufCsuKr6OLs7oHbKJgvAVWj5CMjqexV8i4VG
   +YsfUtc+90Czbbrp5NKmYL0sjJu3zhyA3/xAPdCIK8+vqFGqDnd0bHc1f
   cir8+C70kuLS/u0hY7mkzz/RaUW3R+Pln2cMaMHmDhU3hbCAUIwVfke1t
   z1azC8lUQpxPyGF7EZokmZQRRyxlOfEEHmY4pBZPjEzyovvR8AmC11u5z
   AOUIkcfNnzoj0WF4jM0CjXhEPBUQcossqg3mExtGusLsveWESBpH+Hoqr
   1I0WOHMbXIL/fSq0J806MQFnis60oUyPMHSWQ5wf81ysqFpr9Oob3GZPW
   g==;
X-CSE-ConnectionGUID: AqzVZoyxSMmfLkHzHgxDfw==
X-CSE-MsgGUID: IvjMZ6FeSXC/cV14RTa9Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85952761"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85952761"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:47:02 -0700
X-CSE-ConnectionGUID: K9qnYMTPRsSmWHljd+/rzw==
X-CSE-MsgGUID: aHUW3Q4uTgu/HlLFWxDkaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224203578"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.49])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:47:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260320222033.3238317-1-andriy.shevchenko@linux.intel.com>
References: <20260320222033.3238317-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/mellanox: nvsw-sn2201: Drop unused
 include
Message-Id: <177426281542.8512.9145224772806764967.b4-ty@linux.intel.com>
Date: Mon, 23 Mar 2026 12:46:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 20 Mar 2026 23:20:33 +0100, Andy Shevchenko wrote:

> This driver includes the legacy header <linux/gpio.h> but does
> not use any symbols from it. Drop the inclusion.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: nvsw-sn2201: Drop unused include
      commit: 8786af7704e6289c69d2723def3ca406a15c0dff

--
 i.

