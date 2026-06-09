Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E352E040E;
	Tue,  9 Jun 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015099; cv=none; b=H8W1u1jxQdIRFibsaEFBZ90PdmC9d6nItuEq0MkrLna3+4230bCw96kOmTNbh6k4Z4iwCeBYYmpSfyoXbgW+fOIgh8GoL99TI57zW+ByrGEvNpuItr3jkZpIsHMoAPlRlg1gRSHEo68Z1yeiz1SCnhUQDZw513YpEhSSWXSLUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015099; c=relaxed/simple;
	bh=BHLRMWIn5GBjiRN3tikjUoHnTdQKmy7LmrYluNRDeN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=otq3vvL6zQk7NrPrc6B/Yy2TvMcHzCwaGi/Dcanqvexwky2hbODm6PFfXdxh12wFtpyNcsR51BvgzciB4p6fnwvPCWB9woKlr/UBlT0xkERQj+qZVZFyUOgUG8XagqueGw4+/kRWbY56OmHTmlJEJ4G4Sgkv3nIoRy8Ds2Kdohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4UjsT0W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4UjsT0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781015098; x=1812551098;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=BHLRMWIn5GBjiRN3tikjUoHnTdQKmy7LmrYluNRDeN8=;
  b=G4UjsT0WJyeCdnvjn07vfajxr6WmEHtbUhoymXAs2/8lCAO4idE4URL8
   tHiSvSXCaqeDRFbTm5NGlLGe1zW51cNuWZ9wjb9kB6V3KPJNqS/Rfy5p8
   rlaA6x4Uvewsg2MofmOXgFlDcQ+BIIafG0/emSwmfck5DCmvZ86iA6pcj
   p62i13azA6h66lZCp/Uh2Ab3QhKnDX318WW+zMDidBj2GtSwRqVpejDvy
   0bViRzQ4c5P7FNbNqHjzX4ApA3UWPiNxvpRNl2eUW2oiWiJbUuwRP7p7a
   ftqNZMIR5TH5EESQRnG8pWsr2m8yz907RKb2OuluAUzQURsC1p21vQzR8
   g==;
X-CSE-ConnectionGUID: 9QL2vcLjT7G89Jm9IvjX8Q==
X-CSE-MsgGUID: wx18YwAEQvKlNANHCzYX8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="107212764"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="107212764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:24:57 -0700
X-CSE-ConnectionGUID: LDbVJ3I0SwiKeeVvzU1+vg==
X-CSE-MsgGUID: huvzrRQ7Rf6t3Apcmup3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245970889"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:24:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260608082348.92575-1-shengchao.guo@oss.qualcomm.com>
References: <20260608082348.92575-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Fix indentation in
 comment tables
Message-Id: <178101508964.11417.17451315853725171571.b4-ty@b4>
Date: Tue, 09 Jun 2026 17:24:49 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 08 Jun 2026 16:23:48 +0800, Shawn Guo wrote:

> With tab=8 (Linux Kernel coding style), there are a couple of lines
> misaligned in the comment ASCII tables. Fix indentation for them.


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: arm64: qcom-hamoa-ec: Fix indentation in comment tables
      commit: 3b9f95b5a45786f1ca3feff7a736f30f60af08c7

--
 i.

