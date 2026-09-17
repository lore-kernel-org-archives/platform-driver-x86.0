Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D15AEC5F;
	Thu, 17 Sep 2026 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657457; cv=none; b=FzC0HDUIo+PNHxTB1wuWjQx9RM5xHd1DPN6DIHY5S0DkPYkvTRlat9zdQ/KY5vkPB1nlV9RWIKu5RgEW37v2g+ctEr3F2K+DJAr8Y7AWItATTa8Fq8m//2u8uYSQmbMNjN3nrutCk3lODvXEeAoyNqQai13OFVx/2E0K4HF4kTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657457; c=relaxed/simple;
	bh=6JLsemL9Cyr4K9+YwwmFt3tWloeSa8SHE2a6NOc90Zk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gt18djcoCOBDLPVvupU+cUHIKPhydplLRd+L0+dAnwFjwWqWEdvZl/FafWIKDOXeaXm9gE1qiL+TPY69PmuJqFOKLi2y9Xstt66jvJ+aTWMVV7gnmMGe3G42kJ2tHRCz3YqyIbfk5pmv5MzpogM5Byi+iBWzBzj1WqLw7fhMd9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2sn9pB+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2sn9pB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789657443; x=1821193443;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6JLsemL9Cyr4K9+YwwmFt3tWloeSa8SHE2a6NOc90Zk=;
  b=c2sn9pB+IV2NWXhdpestN3RQ0FhbGXgfNBVn5/iEnG/uGLUR0K1l2hv8
   OZ9Ms+5cfbFkh7lklQ5I3kgW5nJbhZnsjoo+EQNB7Dj9QnftCKl4MS+3R
   AocK+G2cBYmjeGzyxkXIQWonwFgj6H46BqTRtgoRCqJOJ8XhvDIcGZg/N
   eONWUkHKHy1bIKbdnKZv60Fva3Fxvo2PawtfGCbXIpUaD3jVi7f89ZTZF
   aTar+x8xKmAck9lQZRgs4IscHgEKERaOCadxiRSI6JfjVD+Dkrh0ZU+gx
   oDaAx8u3oLYv93kk7He32QNI+7Cx7IGxecMc59/cI0rKwJTrYuAgYsNlL
   A==;
X-CSE-ConnectionGUID: WTftxyLgTw2Wh96pQMzB6A==
X-CSE-MsgGUID: QI9csIK2RG+OiSNiI00CJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92597382"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92597382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:03:56 -0700
X-CSE-ConnectionGUID: 1NKeR4ANQ7SfJKqKWFy6iw==
X-CSE-MsgGUID: D3D1KBaMSV2UM2K0J7u5Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="279078191"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:03:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260815093431.98950-2-thorsten.blum@linux.dev>
References: <20260815093431.98950-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] platform/x86: think-lmi: Use ARRAY_SIZE() in
 tlmi_errstr_to_err()
Message-Id: <178965742900.22350.13322206358610153425.b4-ty@b4>
Date: Thu, 17 Sep 2026 18:03:49 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 15 Aug 2026 11:34:32 +0200, Thorsten Blum wrote:

> Use the ARRAY_SIZE() helper to simplify tlmi_errstr_to_err().

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: think-lmi: Use ARRAY_SIZE() in tlmi_errstr_to_err()
      commit: 2ba3e60e4e073b48abde8e787fe6fffaacdc4007

--
 i.

