Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C93C4B86;
	Fri,  3 Jul 2026 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086173; cv=none; b=PMdMIqufEgEaksKVE0Wy+PPfXzidy6YlrnQmdkLvUNq7lwLp37+05rHlVs81zKfeBkPhShdMo0nDmRxYHzVG4q4u+lnU0V2+cqu8t3QLaDsEw+21KVyNjhsiIUMk0Xala0wdCVrzkOIMZsDYT6kQUPu5kXbLCtN+NaSPeXeQsfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086173; c=relaxed/simple;
	bh=evRLyz7iM4pNE2Cx8YY3+xoV9xt94igoFpB1/rZqVn4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jTpkM/l3FUnnB7zI24CRwIdAwzttTPhOBe4LpBagANMisDTFWn8uVVxOvfMkQ6YwIQdfJ69NKD384lJniOnVRwdJFAsOHtCq7b7wS4DqB5/tcBVeUe+2EgW+1H1iQpWa5K9iyXnKMy+s3FzGi3JFkLEmKjzZVwAxr0KOChznIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8IyTulo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8IyTulo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783086172; x=1814622172;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=evRLyz7iM4pNE2Cx8YY3+xoV9xt94igoFpB1/rZqVn4=;
  b=N8IyTulo9bHQLr2UXcrDCainJTMTtye0+7H7Hwoh2QC5nJGv/bteUmkQ
   GklNjaBaiSyOYqksHeCgJ4Dwdc+b+8JZWcafNnOR8+boZdaZ5Z/koNxwP
   xmrwTLvCumLQ7aSGfLPEEArgC4l7thiFTWQ00Fc0AgTe+y4KeWsBcskvo
   HrItK0b+zmZpNFqq9Ot+MEu65W9iMY6UM/s4LZDu9ltLovGBWERBfBw6W
   8+SqrYtXFYzS8eHx5pcuj5wXMMJh5lDXDL0qt/vfrgjbB4c53qQJc30Gf
   lPZLDai4EwdzlZphqIN5TjGkxXxbVlVjt8DY6rqt7Ie8iRf35rFDLErhK
   w==;
X-CSE-ConnectionGUID: LEz6arAvQlCQhXKvwc6jqA==
X-CSE-MsgGUID: ThpoxFE1TvqOn8uRxJi8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71362783"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="71362783"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:42:51 -0700
X-CSE-ConnectionGUID: EGx3ay1RS/6Sfymx3B2XRw==
X-CSE-MsgGUID: HZizQhZXT96GFcfNcyZwSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="276329760"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:42:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20260701120140.430659-1-qby140326@gmail.com>
References: <20260701120140.430659-1-qby140326@gmail.com>
Subject: Re: [PATCH v2] platform/x86: bitland-mifs-wmi: Fix NULL pointer
 dereference during suspend/resume
Message-Id: <178308616472.25771.4774910234895366411.b4-ty@b4>
Date: Fri, 03 Jul 2026 16:42:44 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 01 Jul 2026 20:01:39 +0800, Mingyou Chen wrote:

> The driver registers two distinct WMI devices: a control device
> (BITLAND_WMI_CONTROL) and an event device (BITLAND_WMI_EVENT). During
> the probe phase, the event device handling path returns early before
> initializing the platform profile device (data->pp_dev), leaving it
> NULL.
> 
> However, the PM sleep operations are registered globally for the WMI
> driver
> and are triggered for both devices. When entering suspend, the event
> device
> invokes bitland_mifs_wmi_suspend(), which passes the uninitialized
> data->pp_dev (NULL) into laptop_profile_get(). This leads to a NULL
> pointer
> dereference inside dev_get_drvdata(), causing a kernel Oops and halting
> the
> suspend sequence.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: bitland-mifs-wmi: Fix NULL pointer dereference during suspend/resume
      commit: d3666875c75eb1bc8090343fa0d6fc8fb7924356

--
 i.

