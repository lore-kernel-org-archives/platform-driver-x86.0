Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE68522682;
	Fri, 18 Sep 2026 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755941; cv=none; b=nEp0QhSQy+AllYe8XvmjuFchdeYILxVBrJeYlf+qmdG6VRZP0zcxsX57rzImT2czI9WqxBd8zQEzd8LDyYM8GlXVFyonNY0NY8wcRwYo5Dfa6Z43SJ8jJfHao3fQI1vtikWtI6BAJ6z0gZ02ojevVOQPjUXTxGxABlN3my4D5/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755941; c=relaxed/simple;
	bh=o6tW1Fcd1iAuSID45p63fNJeLNYN3rmbbvowUKi4SVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gubrjNFBFx2GRSwKGwcJwiwPYPvhqcJ583Kw6TXoat9gSWO1B8iWOTE5uyEl/VPfeHLUARWEg/vSAmT8RZ3WY9qA/dkOQG8Vr4I6ynLcBDdCZWJzSos9OH+t0MgNfH8j0vHobxJoC8x5tJbz05ytCNBjEVTcvpU+qcKMPWA+MeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=legIm51x; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="legIm51x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755939; x=1821291939;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=o6tW1Fcd1iAuSID45p63fNJeLNYN3rmbbvowUKi4SVg=;
  b=legIm51xXDMg4nubacHO3wFlCLIn28mDp0jrKzYHv/xiVIXWIY33CVym
   QBZCzGlfEUcU3HC+t3Ldrj1bumc1rSAIQ7PREQ4mpLbn3MKK8MIP+EgFv
   RZjAqCi99fZ/wrl7Vmbl3dhaPt6elpxUZa913tzZyJpBXJPgJE9qNs/PI
   OkwF+WKrvTi98ISRfmuN5HGB/8AhhQDBajH3AGFJlY3dUTSW8sskqnG3O
   ELwWXhH2uB2GQLUVHjowm/W/7WjgIovQ41x3D+6d7tMS1Y7DA3Kz6F4Nv
   zZKR3bFHaxNB5leEkn6jrfCUz5StCPwbuoibGKHdLGp9rEeE0ZkdmTtFf
   Q==;
X-CSE-ConnectionGUID: s2rXrthFQBO5w35dA3RP7Q==
X-CSE-MsgGUID: /A97j6p8TkKOzWjEhlZ2pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90297758"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90297758"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:39 -0700
X-CSE-ConnectionGUID: jb9oh7hcQkm9AwI524GUdw==
X-CSE-MsgGUID: EorkJM73Sl6TVzq7hQFDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="268252842"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Kurt Borja <kuurtb@gmail.com>, Rickey Bartlett <subtexel@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260828145756.341733-1-subtexel@gmail.com>
References: <20260828145756.341733-1-subtexel@gmail.com>
Subject: Re: [PATCH v2] platform/x86/dell: alienware-wmi-wmax: add
 Alienware Area-51 AAT2250
Message-Id: <178975593156.29716.322413351276895971.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:25:31 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 28 Aug 2026 07:57:56 -0700, Rickey Bartlett wrote:

> Add the Alienware Area-51 (2025 desktop, model AAT2250) to the AWCC DMI
> table. G-Mode is not applicable to this desktop, so generic_quirks is
> used. The full product name is matched to avoid colliding with the
> "Alienware Area-51m" and "Alienware 16/18 Area-51" laptop entries.
> 
> Tested on hardware with BIOS 1.6.0: loading with
> force_platform_profile=1 force_hwmon=1 exposes a working platform
> profile (quiet/balanced/balanced-performance/custom) and a fully
> functional hwmon interface (6 fans - CPU, 3 top, 2 front - with fan
> boost control and temperature sensors).
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
[1/1] platform/x86/dell: alienware-wmi-wmax: add Alienware Area-51 AAT2250
      commit: 1ac4912106627ff77287b7ad5b11e3e6f5690f6c

--
 i.

