Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433622D1F5E;
	Fri, 21 Nov 2025 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763744444; cv=none; b=RlyNcj6vhWzMKt/u7OyKAnxuZz2skki7NaZHRVKzVH8mtn3NT68evde75jl5mYSwHuAWzpMw1H12IZ4J4Nqkf/ZXQRJY8nwF7Xmh+4e+2YXxjjrN+05zTSsuXzbjWEv3yOxXMw0a7wIRsYe05cV5MYOYoCo20gzxrF+HzKHdwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763744444; c=relaxed/simple;
	bh=pB2y36Hn5MVLYcX4ELMU56QzMs4V47Ht55KA15gFf0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=roeIofLesQkFTglmqmqzP1SAwbyYOPx6ebLe623WayfzVhvc5K2g0zJcELU5mFQg0AGVXnOCPwhOxFJwWgdpV85HszwaBpwLBKXnuYdOWXFjwDsXktTr0rbf0earh8fR46X6KW10H9y8SFocOpboQPI6cCuvWQ/9qYdZ4RloKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNObFts0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNObFts0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763744443; x=1795280443;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=pB2y36Hn5MVLYcX4ELMU56QzMs4V47Ht55KA15gFf0s=;
  b=PNObFts05N4feJcwojKd3os6MG7C3JyG+USbCk6c/JDQ4GjVrD+y+nK9
   eITWmhXm/7z2wzscR3hTTvVSI0COePSsnMPano1NgnFmJBxF2wRj6HOWL
   sOaaDXNAhD8N0OJL76FbgyQOIQOwS48ZAytLmT3+TUu6GovElzHso/nCQ
   v87H8/GDrb9GpHThqgL/f6hTP01kERzMi98E3GkEkt/IAdQ388g8qJvCq
   4qyj4amOGRxaSSzA7aSykx+kHVbFGE7uJM56cXprbtY27UvZWOxJrBZhr
   NHJ+GUNe2R7oMOKHowjsT1het2jSn/KfpSfRdzyyzMXoPCKcQahWXPIYk
   g==;
X-CSE-ConnectionGUID: g1aGQPRdRPOPBT55TI/fmA==
X-CSE-MsgGUID: FnSRk1uSQYusc6XwRsuAjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69707531"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69707531"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:42 -0800
X-CSE-ConnectionGUID: ghVyNwl6QPedQcgtNZ28EQ==
X-CSE-MsgGUID: exY1hzMfT+qukwGywI8KOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="222692728"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Luke D. Jones" <luke@ljones.dev>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, 
 Denis Benato <benato.denis96@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aSBqRHs256Tz7EKr@stanley.mountain>
References: <aSBqRHs256Tz7EKr@stanley.mountain>
Subject: Re: [PATCH next] platform/x86: asus-armoury: Fix error code in
 mini_led_mode_current_value_store()
Message-Id: <176374443397.14895.13710946903719696711.b4-ty@linux.intel.com>
Date: Fri, 21 Nov 2025 19:00:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 21 Nov 2025 16:33:56 +0300, Dan Carpenter wrote:

> There are two return statements in a row here.  The first one is wrong
> so delete that one.  This changes the return value to -ENODEV.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: Fix error code in mini_led_mode_current_value_store()
      commit: 0a69fe8f097f7410dc232259129d334518d4e8dc

--
 i.

