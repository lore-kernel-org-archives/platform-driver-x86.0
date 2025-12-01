Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E642F3617;
	Mon,  1 Dec 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584889; cv=none; b=DwTbWsDVFDpXMzrWuWR/HOL8E2Sz1nFqi9M5fDDhpqUMRXc+wcKmCjWT5+ui8sRuZXcnFxeRW2Yeo8kg1R7FaaQL/YUeBTlJiOGK2ZPhQMgeBiqTYkOF/Uz5VBAQ6B+Xj0d62SA6DVFKbwnTKIx6oFQKqPkiUh6TBcS3rbtddZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584889; c=relaxed/simple;
	bh=lubySu67AHHHOsHwPeiSETVoQM3qsK9Z9OuTdp/4n0o=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IGqRcXPYSVB/vjenIcU42dxO8iKMO9k/dAy7KEG40a1rNUc8z9XFvW4k4UfGN60xAcrXliR//YHxuVUmaTbrtCZM2mwXlyxdjp+FV741ajzunIl6vsbWwa2KiTlf1G319B+Vu+Stm0/6fUK4Rk85j1WtTK6WWXbX2hoXlvwqx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYowddWm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYowddWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764584888; x=1796120888;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=lubySu67AHHHOsHwPeiSETVoQM3qsK9Z9OuTdp/4n0o=;
  b=bYowddWmwKpQ3576Mm+WHGDxkwye2n1nyMRadK7McYgDjpjLBQpERwcW
   3VueZIE2Amag1+AFiyUO0BrswwJ7MHD8FAXaYoGfTENtSZzv5zVdIy++V
   JWTmC/bjsCtE22l4T1RWwaPMvHHppqvcUBvvLGfGJdjQ0nuyDJVWvVRd4
   ewP9c+ULxENkJ69ER8CDs/TxQMRLZV5A73HODT4UYTqYBYleSXmioUIH4
   oRa0Ymisvw5U7Vcfl2rQrmCX7V1L5EICJuOlsebmfxnJTCiF3OHREHd5I
   sOK970P8zmYUm8ofOm4s14SiiuBdEIEwV0GlG2hs5kGdItWTYo0eiKDVS
   g==;
X-CSE-ConnectionGUID: VczF2rCGTcGVQBCPNo94QA==
X-CSE-MsgGUID: 9HjYuHheST6GNC9b1I4fIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66407626"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66407626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:28:07 -0800
X-CSE-ConnectionGUID: uJPac02KQLSJbJpiRWDXiA==
X-CSE-MsgGUID: Ct5nlTKmSTie4vaUcPDpDg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.202])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:28:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20251128120215.4450-1-ilpo.jarvinen@linux.intel.com>
References: <20251128120215.4450-1-ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 1/1] platform/x86: hp-wmi: Order DMI board name arrays
Message-Id: <176458488089.9246.11630802631698059482.b4-ty@linux.intel.com>
Date: Mon, 01 Dec 2025 12:28:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 28 Nov 2025 14:02:15 +0200, Ilpo Järvinen wrote:

> The hp-wmi driver has a number of arrays that are getting new entries
> and all/most entries have been added to the end of the array. As a
> result, the numerical order is mixed up in a few entries.
> 
> Reorder the array entries. Split lines for each two leading chars to
> make the arrays easier to read.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Order DMI board name arrays
      commit: 68779adbabdbb1891ba4d9b8c7d3be99ed5e0b3d

--
 i.

