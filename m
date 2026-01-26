Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E623B63F;
	Mon, 26 Jan 2026 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437825; cv=none; b=jS+ALRmOPSdKiDLzMrfeLnZUV9HThWpyBSDRZrreVT06q2ANFK6y97zKklqkEBt9851783dS42uZqpnmyn10OhC3Dapa/+lAY0Zun6DCyQBc8mMzL5J/Kw12++Et7dOlgex209WRGBku8V+dRFSrkfGaQTajrb+mYwf1CUuyB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437825; c=relaxed/simple;
	bh=XCwV8QlbrSzACZ7qcn+VVJCE1qWXbUPtn8PtUKjMK1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u3Vkl3ktuPhoPbuxpnfa3vkE8l85jXYDWQ5eOGZQiAS5Ywjq2rCHKKY32yvrmE/Mr8w3gS7rjJwayN53Griyuylid7FOy5Vh4UsOLtcUDKjE0bLFSX73yYEu9w3TTnkmpxax0tewQ0gyc6U8fyH7MF/xhDL4rnnxgENS7lJND2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bchdh7HT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bchdh7HT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437825; x=1800973825;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=XCwV8QlbrSzACZ7qcn+VVJCE1qWXbUPtn8PtUKjMK1c=;
  b=bchdh7HTpVX1qjr5VzcvHlOVDl0QqbT6yC1UAQ8uG62dp1rAUy8cIcHR
   xg316VY6H/s+Xy7TjxnW8vFxwVzOfFAlD5krllQKZyD/umCKvYeWYogPf
   vFOkYwkeRI/5pUFadzgyQQP8biKqqqN63yTE6OWhoNPy/VTHWrktANJkL
   fnWJ+0J1FBCxVYAfETWB+lcCngkgTMbT2NHX9xMePUuGS5rl2VxdlAUgV
   juKRWrm1pqBgy3w/wQyHbixtYJvqtpCCMN1XDHJRmbQcvp2NkDBIE1hgi
   wMej8O7iqv7vukxtBbX705YogMzUSDBuHcGzyhIFgxKu0ueItulkDKFf7
   g==;
X-CSE-ConnectionGUID: aQAh2YS4QLq/GradGAVAAA==
X-CSE-MsgGUID: 8AEsn9nlQ+KIQqSHjRMnGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74457870"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="74457870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:24 -0800
X-CSE-ConnectionGUID: ZvHy5In8TheSHryKhuY4yw==
X-CSE-MsgGUID: ORkwT5BARSq5b5r5+s0J6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207748539"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Alexey Zagorodnikov <xglooom@gmail.com>
Cc: mario.limonciello@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260121143519.12318-1-xglooom@gmail.com>
References: <20260121143519.12318-1-xglooom@gmail.com>
Subject: Re: [PATCH 1/1] platform/x86/amd/pmf: Added a module parameter to
 disable the Smart PC function
Message-Id: <176943781588.10029.7957034775606221328.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:30:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 21 Jan 2026 19:35:19 +0500, Alexey Zagorodnikov wrote:

> Addresses a low power limits issue on HP ZBook Ultra G1a [1]
> 
> If vendor firmware capped APU power limits with 3rd-party AC adapters,
> the user can disable the Smart PC function via the module parameter
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Added a module parameter to disable the Smart PC function
      commit: 8164a14b15008579801ba6ba3ae00d37ecc310e5

--
 i.

