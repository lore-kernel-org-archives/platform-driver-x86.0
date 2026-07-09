Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA152E5B1B;
	Thu,  9 Jul 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604402; cv=none; b=HpwDDd3MD1cCmWo146TZk2vVvLLMUBidYT2LWMYm31W/Er/qeF4+97z0i+toyVNd8Rn8BzEiiNQJ0YxU8TLRg79BljzJLLWre3Vrb1gNud8P4SSG8aV+i0FFnakaEeYeZYlykaW8J6VpdqLzH8XR+rTKcbfacUVHvytEU4ausbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604402; c=relaxed/simple;
	bh=2E+jKRgPDwmBBuW1KuIrv5OhaSGCL3CWoFBh/7L97gk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZTfoxKc9MQ8H/JI15Re3MJ+FMeWpTZWzWxlIYpKz3nM5SewZ3dFCbVyE+jHsvYNODzPYgrIAAtYoH9VgdM1SCsE8OU1GzfM6TF+tXt24GLdE64EB1Dr7PoGtxWmODak76RNgmeOn95a3aIp/COBPidL6rRD7sq+DkJ/sEh7PuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gk6ixeNh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gk6ixeNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604399; x=1815140399;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2E+jKRgPDwmBBuW1KuIrv5OhaSGCL3CWoFBh/7L97gk=;
  b=Gk6ixeNha08yVKNVb2rHANKMvDMFjTU/PdJKpIGmku5byX74fmLqMM1A
   6GAYkswQ7S0NRLqns3XxjcVz4ggWHzFv5z/2xqUU+DjqGdnJCuDNIFhgt
   Wpg2Y9DkLDrSv0YcXwjyKZAYdsbHFldwdVKaxNhB/Nn+TNdSUw/H9quxl
   McomwmOezleB0UT5rqusRsujvRzawlL3Neqd+EBqrBJXuFkoM+lwLuM34
   TsH86A/ML99uiwebeSkbiQ1Yr93LUyw+GjfbiymbK48cyTeOCIhWVxlNF
   kLEFVJdyj6VjkjfG2LqXewF0nH7QyT55KvUDQLf6Qam3QoaqIBLt5jOAw
   Q==;
X-CSE-ConnectionGUID: tAgtoyTKRUeslH/2OiBMrw==
X-CSE-MsgGUID: x3v460C0R/icLROR1M3BNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84337386"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84337386"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:58 -0700
X-CSE-ConnectionGUID: D9/qXPQOSrydvQWg8PLUEg==
X-CSE-MsgGUID: MLQ6lb9fSO2hxkCWOyeU7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252846675"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?utf-8?q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>
Cc: hansg@kernel.org, krishna.chomal108@gmail.com, radheykalra901@gmail.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260707203740.55369-1-hello@kursatabayli.dev>
References: <20260707203740.55369-1-hello@kursatabayli.dev>
Subject: Re: [PATCH v4] platform/x86: hp-wmi: Add dual-channel PWM fan
 control
Message-Id: <178360439074.12613.11997130499136224748.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:39:50 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Tue, 07 Jul 2026 23:37:40 +0300, Kürşat Abaylı wrote:

> Currently, manual fan control on supported HP models uses a single
> PWM value for both CPU and GPU fans, linking their speeds via a hardcoded
> gpu_delta offset. This prevents userspace tools from managing the thermal
> profiles of the CPU and GPU independently.
> 
> Refactor the hwmon implementation to support independent dual-channel
> PWM control:
> - Split the single 'pwm' state into 'cpu_pwm' and 'gpu_pwm'.
> - Expose a second PWM channel ('pwm2') to userspace via hwmon_channel_info.
> - Remove the gpu_delta mechanism entirely.
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
[1/1] platform/x86: hp-wmi: Add dual-channel PWM fan control
      commit: d61548da368a5622e793669fb1cb85972f67469d

--
 i.

