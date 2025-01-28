Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F785270;
	Tue, 28 Jan 2025 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738066863; cv=none; b=GuXldujH14/7pT2BJp1CCh+OrlNVp+qN07gImn6v5nh2TIGnxWbuK4t4pqOypzoE+eJS9Z6vxWKXIptuN70S7iFz2+ud/4LUJrSDvHiPOVIPaNCyCo4xtLPh4T0k1xgNxcIzhuiGLKSabM0E+knAmKzAM3GHxMLlBg8phscVQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738066863; c=relaxed/simple;
	bh=iIT1kgRXvsy8/3hGSgLT4J+nXr2ensJXzWrS5p2fUyM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fRcKbaO1vtQr+tZARLDBK0mKraoINt1RvRjAG50UxucOoNbKZScvRqwPbIE/jNSArsHGHug8MZM/cTuIXXcVQqfdwhzGgYD9jmOk8zQus/DszUtRuf8FhJ4x5JLPtccQmGjwrMg27yaV2QhGw9KwZeVIYxPuKJl1OaUE3dSBZt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEOLXQPD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEOLXQPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738066861; x=1769602861;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=iIT1kgRXvsy8/3hGSgLT4J+nXr2ensJXzWrS5p2fUyM=;
  b=UEOLXQPDWw0TaecvKPcDHgzSRthBZqNYMZm8DYnG9uudy57Bk8E1/6bn
   1ZItO2qy1Uo8vteTXEdPDtgvgvUeGIm2OfaQG9G9UvxzmOfJxkCBMToGH
   heuBIgO8ZOdSfVkR1MoiJrRTMX0RDKZEzA3QmP8lY78Pmo0mTVdwTgtU4
   9jKwV2ojKi2/sy2xuRXorL8wd3162BgKcb49/ZWBDyKe8QZ2YG/R2UtZK
   HKDxnWXVnO0uReiuseu23tpYzeA2GsSmioOmq/SNYjV8g2aTXAdjpCvT/
   ZEZyugG5EYykR8iF4m7neLVajcIuxGR+QTrstNLxUW+PE0KcMPo7U95NP
   A==;
X-CSE-ConnectionGUID: ORBiqymVRjCp9fqRuCHi2Q==
X-CSE-MsgGUID: XSHtrcY7SqaR6Y7G0+RyUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42306085"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="42306085"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 04:21:01 -0800
X-CSE-ConnectionGUID: bk4yEalZQZaA45hYUfBNmQ==
X-CSE-MsgGUID: K3z/Wp9MSqemn4D35VuwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113696856"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.53])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 04:20:58 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
 Dmitry Kandybka <d.kandybka@gmail.com>
Cc: David E Box <david.e.box@intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250123220739.68087-1-d.kandybka@gmail.com>
References: <20250123220739.68087-1-d.kandybka@gmail.com>
Subject: Re: [PATCH v2] platform/x86/intel: pmc: fix ltr decode in
 pmc_core_ltr_show()
Message-Id: <173806685396.1748.7696364361933084120.b4-ty@linux.intel.com>
Date: Tue, 28 Jan 2025 14:20:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 24 Jan 2025 01:07:39 +0300, Dmitry Kandybka wrote:

> In pmc_core_ltr_show(), promote 'val' to 'u64' to avoid possible integer
> overflow. Values (10 bit) are multiplied by the scale, the result of
> expression is in a range from 1 to 34,326,183,936 which is bigger then
> UINT32_MAX. Compile tested only.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()
      commit: 4afd0e58a6793b8e4d78cb55dbcf6279936730e5

--
 i.

