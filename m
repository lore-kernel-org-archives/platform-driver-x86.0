Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0877641C63;
	Mon, 15 Dec 2025 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765819423; cv=none; b=EAfBtOSCV4q6Psd2ycwrvQ4zXmSx+GyyoE8NrTLEkeZT8LdoCyGGWP/kZLyqiHLV8v8297AWP8I0A+6lbJznKEeHl1YvX8rcgjC7Vj80zaPORp46UrRtoYJV7t9shXY39xABRT0+H2JyV7W97YGQtcE1pFWm1XLDzpABJYUcQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765819423; c=relaxed/simple;
	bh=r3YU0E9UlcE+XwEKG7XUUTB49CEGO8VEcJK6+o4XuRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qS8uVVpZVJWTNZVNQPorkgMUMa2MnS3ly+IyFIl6SbzBt/yziVsiZkZZFy2C++HiAC7XBMi2w5lsWI6PqDcorPmFNNG9Fw++YX315lGMzaFe1M0G3gbRfYERPp6oNOkCle4Jgb4gnoBsc1I5uStrnvH/fSooslx2jwkv7qSyfCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnlbMS8L; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnlbMS8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765819422; x=1797355422;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=r3YU0E9UlcE+XwEKG7XUUTB49CEGO8VEcJK6+o4XuRk=;
  b=fnlbMS8LslasdjCbVoIggrHyueSvqFzfUr5iEbCn8lKJ3BJPlyIBQohO
   iSENUdAT3IFrcqs2NARHRiBmiWI37lAVqJ8fZ8b30XxpRN+LST/AOFNSM
   AoAhkTAJ6PAvQVmhA+MK7XaPBcB+K+V4biP8Ao8AxzUi5Ocex0D1LApfC
   yue/lI/zJ2pJSTcFdGY1eWHYAs8lCx9hMJZbSr4yAKJ8XM9x0Y+dJBFcj
   qhp/Okb3Bd1gK6v6yPk69O8lIIF+Ewk2r5hXqELNETDPIcvkcg9cLBmLK
   z9B9sAna5DdalDkJ/frfJMkoTCViy6qT5wrHx+aClBq4PLbLyFdjilX/3
   A==;
X-CSE-ConnectionGUID: csprGKneQ4uR4HXPRl8e/A==
X-CSE-MsgGUID: 9bDvTTa/QBW8Vk7dpHZGOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67667873"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67667873"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:23:42 -0800
X-CSE-ConnectionGUID: CoHDV3AeTGSND8ElEsiyiw==
X-CSE-MsgGUID: tBjMsTWoR3ixSuevzcOQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="196872647"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:23:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251212180319.712913-1-wse@tuxedocomputers.com>
References: <20251212180319.712913-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH v2] platform/x86/uniwill: Add TUXEDO Book BA15 Gen10
Message-Id: <176581941519.2916.17448151252865958076.b4-ty@linux.intel.com>
Date: Mon, 15 Dec 2025 19:23:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 12 Dec 2025 19:02:22 +0100, Werner Sembach wrote:

> In my previous patch I missed the TUXEDO Book BA15 Gen10. Adding this now
> also to the list of supported devices of the Uniwill driver.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/uniwill: Add TUXEDO Book BA15 Gen10
      commit: 4dcb6e4af15bf45aa1526834e8f5e296ad7ce867

--
 i.

