Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0972EA731;
	Fri, 24 Apr 2026 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031370; cv=none; b=bHIIm2w57nUsKBbhoof57lulWy0b4AD/x1U+869tKFgnVgvb0PucbtO2BRFMA5wJU06Qsd7kJMZklmfaynbdprZXAMXi89qi4VVnL/JXVcH/2oUMJscAGNstFMgiBZaCHYCglm1jlgWkr7ihhsvduTAqBOL+U/XitNlYhHEqlkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031370; c=relaxed/simple;
	bh=IqB4hijZyn5YESQYeqDFECLeSjhPyB+zqTlEGGJUUyg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H5tK4jHoKzVMJKqPunGa8K/EQKwbyU6vhrCJGqphc3DzHGMIqtKxw3koVhez5z84UEfx/nuxMdBIjqjDzaFzYDlH3nFOk4TTXsrkRtU+I+XDsW3JUEyY9Dx7jt1Gzt4Dr7m8J/y1jo2mWUoe1jvQCHnhlfIxYSYiIDTiOFia61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOk8OTwv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOk8OTwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777031369; x=1808567369;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IqB4hijZyn5YESQYeqDFECLeSjhPyB+zqTlEGGJUUyg=;
  b=iOk8OTwvZzr0eypdRPhSz4O04+kJ8ZbDhgWYKooR/wcX+OUFCY/Db/NP
   KtZ/ghiLGGdQJWgsrltquWbVC4YiF+yW//qkzOEsxl5YNL6+U1KfajooG
   WRorhfYTNaFeGfiGg0ThcmZ2769Yxjn7daCxXUkkhenNpr74p+YQ6fP9+
   qOW7RflkODBCo7GxPjpu/f2Wjgr71HdpOm1Z+Z4Sit0sM9Q58rOBrR+K6
   8JBRJ8Exji1B6g/RyjKoEdrCtWt39C7lgfXI+kL15ld/0kL08LKHBcuz7
   UNirWbIe6vgEv86vNuuXxrbexxvXFKoGOImYeTjzFKwhTU8k0sL+7k56p
   A==;
X-CSE-ConnectionGUID: xKRDipwBTGCwFFaFB0UH7g==
X-CSE-MsgGUID: yX9cja2NTfKGJZqKaTSsmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78027536"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="78027536"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:49:29 -0700
X-CSE-ConnectionGUID: 74+o3/fqRJah+rcEFjzV1w==
X-CSE-MsgGUID: 42/9XUgARJ+eE457Jpkkrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232789278"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.120])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:49:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Apr 2026 14:49:23 +0300 (EEST)
To: unknownbbqrx <dev@unknownbbqr.xyz>
cc: srinivas.pandruvada@linux.intel.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] tools/power/x86/intel-speed-select: Harden daemon
 pidfile open
In-Reply-To: <360cfdd8-c97c-4772-bc1e-85a6ee42a2a2@smtp-relay.sendinblue.com>
Message-ID: <252a30ef-197f-1097-1754-5f8058dcd62e@linux.intel.com>
References: <360cfdd8-c97c-4772-bc1e-85a6ee42a2a2@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Apr 2026, unknownbbqrx wrote:

> 
> From: ali <dev@unknownbbqr.xyz>
> 
> Avoid symlink-based pidfile clobbering by opening the pidfile with
> O_NOFOLLOW and validating it with fstat() before locking/writing.
> 
> The daemon currently uses a fixed pidfile path under /tmp. A local
> unprivileged user can pre-create a symlink at that path and cause a
> root-run daemon instance to write into an attacker-chosen file.
> 

Shouldn't this change have a Fixes tag?

> Signed-off-by: ali <dev@unknownbbqr.xyz>

Please use your full name for signing off changes (see 
Documentation/process/submitting-patches.rst).

> ---
>  tools/power/x86/intel-speed-select/isst-daemon.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-daemon.c b/tools/power/x86/intel-speed-select/isst-daemon.c
> index 66df21b2b..4346b049d 100644
> --- a/tools/power/x86/intel-speed-select/isst-daemon.c
> +++ b/tools/power/x86/intel-speed-select/isst-daemon.c
> @@ -200,11 +200,21 @@ static void daemonize(char *rundir, char *pidfile)
>  	if (ret == -1)
>  		exit(EXIT_FAILURE);
>  
> -	pid_file_handle = open(pidfile, O_RDWR | O_CREAT, 0600);
> +	pid_file_handle = open(pidfile, O_RDWR | O_CREAT | O_NOFOLLOW, 0600);
>  	if (pid_file_handle == -1) {
>  		/* Couldn't open lock file */
>  		exit(1);
>  	}
> +
> +	{
> +		struct stat st;
> +
> +		if (fstat(pid_file_handle, &st) == -1)
> +			exit(1);
> +
> +		if (!S_ISREG(st.st_mode))
> +			exit(1);
> +	}
>  	/* Try to lock file */
>  #ifdef LOCKF_SUPPORT
>  	if (lockf(pid_file_handle, F_TLOCK, 0) == -1) {
> 
> base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
> 

-- 
 i.

