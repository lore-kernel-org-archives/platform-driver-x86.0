Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E83372EE3;
	Tue, 24 Mar 2026 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367214; cv=none; b=ROulAAIcjE3Cj+6SCblT4r4abgP0sEiVnfcdo9b1wZRe+td7hzeEKksISCMMZ9anlocPeycxVzLKXoK+1dB+cx45qYnEIN7+qnGpIkjqkBVLFmAbXEYpeSkgvPpxejr74T9Tz6mQIM+l1sjbRV9KakYEDJlhcn76uonHJlXSiO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367214; c=relaxed/simple;
	bh=TF6XkrgUi0aBVbHak3+HIwDP4bR9YWvGJkyFIB0aofE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bXPuOEQtrh5paM6PuMijt3/fIbL+PWJTV1d9bsIWvs4gwEyx+sLMKwBjz9WCTh7yfFpQpG6EUiaDW831lAvWyl8OQeFR/qOhAxkqhxUYZ7mWXReT5rfu5xukJThQkfQBdBVTf2CpI1/8v2mITtCnsDK/Oj8WS1L/vFyw5BcDQSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSXYYS12; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSXYYS12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774367212; x=1805903212;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TF6XkrgUi0aBVbHak3+HIwDP4bR9YWvGJkyFIB0aofE=;
  b=GSXYYS12POKc/ipbCeveEwc4br6IF3E0QH+LnntgduIZMmKvhEZ58mz5
   xDkZwm+IsKsW0zRBK6M0Tqown3j9EoMv8w34eSPq+Q/cleChmjHQvNkyq
   5uW04IYwOuhcgi4QIv4Aoc4wcLE3OAF/4FX+mVptlbzwfFNe1PPzu5GMF
   +Lb1EHH5ItGr+6AocK4dm3wCD4enDKB6LbAbRlLRJVkw7X2WFZdezVGpU
   QOoP+owRB92AcG/9Ml2evzeojodQNldFUh6P3Mmia/0fWzJcPCbOWYkn4
   KLEbfTVdxn33uC1Kcy1hFfrRgfJfS6J9BAcnv/kOMRHPuhX3c8qgMfYUQ
   w==;
X-CSE-ConnectionGUID: inUvANbeQrON8SnzmjsOPg==
X-CSE-MsgGUID: 7P2g+f31QJuaGhnTk5xS6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86762498"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86762498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 08:46:51 -0700
X-CSE-ConnectionGUID: Vjmq4oQfQSOgwBhYRJG+kQ==
X-CSE-MsgGUID: 3nJQ0pJETY2FsHxYVsSsFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247985157"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 08:46:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Mar 2026 17:46:46 +0200 (EET)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com
Subject: Re: [PATCH v2 0/5] platform/x86: hp-wmi: Victus S fan control
 fixes
In-Reply-To: <20260322190624.35162-1-emreleno@gmail.com>
Message-ID: <f3153599-36df-e4b1-4457-201050a8e7f4@linux.intel.com>
References: <20260322190624.35162-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Mar 2026, Emre Cecanpunar wrote:

> This series fixes several bugs in the Victus S fan control code.
> 
> Changes in v2:
> - Patch 4: Drop the if (gpu_delta < 0) guard and pr_warn. A negative
>   delta is valid firmware behavior on boards where CPU_RPM > GPU_RPM.
>   Store gpu_delta as 'int' in struct hp_wmi_hwmon_priv so that the
>   existing signed arithmetic and clamp_val() in hp_wmi_fan_speed_set()
>   handle the negative case correctly without saturating at U8_MAX.
> 
> Emre Cecanpunar (5):
>   platform/x86: hp-wmi: fix ignored return values in fan settings
>   platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
>   platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
>   platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
>   platform/x86: hp-wmi: add locking for concurrent hwmon access

You should all so add Fixes tags to these changes, they're currently 
missing from all of them.

-- 
 i.

