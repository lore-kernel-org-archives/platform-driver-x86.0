Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5CD4CB23
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684561; cv=none; b=J5ESFrcY5C8Sy9aebAuh+fuiaMROZHArBqP9N3ngh1tid3239/DYwf7BflmT/AIUvXZOuA+4r/HENtG6YXAEQqN/m8sfc3Q8Jm+mThQiNYvwMCLFqghQKepAbsxEl88d5IZcAA3jdmZ8VWUmNSo5FPVH/O3IgQn6T+1NnXHQUI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684561; c=relaxed/simple;
	bh=jIHVY7nZXJEe6ZfdWdc/A2e8uOxizmHUmPhhuqMTmko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u8KMEHL1qpiU+Bvzrdr4tCDwCsBjXZvbzxZvwWOr2UvI7Yp15J0DsLGlmPQzC57+/9xJFI+Wy0LVcjFRFZwk9DFbUcFeQPL3irTiLapH3xE9GmnYN8BemMLD7cjCZHhkVsxXz70P0vv6ZnYHlWDsixgStQbAHBMp8GFDcO3iEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0373Ylb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0373Ylb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720684560; x=1752220560;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jIHVY7nZXJEe6ZfdWdc/A2e8uOxizmHUmPhhuqMTmko=;
  b=Z0373Ylbx0WEkNf3S1K6AhP4QWL1CJ8PXrMixlYG0kRK2o1hz9ybWxN7
   iKxugln7TUBoQEADS1SgBRLOmH4NTelHH0nsCxRF75ks6sW/vOmEqutso
   olL6JbuCG9Myrrkc+gqKxOuBMMOAy21WfJx6w06gmxTaaAufFgI7JGqfZ
   ur0fTm9CBl1CY1a9j3ujrt1qlSlbf25ZYd3NcEGTTT/Msi9HjSDkFi8kH
   Rcs3BgBmH7z0pkA2DRvsXLQJS7t7/DeenA4sD3185TlIy9PjSm9DqeBzg
   wIlYJR9sZaTygHLS61R5vjGI2IlFbAixah2w0L1vgAxQFdN21M39mbG5A
   w==;
X-CSE-ConnectionGUID: GmBBE4OuSxKo0Go5m4xDLw==
X-CSE-MsgGUID: b+c8AiOKR8qdsWwmrX/PIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29201518"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="29201518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 00:56:00 -0700
X-CSE-ConnectionGUID: vHoaEQ6/TaWJKzWUsBUc+w==
X-CSE-MsgGUID: y1xLJxcxQXW27qFwPPZNsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53652663"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 00:55:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com
In-Reply-To: <20240711052047.1531957-1-Shyam-sundar.S-k@amd.com>
References: <20240711052047.1531957-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
Message-Id: <172068455105.1726.5644124003009733302.b4-ty@linux.intel.com>
Date: Thu, 11 Jul 2024 10:55:51 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 11 Jul 2024 10:50:46 +0530, Shyam Sundar S K wrote:

> At present, the PMF driver employs custom system state codes to update
> system states. It is recommended to replace these with existing input
> event codes (KEY_SLEEP, KEY_SUSPEND, and KEY_SCREENLOCK) to align system
> updates with the PMF-TA output actions.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd/pmf: Use existing input event codes to update system states
      commit: 4c92d448e3e61d46111c29276ee959e3e4ec412b
[2/2] platform/x86/amd/pmf: Remove update system state document
      commit: 2fd66f7d3b0de2aa986d82ede81d7b85740713c4

--
 i.

