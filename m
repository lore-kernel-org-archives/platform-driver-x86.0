Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A24206C
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691701; cv=none; b=RJNbdkVwnPiM2VPDwjwa6DCb4UcsS+Ai6w+BVHtL1luXnYfcO/L9DzEo+nDfGonKEqbwOxwIEB1G6o7dwA3d+WAGacJ0Kx8dI481jTAvi9vhSJvSdGhVsxu3s2Lhl1AIfy7PtRMnK3HCtBzrx2i0h/cX/CH+7jOzJiYHp+QBqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691701; c=relaxed/simple;
	bh=d44nrZBMas+zswUqgZz8HCNUrhQoGacwgByV5w46tdw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eGLPfQOixrmwzEdk2bhUoveM7gR6x5qaExQU+wOJCSB2mwDmCZBQLDyhG/xxzumvpF6LQJjftfnKXl+DZWaKg6aUc/VNz9ucFBQcq6HHzwU290Q/JagrW8a5jqVhzFCHWrS1ogUBJLy0072rn1lzZGrufq6T+cvAd1YLJOK8+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itta99rx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itta99rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720691700; x=1752227700;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=d44nrZBMas+zswUqgZz8HCNUrhQoGacwgByV5w46tdw=;
  b=itta99rxSfRVNxYq+mIJJmOVa4IEpqb52MO1D0nUn2BxIIntVX0HxXoY
   uis8FZbztEM4Ymt2cAxuK0gTx0fJPmi6a021ioE/NJ/uCZpmtlG9L4v3a
   G9ku1RTn5U9iHdF2gyrKdm2sztRxWcpJxi8kzYHVJ7izNxWgv4fTNLmk7
   gnQo5u4Pq3kOpGepWiVmOs9Pvz7D/igs7Rm+wVcxoE33YCGh+LBJ4dy/w
   zRP2Q8Qj6tDyVfLUf9yazOK+djxy15yrHPki1Noj2LrwiFcb6VHPjeveP
   x0o7BKKkar/qKSbXypDvPyEuhKRL3upP0PQJGPT8Aub55NTNtRFhqp25d
   w==;
X-CSE-ConnectionGUID: ERrufch7SImK+at59N0/fQ==
X-CSE-MsgGUID: qY/nqLWsQBGZKovPAvDr3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17876984"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17876984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 02:55:00 -0700
X-CSE-ConnectionGUID: wO0ZGRToSwe1j5mxGReXSQ==
X-CSE-MsgGUID: lWELN2HqTsG/cx2AnHO5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48577864"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 02:54:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 12:54:54 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v2 06/11] platform/x86/amd/hsmp: Change generic plat_dev name
 to hsmp_pdev
In-Reply-To: <20240711073314.2704871-6-suma.hegde@amd.com>
Message-ID: <58d8dd5e-f3a4-0f14-2dda-7fd5c3555450@linux.intel.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com> <20240711073314.2704871-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-567740996-1720691694=:6262"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-567740996-1720691694=:6262
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Jul 2024, Suma Hegde wrote:

> plat_dev is a commonly used variable name, since its made as extern now,
> change it to more specific name.
> Also change miscdevice hsmp_device to mdev.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.
--8323328-567740996-1720691694=:6262--
