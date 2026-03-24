Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321D241665;
	Tue, 24 Mar 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350092; cv=none; b=p2RnH7KGfHaExvzYI1Y6iSZnaJbUVt1L44s8/g27XPQj3fZqPlgjhASWVl3znSfCioi7SCTP3Igt+URE9RaGymGKLNUsp2mWiqedniwdzEkO3Qa4W93tYbd2ubAj5yz6fyBn2qq1iZIMZRpQ1PB4IofbdsSQFxsWAq8vHDtApPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350092; c=relaxed/simple;
	bh=81Qkjpc6IbC54ykBywCu93u5JWnbfbosDGHSWk5Tyns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kMtc80DYo7Lvc9kUje3OjLH8rkEsWha48LGnKWf41zwLRDFZ5qrhgVJYAcO5/wBDgxLpLdhwx4WQNFS91UNZ2j3Zr4ZnYEN4ZtP8+NWMKK4UMkwzA1V2D2o6tokjdl8WsBIvE9zz3fmQZfa/dzood9wy4PCHCdEcfvPO4LC6D9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hW/muoDz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hW/muoDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774350092; x=1805886092;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=81Qkjpc6IbC54ykBywCu93u5JWnbfbosDGHSWk5Tyns=;
  b=hW/muoDzBJ23rXdlwzbFKAvygu+uK5DTw8J41pQ77xFr8pLJ4HMxR7oN
   ExZJHDNeCPQc07o3xvkENnHd4lrhminwaiz827GR4UfZJUnMs3TJOvIct
   y+98TVXllJMg2nexUcand98JIORSat+GbUjEgfC4R212v+ZEJwKbHwBxz
   RUzezeylt8GWVSnsiGo+Vh3eKNOHwrgwWTUjXsOfVdHtwYCh2MkNDkVMO
   RbTKgi7osGP1PsbBvEfNiTqQgoQwig3o2WP1zgZ+RegDiTgg/1YAE1S+k
   JZyH23EgeVQPlw1ERKzY+VyyBRb8wNDJMuxxRrS/PknH6x+H2yG0Dsbln
   w==;
X-CSE-ConnectionGUID: cuVed4tsQd2fZSkQHCbGOA==
X-CSE-MsgGUID: fpgn7KHUS+W5nZ1wS2iMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75247062"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75247062"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:01:31 -0700
X-CSE-ConnectionGUID: kM1yd7dcS7a+wY8KyNxruQ==
X-CSE-MsgGUID: 5SgNt8dXRpCPO15kMGZP/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228799999"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:01:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260323153635.3263828-1-srinivas.pandruvada@linux.intel.com>
References: <20260323153635.3263828-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: ISST: Correct locked bit width
Message-Id: <177435008376.6571.2449558027467443175.b4-ty@linux.intel.com>
Date: Tue, 24 Mar 2026 13:01:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 23 Mar 2026 08:36:35 -0700, Srinivas Pandruvada wrote:

> SST-PP locked bit width is set to three bits. It should be only one bit.
> Use SST_PP_LOCK_WIDTH define instead of SST_PP_LEVEL_WIDTH.
> 
> 


Thank you for your contribution, it has been applied to my local
fixes branch. Note it will show up in the public
platform-drivers-x86/fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ISST: Correct locked bit width
      commit: fbddf68d7b4e1e6da7a78dd7fbd8ec376536584a

--
 i.

