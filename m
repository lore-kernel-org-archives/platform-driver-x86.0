Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9525D913
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593163; cv=none; b=e/NRM+PIE26jCPpZqudzXBK05wmovBIlf1zEnjk6mypwG/Ge4j2r3O//LntPovXJ7wbqXKa+f4h7MC7TXGfsp/2XTU6yuFjxkbLGccZFRCfvWBFS7xPKiAC5zOaS64oQqkfvcbSgjfPWdKLFlkXwusFvAIt07hpXT07V/tPkhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593163; c=relaxed/simple;
	bh=mBgp2N72THR/JG5IEtZs1iVPROAPSnuvhsNJTKcMHLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=twdG1oqVB40LX6KaBB1gbeRzkkOxHDCizyEOHJd4D+ybQT4/WIgrr9QtmmlZOB3HusssH1F92lZamETHAD+OXOIl6EIbDt5CwQ7MEltvK4/YmeYYiRbARYSK3XsBQnP2FA2nd5MkhJjAggnjIve2b4PcRt+Sqk0QXA/munOskJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrhvUHhb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrhvUHhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745593162; x=1777129162;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mBgp2N72THR/JG5IEtZs1iVPROAPSnuvhsNJTKcMHLM=;
  b=RrhvUHhbMcZFeZoCIl7oAgVvssKqdN115TTx05mjBlve/sSj0UjOsN0j
   /IvLyPHfxXAfLrmKQf1wp6ZZxQ1fMTswBo8UuNgbPleZnf20B7TthdanE
   186E9/76EXEE9QeyIZoGDmz0Jde8NFcHh5DeSJIAXTi+hBq2Ie4lOWFtT
   wJmy5lPDMeAEMzEuvqJOHFgsJb/4NRzk5Ey1lTXVGBdWLg+TSEghxxbnV
   SKV1c+hbC7eVlv5XJ+h4cGLMzL1nMneqZlrqH4F50+cyJwHmi6vZZZYiR
   TNBxvf1tPlU/MI9YEvh2KkoLCM6dPOl6xLKFPLfEfKZMQmCaFZpT4BnOJ
   A==;
X-CSE-ConnectionGUID: z2tcsmwVRKyOo1mmWBG1Sw==
X-CSE-MsgGUID: hn/h7MpuTZKOmpHOCDFUnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="69751548"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="69751548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 07:59:22 -0700
X-CSE-ConnectionGUID: Bnz4JCPcRZSZsdaJB53aLQ==
X-CSE-MsgGUID: FetDtxBZTGOXfiVuZhNeRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163885100"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 07:59:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Vadim Pasternak <vadimp@nvidia.com>
Cc: michaelsh@nvidia.com, crajank@nvidia.com, fradensky@nvidia.com, 
 oleksandrs@nvidia.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20250421092051.7687-1-vadimp@nvidia.com>
References: <20250421092051.7687-1-vadimp@nvidia.com>
Subject: Re: [PATCH platform-next v9 0/6] Add support for new systems,
 amendments
Message-Id: <174559315394.3247.6713784595840768067.b4-ty@linux.intel.com>
Date: Fri, 25 Apr 2025 17:59:13 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 21 Apr 2025 12:20:45 +0300, Vadim Pasternak wrote:

> Patches #1; #2; #4; #5 : Introduce systems: new SN428 smart switch
> 	equipped with DPU for offloading, new 2U systems SN5610 and SN5640,
> 	new compact system SN2200 OCP rack complained.
> Patche #3: Add cosmetic changes - removing spaces, style.
> Patch #6 - Adds documentation.
> 
> Vadim Pasternak (6):
>   platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
>   platform: mellanox: Introduce support of Nvidia smart switch
>   platform: mellanox: Cosmetic changes to improve code style
>   platform: mellanox: mlx-platform: Add support for new Nvidia system
>   platform: mellanox: nvsw-sn2200: Add support for new system flavour
>   Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/6] platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
      commit: 3e75f295411679e999dbcca37499cd00bd643060
[2/6] platform: mellanox: Introduce support of Nvidia smart switch
      commit: b44eea1f8ffc0b7c457f85a77911ba5c9916b551
[3/6] platform: mellanox: Cosmetic changes to improve code style
      commit: 747ada5ac338143758d1d66bfc29b817261031ab
[4/6] platform: mellanox: mlx-platform: Add support for new Nvidia system
      commit: f618f1b298d3195d363b20f158ccb3facf553f0d
[5/6] platform: mellanox: nvsw-sn2200: Add support for new system flavour
      commit: bf180d44c6416f8e68c9a1fa349be008ccedd797
[6/6] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
      commit: 4d17f22bc6e9f6a9d94ee4313f6bf3cfa194726c

--
 i.

