Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D049F4A4403
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820529; cv=none; b=S5fHynaNLfmp1MTtuK100lY7k+x4l1C51MWssV9i+LM/0u8aq7MBvIxEb1Ypni1URdfoHU7XAJ8WaOl9EH9grMYfldXekGBq8xuKLfqEPWr+J7Xwp1xUsKlLT+Pa4+qZ+P0y9ivXKWrefIUv6rtszs9zYD0oiWzIWctamEohJKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820529; c=relaxed/simple;
	bh=+fA+OgfwSY8aRD9QC/NagqfuiUPcaVAqFlC4/fDwJA4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bNHOiKLnAQi4+wZXgJ7Ox56BcOFFa8NWCiIwo/KoBbYTZwGm5OUJNS3PDQaBuigFW7vwlVJyAGFghBv86BCS023sPmfgf+/tNyMS8YQ25rGDZXoSS0mmVogYtTSXbZNoWKcuvXo6JfViv3GCYwUFOMMqvXW/TuJFbuf8Xz1sM0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDJCH7nZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDJCH7nZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820529; x=1823356529;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+fA+OgfwSY8aRD9QC/NagqfuiUPcaVAqFlC4/fDwJA4=;
  b=aDJCH7nZfp1W6leax4POu36nrcxUmga219pBgdmTMgIO3G7q7pdMFP/I
   63ESYL6jZsaCy7Ss1W9iocHr2Qr5jqmnoGn2XTKW5mcLGZ9oKHNT3dKsu
   7+dZV3VRwYEyhjJ0xj0zJzaFsa3u+YdOq4ci0A3cJ/DhJCKGVWKV7UkCw
   hQlN9yY+dbPXHLlTsDyFrdvN70VreK5mCpz74ycbHvxuvFyYJUn+pDUNL
   rX6MW+moVCsC6ah3K354+U74G/xcD05mHJ8IEjOY1s11vaPAddEOhT4h+
   uzwGWprJKPFpIlC6zRgugvnnH9P4cmT6nFK44cl4Vu7CuDAbgnlUSBqAg
   Q==;
X-CSE-ConnectionGUID: EJea750STQmcHPmeFK19YQ==
X-CSE-MsgGUID: C9SqRWduTKOWYybRQT1sGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="522530"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522530"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:28 -0700
X-CSE-ConnectionGUID: FAHJpJAEQGSfvov3OiNMNQ==
X-CSE-MsgGUID: XgU4TQOQTKSyDP3MPlgDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="843911"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260929155317.1710272-1-Shyam-sundar.S-k@amd.com>
References: <20260929155317.1710272-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/amd/pmc: Add PMC driver support for AMD
 1Ah Family DCh SoC
Message-Id: <179182052153.17897.12411281169241954058.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:55:21 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 29 Sep 2026 21:23:17 +0530, Shyam Sundar S K wrote:

> Add the PCI root complex device ID (0x1b20) for AMD Family 1Ah model DCh
> to the PMC driver. This new model shares the same PMC configuration as
> the existing Family 1Ah model 80h, so reuse amd_1ah_m80_cpu_info for the
> device data.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah Family DCh SoC
      commit: bdf79f313421a2df2c90a24a10a1622520391ebc

--
 i.

