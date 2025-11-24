Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE14E2C11DB;
	Mon, 24 Nov 2025 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004027; cv=none; b=Mq+MxW2Zk8cHYKoQ0hf3ZjGeMbxhgdDSdGcOxr5wLWxD/T1DQ969F7PxhwTBb4FUeZzNuvemG/podywQQMKrrFJDDLpQVF1r+JzOAKr2YKV8Vfd/na2A4EDuIibzIS3SFTc8CfnGmPU8hDHimY6knvRxNqAS8rbBnBnK9ObS6j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004027; c=relaxed/simple;
	bh=4G4YdBcmzGk6UR0HV+i/pDluJrb6Ga/cnraQMIRRnJQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cVLxzBNB1Ds1C2mSihgpG2esO+2CTqje6lhHVI7QfIp4dxuGD/G7Gd9WtlxXPyWhuvE8PO8RXCadQFN1OiRnjh6QIIvsJvZCB7eQ7zGvyNteGMdSJjStWPko9QeD6dEt455aaozFuOiQr+L/RJMUjfWYr2zYHUAEhOoNtnzx4fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIfveXmO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIfveXmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764004025; x=1795540025;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4G4YdBcmzGk6UR0HV+i/pDluJrb6Ga/cnraQMIRRnJQ=;
  b=eIfveXmOE7qpD2rzEL6KfkqL/ezlJq/VJ7AqvE9QfEClGC6YGq45uJ1w
   Qx1INn+yqVxAcvoaqqiLIwukRPFWpDe73IijmxAzhbItkwJqAYzqV5cgp
   dSOCWFBwmFWEfY64yo2N1M8kHpwx5D6na2CANf9JR93iLRmGSryIqxMih
   FJzf7Nevdes7uF6tcvH54zuJYPkNPBld8e6ca4aa2qOdCwyiCGzUcFZma
   iDy39z62IX5pzu6CS2DAoQlK7go5EC5bwdjGa3MVvE4Tn9k0I4LOjmBxc
   115eeCh92s20fDq0x8eZoogyoX7h+r1EjbzdTokg3UhceEFO7YrUWiYHP
   g==;
X-CSE-ConnectionGUID: QhB91Sj6ScKquLH1msFFbw==
X-CSE-MsgGUID: i61heA6LSw+nS1IYBqQgqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77371794"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="77371794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:06:58 -0800
X-CSE-ConnectionGUID: c8t5VUYxQYe7QmR5acjFOA==
X-CSE-MsgGUID: q9guJHdJSvCWkNLOvFRo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="191658562"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:06:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
References: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
Subject: Re: [PATCH v2 0/4] platform: arm64: thinkpad-t14s-ec: fixes and
 suspend support
Message-Id: <176400400982.2797.8313782668655152943.b4-ty@linux.intel.com>
Date: Mon, 24 Nov 2025 19:06:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 19 Nov 2025 01:41:39 +0100, Sebastian Reichel wrote:

> I have a two fixes for the T14s Gen6 Snapdragon EC driver as well as
> improved system suspend support. I've been using my Thinkpad with these
> patches for a few weeks as daily driver doing regular system suspend and
> things seem to run well.
> 
> If there is enough time after review the fixes are probably good
> material for the 6.18 release cycle.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform: arm64: thinkpad-t14s-ec: fix IRQ race condition
      (no commit info)
[2/4] platform: arm64: thinkpad-t14s-ec: sleep after EC access
      (no commit info)
[3/4] platform: arm64: thinkpad-t14s-ec: add system PM hooks
      commit: fc62cb6a3e118a7633ca2217203b6293bb742a23
[4/4] platform: arm64: thinkpad-t14s-ec: add suspend handler for keyboard backlight
      commit: 3c79c2e28a24a86199fa83bb80dc1a1c33f996c5

--
 i.

