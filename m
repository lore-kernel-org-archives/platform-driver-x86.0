Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F279F26CE2D;
	Mon, 22 Dec 2025 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414563; cv=none; b=JPpIwORjQDKQ4qVQeDlKoQI1ayEaZc1QXDsoLT2wfJOv8iH4ez1Q1qnCKbdJ16BS1+GEelRjcETyF8bgH76oMWUdO50VwnQApNgdOBN432m2rKI4h7m1YTpHtGqnvfN6xhMFONC9V5s7Njy+/w7scLM11Bi/l4mrpCI6CxVEsaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414563; c=relaxed/simple;
	bh=gBWPojNK7uOveCwrgVrHMYnLCPJd/BXwRoAGJ4OqitA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F2BWF7jc6aOKjlRViVDZvFslYYBSf+ONZYhMv42G44aLbXbNripE44LwOxTiNXUk/cDBjQncykWE1+GdY22FjPWyqu5ugj+886q035OXa4o6QaymErzk9DRk746wIt1dGdB512Ea8ZiVeYxXX+gNK4luvjt824IXtGmqWycFmuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmIB4XhB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmIB4XhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414562; x=1797950562;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gBWPojNK7uOveCwrgVrHMYnLCPJd/BXwRoAGJ4OqitA=;
  b=CmIB4XhBCOaPIfHDT5Aqe6NCJ3w2u4SqBDykzrWnWjGWB1e2Cq1U1FGG
   DAR+HnwygT9ZRxUWx4k+Z/ZjUrj8Gd12IJ3vs3jrXYtkq66bfTL6wTkTa
   ArlAMF36YfI8jAfGVi2CSOOHURijMil9sSinNnLj96uMnHCTgPs38j/NY
   zTz1tHFOd/EBUUclic1XbQY513PC+EweJPKGAnR0SsRF4y6j+nWLSZTdJ
   W+dK5DqliMtDTaIRgvK5MJ/+V8E19YlTnQCpBavgB+wSkZcRces2lmCTV
   g/oLCCOFZAaf7TiOh5YYCrHGGDdI5GmU+sO4H6go6Xw4IYhJs6WEQEq6W
   g==;
X-CSE-ConnectionGUID: XwarZ22GRoyvVaFuT0NxCw==
X-CSE-MsgGUID: 8vptQdcDQhK96gT2MY+2Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79384673"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79384673"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:42:41 -0800
X-CSE-ConnectionGUID: paavMvk/Tsap1aZeTxgT5A==
X-CSE-MsgGUID: 4oqcopb1RTWACOnTWhSykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198683461"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:42:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Tim Wassink <timwassink.dev@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20251221181724.19927-1-timwassink.dev@gmail.com>
References: <20251221181724.19927-1-timwassink.dev@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add keymap for display
 toggle
Message-Id: <176641455320.16407.16078946567406568593.b4-ty@linux.intel.com>
Date: Mon, 22 Dec 2025 16:42:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 21 Dec 2025 19:17:14 +0100, Tim Wassink wrote:

> On the Asus Zenbook 14 (UX3405MA), the Fn+F7 key combination emits
> WMI code 0x2d, which was previously unmapped.
> 
> Map this code to KEY_DISPLAYTOGGLE. This matches the behavior of the
> display toggle/projector mode key found on other Asus laptops, allowing
> userspace to handle multi-monitor switching or screen toggling.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-nb-wmi: Add keymap for display toggle
      commit: e521dc1687834d0e8c7506f1fdf00daab4ebb51d

--
 i.

