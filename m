Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F923A9621;
	Fri, 27 Feb 2026 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192302; cv=none; b=qJmxtLAf3zZEszHxsIK69dzhghtBN4i06XX3MH1NUxZyRzL8gGKLW5u/6S110TB6015JbDdrA7etM3QBMGba7L/yRNLRIK3FbgRVKywIlhs91eTqW5biaH+xybIZFGqtcJFo53BA5dhOu9FH3dAohQ8ekXyhv286C77BpyCT66Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192302; c=relaxed/simple;
	bh=uQJhFw0lvZPQXC1DiB3ZZ57DtCkFjtAqHCddKSY6wUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o5qnMIvfEv4jSIAsdJLVZHu11DeB1uJtbG5DMdwwxrgHHy0e/TErna8ZQEnW5CM9e5QCyHI8wEvUig77v3dg5+SQmTMGAyeH/NUZakTYK5LFL2nRqKxP/TBClrp8p9ZwIzNNAYboSqI6W9ia4k/TnRCTDZBv5Xs/RWBlALF/xQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcYhJo+c; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcYhJo+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772192301; x=1803728301;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=uQJhFw0lvZPQXC1DiB3ZZ57DtCkFjtAqHCddKSY6wUs=;
  b=hcYhJo+c8Fc2tVgNLVZGjEfClFf4CLNjitSr2UEEqHBDIC760y6xVv5z
   MbZJf0dGJgZ8ASR1H5B41O9mGowuVdYuMKQcniqPRZmCkiv6oOlepZm6O
   QK4uPMpafoAQBMOjgC4gC9FJkROlkZwxPX/Gt1RJjWmJDjUrqcAsoLsdu
   IiHbpL9tGLXW7aW1j8kFsjcztUsF4fmOiXc8bza50M4adpALzydKKMkbg
   CDhWV/Z9ZCVTXs8Uv1GcBdJXSqmF+f6v0RRWBSS5ujmt46CgABi5OfZnA
   T4eW+fqcePZTuLgmXFcrbGCXxAVv4/Yq1M5JmaTLWLqCtRgjzNHV7Wf8t
   Q==;
X-CSE-ConnectionGUID: HB2SVS/qSQeoFT6XxZnaMw==
X-CSE-MsgGUID: SPf9TMyrR0iisPCMFq0vzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75873748"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="75873748"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:20 -0800
X-CSE-ConnectionGUID: CY3yb7Y6RI6eVTdxRgzvGA==
X-CSE-MsgGUID: gRA1FZ1sR3CjSmXG/2XUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221377667"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.144])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-kernel@vger.kernel.org, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Eileen <eileen@one-netbook.com>
In-Reply-To: <20260223183004.2696892-1-lkml@antheas.dev>
References: <20260223183004.2696892-1-lkml@antheas.dev>
Subject: Re: [PATCH v2 0/4] platform/x86: oxpec: Add more devices
Message-Id: <177219229305.7567.8063665285336961714.b4-ty@linux.intel.com>
Date: Fri, 27 Feb 2026 13:38:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 23 Feb 2026 19:29:49 +0100, Antheas Kapenekakis wrote:

> Adds support for the new APEX model by OneXPlayer, as well as some other
> devices that I have collected over the last part of 2025.
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: oxpec: Add support for OneXPlayer APEX
      commit: 3385ea97c14d271dcb0c6e6fcf16972f819eecd8
[2/4] platform/x86: oxpec: Add support for OneXPlayer X1z
      commit: 4049c46edb5d44c0de045f6f504371705dd603dd
[3/4] platform/x86: oxpec: Add support for OneXPlayer X1 Air
      commit: 2a3b4a8c10a64a62c4243007139d253dc1324dfd
[4/4] platform/x86: oxpec: Add support for Aokzoe A2 Pro
      commit: cd0883055b04586770dab43c64159348bf480a3e

--
 i.

