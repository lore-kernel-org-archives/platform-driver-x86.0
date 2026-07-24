Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB72446840;
	Fri, 24 Jul 2026 16:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909686; cv=none; b=GbNTtq3qX2FS73MN/e51vklaDZCYNmG8+e7hqAaJYsRawilCeDMAfI3pb0teRIV2afu7XYe5rSXTYlczSY3XhqOgExEcx0flCF1AY0Rwo19OMzl/c1lrAo4KPEl9bOH2CAi1wLup6H3HNhe91ju1x6m6Rt2CD9J0G1187DEPigI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909686; c=relaxed/simple;
	bh=+uss25oHUg3VKNZPsjXmQWU3mVYuGh1zkAm8EYyX/4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=apVla302TUO3VX4b2CUOSomSnvmtV/xd3DDcnPOSU6w90Q8UJ64t3tGQPBn18gAZC30jFJCNGG5t/N3f/7a1Kvz/lWSoFLw8xNAcoGMzEknaW9aMTM6Si7uF4rwAHGRpsMtOyOuVtXNOBAjgen6aGip1rGkHQGfITX0K4VIQRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkahh+2c; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkahh+2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784909640; x=1816445640;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+uss25oHUg3VKNZPsjXmQWU3mVYuGh1zkAm8EYyX/4Y=;
  b=jkahh+2cmoMxtmLiMu8lBn0yKn8qF0LNEvH1JosZNouIQM8dqmYHoQer
   +KFiBuTQpSXy4wRfCrRqFPxHtvB+sJfcY42f1kH8H9FUJ2/0sdP6kI4GD
   8SVbMUJNMWJhcfqbAjdXmTqWpv1vvKESFKWEi+EGR9hzL+AfriUySonQ8
   hVYhYf4h3Jp7dQkHv7iA06AbLrG6MLm5vf17oSNBxX66t/wuf9dT0B3QK
   +IYOxqCtVBWN/UaCA+Ck2mzr/GZPj4HfkpIqWEtq0FSiIxKE3Y9PxzAGq
   VTdj85k9xVJ9R5yEM+S6C+ws/BfOmxs114Li3lkypFt3/u0hltB4HcLGm
   A==;
X-CSE-ConnectionGUID: 2INeE9tmQLWIb1mANaeqUw==
X-CSE-MsgGUID: qZEhWYRARIGiNT+5UEJuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89251561"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="89251561"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 09:13:51 -0700
X-CSE-ConnectionGUID: u2nwHggdSyKZEPDiGTziwg==
X-CSE-MsgGUID: DCvU2boPRua7k3S9b+WS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="255382621"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 09:13:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 muthusamy.ramalingam@amd.com
In-Reply-To: <20260723094656.3806028-1-muralidhara.mk@amd.com>
References: <20260723094656.3806028-1-muralidhara.mk@amd.com>
Subject: Re: [PATCH v7 0/6] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
Message-Id: <178490962483.22684.6012745734129663374.b4-ty@b4>
Date: Fri, 24 Jul 2026 19:13:44 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 23 Jul 2026 15:16:50 +0530, Muralidhara M K wrote:

> This series makes the AMD HSMP driver safe against concurrent probe/remove
> of its per-socket devices and against the data plane (open /dev/hsmp fds and
> hwmon/sysfs reads) racing socket teardown.
> 
> The ACPI front-end binds one platform device per socket but shares a single
> socket array and a single /dev/hsmp misc device across them, while the data
> plane issues mailbox messages with no coordination with driver teardown.
> misc_deregister() does not drain already-open fds, so an in-flight message
> can touch a freed socket array or an unmapped mailbox on unbind.
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
[1/6] platform/x86/amd/hsmp: Serialize ACPI HSMP probe and remove with an rwsem
      commit: 9c40a57258f6cb4109de46467966498e6f90ece6
[2/6] platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap it explicitly
      commit: 5622564fc6924c1607944f0ad22be81ed6fd38fb
[3/6] platform/x86/amd/hsmp: Serialize per-socket metric table reads with a mutex
      commit: 8da4fedd5d1147d26e6ddbd7be2f1f5519df37dd
[4/6] platform/x86/amd/hsmp: Clear mdev.this_device on deregister
      commit: 6bd243d5abd91ee7d7fa58a9ed60381da49b4b0a
[5/6] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
      commit: 9b2895edb2b3ec1fb8a5adadb5305f6459151d38
[6/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
      commit: c7acedb2db001160b1ec41cdcc759dd664150666

--
 i.

