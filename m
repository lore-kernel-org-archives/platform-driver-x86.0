Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F6468C13;
	Tue, 15 Sep 2026 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514521; cv=none; b=PsLO954MAkB8cKJbq4IzsmSqiWsZJiicnPkIn9vBTB79GM5yQKu1l7vQQ3vRBumXIfN6UuoRdHZE9ooYcbFtEf+dlCJ1kP+fj9DXjEzveNT0bNCDaU/K0SfOAXTD7QfYAH2/zkM0CwKyHltslwQaW30r/hQqyyR9rjA02XMvM0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514521; c=relaxed/simple;
	bh=yqk4nhCUfEfTjDaykCX4/ekEpNaqfBHnEv1Mx9dJIa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MPFWffC48nlnMc9n+RGoGYawYk6MmY8zqBXE5PCmx2Z6WCZkDZ0lgik9Yc5BEhEgNK5s1cwI/HpcsdXMpf4chJT+4KX+Nuviou6YvKyQkBN1yFSFBcqjkvY4XVHAUQnVI73Tiy6LWcmBsJS/W3IfZ8bNSk2wJDLBs5YT72/0G+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEGWCj+k; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEGWCj+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789514519; x=1821050519;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=yqk4nhCUfEfTjDaykCX4/ekEpNaqfBHnEv1Mx9dJIa0=;
  b=JEGWCj+knnYralqxKtww6JY3wGMYNt0MP6l0UcJuCLLOdvTeQGv/yOJC
   vFv3cfCt0kQogR6JUzcIDXa8Rs70B4ol+B9beIs2H3bJEc+7MHyQPQXim
   +JKA907VaQaZNKYembzQdd6sSZCi5LqcLXheEscBIc3R5exjIKAzXFLn6
   kcsuSGiMQNMdRkHDX3o92D4FMyhBvEJnZsW2Mq1NFwMyepJ+MN1y+b/sV
   xRS7+s8yJ5C+N4GaX+D4bjIxLB6cujVoLlRn6sisBOHE+CgL6jYfXHm1d
   5t8r4p2Q1VNFit1eZnhB0nuXPXnkBivFfyRi61ZlG8elvwhd6zYcmmsfD
   A==;
X-CSE-ConnectionGUID: 4pnGOBY3SlOAzEs2LPy+Qg==
X-CSE-MsgGUID: TFE/s3M0QneXj2ntt0TOEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92398134"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92398134"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:58 -0700
X-CSE-ConnectionGUID: QIvuWcryQwGVEpBE+QXolg==
X-CSE-MsgGUID: b3aSRi8VQ7GaU9kRLL/8Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1378525"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:21:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: corentin.chary@gmail.com, denis.benato@linux.dev, hansg@kernel.org, 
 linux-kernel@vger.kernel.org, luke@ljones.dev, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260811065703.6626-1-scardracs@disroot.org>
References: <20260811065703.6626-1-scardracs@disroot.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: Add power limits quirk for
 GA401IHR
Message-Id: <178951451098.41627.509900356602796552.b4-ty@b4>
Date: Wed, 16 Sep 2026 02:21:50 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 11 Aug 2026 08:57:03 +0200, Marco Scardovi wrote:

> Add power limits quirk entry for ASUS ROG GA401IHR laptop.
> The limits are extracted from the device's ThrottleGear XML
> configuration file.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: asus-armoury: Add power limits quirk for GA401IHR
      commit: f03ec815842c4593f0d743ae21b11bb399137668

--
 i.

