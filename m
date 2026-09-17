Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA138B124;
	Thu, 17 Sep 2026 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657591; cv=none; b=IpCM7OWvbyvo/4IifAinHDSh1nFP47Lcg3m4pjxKa0zLreJIzsQnipuhykAXl+DU+PdvXopQBo+0I3iWzLvksodRsthdWW2aDEUNcyY5/V9asnFbtrTPEBMR32rRe19g+azVE0lmXPVq5Xklwk1h3PNsmA2c6MvawRfANJ6t1tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657591; c=relaxed/simple;
	bh=F06S3muBwIFxsUQylcInCznpkcEWUBoslR1nKphRXtc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OPHoIgCLdFJVKOEz6yqm7czMTW773NWRCpxjG5XgHe+c5g28caUBD6kE7dArDC7R9xrRzl7fFA3GXIjWHKi8HwlUnlK/rAte9HGpYHnv2UlXeeepzFUNTKx20jN0zNck4ACUFdVRkqJyjJx42Giy0+pUhw6Cgp1MgCbCOmneuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnQ9rKdm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnQ9rKdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789657584; x=1821193584;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=F06S3muBwIFxsUQylcInCznpkcEWUBoslR1nKphRXtc=;
  b=FnQ9rKdmff8jhawgLZzKSSB8vbeDjzvpF5KY+JNo+/6Cj0yyuS8Q1Dze
   v7FgP1HuoULqpAndbKAPJIHcqZnc83giDJEYuEqtfmIITH3Gn9CXgkpaO
   k8Wmz8wpP4nFuF+6yJ/JgXgJp7Vu1FLnTJ1SD+ozwb5EiaofKywBsM52W
   Oo8mPRsO5/vUEBO/4kLXK9wBSprpB01i23QMZzQW9MVYrcFMQRPZsqdnX
   Xxj8Z2LSWeoHRxmoTRE1zU6OnbSrRGkPVYd/X9fm5b/juZbKEaECojSbD
   Jmz9BV7pqasPYH2/1s9C/bS3PlIGwXs7JOOMjdkzGqcHdbH8qfY4gGNrb
   A==;
X-CSE-ConnectionGUID: N2m8O55nQTqXCg8gLPCK6Q==
X-CSE-MsgGUID: 9/ZdPi3oSj+5FYYD40hsiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101433704"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101433704"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:10 -0700
X-CSE-ConnectionGUID: Ye20C1nmRcKxJCL/EN5sXg==
X-CSE-MsgGUID: 3xml8dD9TZezgZ9E5SUOFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275797888"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818203427.2738209-1-srinivas.pandruvada@linux.intel.com>
References: <20260818203427.2738209-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: ISST: Avoid model check for recent
 servers
Message-Id: <178965744374.22350.4555360742713357018.b4-ty@b4>
Date: Thu, 17 Sep 2026 18:04:03 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 18 Aug 2026 13:34:27 -0700, Srinivas Pandruvada wrote:

> To enable SST functions, a CPU model entry is required. This causes
> unnecessary delays in deploying new servers on older kernels.
> 
> To avoid this, if no CPU model match is found, allow the SST common
> driver to load, when all of the following conditions are met:
> 
> - Not running as a guest.
> - The platform is identified as a server via ACPI PM profile.
> - The CPU belongs to the Intel family 19 (decimal), which starts with
> Diamond Rapids. All recent servers are capable of enumerating SST
> features.
> - MSR_PM_LOGICAL_ID (0x54) is present to retrieve the PM logical ID.
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
[1/1] platform/x86: ISST: Avoid model check for recent servers
      commit: 153de724f47af43f0e0a1acc3b1dada18322cd18

--
 i.

