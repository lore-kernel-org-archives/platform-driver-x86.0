Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BEF34575D;
	Tue, 17 Mar 2026 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752475; cv=none; b=Nhsc4rKUYlf5Wu8pb847XwUkMLkkbveN8xtCb6qWdMFZcQcfSGO5Mn561fjMvzBD8azDDz3MxnC64k8rRnqUq+GFou4S3tJmtZXAzmflsdfo5a1V51x4uC8aZi+0AzuvfUtZY+9oCXT3HjY3DNicbJimZAaCEgDHt2ztAo/7DpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752475; c=relaxed/simple;
	bh=k/v8UnXirauMpVWeLug214JzthK+D60IgZpzZuYcoxg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b8ajJhiZ9R8R+2WE/rE/syDViHJyAdOaBQvbxucHVkba4YkAJ83Jnlxu00utmQiqV7xlyOd1NBXHGwqRmORDvDk+2z7Yt7+Da7TE61nl34FuCidVyM17igyEySYzbFAD68OflE7eeRHM/zQjiYAvT/OQb44UVfotU3B3KAhlxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b410aY7+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b410aY7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752474; x=1805288474;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=k/v8UnXirauMpVWeLug214JzthK+D60IgZpzZuYcoxg=;
  b=b410aY7+uCwfEV47QxdJCLzEB6I52U8DYNHD5pEWf4qR56k9ZfTLeoiC
   0fTUH8FkCB39mWuPQ/H3l/ZjV+sG9o6RglyQNDhQLXomTrE3xPkdO7edg
   qZ46Q8yqaj6fWkm3iYIn13zHdnCl/qGMmLMsJKDEmIEej27kJrKvMPe5E
   Kj8sfAWdBvdVjIT7LXn6bdn96TYXovG/vELfKIYpkMPZPVrcAa25SKjAt
   pR8RAJwn8Wokqeifx7nF7f2x1ipgBvLWU833IzJ1FTe0NVvScUhJkhJX3
   XdGKn3X6MojjAZga30F7iN6L9rnp4hG8LtkGkDtKKM5/TAz6kOi9IrD+g
   w==;
X-CSE-ConnectionGUID: xiUlPq6vRkyFPRYFZpWFKg==
X-CSE-MsgGUID: svpaM/09RYiw7+PAfJkZnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100239294"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100239294"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:14 -0700
X-CSE-ConnectionGUID: DONwq0XOTduN4RMQRC2TDw==
X-CSE-MsgGUID: Qr8WsgptTayloqvo5jp5tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217962724"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Denis Benato <benato.denis96@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260312212246.1608080-1-matthew.schwartz@linux.dev>
References: <20260312212246.1608080-1-matthew.schwartz@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG
 Flow Z13-KJP GZ302EAC
Message-Id: <177375246725.9137.10893453731576664619.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:01:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 12 Mar 2026 14:22:46 -0700, Matthew Schwartz wrote:

> The ASUS ROG Flow Z13-KJP GZ302EAC model uses sys_vendor name ASUS
> rather than ASUSTeK COMPUTER INC., but it needs the same folio quirk as
> the other ROG Flow Z13. To keep things simple, just match on sys_vendor
> ASUS since it covers both.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC
      commit: dbde8a0aa45023c52c9769ea086e2bbe576228be

--
 i.

