Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1243630AD;
	Mon, 11 May 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503790; cv=none; b=YbpvRz90Ox+ZlUCMi2e+wVkFfSeb1WkPXwXkCgv7THNB9yabrMZgwSllGUCAXUHpJa6OQpqWdd3C9z6MqqipnTGcKPfdgPNOQZD+drDvOyLo/LYaYBmn7LWfmVidCzP3woOyHGoK8fCizO9kU2hRGHJ2Zeru9shVWP6X6Ni9YVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503790; c=relaxed/simple;
	bh=WtOnLYa2/KA2UckRw1yAlWFHXctmP7UGzBoXgIqa1Tk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tc1nX17KWz7qSDrYnQIEbkr61W5qowiFvFZw1R3BBPj9jxZACreJOtn3TZQcPlxLmTdhGPhZShu/53wsBxgQw7Z+daKKT6cr+VFJhIZ3rK4Yes2TkdhtGHFUvJg4oCovqOEAWpbKV6XGY/BQvWR38M1gM3NyCwore/nZGjcTun0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAQ7JAx1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAQ7JAx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778503789; x=1810039789;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WtOnLYa2/KA2UckRw1yAlWFHXctmP7UGzBoXgIqa1Tk=;
  b=fAQ7JAx1YNTmbvev2dTZwyZ7N93z64O1tP9ydCnekcRElg0d0PA2be5y
   VNabsXePJa1e7P/yW+O4LzDP7sMXuUDHQV7GPVbh536OBE8X2KSN2kTh2
   3V5xgIPAj+D4Vw6UpIpzstYMA6Bq0kDnaWA9z7RMZWUiGcNdVto1pYDlx
   stFtQoXf+hF8Sl9TwbkaYlyNDbJF8nVujLB/Qylfg/vhW520SrNAm8EVJ
   3y2OzK8I6LozpMgCdyN6Wgi7nekHjzn5MQhuono7KfcSoddjv/eA+Mc2H
   h82B/1Z5U2zewYrz1AdbBNrWLL834pX8PANe2pUWfvasM3/1CO8FDh93A
   g==;
X-CSE-ConnectionGUID: B7rf02kSQ7KcYf+V2r3Tgg==
X-CSE-MsgGUID: xZ9ziNjqSqSQoa/kijRbcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81952527"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="81952527"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:49:49 -0700
X-CSE-ConnectionGUID: RFvlfOkgTfCi4fM+hEj3tQ==
X-CSE-MsgGUID: PZdwM6EYRnKnXhpyfBqudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="241801204"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:49:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 15:49:43 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
In-Reply-To: <20260509013105.816339-6-daniel@gibson.sh>
Message-ID: <14ccefdc-eab5-b5a9-b8f1-1128bbf7f217@linux.intel.com>
References: <20260509013105.816339-1-daniel@gibson.sh> <20260509013105.816339-6-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 9 May 2026, Daniel Gibson wrote:

> must be updated with the actual commit IDs when they are merged

Please write a proper changelog text.

Unfortunately, I cannot know the commit ID in advance as it depends on the 
commit content itself (git object hashing works that way).

> 
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>  Documentation/arch/x86/amd-debugging.rst | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
> index 3176a1240fee..3af7799cca1a 100644
> --- a/Documentation/arch/x86/amd-debugging.rst
> +++ b/Documentation/arch/x86/amd-debugging.rst
> @@ -249,6 +249,31 @@ state entry.
>  
>  `commit 40b8c14936bd2 ("drm/amd/display: Disable unneeded hpd interrupts during dm_init") <https://git.kernel.org/torvalds/c/40b8c14936bd2>`_
>  
> +Keyboard and Lid Switch stop working after resume
> +-------------------------------------------------
> +On various variants of the Lenovo IdeaPad Slim 3 with Barcelo and Rembrandt CPUs
> +the lid switch and keyboard, or at least the Fn/Multimedia keys, stopped working
> +after resume, until the next reboot.
> +
> +This was caused by buggy firmware having timing problems, the EC needed some idle
> +time right before the CPU cores are suspended, or it got into an inconsistent state.
> +
> +For laptops that are known to be affected this workaround is enabled
> +automatically, to test this workaround on other machines you can set the
> +``delay_suspend`` parameter of the ``amd_pmc`` module.
> +
> +If you need to set the ``delay_suspend`` parameter to fix your machine, please
> +report this at platform-driver-x86@vger.kernel.org for it to be added to the
> +list of devices that need this workaround, so in future kernel versions it's
> +enabled automatically.
> +
> +Note that the current workaround isn't perfect: The problems can still happen
> +if resume is triggered by a timer (wakealarm).
> +
> +`commit TODO ("platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops") <https://git.kernel.org/torvalds/c/TODO>`_
> +
> +`commit TODO ("platform/x86/amd/pmc: Add delay_suspend module parameter") <https://git.kernel.org/torvalds/c/TODO>`_
> +
>  Runtime power consumption issues
>  ================================
>  
> 

-- 
 i.

