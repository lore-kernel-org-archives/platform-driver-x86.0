Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816C531629;
	Thu, 15 Oct 2026 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074523; cv=none; b=n4rRk1AEhgGGTbGpHCya0MHamGY/jNpB5vy9ZZLhrs+TTeRYJ5wf3KBfclge4VRXofm9j+pGp/Nn9Gvtyl4mayLHQNMyfwMpw52UdxxWR1Q96zr78P/7nV4ReHqZvbSf92R7JHRNpqgOl+9J0jqYUj2L8ANZapqyyQ+H0Ke2e2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074523; c=relaxed/simple;
	bh=8vw+jc8Ck/hwngx3TnGdXLUzag81p7fRtuaHieoLfWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oIHkV+b9TftTCTJL6B7hdk+kyzmLYfwbQbQqdOJtHomT4Dt1Rpm8LDFlZTftqrqllZ2TS4O89n0rGjdPAhzhOxpCFLd+u94Fs9sCIfJ9xIWYyREGk40iHCYPh62AHjxlHDR1bE7MF52mOSx/F64y1SREtx6oDSYHklCRqYJxl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMHCinqx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMHCinqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074521; x=1823610521;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8vw+jc8Ck/hwngx3TnGdXLUzag81p7fRtuaHieoLfWo=;
  b=OMHCinqxVir0myeTr6SfWjzhzG8W/3cO9cWV42XQLfGi0wOI6j3xSg/H
   bczybeDXtzHgCkNSFYxFwSQahAO5QTO+c0dpF9TCXV7s3wS0shbuaWE2r
   BVOQgR7oNveu4ve5XmANjtiqg9xR2qu4JnfsuFf0j1R5jQOe1/DveMrL3
   Jsb+frHm0UNunytBkDTYnVQSZkkZHGmaB3SwDYURbA8ujytUTK5C2+xvc
   2kO0RfKaB7luU9BUqWm945Gss7pbBTWnmcSqLs1pBf5pPBuWPiZ+A4APA
   eY+2YZ8AJiCbVzQwTu5F0XOreVpTf57+U76vEk0xcjvwTtE7s4HVMvpGJ
   w==;
X-CSE-ConnectionGUID: KULSeAt8Tt2MR//HfTGZ0A==
X-CSE-MsgGUID: mv+X1peFT8m24Vyfe9xZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="732095"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="732095"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:42 -0700
X-CSE-ConnectionGUID: lIPxsqFhTBmvPewxxfbMdg==
X-CSE-MsgGUID: 20k8TlfQQuWL7P4w4XbUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3482787"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Shuwen Bao <baoshuwen2013@outlook.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krishna Chomal <krishna.chomal108@gmail.com>, 
 Emre Cecanpunar <emreleno@gmail.com>, 
 Suryansh Singh <technosfan14@gmail.com>, 
 Radhey Kalra <radheykalra901@gmail.com>, 
 =?utf-8?q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>
In-Reply-To: <SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
References: <SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
Subject: Re: [PATCH v3] platform/x86: hp-wmi: add support for OMEN
 16-am2xxx boards
Message-Id: <179207451329.13793.4180821086242621563.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:28:33 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 07 Oct 2026 11:08:36 +0800, Shuwen Bao wrote:

> The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
> Arrow Lake-HXR) is listed in the OMEN Command Center device
> capability table with DisplayName "HyperX OMEN 16" and the
> "PerformanceControl" feature, but is missing from the kernel's
> hp_wmi_feature_boards[] list.
> 
> Add 8F1C to the hp_wmi_feature_boards[] list, using
> omen_v1_legacy_board_params as driver_data.
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
[1/1] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
      commit: 2cd10a35f3f09c49698956d32c6374fbdc03245d

--
 i.

