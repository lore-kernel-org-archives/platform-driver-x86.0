Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9085D378817;
	Fri, 27 Mar 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612864; cv=none; b=K/IOFofGh/ow87IkAAf/M3O2URa9LGRTFJCiS93UtuohCyTifANNRwOz5bM9I6fL/MKCai4Itxwzu8yHzfK1H0NL5xfbUz9+H+VZAptxqrrMGcndJgoDo5BR2BTy9uNwYkA4v4gzRJmNaKQZVjV1zZFDIofxj8tkMSUGH0IyBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612864; c=relaxed/simple;
	bh=2EWKPJBUTklmqCWbAZEWQItLWPHf2rsrcO3nsHDUBwM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l4Bvgqcj/ViA4bY8slrm9cXmw4VriqWxJ7s6oByz+Q38jb3N0vPv33A6LtWUF/y3acc07fcYaWAle+3im1MGwQYD5XaUsntEAylEMLE3JiPXJ2r/gYuAmQHHOoDjNPOSejLdNH+K7x9K37zVBOsVGWzR2lTbQNtxco6Lg1v6uUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpO/t1E4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpO/t1E4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774612864; x=1806148864;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2EWKPJBUTklmqCWbAZEWQItLWPHf2rsrcO3nsHDUBwM=;
  b=jpO/t1E4izOT3Tr2ukFiYLPgKyb4SV+iMo3Lfo0lldAJOn3qNfer2qNi
   DFs/HbnHMsZchQWLVDV0pa4sNxYZR5XXtnZk6zuv6CvsrsTMfhEqb0+ir
   4QWZpYX1MDVZpBp4E1jQxy2EDw2wK87SDvZUSVhKf0B5F3VZrYEUxe67V
   sKiRjIlOmtR7c+ULif+iB90owfKNG0WZN1P8U5J1lyvUz2BenkOjONyb9
   Y518wmB7pZT20sIK/ldRKLu1BbCTu68/Q0CoXwGGlPIMUuyrfU17Bmk3Z
   bD5jKbLQCwIYzbKhUBk4r/mCVfo1q5/Or3mbvdT/NcXuKUE1FIKRQ3RzZ
   w==;
X-CSE-ConnectionGUID: I7Te2m7BSLGEm0PbHYwzJg==
X-CSE-MsgGUID: cCZrZfkNQryuYU8rQ8jqdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74715371"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74715371"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:01:03 -0700
X-CSE-ConnectionGUID: y8mNEOFPStOea/ofo19v4A==
X-CSE-MsgGUID: b7VFeSU3Qz+HdPUTQWjcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248607006"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.186])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:01:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260325193158.3417382-1-srinivas.pandruvada@linux.intel.com>
References: <20260325193158.3417382-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 1/2] platform/x86: ISST: Increase minor version
Message-Id: <177461285580.7356.11687321701704257612.b4-ty@linux.intel.com>
Date: Fri, 27 Mar 2026 14:00:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 25 Mar 2026 12:31:57 -0700, Srinivas Pandruvada wrote:

> The current implementation doesn't require any changes to support minor
> version 3, hence increment it to avoid "Unsupported minor version:3"
> message.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: ISST: Increase minor version
      commit: ba7d46e0a384398c58eee34579986f830260d37b
[2/2] platform/x86/intel-uncore-freq: Increase minor version
      commit: b7f4e7babc122426e8802dffdd8ff1501db6adf4

--
 i.

