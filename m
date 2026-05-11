Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE42D97BB;
	Mon, 11 May 2026 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503562; cv=none; b=hfwHn8O8rKlMh5MQetMZkTDVTIwtbReXYGtRcoACS58qgKjexQ1Her8PKEnHDggmiuWYFThsbJOb8Uu04sV2lEfoSrauTP+SONMfxc55GhPkZf/dxUIqFe4V5RMtFsCNSf1HlI8oR/5HkTcfCGDZ3qQ7vvclbe+HTNpSrhEVrbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503562; c=relaxed/simple;
	bh=tGsdln61AmDeoUOCKsq2EkAOxdhOPnfoAc8OZGL1Zj8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H5yOaJyYl0mZKHxqDnjNCQEj+ZwyBsaP+8zuOp5Jqy92jnrcynMPc/UmOL+GsgHXCVM9frxSiaXbWoWayYU0X1M6Qqc68JCaRjPpgCK06EOp5gVod8ttVJYG53Kx5fabZM57Mz5zT4DGaLA3vCAKmi29PWnKlWxv8HsqjXhXW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAQYNXIo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAQYNXIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778503561; x=1810039561;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tGsdln61AmDeoUOCKsq2EkAOxdhOPnfoAc8OZGL1Zj8=;
  b=cAQYNXIodvXtQyqK8Uu6MY11fI8YLw5E9sO06X8ILfJCIB9dFoTPcw6A
   XNgJPtIRBtn4UJAoA2OJ8sIdKBkDlnzt5eHF2TYH1r1QGVpYtpyY7eh6Q
   6irQj3/BHW5R0asl7TJ32UgYg8eXwzLUuqKx4fYVEpOTTzhe0fheHBkrL
   2fRKxFdtQBQgIWToqGZeWhS23LDyxEagcunXoB1647kS5kD0huUdcokN2
   EuR/U0qyBCm5xtJr1+m+OYVBmqUQjcToJLc/4OZ4IkrCgcRXdfVakVSn3
   4dKrcL4PerV5IISeTaKH8w46gYCcxvinzsD6OU6kqY4yipPpljIY8OyE4
   A==;
X-CSE-ConnectionGUID: yiU+ySePRPqjEdzrrBls4A==
X-CSE-MsgGUID: xymS07ykTlmrDx2Ww4OZWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79372197"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79372197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:46:00 -0700
X-CSE-ConnectionGUID: JWJfbR9tREaugJQRE4l7mw==
X-CSE-MsgGUID: HRB1JVDfTX+b0Qu86B1rbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234383114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:45:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 15:45:54 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] Documentation/arch/x86/amd-debugging: Add example
 for reset register
In-Reply-To: <20260509013105.816339-5-daniel@gibson.sh>
Message-ID: <a9ae3731-f90a-b7f6-7fd9-c81ec6d9bf03@linux.intel.com>
References: <20260509013105.816339-1-daniel@gibson.sh> <20260509013105.816339-5-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 9 May 2026, Daniel Gibson wrote:

> To me it wasn't clear how I get the information stored in the reset
> register, or how to identify the messages in the syslog mentioned there.

Please rewrite the entire changelog text. Don't write it from your own 
perspective (no "I" / "We") but describe it as a problem/defiancy in the 
documentation.

> Mario Limonciello sent me an example line which illustrates what to
> look for and I added it to the AMD debugging documentation, with a short
> explanation.

Change e.g. to:

Add an example how the reset reason is presented into AMD debugging 
documentation.

As Mario mentioned, persons suggesting something can be put to 
Suggested-by tag.

> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>  Documentation/arch/x86/amd-debugging.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
> index d92bf59d62c7..3176a1240fee 100644
> --- a/Documentation/arch/x86/amd-debugging.rst
> +++ b/Documentation/arch/x86/amd-debugging.rst
> @@ -366,3 +366,8 @@ There are 6 classes of reasons for the reboot:
>  This information is read by the kernel at bootup and printed into
>  the syslog. When a random reboot occurs this message can be helpful
>  to determine the next component to debug.
> +
> +For example, if bit 19 was set, you will get a message like this in the log on
> +next bootup::
> +
> +  x86/amd: Previous system reset reason [0x00080000]: software wrote 0x6 to reset control register 0xCF9

The diff itself looks fine.

-- 
 i.

