Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4C531629;
	Thu, 15 Oct 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074530; cv=none; b=GWs8/9zeCN//09JFtuezvAr8qIh2jDE2SOORSRZa7xxCajC4RxXcWVUxKpRJMookUb5AdhiqS5OvtJgIcf4QAcx48ZURKHtkhlPN7xQaDXi1NIhg7XzS9c7AZbG4Pwrftgmd6Kmg+gmn2dQIEuPz3bDReOkBxo6jfJRCwj5P5bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074530; c=relaxed/simple;
	bh=RuO77O3KEn0ftpw5dH9LkmgIZ1M3xIAK9adBZIcYmVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WYzFVMSTKmVUajHhVZoiUtI/o+7vQzEkaP88iXGWYD7H2bSf2FFNwOMJrhvCPj6OaaXTTmHwu6cVtGdGYTCAiFpvcmEiEwbbResurjrDVj1IpqXItjPoOgbhlqPEgqly4V+PlUbcQG804TUpi2LPZ4IqAqgsDq3YEsLV/rlvUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRKm/jWI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRKm/jWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074528; x=1823610528;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RuO77O3KEn0ftpw5dH9LkmgIZ1M3xIAK9adBZIcYmVE=;
  b=iRKm/jWIe0ocNQBJ+ijoA3cjQgBOGUqaydKVzGsblyGtrvNowhwyIjEe
   RksSE9Wgg13m95kbQ+qcMnMFrhonaUmmHthWp1E2/uYaAm6s8cR8/0rSw
   kYIzv/Mx4yHCAzyQfpCEvHZLegbeoVSZ1Rfx32lTbD+BTEZ2fp0DgbOl+
   zxJ+oMYfMlseSNZDfd797hEcOvshve2q+LJDdcS6ZXfEWmIAci7AQ6oOb
   zaowyEOyURuCdPEsxGdrKZ5vh9GJfnAU1J36+QuFkOrMECpJxOhBwl3C/
   N9cmRtE7hfQqO7MxUVLD0njwVNEDmlYpM1C3nhlGvdqc7U6VbghHOSfV6
   g==;
X-CSE-ConnectionGUID: CWFaIXcySjy2pBHGp6zaog==
X-CSE-MsgGUID: SND2lPO4RrKmPsxHQ1LZ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="730386"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="730386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:48 -0700
X-CSE-ConnectionGUID: cU4QL7iwSyiRSwu3NIOBDw==
X-CSE-MsgGUID: GVIvi4fNTtaW5Yhc5UuuxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2063745"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>, 
 Hans de Goede <hansg@kernel.org>, Aaron Erhardt <aer@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261007080202.81694-1-aer@tuxedocomputers.com>
References: <20261007080202.81694-1-aer@tuxedocomputers.com>
Subject: Re: [PATCH v5 0/6] platform/x86/tuxedo: Fixes for TUXEDO NB04
 driver
Message-Id: <179207452117.13793.6197751401384421465.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:28:41 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 07 Oct 2026 10:01:46 +0200, Aaron Erhardt wrote:

> This patch series contains several fixes for the TUXEDO NB04 driver.
> Additional userspace tooling and a new WIP generic lamp array driver
> being tested brought more attention to this driver, thus uncovering
> some problems and potential for improvements.
> 
> v5: Fix and add missing tags
> v4: Add missing fixes tag
> v3: Improve commit message to properly explain changes
> v2: Send all patches as one thread (sorry for the noise)
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
[1/6] platform/x86/tuxedo: Don't use device driver data
      commit: 7a267229b0bc162a465f6b95afdcd6adc29acf10
[2/6] platform/x86/tuxedo: Set HID report ID on success
      commit: b6bdd22c3b92abe6f192ab533b843b52346a7640
[3/6] platform/x86/tuxedo: Use intensity according to HID spec
      commit: ef6ff9aebf5b8797590e4fa586114a2688106a4d
[4/6] platform/x86/tuxedo: Fix keyboard LED map ordering
      commit: 5c9c54dfa28c9a47c9d81322d16585f9a64d4c69
[5/6] platform/x86/tuxedo: Update and extend documentation
      commit: bb47fafd94656a0fd2ea6cb636b0fe3fd141e459
[6/6] MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS
      commit: f179daadefce0a03f918c2d38b78053a276b3f77

--
 i.

