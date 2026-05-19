Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36353BCD3D;
	Tue, 19 May 2026 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193488; cv=none; b=LDMXnDqTkxT4KdBEmJWJNsfmHJWkE8G0f5yXOKGQY5dmAz2hP8q9Z5RpPou/anyhd+phsOrxGILfOfCq3JdlFw5vsEqzDNK7K25EbXGKIUrn+rLONnJgrm/ufS6zLtpwxTuFiJG51HB0TSYuixb6GYZLrkf/Bx3F2nEmpcdMB8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193488; c=relaxed/simple;
	bh=VMZbgpt8RZdSf2OB9WNWcGtIHsdXR+08yHzWzEtl8nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eS/IdD/1p2eXBBxgW3nXXPJXJDm++7kLXzd4Q+b5pz87b3T5QEJDDP2Gu2Anhb/lrCgUrT7usYvwXgbRXVzPhtElyZt48t5NXP+5PeZQqYsZLjDt8JPjkPDcqMW1rBfwiVYIm7INF1pT0rZDRgfom2wreXUaXOPjRckFad8lcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctEKZwV3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctEKZwV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779193487; x=1810729487;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=VMZbgpt8RZdSf2OB9WNWcGtIHsdXR+08yHzWzEtl8nw=;
  b=ctEKZwV3f5vEmZRpyiGrOK3nDSB0zJTQER840GEHplYMfevwy6D0vAQ2
   /i+vYaqLK5nlLFJyhKLp5o1bE8lSEv9323axk9SQSbiRzW8Pond4dGN2m
   hoLgtBvrMJVfXcVPg3Oz58rvAjG3pSJMcBn3p+MBTYZvkdU3DWlceB025
   XY/SwDPzGjOT0FTW/ieHR7Nfks9JukSBRZBRt8JYlO4nM+cEpjpR5bu9m
   5a+Iom57yDNWRtbseWxDVx52jNmjxFTxIXrplv89wSKTEH7XgE9oFg9cN
   ZiIU8+jbXkKZOe5S5rUgOuPz9wzY0Qb2JLdcYZxsQlgXQ0xmBbIlgkt3f
   A==;
X-CSE-ConnectionGUID: yl7RfPQ+Qte8qSGkeCKEqQ==
X-CSE-MsgGUID: Hucb0PUdTqGeP1jJGpg1Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79970093"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79970093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:24:47 -0700
X-CSE-ConnectionGUID: B3cmPpevRSyCIyqUJrXS2A==
X-CSE-MsgGUID: 6FY/eWN+SuOjtrAIt9ikCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235500796"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:24:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260429-aw-new-api-v5-1-7702668d04c6@gmail.com>
References: <20260429-aw-new-api-v5-1-7702668d04c6@gmail.com>
Subject: Re: [PATCH v5] platform/x86: alienware-wmi-base: Transition to new
 WMI API
Message-Id: <177919347765.8561.14455603039845343611.b4-ty@linux.intel.com>
Date: Tue, 19 May 2026 15:24:37 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 29 Apr 2026 08:27:02 -0500, Kurt Borja wrote:

> Transition to the new wmi_buffer based WMI API.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: alienware-wmi-base: Transition to new WMI API
      commit: 5809de26ccab13c18d591e923acbab5edebbf283

--
 i.

