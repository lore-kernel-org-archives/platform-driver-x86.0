Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF74A9D59;
	Mon, 12 Oct 2026 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820580; cv=none; b=qGHMxGetISg69Zj7wfdJXi+J6/ySUP5NxI1NC7s24dMVFnoSPZJiRVbYXoqMPCZgnSx+d9AXq0OV5kT/Q2zZpNEpJTas3pt4GNab9DdCIo5JdxZAPN+/3Itd445/IVFOGMvz/R3Q19lVhbCVIU6CiSeKp9g3aAt7o1pMipAgU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820580; c=relaxed/simple;
	bh=zKbVeQlf03YWwT0ViBX3sWgzxRJ76jzyjXhnE1yIUEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UqyP+5wDJAjoZ+rrw4G8tnFgwAihUawy+U2Zu9Pu6y8bbV6ds/+k9jsnSUnhmXFk9moTg6cJJ7KXqIwn2CloN6+Enkcs3g0ildZwKCElBhnPHJ/ZtbmptQAKQq8nZlrhDdfsVl+MRinmkRklngs2cbKrBO9Dvr9zrYDUVBRJeEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvDn81Zi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvDn81Zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820579; x=1823356579;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=zKbVeQlf03YWwT0ViBX3sWgzxRJ76jzyjXhnE1yIUEI=;
  b=LvDn81ZipFYcq8gR7Gmta4128bE3epvz0QXLlWB75+VqXn9QMrA8X0iY
   Bf+diPTy06ybvOgDm0TCvrdkYKTkkLbUmhFQ8kOgQ3rIfyMEx9fYlfZzM
   E/wU6OobqSXId1Zogpzr8Tt123nHxI/C5o9EEgfXaesgvt9CJ73Oa0rHt
   2e8cHeO442RZmn8lstlY9bbxw0w9y0pyZ5gSQKkJiluannp9NB3/EVoc2
   b6HSGCbGBrIR18hccG2jvLHoc3rroHLiQWTTW8wD7CSldZ3n2eNyzAucD
   JRw915ZqsoPiGCq7pAoOTIdXVLQgIb73bTpAVxi/AH3Ka8eVqFTTiY5iw
   A==;
X-CSE-ConnectionGUID: aLiZvCRcTdeM2IszIhtrfQ==
X-CSE-MsgGUID: +3aVi1s7SxG3CZVBN/zq1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="625483"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="625483"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:56:19 -0700
X-CSE-ConnectionGUID: ApHOFhWbRxCoh1C4AH5e5Q==
X-CSE-MsgGUID: zl6fZdLdQgeaPj2xyqisww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="970410"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:56:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, Thorsten Blum <blum@kernel.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261005163130.20375-2-blum@kernel.org>
References: <20261005163130.20375-2-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use bool for local
 is_thinkpad variable
Message-Id: <179182056966.17897.6975873599721190905.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:56:09 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 05 Oct 2026 18:31:31 +0200, Thorsten Blum wrote:

> Use bool for the local is_thinkpad variable because it only stores a
> boolean value.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Use bool for local is_thinkpad variable
      commit: acf32e5497af0bfaaa68b30cecab18aaea56a31b

--
 i.

