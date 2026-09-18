Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E451DDF4;
	Fri, 18 Sep 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755896; cv=none; b=fJwFOqp18HaVSEslYKO2WWjQm0xz5ck79Q8hMZ/OcDRNxfqO4+QCwzuAKy02f4zpW5zQFMrkdP0RgpD/J5oDeyJDVLQVKsL2KCR1Y+yZkQzKxrCc+KcddDAeXRTo9z1AmuXr6D2aBXYu/TTiM8qsqVhsatqoLFdeggemBgx+xS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755896; c=relaxed/simple;
	bh=n3GTwo07VabT6Um6fys7CkPvfOGICzrGoxo9avyWeP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kt3+Yvz3MQZJ5Up6vDROSLQieluIExBXKW51acA5BjCa0dw4fIlfxQWqMTh7WIQUGdZNYu8fxk/ZoNqovDQEa1XIHh+LcobtYxjNcQFzT29UskaMyIUv1OtiKg8/eGI+/FPJa7EXtl3XjyFZIaZV2IFU2TfbZbyeiP8m3CXbafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O44Q/gGB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O44Q/gGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755895; x=1821291895;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=n3GTwo07VabT6Um6fys7CkPvfOGICzrGoxo9avyWeP8=;
  b=O44Q/gGBylKfuIuYvoksHTIbAg/bRpnMDDm7Qd2j0UbYBfinmq3bKT9y
   vn+Hi42VQJwPRsmXE+QOGbfDteTPDKYSE5qXaPV0fqjmCRckVVgc+53hQ
   cGTcnb5/oZ00ul5OvKD0/rmayRbOt88ERRWiNJOWLteUJOYI4eP2bEu7a
   vD167DY/gGPQ6VoIWkDQhZQfBEM0V8CGCFLoDASfeyrtgROHUCDgXYC8w
   yY5I8IcUDc6N9KVappIRxB+5Hw/yYmXvcWyjXsWSG+LBs7Z6PniJYd+yW
   J1XVYbK12ROkOJNMW3g7b9JeHx9ZuMMn0m1Ju6iOFBf3dqhXyEPOUVOW0
   w==;
X-CSE-ConnectionGUID: +Pt5ZsbHS/iVR4SoAn9Imw==
X-CSE-MsgGUID: yOmL37ylQjKP8YewzZfhug==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107785009"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="107785009"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:54 -0700
X-CSE-ConnectionGUID: d+DUhK+6QP6rNDRmYQK/Rw==
X-CSE-MsgGUID: aCqByL5lQqaGl7iPykimIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2726933"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: luke@ljones.dev, Armandas Kvietkus <armandas.kvietkus@proton.me>
Cc: denis.benato@linux.dev, hansg@kernel.org, corentin.chary@gmail.com, 
 fxzxaxon@outlook.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260825-fan-curve-v3-1-617f8e661e9c@proton.me>
References: <20260825-fan-curve-v3-1-617f8e661e9c@proton.me>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: suppress -ENODEV warning in
 fan_curve_get_factory_default()
Message-Id: <178975588661.29716.3167848890407727242.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:24:46 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 25 Aug 2026 00:47:07 +0200, Armandas Kvietkus wrote:

> When firmware does not support the fan curve WMI method,
> asus_wmi_evaluate_method_buf() returns -ENODEV. Callers treat this
> as non-fatal, but the pr_warn() here still fires, producing
> spurious boot noise on unsupported hardware. Downgrade the message
> to pr_debug().
> 
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
[1/1] platform/x86: asus-wmi: suppress -ENODEV warning in fan_curve_get_factory_default()
      commit: 9af7fddef448d649fa1332d86a14465a1d1fafe3

--
 i.

