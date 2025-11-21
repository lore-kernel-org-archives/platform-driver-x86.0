Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A72DEA89
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763744436; cv=none; b=rJ3jFzA5dwOOKupsMOMN66rIrAgVMiJIrYzFDAcj5OpYItzHJVv0Fkwd4eUkj0BCyfkL3/ak6N33lciU9PtpOZdDw3ayGRGpJXfN2fbDCYCStX6uczqywSGuggxIP096vzQ5lxFPokB4lyvm5N4CoCAzSNLeukSmVzz1saqXyNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763744436; c=relaxed/simple;
	bh=Il+qIi5G2OaVHfpPgfdTmuV4Dp/L3/JFI9W/sFTXkPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I0N3egmXv4xxk7iYbAxsxviApxo91bqBpn1O2ap2mNUChNIIPmAKOM4csUEe+ZlpXAKvpXZeiwgrlVVVBUfqmL+nI6pF4SZ+lkjAzGEbRCevcoq8dTddcGGk2Rq0WnQuwhgvWtyxmRsc2AlJYKxqrNT77w0OEmkrDQiDOWNYf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXs6HMNS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXs6HMNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763744434; x=1795280434;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Il+qIi5G2OaVHfpPgfdTmuV4Dp/L3/JFI9W/sFTXkPc=;
  b=eXs6HMNS3AH4juqNFV8U0AkJmv0y7v5LXdhwHkdIv8hUuVa2mIBXhXhS
   qeVqvn2TR8Vj4IhbsaMnjx5B3O+K/EZhMBH2pcDWr5raN24JKRorDT4P4
   dwireqO2E6VdyEpG0HyzvdWuvv4a3hPtE3Cd6k2gAn27uxP/ikSzckYLR
   CYEormbn9yLHM1zs1mbUcw6giLz0L6Ia9YSMBqlNt7XtNKnBhAbWbEhR8
   nmiV0/RqjXONrfot4a1XhWilkDBj/6+0j+2oaWGPYf3MQyPUoL9PUk/e2
   8iWUcdNtBqbua9LskdVmEOzL5/Qd/9daJwTqDFR3LK2ea1mtkuaWKpO7u
   Q==;
X-CSE-ConnectionGUID: aJhc0xe8SP6NI2nn6Ukzkw==
X-CSE-MsgGUID: fv906ZJVQIikBQQgjhXzhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69707521"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69707521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:34 -0800
X-CSE-ConnectionGUID: kVwyfOLHTR6V0HPPFK4XuQ==
X-CSE-MsgGUID: qs0C4lF0QPS5+81iJaEp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="222692665"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com
In-Reply-To: <20251120105210.3945710-1-Shyam-sundar.S-k@amd.com>
References: <20251120105210.3945710-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3 0/3] PMF Cleanup series
Message-Id: <176374442742.14895.10687058647755706872.b4-ty@linux.intel.com>
Date: Fri, 21 Nov 2025 19:00:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 20 Nov 2025 16:22:07 +0530, Shyam Sundar S K wrote:

> Changes include renaming legacy IPU fields to NPU in the metrics structure
> replacing ambiguous booleans and magic values with explicit
> SET_CMD/GET_CMD and METRICS_TABLE_ID constants.
> 
> Note: This series can be applied on mainline with 6fb7433c7b8e
> ("platform/x86/amd/pmf: Use ring buffer to store custom BIOS input
> values") as the tip.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
      commit: bc3c0a3231b78589896f283d971a003761b100e5
[2/3] platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in amd_pmf_send_cmd()
      commit: 83f0442a4012179c204d68c7f619755693ac5c2f
[3/3] platform/x86/amd/pmf: Replace magic table id with METRICS_TABLE_ID
      commit: 7ec374c6b8597dd23d8c2de1e4045452348cf9cd

--
 i.

