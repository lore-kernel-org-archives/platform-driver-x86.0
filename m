Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E607E259C80;
	Thu, 17 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657591; cv=none; b=ostn52JYMunn9nMay4F1l3M9kIClGN7I60BgR1Ai43jOWEonzmu31ArUiWw5beTX0VrBqxDo8cRCF5J1S2hQ+R3Gbzhp6HK8FYQNyERSEJR9EXQvtXbxhgKFsD93eWuz40UO++p9Z8YrfYVPclM0ZVpJ1jKY3SYyAEn7Nh5Jt5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657591; c=relaxed/simple;
	bh=ul6HdkyXtMQORe+nB4GohG78YZaNPoiGYQM+ak+UeYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eM+kcxp58lXISvrWCnloKqDxTumEtdRKoA+IUXrNP9KNSS2vXJqOQ0FHSD6ATbIwvQ9JIpzFq5SV1/frcPM8X2+DdW1dAX67BPNjrIzxTwPpCOtUGaghKuyLdBE2/nU8zHj68oGsx0AP+K7yGMi5eg3QeIjKzTqyXmJh4jj8mOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4sknGW2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4sknGW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789657588; x=1821193588;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ul6HdkyXtMQORe+nB4GohG78YZaNPoiGYQM+ak+UeYA=;
  b=P4sknGW2zGR7dsig1DX9MdwWyWnRHEOmD0O6WtPxlb6/B5HE0cHFN4G0
   tkQG0t9AU/G3qPuPWDiwziTAWVs12rJ/TcI1P3SKLRP8F1lBJBKy3y/Lw
   Wk008NcihmpXVClnsYdWBW6JDyio6RVTFCwSAwQRDn/YGErstY+eNmAER
   RSkjuTWte4cvHcoq/MdjZUuI/4HqS/gQSLFHL7NY2VqitZ8JCZBtO41nK
   tIvrtw/CSVTFWPAIHIbUqtEGb1ub+oSIyDiDPOWLGVpEnHfyXoZl61I+9
   NTHs6mNtXV61Ovv1p0+zJhlE6bNc5kwjXHTvUN/5ALsT5IAlzzfV72e6/
   g==;
X-CSE-ConnectionGUID: Ds2F3pypTj+jOdPcoRsegQ==
X-CSE-MsgGUID: Fv9lTX+cRtCbE8ob6tjlrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101433731"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101433731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:17 -0700
X-CSE-ConnectionGUID: 8zJwTKhzQX+GiAQKPSR1Mw==
X-CSE-MsgGUID: Svzg6cGcT+WHVbXIQxIoJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275798196"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
 Mohsen Tahmasebi <moh53n@moh53n.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819150205.19453-1-moh53n@moh53n.net>
References: <20260819150205.19453-1-moh53n@moh53n.net>
Subject: Re: [PATCH v2 0/3] platform/x86: acer-wmi: enable hwmon on Aspire
 A315-58G
Message-Id: <178965745060.22350.9970348302983102113.b4-ty@b4>
Date: Thu, 17 Sep 2026 18:04:10 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 19 Aug 2026 18:31:55 +0330, Mohsen Tahmasebi wrote:

> Some Acer laptops expose the same WMI sensor interface without necessarily
> supporting platform profile functionality.
> 
> This series cleans up the quirk fields by using bool, separates hwmon from
> platform profile support, renames the predator_v4 quirk field to
> platform_profile, and enables hwmon support on the Acer Aspire A315-58G.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/3] platform/x86: acer-wmi: use bool for boolean quirk fields
      commit: 4b960cc3c9e7f26d2efbbb40828ae1b28f085b60
[2/3] platform/x86: acer-wmi: split hwmon from platform profile quirk
      commit: 09e0cadc540c56f7d7836cdbed915a04a10e18d2
[3/3] platform/x86: acer-wmi: enable hwmon on Aspire A315-58G
      commit: 8adc32a9553d4b61fdc41fb3a7ccce64e118c935

--
 i.

