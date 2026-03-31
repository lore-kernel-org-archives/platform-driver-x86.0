Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7A401A33;
	Tue, 31 Mar 2026 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969381; cv=none; b=oqoeZqOl/Nidq6/jnD4vHjXH/ZOjz6G8YngzlwBA13E6PukdmLUgL7ZYwO/mUnEQ7kOjHmPl3uSe1GHYjiiWcMcuUt80Wlp+JI8493U1M9MZ+RJNzxpfar0oj49wf13fmPmt2nZJ5rjeVVlGx8Jzc/vE+o58mTc/y7hMAQPqhtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969381; c=relaxed/simple;
	bh=WFEcqCZRXjxjuEyiZ0NDYgx7Ts1OcFUBxJMFQtkbxwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QXh94iAtfvP6kk9ZhclQk/pd7eHsEWrvmyBcCn3trk40zETxRlyVLNIjYoeGgMLiwrTQbW20JALmxX/3Tp44331CeBKVOSVw35eEJZgcJGE7/9YwfwNhdwPCGXsT1eOR9ZCDx0zFiFaZfMKg4i7ep6nfsMKPLuRmInIkU2G3X9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6Y1igPi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6Y1igPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774969380; x=1806505380;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WFEcqCZRXjxjuEyiZ0NDYgx7Ts1OcFUBxJMFQtkbxwc=;
  b=i6Y1igPind+t/KjlrrDZ6u09yOXZFSWuzCIOS7mmbnkG1iYGK91UAPuQ
   txOsZToOGr3eQlIrdjorOBHKQCV1+IA5QP6bnzp5i78/YBblYl3JuL7p+
   mHLcHbigQvxWdYIiBIr9jn185yilgwkqUvtRxfsuNaJq63Lex51oyYwE3
   abqsrjQEglrhaxYDxGqTx/OTD5mnkVplh2tTqJOqgB5oOExbvLbVKB2gY
   DF03vQ1TkVS9dbNMozLQJGEXakUpbGWwYNqjnsZZ33FCF4Vplb8gAZhLQ
   KFjSKS4if0NCF/k25pjao7THHmI84Ja+83FXPp/fmRCnRiaIbXDRKn7ME
   A==;
X-CSE-ConnectionGUID: RevcXtkRSZq0H6e0WHiJvw==
X-CSE-MsgGUID: F5wr4AUcRy+yAmGf+glOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86682271"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86682271"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:02:54 -0700
X-CSE-ConnectionGUID: Qk1xLwU5R/yK9DUbmgWQ1Q==
X-CSE-MsgGUID: 2SC+k7y3Q5WwMPv+gCRIcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="221527677"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:02:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: W_Armin@gmx.de, hansg@kernel.org, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324203413.454361-1-wse@tuxedocomputers.com>
References: <20260324203413.454361-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH v8 0/5] platform/x86: uniwill-laptop: More support for
 TUXEDO devices
Message-Id: <177496936525.10314.17265576184394353161.b4-ty@linux.intel.com>
Date: Tue, 31 Mar 2026 18:02:45 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 24 Mar 2026 21:32:07 +0100, Werner Sembach wrote:

> v2: Incorporate Armins feedback.
> v3: Incorporate more of Armins feedback.
>     Rework USB-C power prio functions
> v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
>     Replace for loops with if statements for USB-C power priority functions
>     Add missing mutex in usb_c_power_priority_restore
> v5: Restructure patch around new entry for XMG Fusion
>     Add missing Reviewed-by and Tested-by
>     Spelling fixes in documentation
> v6: Fix small format error in docs
>     Fix Reviewed-by line
> v7: Variable rename to lowercase
> v8: Move USB-C power priority init to after probe call
>     Clarify documentation
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/5] platform/x86: uniwill-laptop: Rework hwmon feature defines
      commit: f3660b13495ae47d0ab2755a7b32999fb718ee5c
[2/5] platform/x86: uniwill-laptop: Implement USB-C power priority setting
      commit: 03ae0a0d0973b9e584a05136aab08fee2ef8e455
[3/5] platform/x86: uniwill-laptop: Fix XMG Fusion 15 (L19) entries
      commit: ab97e28be21181a7f08300de1088f48e9f8274a9
[4/5] platform/x86: uniwill-laptop: Apply features across all TUXEDO devices
      commit: a5ee4c959b0efc347cdf6565ebcbc81131ff3677
[5/5] Documentation: laptops: Update documentation for uniwill laptops
      commit: 9ec6bf62cf98e30c7126a0f51ee7cdf2e8d458b6

--
 i.

