Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A604E336EC5;
	Tue, 31 Mar 2026 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966993; cv=none; b=o2LoxWFCv8baAGZjf7QDvQUcaMVxAYJq7yLxItoCr7LjVqz62T8xAaDuXcFXX6ObsXr4JUkiCuRwSDKnV2KlEuiNOsPDTsY9fJ27ToQzSMW2kdJdQRb463fp+NK5hjh7GS9vAHsYhmW4tCqn5RLxkYJE8BvknHX0cTI8DesuA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966993; c=relaxed/simple;
	bh=DwXjTIHBaRqm6sbZHP67D7612YEQdOOS7TCMeWWjdos=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jIdSADckq9hO+jKy1oh3BI/YZPIexC6s4LAFkFSN6zmWlIimJY7HsqIxXDT7to5kzSIe06tfreR/xmFHvL6xSUZp744gO/d4gA66GCwKpvchFYWNMOdCO1jRUp8pn0lFogsx8n9Wr2clMF0sAQhtXeJqW1TpAA8NZVOzu1zu5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LM/qFmAs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LM/qFmAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774966992; x=1806502992;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=DwXjTIHBaRqm6sbZHP67D7612YEQdOOS7TCMeWWjdos=;
  b=LM/qFmAszTXdI/bVvpuvvVgQiUuMZqkAHiPVQ3A/11zbROWoiw/1/6y9
   skQLpQ8YsRWDSky1tEX8IPSWoOEYjgAbLsnN2b1Y5RgAOQxFsuNL0fX/q
   PtjqohTYn9g2uPZNn5p9mYR+WD0XPNat1wZvvFlZDWBXt8C2PUFIe3qD+
   c5GJw9RvQ23BKXC2T0Kp9oFmp3Xo8xkV6uzW9Gl6inSobf2ykMrv3JC4d
   HUo2W7B5qfWiEh3P130nk2yhRmxNP/ZGq3rhXwN+YEjpj7XWu7g2GKe3t
   CvzlGyVax3YuxPeSUk6DgBR8cfZjsC6dlStC7rCjEOcDKzc/hCLK747hf
   w==;
X-CSE-ConnectionGUID: TjxOO6yhQTCNkOTS7QAGuw==
X-CSE-MsgGUID: x3/LFjyVRyC6gobsUmkGXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79582033"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="79582033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:23:12 -0700
X-CSE-ConnectionGUID: GWZJRlSSSQOljyqFYRfhPA==
X-CSE-MsgGUID: bCaEYo4YQ9yMhSpF8VjOqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="249432259"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:23:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260329124659.3967495-1-denis.benato@linux.dev>
References: <20260329124659.3967495-1-denis.benato@linux.dev>
Subject: Re: [PATCH 0/3] Add three more ASUS models to asus-armoury driver
Message-Id: <177496698462.3056.7565220602090190959.b4-ty@linux.intel.com>
Date: Tue, 31 Mar 2026 17:23:04 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 29 Mar 2026 14:46:56 +0200, Denis Benato wrote:

> This patch series adds support for three more ASUS models to the asus-armoury driver:
> the GV302XU, FA607NU, and GU605MU.
> 
> I have discovered that GU605MU model has configurable TGP that was not listed
> in the GU605M model, so I have added  a specific metch for that model before
> the GU605M one, this way the for loop should attempt to match the GU605MU
> first and if it fails it will try to match the GU605M.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: asus-armoury: add support for GV302XU
      commit: 82cbae59263e3941a8bb79f0b25e0b0f085132d4
[2/3] platform/x86: asus-armoury: add support for FA607NU
      commit: b4f04a6038fa97f7ceea33e99456b9838c79dde7
[3/3] platform/x86: asus-armoury: add support for GU605MU
      commit: 5d486669b3db11ccc2d1b9f4e42c11c2766f35ba

--
 i.

