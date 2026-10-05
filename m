Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29B4BD7AF;
	Mon,  5 Oct 2026 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214689; cv=none; b=p01C5NWVPxLJ1Hz4tEe+tPlIz+lvHsCS4jXtlATj5UhpO+XcZlcp2wkn1o56qvgz8xlqybxi1QCo1KObrBeepfgYMnhfyGrIHFN2F76ukTP5z8aBn63XH4yAcpMJmEqEsdwMBXjGZPOEtpKmk23eqTX4joEq0BCo9eZkXd+R52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214689; c=relaxed/simple;
	bh=b/dKJBIY24HTRZ63CQ4I+3YJ8eYilY/BaiTI46Z8wSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EaDCEzLtBBBpxxHJ/j5NADTf8okwjrJGHzn1ReBGJ06H/2hsZTyH9tbSx5/6u8wvQUx7VcWatLSOPKedJlhCmn28NnXZ9Pv3K4eE4VvEQffIViXlsu3uGci4qqFi0ZpYfJQCT3HwS8fZf9+SmABTDiFHcfbYATbfBZN7JtAVuUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnIJ8Vht; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnIJ8Vht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791214688; x=1822750688;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=b/dKJBIY24HTRZ63CQ4I+3YJ8eYilY/BaiTI46Z8wSI=;
  b=RnIJ8Vht8qPALIR8FMvk/dZ/guoy7v+P/aYWDydf5bgvsE80y33cE6c+
   Yqg9mM7P7uyUNEoLwB0TtybtXK5HV40OavbAogqacS65AbB49uDYIiwr1
   yIlsrUzzCa+ExVJzC9uaTnSpeD78Bub1XNCtEKIigABHdNQ3Mzbnal2sL
   ddQG73VM4zAYcuuO3AhlFl/W2zg3TVOlzliV57zbm4M078v7FsSg+GYGT
   2FAYBuqCh6HzJyPgMaAaD/EtZYn+653X1ZtoQVMY3QEc3p4RfAV6WFxXX
   C/qvzdK0gHNKp8eKPXGuak2L6TQiGClBREw8COZWZu0K/QBTcMLv0ujoF
   A==;
X-CSE-ConnectionGUID: Lclko0yVTHCbi1nt8xZhfA==
X-CSE-MsgGUID: 3h37ickESf6/rptolXTG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102468551"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102468551"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:38:07 -0700
X-CSE-ConnectionGUID: dZTmJc1gTMmxuietg9n/4A==
X-CSE-MsgGUID: Ay7KpX13S02rAz1GV+P5eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280585766"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:38:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nir Yehoshua <nir@ciphersecuritylabs.com>
In-Reply-To: <20260831-fan-curve-validation-v2-1-7274ca16c8fe@ghoul.dev>
References: <20260831-fan-curve-validation-v2-1-7274ca16c8fe@ghoul.dev>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: validate custom fan curves
 on enable
Message-Id: <179121467980.12659.16542259089072017816.b4-ty@b4>
Date: Mon, 05 Oct 2026 18:37:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 31 Aug 2026 18:48:08 +0000, Ahmed Yaseen wrote:

> Custom fan curves reach firmware unchecked, so a curve whose temperature
> or PWM decreases from one point to the next is accepted. The firmware
> does not respect such a curve: a first point of 100% followed by 50%
> leaves every point running at 100%. The kernel keeps reporting the
> points that were written, so sysfs stops describing what the fans are
> actually doing.
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
[1/1] platform/x86: asus-wmi: validate custom fan curves on enable
      commit: ff7edee7842cba8c28845f5a63d2cc7f0e05586d

--
 i.

