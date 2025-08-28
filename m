Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD8130F801
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756382900; cv=none; b=KX4qM4QG9knU48JQ48HZ3GOYSPwqW4eIrqrCIYCMfjIEIOLK65EFXASzB7VrNxP6c5s5cQ4xCgDkj6lQOCPd5E2TDZVDH1gZiqZlKQqGGf5SMxwChSrhxSgOWXrroJ25i4UG2FBacADYO7EvZI55O5RDXwcTnq+77H1SdOsgfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756382900; c=relaxed/simple;
	bh=wTrM/KsMNljI5x7/maHcev9CnVk7Yt6SFuoxF9RcbnY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ciyb9TPdQxVNgqvtCz5/FYhxfnNYWyvOpXPuxaga1+8CTsYSbLxq71Hd7AnaO1E42bejpxmWSz0y8gxEOjxQ8Onu58nzWrUr7xIP9xpMRd7JunL9xI76eABZR5EibamFlcILtk4Fa/Z3emp84q4qRolxFBuh94YIV9mPvcwnXoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBXbiV/e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBXbiV/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756382899; x=1787918899;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=wTrM/KsMNljI5x7/maHcev9CnVk7Yt6SFuoxF9RcbnY=;
  b=hBXbiV/euR/na/CC9/m89US1BzpZz5Fpd0T+eZsde85LYjx4LjpVZPXo
   7s3L8T+uVhpWv7hYM+HNVOMMTM7GJiPHkrUeDvJs80MYprD6MKxqqCx4s
   5/k64DLUHn6ZX6F1ZCbZOYkGggGORh7gq7N6YyHrak+OOlFmjbKEyHe1C
   y5FojoNxTyzaf37O3Iktk/vnXETlwA8IRQjfTSoeWVnz79wkKmr79Yz1+
   hs5wHmOPBnbXIQYE7burxmJRsyz0lsaoO+U8qAqGTgzL1jK0kCbxt3ppX
   GE8ftdoChfyp7d5AyFIBiG3JKsdL5JBDWDdHBkmOwXkAhn4yog7szx4ZN
   Q==;
X-CSE-ConnectionGUID: CMCIt7LhSeik3cQ7ssvXkA==
X-CSE-MsgGUID: 7Pcz/U56SFqWDM9YIUhMkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58749757"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58749757"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:08:19 -0700
X-CSE-ConnectionGUID: 6W9LhIjkQnGpkM7m2CNqwg==
X-CSE-MsgGUID: wYp0ag0pQIyDRcqFNAgXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="175375471"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:08:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250807114203.982860-1-suma.hegde@amd.com>
References: <20250807114203.982860-1-suma.hegde@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Replace dev_err() with
 dev_info() for non-fatal errors
Message-Id: <175638289297.13908.5646995941702168400.b4-ty@linux.intel.com>
Date: Thu, 28 Aug 2025 15:08:12 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 07 Aug 2025 11:42:03 +0000, Suma Hegde wrote:

> Failure in metric table initialization and hwmon registration are
> non-fatal errors. Hence replace them with dev_info().
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Replace dev_err() with dev_info() for non-fatal errors
      commit: ee1cb9b0e6a80c4f9011e7a9f87e3942a65e6f16

--
 i.

