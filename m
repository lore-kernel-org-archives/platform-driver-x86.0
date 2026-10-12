Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB89549B20C;
	Mon, 12 Oct 2026 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820516; cv=none; b=DGPEpqGqGUnLeCAMVaLIZz9dBRQRprt/SLEwIlX8RXvoYKSK8saLaqc5YagJRVWiSfzfQujOoOMRJR6bbYe7AddXsSr+K+bfs0CJdPcVorxxDLtVqGdU9tpYIaWsY/JJhj0p4IStbtiJ4rfoME6U6nAn9VOi6QNRuRldZgPfXro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820516; c=relaxed/simple;
	bh=6VevmADBkpHyOhHoaNUqRT21BJiJalz6pyfJy3uAGC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h3yVk+OseRsuaT12UD+H+mGeWY7RRut3NVjIJQRHw05ktviN0aM4ebgR3UlPAt7VXsACRfduGtnZb2/cTz8LpoZIyEQjLq4G0ySlfX2zTEGKtrjAzYa9FLBuTJs5G1ZIxLtRMgeygVk7EJLiUD3kbKVuu1qJnh4H2pk5CbRWeww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gczWPpvd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gczWPpvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820515; x=1823356515;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6VevmADBkpHyOhHoaNUqRT21BJiJalz6pyfJy3uAGC8=;
  b=gczWPpvdC5mzVw4DyoU/7MXBSDf/IoPg33Nd8mZgt71tx/IIZ12X1qI8
   2LR8fhDbEYh7YYNzDU0Yw677ix1YdUxtAxlLGqeXK0ou7PXb2CwlpDH5w
   vakKpyrUndL54taLJpD8x/lYKZUImW7b+HgzQ5qLFxs2/p9arRslakx7a
   KeMJdQP2JWTQmKcyF3mv8IDNYYxyOTNmTSA9s0OMKxwrKEQ5S9mN624e4
   tMUuUOgfNnapGClP5uUVV2WAn5jddta9HXq8WWA569WxFKXtMRqOGA53k
   t3LI1hc0k57RML97uGrFgg7KRxMN9kPFbo21lFLhwmpvTWZ/EumoSR2PD
   Q==;
X-CSE-ConnectionGUID: XK8psNlXTf2wBua9WcLeQQ==
X-CSE-MsgGUID: rSe1eRZfSjuyLn9TWyzSDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="554476"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="554476"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:14 -0700
X-CSE-ConnectionGUID: pvONS+WtTB2TnGiP5DbufQ==
X-CSE-MsgGUID: ZWD6FcqXRQ+Fv7Vzi8wdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1117347"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam-sundar.S-k@amd.com, mario.limonciello@amd.com, 
 Bruno BOI <bruno.boi@bobtopus.eu>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
References: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5)
 to quirk_s2idle_bug
Message-Id: <179182050556.17897.223715209051721705.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:55:05 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 28 Sep 2026 18:06:07 +0200, Bruno BOI wrote:

> The Thinkpad L14 Gen3 with DMI product name 21C5 is affected by the same
> s2idle resume stall as the already listed 21C6 variant: resuming from
> s2idle blocks for several seconds before the kernel resumes.
> 
> DMI_MATCH() performs substring matching, so a "21C5" entry also covers
> SKUs such as 21C5S05800. Add the 21C5 model to the existing
> quirk_s2idle_bug table.
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
[1/1] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to quirk_s2idle_bug
      commit: 0a88f9fb4c33a75b613252bd9270e57f8bbc0af9

--
 i.

