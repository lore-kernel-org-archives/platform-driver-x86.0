Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B322E004;
	Tue, 18 Nov 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453485; cv=none; b=Y16JRp67tNrZWOkD/UKc7xNecjjo4hG1dktTopWEmjj2THXrd8O+HFm/aYB9Tujs1BdlYisSDyzbXFiIQlzoowmbGCJAirDyP9S/Af0dhPSzlDuubTJYtuE3wiKCZILrmqwTzlG11SF9WSeAHeWOZsUJQyls0HU1bQ+At4jIcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453485; c=relaxed/simple;
	bh=RaXoFYg0tizgrLdnlaKTz7ePlD4RiPEM7iWhkJOuv2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kLLukmtXhLm8hTLh/gnWsK6Mf1GjpzU65UFgSY7qTFm0bjwU9ReKLg+1/o0WE96jxpcH/B6pjcRZqO62KELeW37EUY68QZmejhP4t0UxHE2nZGieB4kZJTg+iHGHpWro38oHaU9ZhGJ3eSfnLOIDxXVjcO8hbHjLxcyo92LS9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCZrgqCx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCZrgqCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763453484; x=1794989484;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RaXoFYg0tizgrLdnlaKTz7ePlD4RiPEM7iWhkJOuv2M=;
  b=XCZrgqCxUJUJ5MxX+5Ir9PLVaaOeUKY3pwGbvNWfQuIme5LuaXiop2m4
   4HPs8PvaJuCMjnECyQ6AtVYiDpapPFTOu0QM7KVRSWBoJ94Tfj5mCL8PC
   C5M7UxpTuoUNWwZaJxS6fWiclF8BzrTbpcZdSkGHy89H9ybGVUBvAF8p3
   OuIL2fXcqxZxxQQMPJaVupXyMpuovn+aJwb5cxnb1EIWT1iE51Oq5Olmn
   FrrS2tPGUNfWY8BQGW08h/ctloDLqIcemXm6jbpYSaDtYBSSyEJ6ohYJX
   xukLhU0befd6sLE5+kVtnPUo4/jDJ2k6m97UtpTDtQgjC/R8S8bCs5Ko6
   g==;
X-CSE-ConnectionGUID: dd5Wi7YUQlidibx3sUFx5A==
X-CSE-MsgGUID: 7Qw0oqdtQGKI5V/htkuuwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65367445"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65367445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:23 -0800
X-CSE-ConnectionGUID: VR/DAoNYSKqeAU14KkjzcA==
X-CSE-MsgGUID: JLc+BZIWSl2FA5Z6c9WX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="228029698"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: srinivas.pandruvada@linux.intel.com, hansg@kernel.org, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251117033354.132-1-vulab@iscas.ac.cn>
References: <20251117033354.132-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] platform/x86/intel/speed_select_if: Convert PCIBIOS_*
 return codes to errnos
Message-Id: <176345347549.8636.16819591367498127239.b4-ty@linux.intel.com>
Date: Tue, 18 Nov 2025 10:11:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 17 Nov 2025 11:33:54 +0800, Haotian Zhang wrote:

> isst_if_probe() uses pci_read_config_dword() that returns PCIBIOS_*
> codes. The return code is returned from the probe function as is but
> probe functions should return normal errnos. A proper implementation
> can be found in drivers/leds/leds-ss4200.c.
> 
> Convert PCIBIOS_* return codes using pcibios_err_to_errno() into
> normal errno before returning.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos
      commit: d8bb447efc5622577994287dc77c684fa8840b30

--
 i.

