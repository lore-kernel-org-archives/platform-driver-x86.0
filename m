Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC27F279DCB
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504166; cv=none; b=tySFPiDRpDIhKaj0xEnQkdBArVZP/nZZA7Qkco87I8xkZhdu0wUaguafGTdIJmIFlF8xNlrUTCkx0/7yvLGKD1nS95e9jdInTgXsEhr4xXRq2nk5y7+h5c6r+rxixm8/oCG73GGVd66aSAbiRrUv5bY17ufkWpYZZV807ewmSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504166; c=relaxed/simple;
	bh=X4a0uC1Ejm1eUyqwsfZJRnC2G5nwVnscGZOgxvehgP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gvIv9l9aypB2xJsF0in/Cyh2rARfyONCfUsBBnGHQKeS3aXLK2MGFngiUcgYrwLkeSJ7ppfV5OjpRomE6URxGgxXba9xM/OOe4d5ORS1Ec/EYzpUiDNXLPkOuG0n2ijC/JLYDHPiPCf9CPMc5fP7+WuDs+NlPzHMIcDA4Mn8oiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2RdkW6X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2RdkW6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757504165; x=1789040165;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=X4a0uC1Ejm1eUyqwsfZJRnC2G5nwVnscGZOgxvehgP0=;
  b=Y2RdkW6XyC/MBIcR0VqSfxyLdSuqkNfC3qhAC/wh2dlA3qy2ayRDTiHd
   eHrtdMv+Wi7LIgsaKkQitShoIRdpuiz2Wt5tifWlc+1XEFPpJG6oJPm9n
   ewcvd6hLAFvvpLbHu8TXfytpigu+EJYsXURPM+wkG9Q+gLsabFEUmpxXx
   c5pSNFWJYITqOjLgmuzrHima9gr2FzgOQgvRHLs4ronAdqhaZIyi6gh+4
   h6gP/QeWxCklA5Edb24PPG11rve1uLQ1HPToairLUlK+viOlF6fUYSO+j
   oZ05XvtkdrvkNUYLka7L5PhekFAC8+jFniTdBqmExLoVgxIESZg4s+ABD
   A==;
X-CSE-ConnectionGUID: MW4U6UACQheFIgVDRUVjnA==
X-CSE-MsgGUID: l64m2Xh9QoCK6f+m7+JPPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="85254186"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="85254186"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 04:36:04 -0700
X-CSE-ConnectionGUID: wA+IdgOHRP6XP0rbLhqQ1Q==
X-CSE-MsgGUID: yVx9n5ZTTQ2iWC304H5RFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="173817828"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 04:36:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 aprilgrimoire <aprilgrimoire@proton.me>
Cc: superm1@kernel.org
In-Reply-To: <IvSc_IN5Pa0wRXElTk_fEl-cTpMZxg6TCQk_7aRUkTd9vJUp_ZeC0NdXZ0z6Tn7B-XiqqqQvCH65lq6FqhuECBMEYWcHQmWm1Jo7Br8kpeg=@proton.me>
References: <IvSc_IN5Pa0wRXElTk_fEl-cTpMZxg6TCQk_7aRUkTd9vJUp_ZeC0NdXZ0z6Tn7B-XiqqqQvCH65lq6FqhuECBMEYWcHQmWm1Jo7Br8kpeg=@proton.me>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add MECHREVO Yilong15Pro to
 spurious_8042 list
Message-Id: <175750415784.15501.9170788468384360603.b4-ty@linux.intel.com>
Date: Wed, 10 Sep 2025 14:35:57 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 07 Sep 2025 09:06:11 +0000, aprilgrimoire wrote:

> The firmware of Mechrevo Yilong15Pro emits a spurious keyboard interrupt on
> events including closing the lid. When a user closes the lid on an already
> suspended system this causes the system to wake up.
> Add Mechrevo Yilong15Pro Series (GM5HG7A) to the list of quirk
> spurious_8042 to work around this issue.
> 
> Link: https://lore.kernel.org/linux-pm/6ww4uu6Gl4F5n6VY5dl1ufASfKzs4DhMxAN8BuqUpCoqU3PQukVSVSBCl_lKIzkQ-S8kt1acPd58eyolhkWN32lMLFj4ViI0Tdu2jwhnYZ8=@proton.me/
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Add MECHREVO Yilong15Pro to spurious_8042 list
      commit: 8822e8be86d40410ddd2ac8ff44f3050c9ecf9c6

--
 i.

