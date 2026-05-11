Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8833D3CE6
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521988; cv=none; b=GkmOs3Igyoz29nEiqORa10vnFB6NH+GkKuH3NtaNH23SaVgfYRcMeXhVtS11iIygC0s2rZ/WGz7U9NZAbyuhK+QwZo4fu/p+rLBScHLo50lLk3aLAQrT9SRVpwZ5j/jV/sD/zQJA2eHpE/6YsijPZSohRSVxegPu7DMis5OM34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521988; c=relaxed/simple;
	bh=ud7OcxEBW+d1sum6FxDMfs3m/kqvke/3LmnwQWINT9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=utAqDhnoX9IC1isuE4R6oa7HMEeqRtU832qf9cecduc6yJgc/gx1fiDQQVh3Bqs2LdwpkWORXllFvl9DlvXZ4/H4S3otplBEEUHLp/0gribPA1aIljJlIejWqww6dpeeoteFZumtz9NNfcgYgSsI8hlwPULCE3pS8D6D3N+MApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmPtftou; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmPtftou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778521986; x=1810057986;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ud7OcxEBW+d1sum6FxDMfs3m/kqvke/3LmnwQWINT9k=;
  b=OmPtftouu4x7loGgng7GYHUer9TNjGhsGREoFTK/rleB/WC/l6Uks5fK
   wnNkSgo179xLhRdMlM6WaQMqNSzKVm2E5XGdvmCqTN1oM5d2KJbTNACvR
   HRV032WEfQYtHiAk8t58B8jhwMF3QXKwzADgNst9I0/rZPnNoJP5UHERi
   ujJkjnB5MTZO2XaQ1w/p6hmPL+htuAO+FvFOAm7Nl4kccg+KbmH7vDV+e
   BLmxgb6s92PRnvJMqaKRtCvxdBWEPKl/mpjFkzzg6tyXkhwiD5rpRjpCF
   OwPeoHhXUhWXIK8ShH+twprcD7HXI5H8+euAaKidNY6bUg8YBgjdaUuGQ
   g==;
X-CSE-ConnectionGUID: TQMGkKNBTK2tnGtZLhSUyA==
X-CSE-MsgGUID: mSjcX0UeTQugtEL9EuYeYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83033357"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83033357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:53:06 -0700
X-CSE-ConnectionGUID: BbHaSPEjRTKgXa/vA2vTjA==
X-CSE-MsgGUID: 3Fjfg/WQQk6yKSG+TXBl2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="234857681"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:53:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Brodie Abrew <brodie_abrew@selinc.com>
Cc: platform-driver-x86@vger.kernel.org, robert.joslyn@redrectangle.org
In-Reply-To: <20260507004916.6710-1-brodie_abrew@selinc.com>
References: <65829704-a7b8-208a-255c-6d4586b75772@linux.intel.com>
 <20260507004916.6710-1-brodie_abrew@selinc.com>
Subject: Re: [PATCH v3] platform/x86: sel3350-platform: Retain LED state on
 load and unload
Message-Id: <177852197872.27853.5456285209372224389.b4-ty@linux.intel.com>
Date: Mon, 11 May 2026 20:52:58 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 06 May 2026 17:49:16 -0700, Brodie Abrew wrote:

> When the platform driver is loaded or unloaded, it overwrites the
> existing LED states. This can cause a loss of early boot state when the
> driver loads, and it can cause the ALARM contact to change state or
> flicker.
> 
> Explicitly retain the existing LED state to prevent overwriting on
> driver load and unload.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: sel3350-platform: Retain LED state on load and unload
      commit: 18bc6ce6bb618e1dff4473d7dd528d22519abbd7

--
 i.

