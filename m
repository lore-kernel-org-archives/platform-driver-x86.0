Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8127F754
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773044305; cv=none; b=sxgJda11/9o9Ls5xlynCCFcL93MNa7eB8QLcmKqm92hwWBTUKipoU3ZaDR4n5tKQZHm/I/5zqTFFnEFvLfAkv3d/EUtRcgbiqwfZccIwN9t9/QMIkUlk3KveFb5rFcF1IpVaQ4MwNkBuva2t32pJlYepujRYBOZ9i9XXrV1Ufq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773044305; c=relaxed/simple;
	bh=QsVnZ/dKQ9V2+spbYMFmIy5EC+6S4HXM3VbyGLv7etA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jVL8cWZEslcrshfuuGb3I+C6+vXEwAyh0A2P7agGUon7YIK4jVUch61WZuxKkPIjdWidrcfqPbkczCboPXvd0rlyBYSvWEzqwOuJsBmCJI5awsp4HQwrFKFARKZre2PqkxIADMQgJ+NP6y6HJms9teJYO6qc4DTrxmtbF694m+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djpWEhD9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djpWEhD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773044305; x=1804580305;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QsVnZ/dKQ9V2+spbYMFmIy5EC+6S4HXM3VbyGLv7etA=;
  b=djpWEhD97I4Iyi9wB/qDAioBINiDPfV/bH0XVClFE3XHrhtpIivr7T3U
   FY0NjeFWor8L6g/rBSEvHkBdIV3yqSdOKGPGSOz3POtdxJr5ncumTzPf8
   sj+WnGJIIEJXnsT0aM2VGKWcJF2vH9nHdplA8dW2Ydrch7mkXeSjF7+zH
   o561WJvHgFOY+vCg37YaxzpSRLex32yCoEkhSzHh/YrLY/AS4Y/VqgxHo
   0EyZeNrnFQDj2hEmXUXDrjBs5IdmwBFgznsgMKjfXowWSlzf1pqdTiZBM
   skOFdSdPd3mNikLmrlzp3md+7Vty3hGDpPWfjEYzjxRKzSTNV7ubu1EzL
   g==;
X-CSE-ConnectionGUID: vsF8qfBmS02XZJLVyff5jg==
X-CSE-MsgGUID: twjW/no8QB+iYJDU1hxSGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74254733"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74254733"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:18:23 -0700
X-CSE-ConnectionGUID: KWOnVxqGRQ6I6dfj4DRm6Q==
X-CSE-MsgGUID: +h32XN0qRcmxenxZhzcQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218822862"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.153])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:18:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Mar 2026 10:18:16 +0200 (EET)
To: Alok Tiwari <alok.a.tiwari@oracle.com>
cc: lkundrak@v3.sk, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] platform/olpc: olpc-xo175-ec: Fix overflow error message
 to print inlen
In-Reply-To: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
Message-ID: <3a9bcb9f-b38d-1d9d-c1e5-211538aee5e8@linux.intel.com>
References: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 Mar 2026, Alok Tiwari wrote:

> The command length check validates inlen (> 5), but the error message
> incorrectly printed resp_len. Print inlen so the log reflects the
> actual command length.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/platform/olpc/olpc-xo175-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
> index fa7b3bda688a..bee271a4fda1 100644
> --- a/drivers/platform/olpc/olpc-xo175-ec.c
> +++ b/drivers/platform/olpc/olpc-xo175-ec.c
> @@ -482,7 +482,7 @@ static int olpc_xo175_ec_cmd(u8 cmd, u8 *inbuf, size_t inlen, u8 *resp,
>  	dev_dbg(dev, "CMD %x, %zd bytes expected\n", cmd, resp_len);
>  
>  	if (inlen > 5) {
> -		dev_err(dev, "command len %zd too big!\n", resp_len);
> +		dev_err(dev, "command len %zd too big!\n", inlen);
>  		return -EOVERFLOW;

Wouldn't a Fixes tag be in order for this?

-- 
 i.

