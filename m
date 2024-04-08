Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6897E1411E2
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590947; cv=none; b=G8n9sRTA+j3LLXsFCDcojou3jKM2GS6NxzIC03k+s+VADQJmdxxvXZk9riZYBfIzOQUStiZXZmqss0hkNzQpX325uEwOIbj77r7P0E4jcu/rQfQHabVtZWMWgTNRUkpVBZOxMTOYe8aFBPqQahhYd6yxRCR1lBqHKSpHSow/lKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590947; c=relaxed/simple;
	bh=tJpbrluwt0P9ICJjQfsv7slJ/4XR0fP1JHrZzK813EI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P2HBGWWs8TSmN4SXwEnDU63viEotKtXAW971fGFhkpRqMaTiz1zmQPHZ5zl8USrDwvNitfgNsHs+zfoy8yfwgyP4ZZ5Dc12F+kXGAPQYRwXiwJPBvmfsqyPDaUTJXoT9iaF8g66LGtJb0F+cLRwQn6S6Gw/NRqHykWLf/n6wog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROsuezii; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROsuezii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712590946; x=1744126946;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=tJpbrluwt0P9ICJjQfsv7slJ/4XR0fP1JHrZzK813EI=;
  b=ROsueziiWZGG3h/eGyw/aC4a486zYSrHQaYj06olI2LFOk+jsO2mcG8c
   4kgweCvYvffodz450TxQejh8xnb18VH5+pQqsykogiPDPJ3JGiGMJXX12
   6XyGWTMjymxqRtfQH0cK9zfBAZG7HqTVpfA7zIz6v3s9uP7nUKJ7BX+ze
   T/0FHZsq8hUcY9gWjPsSBEoR62adV+uC3k9k6OWigsZpBumUHDHd/KJvm
   qFaG5iBOuSg33/nzGpsAxuhIamn2A4C/FN4ZYVhddvBOvrieMtX/+WR1H
   m/OPnhzJwqu6d/0JiZB+vOY9OwfB8+kNoBQm/JxMiY6w7PLjMFWCosx4o
   w==;
X-CSE-ConnectionGUID: 7KmJX2y6TyqXejc+MdpM0w==
X-CSE-MsgGUID: EAM+Dc9bRS+aqObEYKREUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19018794"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19018794"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:42:25 -0700
X-CSE-ConnectionGUID: AP3gbZOfQVK8+7yxDAMkWA==
X-CSE-MsgGUID: 0R1En9JXTaOwE//R15V2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24622308"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.28])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:42:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20240402124351.167152-1-hdegoede@redhat.com>
References: <20240402124351.167152-1-hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: toshiba_acpi: Silence logging for some
 events
Message-Id: <171259093806.17776.3713671881492753491.b4-ty@linux.intel.com>
Date: Mon, 08 Apr 2024 18:42:18 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 02 Apr 2024 14:43:51 +0200, Hans de Goede wrote:

> Stop logging unknown event / unknown keycode messages on suspend /
> resume on a Toshiba Portege Z830:
> 
> 1. The Toshiba Portege Z830 sends a 0x8e event when the power button
> is pressed, ignore this.
> 
> 2. The Toshiba Portege Z830 sends a 0xe00 hotkey event on resume from
> suspend, ignore this.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: toshiba_acpi: Silence logging for some events
      commit: 0dd50b3e2c3d651ea972c97cff1af67870f3deaf

--
 i.

