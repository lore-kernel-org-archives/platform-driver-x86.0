Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034712747B
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Feb 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740410373; cv=none; b=hbwDR6QgfcLsrfZjpPnRYJoUQ7iozFu32/pgSnpc6RC3bnEBiKsvNw/slcdpMGjIWgC/Nii5EINC4tMze5kdCpf6ZWGHnY+yPuogNRmeKwnvbwR3jJYeTmJpvw68ji5XjWPVvo8c7Bhznh2aC2iJvTbClAgeURDin3WllhH/UmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740410373; c=relaxed/simple;
	bh=kOCFxklNplb5nsmcarhijmsBYhzSfuM28QlaFV6DonU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s06U1cforxloxeXf4vfZIaV/KbM/h0HViujDC1t6Rn+jcxtD0QBDspKz+CuOwDLVTiyHYfvE1RbtByskzvcZBE4U5JXYX2jJ9mVTL6LO0qDMIba0ZMmKTN0mlzKIFZxxR1bJmIgZgZDT2+OhPuki1lBtV14ezq/RJQCDtnNcmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ms0CkBsh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ms0CkBsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740410373; x=1771946373;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=kOCFxklNplb5nsmcarhijmsBYhzSfuM28QlaFV6DonU=;
  b=Ms0CkBshH8arY2E9E1p+Q3lNkgNGqNyqwmv9/okJ7LoT68+dBBNkJYv/
   76qNY2CnIaLDWJ0Yd6MB1/5EnCmRWsYv2oPboT3JFlS7ieTouht3bzQN7
   LEWhJ70p++nn/1s41YTDRfNfvCB4qABR5tQQDn52BytcPmsDVISYiYUrj
   DxLFN+BVS/7qpKOFUC6q9/6MWx2xm6bE2KD4U0+DAabftMz5wdgnKcXGl
   dB2/WAsfL38bh+phYXylOtJmMfY3ehGR6QWU/OGqC0D0hiGptC6fA0foB
   8ffXOcJh9jfPA95g7YE7ClGadAZNmU8GEcpnbzH1iC59x2n/FxcJamPe3
   w==;
X-CSE-ConnectionGUID: ceHqOUhER3mW2cPVfsz3xA==
X-CSE-MsgGUID: wtXoYFezT8ybW/M7OUstZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="63636763"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63636763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 07:19:32 -0800
X-CSE-ConnectionGUID: RcWXwy0KSAOPil4/Bxil8w==
X-CSE-MsgGUID: POqCKA3uQtK+FMKKYKPihQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116713089"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.233])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 07:19:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Vadim Pasternak <vadimp@nvidia.com>
Cc: michaelsh@nvidia.com, crajank@nvidia.com, fradensky@nvidia.com, 
 oleksandrs@nvidia.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20250210203451.29712-1-vadimp@nvidia.com>
References: <20250210203451.29712-1-vadimp@nvidia.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Add documentation reference for
 Mellanox platform
Message-Id: <174041036374.17410.17317326016166749032.b4-ty@linux.intel.com>
Date: Mon, 24 Feb 2025 17:19:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 10 Feb 2025 22:34:45 +0200, Vadim Pasternak wrote:

> Add reference for Documentation/ABI/stable/sysfs-driver-mlxreg-io
> under "MELLANOX HARDWARE PLATFORM SUPPORT".
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: Add documentation reference for Mellanox platform
      commit: 5ad6d62c9b183314ec1c64a95a26636e973e736a

--
 i.

