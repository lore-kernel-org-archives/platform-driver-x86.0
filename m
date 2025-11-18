Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B2930216E;
	Tue, 18 Nov 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453493; cv=none; b=CShzu5FYjQ49NfqyadTdtYLcytr0C+7OeJXX7ezNHClN55s0NGQ+fxTdl8Wwi0hSPndDF1dRkl6kLEnNFoDJGpvsfi0wqtP+wHjwHMs07amUAdg+1NdXeR6dDqFnrAdmiuOKe2Z06lj4+d7oFvhD54CoWey4vpqdgFjIelPk4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453493; c=relaxed/simple;
	bh=80jqPddCef6Ag/5MaVhvTMv/+21u1nhsrGkab+6FTpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=smFNZYBWwtlCF04h1Vo/AFdjjnb37016cnEPkznLI94zTwYVMsI7jpk7LKVlggRUeRtMY8RjU159OzEnd8owIx8sRV5+He5XQT6Yn2bsWSTvBcxb2QBcT8dKHHJtDcxhY9nTOpnCVPzVaeyijeCxPgy8ck2k2KXKFCcUtqdxHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Axlircye; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Axlircye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763453492; x=1794989492;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=80jqPddCef6Ag/5MaVhvTMv/+21u1nhsrGkab+6FTpI=;
  b=Axlircyel/4Oub+dwg4gqM5ysonPNrV0WUbYzSd1AlHCHPhldkYxMDQ2
   al6hia6O0lTsTjnhA0kxPVJtJqsu1bJLucOVRV2kxdGaz/6ADOuX+p21P
   yA3D+TLiZldmRQyUazLGAxdPN0zukfViudONifo5zzUOzENGuHJGDZkLh
   HGp2Z6WtAZBHTH2E+Jp91eeWSMdts04Y/hFWsQR5EeNyv+aoKfNmtjmqf
   EOIg8Kt5UUgQXzpJSOIX7MaJWrYMjSGOc2oRG+Gw3iEShfL9tAANlbANk
   sFOZdZCRo9G2GD8iUWvBtdnaZ0oqse4fwRRLsfk9f++tDcpzMPudazcrz
   Q==;
X-CSE-ConnectionGUID: CsvaWeM0SFGYur+hv7cOzQ==
X-CSE-MsgGUID: RhZjeqgpSDeBXKFCcDehnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65367452"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65367452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:31 -0800
X-CSE-ConnectionGUID: 0vYPXUejRdu5PiwqLsUK5Q==
X-CSE-MsgGUID: O9XDls2hQlevlUzcBkqZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="228029727"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jlee@suse.com, Bugaddr@protonmail.com, hansg@kernel.org, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251117155938.3030-1-W_Armin@gmx.de>
References: <20251117155938.3030-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/x86: acer-wmi: Ignore backlight event
Message-Id: <176345348327.8636.1554023632757663812.b4-ty@linux.intel.com>
Date: Tue, 18 Nov 2025 10:11:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 17 Nov 2025 16:59:38 +0100, Armin Wolf wrote:

> On the Acer Nitro AN515-58, the event 4 - 0 is send by the ACPI
> firmware when the backlight up/down keys are pressed. Ignore this
> event to avoid spamming the kernel log with error messages, as the
> acpi-video driver already handles brightness up/down events.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: acer-wmi: Ignore backlight event
      commit: 444a9256f8d106e08a6bc2dc8ef28a8699e4b3ba

--
 i.

