Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E3226FD97
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612872; cv=none; b=UOiJHzER8kRxxFPU/lGW7jjfQ+ufp/DSs4835aoScEIwFpCraKqg7kiVFfm+ubYGY1k4k2iWdEj8kx38ucUw53w7GkzVl8dQnl6RP+SnRaFqNY9Mdqz2szyhT0UE/8vI5rhqKKxxBwlB9HSIR7NhzyDuYJClc1Yb3cfo1kSN4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612872; c=relaxed/simple;
	bh=rjuXPZceENGeIX2nyyDne2yf/X6iKnh/49Ry8FICj1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k6DbG+1V09NpR0oRIHWG8xVHVKRnweaL+tbGYutUBSsYQ8CsFg7A+syBJbmt9uZ5b5IOLpPCs5OfHGsE6BxO1GAOjnN8AtcS+p8bzeKjGgPPQolchT2ZjHuzg04VxWzSsl98JKASmrWcmmWVTq7Q23HhSsuMBqlGCTgUyig3cDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkmajErV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkmajErV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774612872; x=1806148872;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=rjuXPZceENGeIX2nyyDne2yf/X6iKnh/49Ry8FICj1I=;
  b=bkmajErV0/jOzIouEENRka1jJ++wNbnjXdLJhFe5wucDbT7MtqS3dHFe
   ZFyAwq9UHq4h8WfpRM7Y1SrtJcOZ6AgLBLZZ/j5ybRqvXkrSfwDKof18F
   KySoncICjO39EOSlU14rJXkBb28Jt8KVe1sSTzbZ67ktuMcSXAdEJNybD
   nYAU2R7qWtRoNIFyjhTdqbyZLkG8KWjLKxS/FycHJl+8DXLKbJjIOKemU
   TBYLCT4aFGeAd9pd1WKIONGCCO58QOMjP2NWcBO13e4nELv+YWqJJ59NK
   yWRqEcsd6l3VS4jPar3eTQbB+ypwqSw0+B6znX0WtozyQeXPtgDolY0Cg
   w==;
X-CSE-ConnectionGUID: MH4sSUboTSmih4MtdV15IQ==
X-CSE-MsgGUID: fvsNerFITuSYAYA4ISDcFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74715388"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74715388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:01:11 -0700
X-CSE-ConnectionGUID: NVe/0TyDSXCYVJsr92O5UA==
X-CSE-MsgGUID: 7OuP1TFtSE2kZ0j3Fn2EKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248607017"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.186])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:01:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam-sundar.S-k@amd.com, hansg@kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Imrane <ihalim.me@gmail.com>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260324211647.357924-1-mario.limonciello@amd.com>
References: <20260324211647.357924-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] platform/x86/amd: pmc: Add Thinkpad L14 Gen3 to
 quirk_s2idle_bug
Message-Id: <177461286360.7356.10808624398838001905.b4-ty@linux.intel.com>
Date: Fri, 27 Mar 2026 14:01:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 24 Mar 2026 16:16:41 -0500, Mario Limonciello wrote:

> This platform is a similar vintage of platforms that had a BIOS bug
> leading to a 10s delay at resume from s0i3.
> 
> Add a quirk for it.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd: pmc: Add Thinkpad L14 Gen3 to quirk_s2idle_bug
      commit: 1a9452c428a6b76f0b797bae21daa454fccef1a2

--
 i.

