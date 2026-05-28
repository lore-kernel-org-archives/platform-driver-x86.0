Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D413BB127;
	Thu, 28 May 2026 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970261; cv=none; b=ACAwZJ62W9Ka/YdfKhe47t06D5Cu+f0AodMV51k/KvsmzpwgDUps5l8t5t/rZnxwiQWY1AKJSNYX2aqQbLF7Aw6s8db/z//sBHR0Y+v4rGnd1R5J8asYQuofFHdQZ3/okZSHaHCCq9r/k8Z+wjDbJCMpixifucUx5NRxtnHCuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970261; c=relaxed/simple;
	bh=ooaJtzuPRgzw87FSLVKaMVA5iyF5MXNGGTWEKobr5kU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UqdI+ffF3AdYCqsTKmlLR0k3itD4/xeH9kHmbEY++dypCMIeAURjKLUcBs8dffblibjnXcCCzNhJkQuiTeVJ7eZbMNOYexbxPU4gKB7G/97F5gwNIrm+4gL5KcP4vdnNsYN7H6pPRqjFW2CWbJ4lHVbAK1TWnzW37VDfgZc5tT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bi1wNCSd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bi1wNCSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779970259; x=1811506259;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ooaJtzuPRgzw87FSLVKaMVA5iyF5MXNGGTWEKobr5kU=;
  b=Bi1wNCSdqdZ4PRl30P4OwN5qUdhFkKC/jDkFcDX/WAPdPbYKme+PwRSS
   qM/irmo9Ll8nHFDgCCwLQMRz/fPIJuHs8IHfuXPnMNIpICrBx2jh62Oqi
   Cf2vdrqAq1eR06JzQb09OonnPk85X8jIrz4f1Rftj0OSUnzf7LttxeAUm
   q6ga7dZKDAkYoPdCAQWJVYjMlG/ttyYvD3mz/t338g7dJ2GlWjT4EsSQ2
   qby77dbNyRhRff2L8BZDKBRTldydbbNMU8loZAuXsNlccpNcJu4s1fsPi
   ZU4TqNCaNR47kC9YuysbOI1FQBRSnR2GIBe6TAnr90+BcsoGQTxEWyQ3K
   g==;
X-CSE-ConnectionGUID: 2VZoa5mqRo2cT1jpClPYDQ==
X-CSE-MsgGUID: ppMjT7y2QHONUyaaQdRUHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84699091"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84699091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:10:59 -0700
X-CSE-ConnectionGUID: G32lFRaKSayRUcfFfs36FQ==
X-CSE-MsgGUID: TKQwXZNjTNCMtRPQGA+14A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266139291"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:10:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Jack Wu <jackbb_wu@compal.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>, Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260526-dell-reset-v8-v8-1-d3a29cb4cf2f@compal.com>
References: <20260526-dell-reset-v8-v8-1-d3a29cb4cf2f@compal.com>
Subject: Re: [PATCH v8] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
Message-Id: <177997025245.9687.16576267764603371250.b4-ty@linux.intel.com>
Date: Thu, 28 May 2026 15:10:52 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 26 May 2026 18:36:37 +0800, Jack Wu wrote:

> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-dw5826e: Add reset driver for DW5826e
      commit: 1ab843135a7795b0ef37bd7eaf01056276873fd4

--
 i.

