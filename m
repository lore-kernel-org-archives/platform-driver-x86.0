Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4372F2914;
	Mon,  5 Oct 2026 18:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226337; cv=none; b=skT3CD1vovhCf8MPqarPs4BM5U4nNYMHsqxKUMynHLbhMfkmYEHJPEJx+qWnAjwqsoNIksLcAfHfAgqrKBZa8BW8N6c2M2N4JOriGRjg1XZpxaMxCpEwu5zEVGE3bVMoN7cP8E7Ur+4MUPRubU611R9rGM52bWIMhaQjPa3aWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226337; c=relaxed/simple;
	bh=MujzhspDZ7J5vobndP2THt3dNoYJP9wA9JuVWl6itCQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A5nVWDSPCLTn/9raKwPCkQ8yMChYcHkHdC8O6LjRNQayFPA1svoOa9uLj4HyHTeKzVJxrRc5JlyMXkfQ4/zaTECjjnIDsE/z/964BXtvz/XVIe6QMZKW6cJUsskbCZr1YxR/gxzOdEyiVF/IjObktd2N4ndWzTIwNSBk0mHPTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fERubFND; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fERubFND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226336; x=1822762336;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MujzhspDZ7J5vobndP2THt3dNoYJP9wA9JuVWl6itCQ=;
  b=fERubFND+/Gj1db5A4/0Tv3yOJXGzbzqQeFp2eO9Glg+qyuMebh88UkZ
   x61ToIp24Ryh09wBhphuGEg+SZ7W02gIz0yJKX7xsoF+093/2c9GnowJr
   NeyC3LdgASocppt3mNVDyJYCyvRYvzpvvQymwvoU26xI1cjQF6tr8exVQ
   FThHzRM0BbKmFVDzReD9or3pGR9I05dH8ST6Ucxj/xPRnkS/UzAFE6Ae9
   bB2UN8XctdMZdZHxORhNpiURPy7ZTbOjnmE56A0AGDG1E/w0hPRnGrBPu
   dFOiC/K4IXNIXHFhrnT4h/1h5KsiamoOYBewGwNzfjk+fo45m5NrhcNMS
   g==;
X-CSE-ConnectionGUID: +OHKxxG6Se2pgStRPe+BQg==
X-CSE-MsgGUID: CpUcNyhCSOWXgqpeAyP+tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94780723"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94780723"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:15 -0700
X-CSE-ConnectionGUID: AOKwNdtuQyqk3uQSdz/kTg==
X-CSE-MsgGUID: qPAuCtxeRYG3XbWyTX5cPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276433241"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: teackot@gmail.com, hansg@kernel.org, 
 Patryk Pilichowski <pat.pilichowski@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925125628.69826-1-pat.pilichowski@gmail.com>
References: <20260925125628.69826-1-pat.pilichowski@gmail.com>
Subject: Re: [PATCH] platform/x86: msi-ec: Add MSI Katana 15 B13VFK EC
 firmware
Message-Id: <179122632788.41716.8060332940825332260.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:52:07 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 25 Sep 2026 14:56:28 +0200, Patryk Pilichowski wrote:

> Add the EC firmware string '1585EMS1.115' to ALLOWED_FW_10. This
> enables battery charge thresholds on the MSI Katana 15 B13VFK
> (MS-1585).
> 
> The out-of-tree msi-ec driver groups this firmware with 1582EMS1.107
> and 1583EMS1.109, which are already in ALLOWED_FW_10. An independent
> report for the same model and firmware confirms the same charge
> control encoding.
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
[1/1] platform/x86: msi-ec: Add MSI Katana 15 B13VFK EC firmware
      commit: 25143e0d2be3a1ea74d62e0ec2c7e42967267f0f

--
 i.

