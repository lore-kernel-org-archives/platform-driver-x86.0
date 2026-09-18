Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A351DE1B;
	Fri, 18 Sep 2026 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755982; cv=none; b=aAbCJRwe/+wYVO23hhpcMMKqv9yUGow0/BBdFEIr6WCIjLWtSe/PxqRasDS6qD/udryFNLDlADldHfVGa5+b1HgBuTnHzi1cTG6c3mbCFjAlKe9ebkYWG3ams/UFniGjDEU7VMxDw8Xsx4Bg6XolSJ98KrY28ZuQUUngc5vCsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755982; c=relaxed/simple;
	bh=3kbxe+Wvt+RCWOWzNTO2yyeN6v+3aTQNV/gz5dSbjTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nfU449w+h+wIEKfoM6d6O2nPkDQXfXe2xvn7VLZhCOGkcp2enfNmQ74MtNazFPyozf0/nPFYD6lPbAxmGoY1UTINuAE4A0HKntrQJ9ZwS4lH0Ku68wQgVmar1Xykv0FeD5MbEmngb5HTEUOOzq4dXuArr4+amTqDW++/X48X3f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vy0WPL0g; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vy0WPL0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755981; x=1821291981;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=3kbxe+Wvt+RCWOWzNTO2yyeN6v+3aTQNV/gz5dSbjTs=;
  b=Vy0WPL0gyzy5Zwg2ck5yW2zWJagA6aeWO1rjFU3FCJq38WUx9EKXzM8f
   mKvZVP1oRE7KiF0QYznSXucNox1zWeGuRO/cTWf26V5/yGlLRfZl8LQoC
   0MJfRBqM5Yc2a/Q1ak9ix2KWJwXXIB14axd5NmK2e6a9vWQ0aOaKhLwpl
   lsM6Mmmcy5yuFpB2AP1Rs69X5e8S6josoPbhPunYnrjWm5lKGlT3ZhDva
   Vqx/2QrESpsrawzxt902n+vgPiELDBbEIxweGHizpc4aI7vncSodMa16V
   5wDpR2tmvBVUTTeRU30Pwg+ELi2ISVAB1/nG3gEqUqyuUgxZMFpUhVBiQ
   Q==;
X-CSE-ConnectionGUID: yAqTcUlUQTG9a9E1Xn7rXA==
X-CSE-MsgGUID: n3/876e2QsuzXDoCrK2Zqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107785162"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="107785162"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:20 -0700
X-CSE-ConnectionGUID: dswva4OARNyT/hNHrDdIJQ==
X-CSE-MsgGUID: StuBMnJkTAiGG92vIT8R9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2727564"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, Murat Bayraktar <bob65536@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906-hp-887c-s2idle-quirk-v1-1-e470e36fb01d@proton.me>
References: <20260906-hp-887c-s2idle-quirk-v1-1-e470e36fb01d@proton.me>
Subject: Re: [PATCH] platform/x86/amd/pmc: Add HP Laptop 14-fq1xxx to
 s2idle quirk list
Message-Id: <178975597303.29716.270566410301792970.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:26:13 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 06 Sep 2026 13:47:30 -0400, Murat Bayraktar wrote:

> The HP Laptop 14-fq1xxx (board 887C, BIOS F.38) takes about 10.2
> seconds in noirq device resume from s2idle. Its firmware uses the NVMe
> SMI path already handled by amd_pmc_skip_nvme_smi_handler().
> 
> Add the system to fwbug_list with the combined Cezanne quirk so the
> existing spurious 8042 workaround remains enabled. This reduced noirq
> device resume from 10195/10242 ms to 27 ms in testing.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Add HP Laptop 14-fq1xxx to s2idle quirk list
      commit: 5ea02ed54e8127708684875c4e3cd30e3748dda3

--
 i.

