Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2070224B15;
	Tue, 17 Mar 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752435; cv=none; b=pn/k7PZ1zGU3UyRQE24zvmVcUn5THU+ZCI98mq8StvsJoW1OUlndjaCFfviWZi+U6mKz/763CO790u4QFI6Te0YDjHafTjyPQjiBU+zPsNTk8113xL5aTMr9Dlsd+M7SOLAxm8Smqnkraf3D8MBJGUDa9QLc88gXyoH964cMZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752435; c=relaxed/simple;
	bh=razqrwSdxhx/Ck8FxFAVOa6fBnyBgm3G9vjGDHpctjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A9sPrUarZ5XKgLbXQKBF/xRwtTPajBb1KShDIacBJUAUX8UsmSYR+ycrFo1UsMygovUuvuru4+20APp496JLda46bh5onVu0aZVHQ2R+nG7aA6PuUPWkbTMcRXDUPzYtHgqCLqWcZxHa9HXXx8/sfyUsW8z8+txK9gwGAPJZ2Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9kUbNBx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9kUbNBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752434; x=1805288434;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=razqrwSdxhx/Ck8FxFAVOa6fBnyBgm3G9vjGDHpctjs=;
  b=B9kUbNBxdqRDQhuPgFrcVq1dHeKWe1JRy9KxWnq177zU27V5JNoKbkHl
   +ho09w7sf5/xsO/Kk0deVp6JTtJnFXasUFPwo5igPyGTuBOtv7SwhycUf
   XOF6Zz6K7g8JN+41wQTimcL/sXsQgv1esBCc3p7Tq3+J9Wk6kzuoxRQAi
   QozENCXP2cpvny6nDs3UPEwGGbXT7HzSZnuhqNiR/lq7rjx5X0VyU0aim
   dZ/Vv4puNlps3FXdH5xr7YqFYF6PyK0GxgNC0UOvI1y0mQys/5hDH8kwy
   EpMvcOjFaG1PzZXqibmg+pv+l0nxDrQ7tbYrvRB0/Eko9O4v62sOkNOCc
   w==;
X-CSE-ConnectionGUID: xJdzSEWBSnCcdeSkIUmXPA==
X-CSE-MsgGUID: /cIUv/HsTHSDTEHcQwp7qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85481173"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85481173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:33 -0700
X-CSE-ConnectionGUID: m9cCC76LRKi43SkiEl34eg==
X-CSE-MsgGUID: HoyL+HR9RqmieIAHobjBNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="260166211"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 qwqgong@gmail.com
In-Reply-To: <20260302073525.71037-1-krishna.chomal108@gmail.com>
References: <20260302073525.71037-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-k0xxx
 (8A4D)
Message-Id: <177375242639.9137.15181632813324946306.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 02 Mar 2026 13:05:25 +0530, Krishna Chomal wrote:

> The HP Omen 16-k0xxx (board ID: 8A4D) has the same WMI interface as
> other Victus S boards, but requires additional quirks for correctly
> switching thermal profile.
> 
> Create a new quirk omen_v1_legacy_thermal_params which allows a board to
> use Omen V1 thermal values, but rely on the older legacy
> HP_OMEN_EC_THERMAL_PROFILE_OFFSET. Add the DMI board name to
> victus_s_thermal_profile_boards[] table and map it to the newly added
> quirk.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add support for Omen 16-k0xxx (8A4D)
      commit: 63ccfdb0b412bfe37007422e78a161ad0d755df6

--
 i.

