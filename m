Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E454D90A8;
	Mon,  5 Oct 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224719; cv=none; b=EfSV7aOeW/rE1C7Qr/n8pYVl3C/9ZzE3pJY2XYbOj34E/sV4NJMrZBnuDjoSwDelHKyldI1bi6n668KvbroAmN6iqq9H+Q+tVAbR02Yy8WzrT61yk55wXFzAFrYQ/fVz3remaOMdOlGbHUdKL89Qs3q0lrVunOMGURJNVc7gb+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224719; c=relaxed/simple;
	bh=fpl5rcSIegWBTdiJ+uCbTt1LFi6GWTSil3104/uNTWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nCNbcyzEHqRNR1ojYaR2y9Jzh9coN20hBIn+UydX6da9yx1D3b2Lg6y4b5UJm1Ib+YOYZ4RkxdbcBaP+bzGpxccRfVqy5no1h+QwwiGd8WS6hVf3NVs6MmWzcp0ERknU3kV3r/sw0MDmJh2/eFCxKATZqaSH8BkeC0tY5XbaPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1L93Pt8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1L93Pt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224719; x=1822760719;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fpl5rcSIegWBTdiJ+uCbTt1LFi6GWTSil3104/uNTWA=;
  b=k1L93Pt8XFp3V3HoOPZMihDL00Sun6eoMj9EG+POvXCjDJhxBNl+NbVE
   eVJicf9LdXuf9Awgbis5gS6DHeXbGZrwYLf7ubpAdc+StNwM0D0gblRxW
   GwsVtvmtaNkWg92N9tgXGh7+3DUu1Q6xMMmR7oNrqcPexXNSLHPLSP7o5
   KU3TWAX6StWSASee5tRG0eDXjfkor4rmMcTlgpTf/ZRkj88reb2Xv3aC5
   zCRORcci8GwHS6AiVIke6roNM23wBVYp/juWkccJuMplUJU3kg6/0HV+Z
   lWaW9asZIqJG6jLSQC8gZb5W+u/WuVteQb8yMTYyryjKCjwKRHis9YgcU
   Q==;
X-CSE-ConnectionGUID: rvVI6BCIRQacrxmBsf6+VQ==
X-CSE-MsgGUID: 3MHlzRFLShi0UIPQeGYITg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94614024"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94614024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:18 -0700
X-CSE-ConnectionGUID: rgRPucoxR4qYh2Vzh9KsaQ==
X-CSE-MsgGUID: QDdfXNTAQqWbgbgI0GeJsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="276413124"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Arav Verma <svav2021@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923000002.1799245-1-svav2021@gmail.com>
References: <20260923000002.1799245-1-svav2021@gmail.com>
Subject: Re: [PATCH v4 1/2] platform/x86: intel: wmi: Use sysfs_emit in
 sbl-fw-update
Message-Id: <179122471025.34664.11225269740997197663.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:25:10 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 22 Sep 2026 18:59:53 -0500, Arav Verma wrote:

> Modernize firmware_update_request_show by replacing legacy
> sprintf() call with sysfs_emit. When altering string,
> corrected format specified from %d to %u to match u32 type of
> target variable.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/2] platform/x86: intel: wmi: Use sysfs_emit in sbl-fw-update
      commit: cfcedb39eb6ce3b4914e70fc5506c0bbe08f1039
[2/2] platform/x86: intel: wmi: Remove redundant callbacks
      commit: f866fb6769754d1c07ade90ba22033bee6e55a71

--
 i.

