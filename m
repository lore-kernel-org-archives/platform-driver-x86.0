Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11565275A1;
	Fri, 18 Sep 2026 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755952; cv=none; b=qVQHrRz0wZ5swydj1oUhM4D5NVw04ErsA2OU7Ub7LLHpHr92zaM4gkz3CqKeaBp6ItTAiN8shxJYgHC/Z545qfVPvSBalQQejRiBRh4BV7W+8knm2kJkTnbqOkS483JGTAFrhnh/jzgx5J7YXdIpnB9+Jp67qN2KuzmdO6S9OVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755952; c=relaxed/simple;
	bh=NZXF0j3Mc0z0y1ry9mQB2+dI/T54wqOHmeOkwRIu1K0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UgU6NDZHqxQScdDErRO4en5dR4TSNdUiM0qn8/eZnT47qOkwfZVUiKtUBmW0z3heC3vcRErQyl6gQALsuHpkj7gbkbti13dlmlytjBEopJcMMJwEaw3os1TkRT7323eHYfr22FjPKgKeDC0hSgRGcKHCHs4/s6RrctpaB0G8ZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+EerJSm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+EerJSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755951; x=1821291951;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=NZXF0j3Mc0z0y1ry9mQB2+dI/T54wqOHmeOkwRIu1K0=;
  b=D+EerJSmwEZnWd4nEYUfvYrQt8l3uSeUxqNYIPjZxcZJ3INH3ylah4jZ
   ydnGU0y0CfgvtTeHI0Rh9TNXKoRqaabl6d1uQGx49fx/lDa0P3sj4grzJ
   6poD1J3Z3AD7qvzsn2ujOtXFvpkzmv+UuTXugnUMcsnj6dsKwfT17vyWd
   W6TgUc5NxYbvTTpz8KdVL7FO8L6Q2wWezgyPnyi7rD/ghPevyf5gR6bgP
   /rTI+eg+egHNk/NhqmfYFdEZqrxYPwq8lJsBXjqnJ75wZM6MahgjRlOBj
   SB1KSCghJkD3skl9V/BbfdNpjokeiU2kvXjAd6oMH8VQ1IDOAzY0KNpDl
   A==;
X-CSE-ConnectionGUID: mu4g6LFyT8WVZ8mHmCPyDQ==
X-CSE-MsgGUID: 2xsx/TaDQoOcIpymPQFNGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90297785"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90297785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:50 -0700
X-CSE-ConnectionGUID: gWWpofBsSPaSy+Iz2qX0bA==
X-CSE-MsgGUID: cZSs06knQ6y/PkTKm952UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271192287"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Ziobro <ziobrojan79@gmail.com>
In-Reply-To: <20260829071843.62902-1-krishna.chomal108@gmail.com>
References: <20260829071843.62902-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-am0xxx
 (8D3F)
Message-Id: <178975593893.29716.2404244165579223536.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:25:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 29 Aug 2026 12:48:43 +0530, Krishna Chomal wrote:

> The HP Omen 16-am0xxx (board ID: 8D3F) has the same WMI interface as
> other Victus S boards, but requires quirks for correctly switching
> thermal profile.
> 
> Add the DMI board name to hp_wmi_feature_boards[] table and
> map it to omen_v1_legacy_board_params.
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
[1/1] platform/x86: hp-wmi: Add support for Omen 16-am0xxx (8D3F)
      commit: 231fa63e36dd6437741547ff63ab52fbe4bd4615

--
 i.

