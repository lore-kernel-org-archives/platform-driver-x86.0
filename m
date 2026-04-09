Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AC1395DB5;
	Thu,  9 Apr 2026 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742087; cv=none; b=JjZBQnmJ18yOM+sm+AlGaj++NL19jkhmqJhc+tPau3NG0UXoJBSz+SJvq0ig6eMARbGDhkf6yKBB0lfMqD/vC312ypoYXAyqWp06E02UvGbSnkRSAkI2mltGYWlrMfzEQdKdf1WP8pIY63F7x+7j5vQ136bg0dUAPmpcbcb/2fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742087; c=relaxed/simple;
	bh=EAV1wdtw0w9gIjNxDq9WAqx/zp5RS/WP5jndUBksQOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lQZb9TzKjGYw8zG0HNfTtHEn9kwRvWy6qCUC2yOLfRhmHDLtnDhyUlzifOBt3lhSAITsatrXNTOufev73MksJLJcsFXJ6kleT6gJGK6dhtXhBp99l7g3IbAzVBAjW139gpuu9mrS1ezLu58IpBtjsjpz8lq7knX/gb9whK935EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CITlsiO7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CITlsiO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775742083; x=1807278083;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EAV1wdtw0w9gIjNxDq9WAqx/zp5RS/WP5jndUBksQOM=;
  b=CITlsiO7VYY+u1BW5r/VQAlURz/ftJyyBfIP5sg4pEtPgkhVOFl2XTGX
   rEWLQu2KZc3p6wpAxVby1ML7EtALxTTLJ7ZPePXHQyHASoWUKwa7yttPW
   A8nLryUrsnBpJjKTbmQPyx8JzkhABJmu6Hq+m7+41bkJG2DjfpySuTU5w
   f0JzVQPy/jqELPAWIzgOzp4cVxxJ0NL1J/lL95rX8XuRAJ+8QuT/kzn25
   i7Y7AnT78H/qiGE9YP3CtGDh7P3ltsmPc6WaX+e3KKiP1+jIrE57v1QUi
   oj7yjMQ94C8VThbYNpVpC4aU060qFIBsK1y6VQxldSsrLFhK+3wKZYf+o
   w==;
X-CSE-ConnectionGUID: GGhmxxeuSbavc8ghWcxAog==
X-CSE-MsgGUID: 5WfsozsiSdO4ecm+vs9blw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76708216"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76708216"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:22 -0700
X-CSE-ConnectionGUID: 0IWnd0+OQSKRlay7OUQUpg==
X-CSE-MsgGUID: 4KbrbBb5Q4ypEw2eFJTumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="233756820"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: W_Armin@gmx.de, hansg@kernel.org, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260403070928.802196-1-ethantidmore06@gmail.com>
References: <20260403070928.802196-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Fix signedness bug
Message-Id: <177574207482.8529.7240891931349170592.b4-ty@linux.intel.com>
Date: Thu, 09 Apr 2026 16:41:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 03 Apr 2026 02:09:28 -0500, Ethan Tidmore wrote:

> The function sysfs_match_string() can return negative error codes and
> the variable assigned to it is the enum 'option'. Which could be an
> unsigned int due to different compiler implementations.
> 
> Assign signed variable 'ret' to sysfs_match_string(), check for error,
> then assign ret to option.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: uniwill-laptop: Fix signedness bug
      commit: 6b0567dc4c9ad140044400e06dd97fdce12c204f

--
 i.

