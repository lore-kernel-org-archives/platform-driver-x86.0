Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F613B1EC0;
	Thu,  8 Oct 2026 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481054; cv=none; b=d5O8DqLJNmSNCb1DNdjNrrdP7gETezUQ2BP9j0iJip3TqKWcSa8bYOcYgfpWIUfEftXKRB0AMZ+3VIiq2/p1kR55g1qVFouDo21agxk2Zdj5CnXzsFFXoreJLjHI3nM7+Akr1yJOpp1urFjP4SXwrGP/eVTTIGGl+4kKZadKMYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481054; c=relaxed/simple;
	bh=UJfN5kY7xG9IMsCcCHdORLsnENvxc2vA/1iz7BCBMfI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ObMvJ+mXtQjMUH5NjwxHyYnMGZcUB4KA+z/h/mvXaOb1CCR7JXebBmz2YZ+pRjNCrMpmd+HHkCpo4Us0iH1YBcKj0EzFRbZMgvTKQv8n21MriDN0tfyeXSVZfqKm/oYTc+A3C+Y/9woOzdGun4+whOolddqTLlNa3dUhwRWU1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uoltszwg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uoltszwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481054; x=1823017054;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=UJfN5kY7xG9IMsCcCHdORLsnENvxc2vA/1iz7BCBMfI=;
  b=UoltszwgWgc8Wtvqe2utNDELJp0wPP5tnZyw++KD2wrNF3imz43jUGlm
   T8ej6bMy1kM+cDuBNa+z1NAjA7gtIsGOnhPxtcj5mSiZwJLso8WVZivrj
   490bq4sv1PWsQIHPICxU5VydMi3iKuKRBv0Rks6gcdcMFSrQN3Q5LbTJP
   J7DsOH45rJs6G1R6/2QloQ37Utz2LJKinkzd4i36EArs11r3IFLz26/mb
   WkkmvyiSSXZFZN+XqDqw2L6OOKOBZSHGlevacKy8LZg14Ilq3BzJtp5Mp
   ciP+m9oI6PmXGdPUAYOl+ZpvEapUklhJswgYQTjdcyKr2tB8upWwhA0zv
   w==;
X-CSE-ConnectionGUID: Np2RvVvjRlOp4gvA0mrz3w==
X-CSE-MsgGUID: xz6wOmXSQ2Wyml6rzN95qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="153655"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="153655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:37:33 -0700
X-CSE-ConnectionGUID: azwa8kEFQy6Xs2qhpIxDYQ==
X-CSE-MsgGUID: RuQz4rWxQgOJvaTmxkhvPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="436693"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:37:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Ike Panhc <ikepanhc@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Rong Zhang <i@rong.moe>
Cc: Marco Giunta <marco_giunta@outlook.it>, Huang Wei <huangwei@kylinos.cn>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924-ideapad-laptop-camera-sw-v3-1-922ea6a9fff4@rong.moe>
References: <20260924-ideapad-laptop-camera-sw-v3-1-922ea6a9fff4@rong.moe>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: Report camera switch
 as SW_CAMERA_LENS_COVER
Message-Id: <179148104504.29028.17965248102154899322.b4-ty@b4>
Date: Thu, 08 Oct 2026 20:37:25 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 24 Sep 2026 00:31:27 +0800, Rong Zhang wrote:

> On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legion
> Pro 7 16AFR10H, a switch on the side disables the camera. This is handled
> by the firmware, which also sends event 0x0d (camera disabled) or 0x0c
> (camera enabled) through the WMI event GUID handled with
> ideapad_wmi_context_fn_keys. These events are currently reported as
> KEY_UNKNOWN.
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
[1/1] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
      commit: 1584717fb8c7c80f06d116d3631334f6acde78ae

--
 i.

