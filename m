Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8892D3612E1
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232090; cv=none; b=s6+2dJyHONV0+bKjtZCphZY6NlzDk+ZtuYrNLc7j97byRRUFie9SX2Hs2CrRtsH1hZ2AN0wlYPd90K7mNWrbsGOihZx1yWxTlIvqElXjQSz/1B01CSvzICb1FXZ5WHtwuycX3O4HqzBuLHH1NU83eOEBGtiIJubo/1ZVuirjhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232090; c=relaxed/simple;
	bh=DPu4Wmvz1J2fY1y8yxbjaRTUiB9DfGU/gFIT9kSlSvo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DiAMtE+H4Fp+2NkwzFt8bSHs/5IUk4FEucBaXxIIhziAkqxE76u43tRqnZYj5ZtQH/hJxotjzJ+UQz7gPDbzhlqj+Lv6ZyPr/m+CTlUszAXOT1QzGRtK0NOlOeaFqd5DgC4Yxtx7bA3ZxWXoaatEYWOWrrG+kFKaaZan8luqWEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1tcLszz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1tcLszz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232090; x=1799768090;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=DPu4Wmvz1J2fY1y8yxbjaRTUiB9DfGU/gFIT9kSlSvo=;
  b=J1tcLszzM9DQeRWaFVraL/73GNgATA9Xsjkc7te2TP4Ha/+ohNITXY5R
   7smmF0hrY1dIlM/apj+dwYxf+pCjC929GbuCM5dvugoU8THIQLTQ4Hr35
   3eHlic7QnlnqX/01z58imTlqi1ymxdlxP1PSBgap7pMvb2bjrYv/AggKL
   F/aLi4zvWzTs4aWjA8vqUIMfbouAc65KYfvSmQ3CE6k9zj4mgzTnbv2zp
   BxF4rzw2VpxZTcHL/0FlCIociyZGD5YxZo+3M7Kf+Ds/hh9xNY/mCWwEh
   xZzTGgOqhuQSB9VQD6dR4B6tD2c90G+KKsuuVaOizxSvvfb43yZM29Q52
   g==;
X-CSE-ConnectionGUID: d5hDAJIrTgycbmTf9ZTSWw==
X-CSE-MsgGUID: kGZAwBl5QIeJAYvFdCcVAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80613207"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80613207"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:49 -0800
X-CSE-ConnectionGUID: bk8GSdRuTEO1YJP7S8gqzA==
X-CSE-MsgGUID: 0df4z30nShe+RwjJanqX0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208960362"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20251218124303.22024-1-krishna.chomal108@gmail.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH v4 0/2] Fix Omen 16-wf1xxx thermal profile and add EC
 readback
Message-Id: <176823207511.9723.10021168845490287383.b4-ty@linux.intel.com>
Date: Mon, 12 Jan 2026 17:34:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 18 Dec 2025 18:13:01 +0530, Krishna Chomal wrote:

> This series fixes incorrect thermal profile parameters sent for HP Omen
> 16-wf1xxx and implements hardware readback support for Victus S thermal
> profiles.
> 
> The first patch refactors the DMI handling for Victus S boards. By
> moving from simple string list to DMI system id table with driver_data,
> we can now map each board to its correct thermal parameters.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
      commit: d8bf01424f9eb555bf13b802a8ddffbb49f221a7
[2/2] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
      commit: 2511dd4dbb76ef6914c9b45ccba2492da25d772d

--
 i.

