Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E302D9EE6
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063731; cv=none; b=Y37VuH288iY6gcgD9O6db/IVXqA1KXa8AbK71NTQl/6O6BCKqlhRnk98aPwjFOB3ovi+1SRa+qmGDrZFx6Q+1uFrng60W6XX7Cm01lqmFCzt72V1RBEYKhdUZYFj7TX8/AtTREMbwwl3toooYxRnazqtt/HlQkU+GOYDrZpbCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063731; c=relaxed/simple;
	bh=Q+oivYOrnwDyY3/4GGIIIlTWY65O7c6Ba3tP+oKIV4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FdJ3bjBT2z7giXhF024XOLnsC6CNKe9cW+hPnVxdDhWSMBAW0yicW9ee4nAvBBnWA1njRWwYCrbFwuayrmLtr+Y7bc/hNjyZM138cXofUi+J/Xg03u/W2uqxedIA3Cudfkz+A40JW2o43O288DzL8YiiiReDEPZeefIT1j0bqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0CRtu5B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0CRtu5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752063730; x=1783599730;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Q+oivYOrnwDyY3/4GGIIIlTWY65O7c6Ba3tP+oKIV4k=;
  b=D0CRtu5BKHzUFgY9E50a4pawABhwifZ4VQFM4kZ1ee/4rPxk0HfZiIRy
   y5M2jnKi63mKLkYmcY0GSxDQ6osHBUKOO1fGYnITGZvRWmOXQ8r1WkaHb
   le6M+YUAFa1YTPFCewEMxSPmKOj6rReuIsPzNR317w6RqCf5AZzJt9Ewx
   PauqRPbW+mzgg1G5bcKONyis4uSmOjCbNUhBhCnstKpE2WxPLLYdynKM9
   r8+9eykfDKqtzIVm9owYah67TrMOaiZVkSrOwn7cComY8TeUCPeRQPTpc
   KtpjMnMgkSuF2yqyuFLEkNhTGzzyY2pVgakKmm6KZoUWT758EBSIq7Tp1
   Q==;
X-CSE-ConnectionGUID: mVUNdMJ4Tv6Ll6PvAheY+g==
X-CSE-MsgGUID: TZxI91M6RciEwIYDAIT+lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54467114"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54467114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 05:22:09 -0700
X-CSE-ConnectionGUID: 8CWz5ekuRbqMn15FcnQIUg==
X-CSE-MsgGUID: zTimPDpITK+HK7t/k/ozLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155849086"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.168])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 05:22:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250709105413.2487851-1-suma.hegde@amd.com>
References: <20250709105413.2487851-1-suma.hegde@amd.com>
Subject: Re: [v4] platform/x86/amd/hsmp: Enhance the print messages to
 prevent confusion
Message-Id: <175206372278.12514.7660174160182561105.b4-ty@linux.intel.com>
Date: Wed, 09 Jul 2025 15:22:02 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 09 Jul 2025 10:54:13 +0000, Suma Hegde wrote:

> When the HSMP ACPI device is present, loading the amd_hsmp.ko
> module incorrectly displays the message "HSMP is not supported on
> Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
> module, leading to confusion.
> 
> To address this issue, relocate the acpi_dev_present() check to the
> beginning of the hsmp_plt_init() and revise the print message to
> better reflect the current support status.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Enhance the print messages to prevent confusion
      commit: bde430fb669d03a0025fd90485dc26acfafd9b4f

--
 i.

