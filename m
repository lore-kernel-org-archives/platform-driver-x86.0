Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5A12E1CE
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Feb 2024 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707214740; cv=none; b=k1KxyAPAoJotGpfTYai3e7ngBrw9nKl5AYqaIMwIKjEqH8qG2E4khkWiLhwlOtuD6VVuwS+KKlFtFlPUBn/8/6q3pVNgPxsP/yuw4PAzTWkeLUix5lrLeiAFr8rNi2I8PqjGmctjA23bPNTFczSbkntIbpr72cgHM0Ltw7EGDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707214740; c=relaxed/simple;
	bh=qoap5MzV9WMz12YWMg91fBHitnpLGtUs3UwXbqOrTcI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M+fXGM6jPo3JrNV4c1w0tF3+b2C7R4pgqJCOHLdDuPVX+0RIKXGZLf9A87t2VGRqMJqfTRbrBzNHegOU8pjPnhwPjL1yQebYm0Hm2lao/wi8aPaVlj3sfadRdSx6wLUvH8doZIzCC1FCha10jBb1KNQq0p53j86Z9ExjbAOJOJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9GM9wBA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9GM9wBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707214738; x=1738750738;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qoap5MzV9WMz12YWMg91fBHitnpLGtUs3UwXbqOrTcI=;
  b=R9GM9wBAnoLi7BPucwkR1srAyG7tlZWK2So6aBwQiDyB2zOTUZniA/It
   9ZXKOj1ZVj9fewwJNjTcmts0seyAr0J1eIHcd5If2+VhrQ2Uq0hMh56aw
   eT80OBjcQy10QcgQHtLqkYuLBbfxjwxUFCxNLJDtN9cjohT86XmWsnt4w
   DUOsSyFlzRDK8tKrnW0I6ShSfkPPooN7H3rhyA/ahVQEcgPDW9ncuAAup
   25qVt1Bki+7Eh7MC+xlsitC29IAvJjrhWH/ZJHjYACd89lhBsZ3HE5ShM
   G9FZPYuFEDQU6xQfUvGU9Y4/tRUIPaP0u6N81bcXSI+6ytxaL5qcEzCxZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26159507"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="26159507"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 02:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="968859"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.36.139])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 02:18:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Feb 2024 12:18:52 +0200 (EET)
To: Alexis Belmonte <alexbelm48@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    putr4.s@gmail.com
Subject: Re: [PATCH v2 2/2] platform/x86: hp-wmi: Add thermal profile support
 for 8BAD boards
In-Reply-To: <ZbucvX2rRdqRgtcu@alexis-pc>
Message-ID: <a01f31a5-8634-6817-e2a6-194c937ec572@linux.intel.com>
References: <ZbucvX2rRdqRgtcu@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Feb 2024, Alexis Belmonte wrote:

> Add 8BAD to the list of boards which have thermal profile selection
> available. This allows the CPU to draw more power than the default TDP
> barrier defined by the 'balanced' thermal profile (around 50W), hence
> allowing it to perform better without being throttled by the embedded
> controller (around 130W).
> 
> We first need to set the HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET to zero.
> This prevents the timer countdown from reaching zero, making the embedded
> controller "force-switch" the system's thermal profile back to 'balanced'
> automatically.
> 
> We also need to put a number of specific flags in
> HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET when we're switching to another
> thermal profile:
> 
>    - for 'performance', we need to set both HP_OMEN_EC_FLAGS_TURBO and
>      HP_OMEN_EC_FLAGS_NOTIMER;
> 
>    - for 'balanced' and 'powersave', we clear out the register to notify
>      the system that we want to lower the TDP barrier as soon as possible.
> 
> The third flag defined in the hp_thermal_profile_omen_flags enum,
> HP_OMEN_EC_FLAGS_JUSTSET, is present for completeness.
> 
> To prevent potential behaviour breakage with other Omen models, a
> separate omen_timed_thermal_profile_boards array has been added to list
> which boards expose this behaviour.
> 
> Performance benchmarking was done with the help of silver.urih.com and
> Google Chrome 120.0.6099.129, on Gnome 45.2, with the 'performance'
> thermal profile set:
> 
> |                  | Performance |     Stress |   TDP |
> |------------------|-------------|------------|-------|
> |    with my patch |      P84549 |    S0.1891 |  131W | 
> | without my patch |      P44084 |    S0.1359 |   47W |
> 
> The TDP measurements were done with the help of the s-tui utility,
> during the load.
> 
> There is still work to be done:
> 
>    - tune the CPU and GPU fans to better cool down and enhance
>      performance at the right time; right now, it seems that the fans are
>      not properly reacting to thermal/performance events, which in turn
>      either causes thermal throttling OR makes the fans spin way too long,
>      even though the temperatures have lowered down
> 
>    - expose the CPU and GPU fan curves to user-land so that they can be
>      controlled just like what the Omen Gaming Hub utility proposes to
>      its users;
> 
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>

Thanks a lot. I've now applied these to review-ilpo.

-- 
 i.

