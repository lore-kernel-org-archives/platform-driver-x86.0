Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAAC3BE62F;
	Thu,  9 Apr 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742067; cv=none; b=a0FyaYBqS/GPTsNwgjwiLhGMgKIzuQl9X9GBWI3j/+Il7CC0xS2bOavJL6lVbnhPwKTvA07Cg3nHhozwI6EWa1vHMVEjzWb8wUstkU0tN3z0SnGLrJMGqBtSFEdtW5b/ukbSdvdJSzlGzBtH979tcTMEJKD9xxcIomzDR3ejMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742067; c=relaxed/simple;
	bh=dtAoRY71Dd7S0XaVBfTVRxacwv+Mj7+j40E6X6JtTL4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DuNqLLcVu2/Eo+Dz/ztXI5i6X52DUfTs3qaaUYvfwvm2zpjQjg4gYhMugUDJZy3RivW5Y0o9Y2fKLbasFb+vSULESWYoYVTnMxTlA9eFVK1NqDjQ0EYW+8bWXLtI4raODBtrJcApvxxOPlfEMf3LP7n+pzvckH8Spb4hcE2C8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsNLZIWx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsNLZIWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775742065; x=1807278065;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=dtAoRY71Dd7S0XaVBfTVRxacwv+Mj7+j40E6X6JtTL4=;
  b=LsNLZIWxSrp4dS4C6jx3E/Fy2VvwwgWkPxAAevPfKGJfKFHj/kZvVl7Q
   9a4kQSnrxE+kRTLIYglGMxlT6txQ3aZM0p7TfawisbE9SXJ2CZzxRTHY+
   CLpeEVAxE3I0uTyN5PoTQghnmmIyNNrD5Lyb1Sjgvzm2xwuLTqYJu5oWu
   IgnOvfbL0T2Ncf2cvUG/OAlog5GlyDWMQG4HDbT1OyR1g8St6V5+ZtvrR
   wwy0OaAmsKV6tyDWNROK9315rifHH1bM15Hu86Tt6dQboWgzR2GVfIxwG
   wS5qzBtGQ69dESdE+w8+M6ChqZOnij+kTMlN2pyzSJKK8uTizNQL1JVhn
   g==;
X-CSE-ConnectionGUID: Ke+4racNTKqRu5cd3F6gbQ==
X-CSE-MsgGUID: KqYVrkK7SuGli3IBp6ciQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76818830"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76818830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:04 -0700
X-CSE-ConnectionGUID: 07v4W3h8TRik1XLuG8S3vg==
X-CSE-MsgGUID: 1eMj04EOQY+OAVmXzqGwcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="226022412"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:40:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Emre Cecanpunar <emreleno@gmail.com>
Cc: hansg@kernel.org, linux-kernel@vger.kernel.org, 
 krishna.chomal108@gmail.com, edip@medip.dev
In-Reply-To: <20260407142515.20683-1-emreleno@gmail.com>
References: <20260407142515.20683-1-emreleno@gmail.com>
Subject: Re: [PATCH v4 0/5] platform/x86: hp-wmi: Victus S fan control
 fixes
Message-Id: <177574205493.8529.4447378805508346661.b4-ty@linux.intel.com>
Date: Thu, 09 Apr 2026 16:40:54 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 07 Apr 2026 17:25:09 +0300, Emre Cecanpunar wrote:

> Bug fixes for the Victus S manual fan control:
> - Propagate fan_count_userdefine_trigger() errors
> - Fix cancel_delayed_work_sync() deadlock from work handler
> - Use mod_delayed_work() for efficient keep-alive timer resets
> - Fix u8 underflow in gpu_delta calculation
> - Add mutex for concurrent hwmon state access
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/5] platform/x86: hp-wmi: fix ignored return values in fan settings
      commit: 7265b57fbc32782d02bdb8d865ba0d8efa209c8c
[2/5] platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
      commit: 249ddba9c0ba4453c0a6bc0e3626e7864751d940
[3/5] platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
      commit: 6297443beb0c5606399ec7d4f4b335e2e7379147
[4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
      commit: cb4daa450f05447c1f914eaef75b2577c25a0fcd
[5/5] platform/x86: hp-wmi: add locking for concurrent hwmon access
      commit: 5969c55e2145368254194edbe0e64880314be69f

--
 i.

