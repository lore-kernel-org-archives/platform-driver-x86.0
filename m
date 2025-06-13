Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00B2E0B7B
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816599; cv=none; b=VYYBUWxxpOzWWvg3NMIOz1DBgGGrI50oSMZXtEKr+1kGTMKHRM6kqN2MHTsC4g26eMWL8Jav22XMK1T2wr/Jdz1MBT/cZzNIL88RzpQmSZ5uyEqVuexpKp8JrbTw0FL1QGub+uEdDdBp1hIpUol2TPFCgGAjUkCvOCRGt7BSHE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816599; c=relaxed/simple;
	bh=CRBpT1w+NeTcL1mT+ps/br1959z3CCm1yZ5Z3NRutFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FZ7lx9l7P+DcWgd8EAtv/z6U2JzfX5d0VX/gc+wypEbxuWW4K3jYr9QYesTg7FGIcemzLKlknraQAa6zeF9kloE2P/MWWlvpdHALcnepS5aju/VXpDYVj730yLIg386gyXw4QG6Ksb8E7mV2B+nTG8t5CB4ez2QrFinDo9W2Fck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZXxCgCv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZXxCgCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749816598; x=1781352598;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CRBpT1w+NeTcL1mT+ps/br1959z3CCm1yZ5Z3NRutFM=;
  b=QZXxCgCvmrLhcLOnrWLPvmq4zn8VPCQi1wDUTj4PR2ZNKlr9GKuTvEoC
   Sl5fVY5G06bqrg5URn/aO/XyJM4v2tdOt6l8mBsmc5iyfNix/hzKCLfiX
   9jyA1bZk+ofFOcf4TBYV31LqkCPG5zLX4ZR+M5ySmLYeskxWC/P7X8g0F
   F7Pzwl81D/2l4uLMgkTw01KbJRg/45oRZwfoNPHVuGC0ZDJOu0jb1owpE
   W+7RAALz/I9uWPxYxHGroZhkH4YLa709yO6xr+HXjeqtVnd1uoTgzSjQv
   rL31513siKxAnTnDFpOkZZ9P2T/6Dhjnq94p3FPM6BprD0lUgI27yfpKn
   Q==;
X-CSE-ConnectionGUID: ghCudwvMRNu9U+eOcV5MMw==
X-CSE-MsgGUID: BmEvfPUxSc+001hDiac0NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51898592"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51898592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:09:48 -0700
X-CSE-ConnectionGUID: zsGHerwOQLifoALMsHrdTQ==
X-CSE-MsgGUID: mY+pco0ARAqYPmrmJ30zJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="178792751"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:09:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
 Hans de Goede <hansg@kernel.org>, Mario Limonciello <superm1@kernel.org>
Cc: Raoul <ein4rth@gmail.com>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20250611203341.3733478-1-superm1@kernel.org>
References: <20250611203341.3733478-1-superm1@kernel.org>
Subject: Re: [PATCH] platform/x86/amd/pmc: Add PCSpecialist Lafite Pro V
 14M to 8042 quirks list
Message-Id: <174981658153.27029.8167293167631434460.b4-ty@linux.intel.com>
Date: Fri, 13 Jun 2025 15:09:41 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 11 Jun 2025 15:33:40 -0500, Mario Limonciello wrote:

> Every other s2idle cycle fails to reach hardware sleep when keyboard
> wakeup is enabled.  This appears to be an EC bug, but the vendor
> refuses to fix it.
> 
> It was confirmed that turning off i8042 wakeup avoids ths issue
> (albeit keyboard wakeup is disabled).  Take the lesser of two evils
> and add it to the i8042 quirk list.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Add PCSpecialist Lafite Pro V 14M to 8042 quirks list
      commit: 9ba75ccad85708c5a484637dccc1fc59295b0a83

--
 i.

