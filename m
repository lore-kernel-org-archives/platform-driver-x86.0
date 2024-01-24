Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296DF18E01
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706092131; cv=none; b=OvN91oUlIkoQnhtaZVTWC8ZBaLi+4POue4tPrPqfOVSPNnawbqD/LUhujvbNB9UqlD58ewpzrS/0zAMePjG9Z4TYR0dLHYMPO/AuAqN3E6Fkl18Tj+N55OJx2V92RlABi/UhSXT0YNjtlrzBJ5WDkPXU6FDgmE3L7lOr+4vL0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706092131; c=relaxed/simple;
	bh=aRTeAiQQrNS2wUG93GqPOHwzQyE7LjE8logd55KcvUQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EcJjsk98gxulCXQwiczv8azA1xbx3v1M5y1tEwOxjJaEmlawNG/CC/rA0tQ9DLHEVCyyRsfmZr+Yv6+vd9I1gbeVd5e3o+onhRQJRvrlOr8mE3Ixnd2L8PgLYwyN/6FpA2ih61tavO/dY1D/CniUL2DmacRDCYHBGROda6//yEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZrSi8XD; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZrSi8XD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706092129; x=1737628129;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aRTeAiQQrNS2wUG93GqPOHwzQyE7LjE8logd55KcvUQ=;
  b=FZrSi8XD5NrlPqHrot+M9kjhluRXZQDJLMwT9DEvjkI1WCBSGOa8gP6J
   IWFBXStm+PGiniX0rF8PdG2mDqJABqWCcelHOvVKHgCs2IFE7oLWSyBGg
   YjiotPFKT0+NIhaiyYIvdoHFAbhNEcn14kCK5naS8+AcwWUzOiVtcLWIH
   5+MHlX63vYG1PCQdg0DCgypOF0ByOsFyp7TB/84ll5vkRd84ojv59DJVA
   FjZMBob5kWUNKFJIFTmMWEK7KukrkucduRo2V0hsjnpK3+mWBi74FPZxP
   q7A9pvdU1eWNAr5KQg2E2XCNUPYy57C5aehtD2xrz0uIgWKRv2Dl9rY7J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405554781"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405554781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 02:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1880150"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 02:28:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 12:28:41 +0200 (EET)
To: Alexis Belmonte <alexbelm48@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    putr4.s@gmail.com
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: Tidy up module source code
In-Reply-To: <ZZchYfQcg0fPBJZy@alexis-pc>
Message-ID: <6c27cef8-d301-0634-10d4-9fac097e6e97@linux.intel.com>
References: <ZZchYfQcg0fPBJZy@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Jan 2024, Alexis Belmonte wrote:

> This commit performs four things:
> 
>    - fix up the GUID string inconsistency (lower case 'e') from the
>      WMI module alias declaration/macro definition
> 
>    - separate GUID macros from the embedded controller offset macros
> 
>    - rename the description of the module to better represent what it
>      actually achieves as a whole
> 
>    - add a space right before the '*' pointer qualifier to match the
>      other array declarations
> 
> This also prepares the terrain for integrating support work for boards
> identified as '8BAD', which corresponds to HP's Omen 17 ck2xxx models.
> 
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>

Hi,

Thanks for updating but could you please resubmit these properly with v2 
in the subject so that it is easier to locate if somebody has to look it 
up from the archives many years from now.

-- 
 i.

