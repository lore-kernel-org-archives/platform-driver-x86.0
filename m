Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEFA281368
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455595; cv=none; b=Mg/6cmCe1BMDmVwlxeDfbpDDVseHEZ1s6m0TE0QC+8LmzIoA4WD1CYa6uZixHFR+StczPkXt6aQghJ0TIwbZCsVNSmPTzymcBp1enLxgGJf68UJejtgVy6Wb9BYl6mHFFQBfCvmpLc243Df22lVb7uVGPsYJzwOFQvEDcZkSmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455595; c=relaxed/simple;
	bh=2VhBVoFW0kqafxSyM0OejnZBMtK6tshxOVT1OyyPG4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GOgXJ5JwNtoH7LdErH2k6fNsBg0ubUYRLN1Z2uZmK5U/3xvcoqmULgXznIuwK0vgIrqmMTf3mHvvZGbzO6ioZ1fQmHFoWYZGqEd625hT2qn1vwwivaYTuV37VG0/GPuVlVMaRiGCpcjGSimarj1F7BvUzluKpEGigezYnQ0kNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kt1QEYsH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kt1QEYsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749455594; x=1780991594;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2VhBVoFW0kqafxSyM0OejnZBMtK6tshxOVT1OyyPG4k=;
  b=Kt1QEYsH3W9tdNVCCROJryEDX/tyTD8DCV6dGDrYsv20Mqa2qCq5g4rj
   C1tzRa0UjwckXSjyc7als7tI98dcHaE9DHOURzMiCgSx+QWW1o4uTtX/O
   1iad/ZWRvyOyHBSJJHTzn+uxvQj6TMOQLe7qAVTYkGkwvpfdsZj+2Fb/+
   WQ7sNiiWRwxJ7XHttAhOLNPd0ToWb/1NJQLEYQXwuQo8YixBzsQBRv8lq
   aXBWW6hFrw9ZLvkFFaMvaN5zw5DNWPFMqEm5QUd2GFr5SW/aGbngrj4m3
   7qbYg/jxQz2wzbGnmbWFQFG87xo0h1ib+9sw3rKIyeg3/bxu0ZFvMQJXb
   g==;
X-CSE-ConnectionGUID: 9iblyDPiSlK4RRxZBzGEFA==
X-CSE-MsgGUID: p7L8Tbd7QQKAGkqZ5Wwv4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="68973418"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="68973418"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:53:13 -0700
X-CSE-ConnectionGUID: SD8hktx0RdyiG4jo9Y85eA==
X-CSE-MsgGUID: mXJd8hJ1SpuVx9j7OudEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146324959"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:53:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
 hdegoede@redhat.com, Mario Limonciello <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250603132412.3555302-1-superm1@kernel.org>
References: <20250603132412.3555302-1-superm1@kernel.org>
Subject: Re: [PATCH] platform/x86/amd: pmc: Clear metrics table at start of
 cycle
Message-Id: <174945558571.2685.1305515456946931009.b4-ty@linux.intel.com>
Date: Mon, 09 Jun 2025 10:53:05 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 03 Jun 2025 08:24:08 -0500, Mario Limonciello wrote:

> The area of memory that contains the metrics table may contain garbage
> when the cycle starts.  This normally doesn't matter because the cycle
> itself will populate it with valid data, however commit 9f5595d5f03fd
> ("platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep
> cycles") started to use it during the check() phase.  Depending upon
> what garbage is in the table it's possible that the system will wait
> 2.5 seconds for even the first cycle, which will be visible to a user.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd: pmc: Clear metrics table at start of cycle
      commit: 4dbd11796f3a8eb95647507befc41995458a4023

--
 i.

