Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9D316188
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669492; cv=none; b=qbiqblTHSzn0hi2azT+q2B3HvFbaSYzngZiVBughofXth9epCVwsEAFMKBjfTOJMnsoGI9M7EuND1TSVflfDylzq1OwVbBtjh7FDulxs2Wrg3whrshwIUUwohd5ZualYgBx7SYUunYyVvkME9ZQc/dw8CzCL4a7d8WK01H8gRmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669492; c=relaxed/simple;
	bh=Gwf1myynrsWTLsrQDL6mhbIKeQj0Ir/k21n6sev5wBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RSmbPHSg4p6Yg4fsS0ryjW7DIs9ku5/N/fx2Hux0YEf3tMZ012kCiXKElE1l0V8r/DWgqVK43xyLDtqWTEC2HRx2M+in1CTU9QLsd5hGJx9Pa9Z1Y834J/c7bMoKdd6QpcLWkGfB5FTC1N1we0cbM+IbDuQTa/BOqlVKn4xfPzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JV0Vci0z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JV0Vci0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761669490; x=1793205490;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Gwf1myynrsWTLsrQDL6mhbIKeQj0Ir/k21n6sev5wBQ=;
  b=JV0Vci0zJRwixZNd4siCGbyVJ8/fhb+L+3SSAVC/bU2sfilLcAq/LxLP
   Mki4AV0nHEqqADg5sMI9jvw1MrIOz5NiSXp9PloaH361/NMWrCZLhqEtz
   ku8dI2nzJtY//FmXowSU3EJfCdP6rTJrD5MBVXH9Pc+kvtsSyUfwIbYt8
   uzH2s9aVl15LF3uBLU0AYElF56LfcwRvEc8nb51qDmAIXwFlI+hwViRQ4
   XPAD7eY+hLJmz72zIX+lC3pULdilkiczqnbLjjIkqJPqJL5rqVNA9Cgo0
   2xtfDfadMMrQ2a9WcfVX+qmfqBXWgjLQQP+KCcTYwVdlk1H1vWBuLNaTO
   Q==;
X-CSE-ConnectionGUID: DYZlsaEJT5O4tMoZQ85vAw==
X-CSE-MsgGUID: +1JlWdu9QwGk9cf2NILJRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67640366"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="67640366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:37:40 -0700
X-CSE-ConnectionGUID: Hj8KI9rmTI2SRfiemqcZtA==
X-CSE-MsgGUID: p3QJ6cphQouWtDFAPnTc6Q==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:37:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251028084959.394795-1-sakari.ailus@linux.intel.com>
References: <20251028084959.394795-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Update int3472 maintainers
Message-Id: <176166945291.2044.458036116871888011.b4-ty@linux.intel.com>
Date: Tue, 28 Oct 2025 18:37:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 28 Oct 2025 10:49:59 +0200, Sakari Ailus wrote:

> Add myself as the maintainer of the int3472 driver. Also update Daniel's
> e-mail address while at it.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: Update int3472 maintainers
      commit: 7f7d28c69eda3692bcf102b7096b93fd45c75b1d

--
 i.

