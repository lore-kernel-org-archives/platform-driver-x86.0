Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D58E153BD9
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007561; cv=none; b=Dw28Ues02X6hTSz9B3Ihq176ay5iHz5CpRKWkvDcQhD/n2M5Cc5WfAbSTlPpAvlGYhDP4pyo1Ei60kMrbw+u4tbhL9d6HYSg/IWoCdGMorLshRJ60wv5G5HJv3juuk2pbyVJ/w/8mmCtyhaRFOSWKSwLKuTa6cvaXsFeH9hjvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007561; c=relaxed/simple;
	bh=igTSXji7LJpeXsn+c63L7sZWONFSWh4+SjsjGmethsQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WpExoAQDeBX9LMyb9mvB8BHySoKzzP4LmE/zaOYbAHn8wesvoQLkTdqhDU+LuOK24W7q4S9MdS6waZZzrTZcY0qFYDfDdE4Xs7GYfDu+5thj5xgIgXY4tlgX9ijXVLwbx3poydNhw+/SFFe89U9/Hq5/ArWQti07Nap4QQUZpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkhCFVHD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkhCFVHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715007560; x=1746543560;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=igTSXji7LJpeXsn+c63L7sZWONFSWh4+SjsjGmethsQ=;
  b=fkhCFVHDVJgU/v/H/4gOBm77rIsv69mwDcnemshEZAjTWDsteECFqxN7
   1K8MhCUlhb1SpY2iCfLRFUKCkp0ixTa+9R1CIgIR1Q/A4F0qlz1sDfr4M
   GGlph+Qym+24r0ZFeyTRQ5X6F6oV1528R2P6L6Nx2s0MM+PjUufiMo+0B
   2OvkQMcuUTbGastoW3TiFKLC1eE12z7BvhNO8Hc9DPKgZJdRZ9bzhFNmY
   X71I3AgXAQy+snmFKFrMojFoVnMgcWbtof1YSV/wjsv/F5abs2Bio/s6Q
   EYHJwZm/7KdYQt3F/e97oBkeA5ZTGXxJySCVllVDYReLH421sihaNvTVh
   g==;
X-CSE-ConnectionGUID: xVu80R/tRTqxGVtl3tjf+w==
X-CSE-MsgGUID: 8Zan4aWLSMi9tdNtoOiNiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21912925"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="21912925"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:59:19 -0700
X-CSE-ConnectionGUID: aquOeOCsSiah9OaE57I+aA==
X-CSE-MsgGUID: +VpTBwBQQ1WkxBwcwcX2xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28186463"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.68])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:59:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 May 2024 17:59:13 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Pass struct device
 to init()
In-Reply-To: <20240505160832.44216-1-hdegoede@redhat.com>
Message-ID: <8fd64b93-36f3-ddc7-3984-2d232a28a395@linux.intel.com>
References: <20240505160832.44216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-3228699-1715007553=:1111"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-3228699-1715007553=:1111
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 5 May 2024, Hans de Goede wrote:

> Pass a struct device pointer for x86_android_tablet_device to the board
> specific init() functions, so that these functions can use this for
> e.g. devm_*() functions.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-3228699-1715007553=:1111--
