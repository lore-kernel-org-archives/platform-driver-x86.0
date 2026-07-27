Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493DB3E316B;
	Mon, 27 Jul 2026 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143568; cv=none; b=qr94BSsJJUiY9A0SU2NAIgc1kPDpUXyozIK8j7nEGWUTPsycjT0MCFgwk1C9nsSZcsQ+E+rv//h90Trpvag1Aj/TN5sUcqkpBPEGsPqddjL2mjoK1NYmay50kk9cnQDSb1JMuAyP29hy4blIylTc8egNNItWSCwTnVHH9r3ExDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143568; c=relaxed/simple;
	bh=brqvS7y+XwxoRc+aT8m4SnfIo+9k+UN0QvDScHtWKJk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UXzTMNzAGVIoCY64PL0YRRsG+YNAS31j1uKBkydE4J7rcZvD/zKfWYNU5jiW8pfBbKu7p4dTIjdKrBBRDQXBjcX+/H/+1T+SbQUWMu6zGN74eMAec1JstU5WGzBwrSlSiD0SrBdVTXlPmT/0KpCRtsX9qGKdrtZpWobphF+XJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eO7K+bbx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eO7K+bbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785143567; x=1816679567;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=brqvS7y+XwxoRc+aT8m4SnfIo+9k+UN0QvDScHtWKJk=;
  b=eO7K+bbxz7stk872R7tHJOwMCt4Yu2OO3j0ljUhjCkRji7BWOD6TyCfX
   tQKAM3FdLv1jedltUpmgmopirRnAEI9c1wrl2N96NSjsCu3tIZ4pbpHP1
   7Ig5e7Lf9kUTHSiMhUtaF4e46+Wa3fvBquiZ9mOSKTKQpGDN5B7+j7twY
   cRxyg06jxA19jdVd9A2uA/PM0g22iKZPyw3ec/V4qmWozGDQIN3OCPVp7
   dEwZ0M3GYVcgqdFtBLjXDPIj9x5UNpSC74hofUeWFrkQcOW+gtMihXAnL
   xsf49lXMLdYj3UByqvr4WJfCDhOdANZnewaRpndhGHPX/Nw8g+xdTHtsi
   w==;
X-CSE-ConnectionGUID: b/Ir4sh/TZuFe2baZc8r1Q==
X-CSE-MsgGUID: 5DqeJLk1RqyLRYZ6DO3ZKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="111252351"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="111252351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 02:12:46 -0700
X-CSE-ConnectionGUID: /CbIfsv1QK+EWo9784xwEw==
X-CSE-MsgGUID: avrgKZ7wR3ClEor5MsFayw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="263659483"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.226])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 02:12:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 Jul 2026 12:12:40 +0300 (EEST)
To: "shaikh.kamal" <shaikhkamal2012@gmail.com>
cc: "David E . Box" <david.e.box@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/ABI: intel_pmt: fix 'threashold'
 spelling
In-Reply-To: <20260726063734.19944-1-shaikhkamal2012@gmail.com>
Message-ID: <3391ce45-1f3b-a6b9-92c8-2b94a801c6d9@linux.intel.com>
References: <20260726063734.19944-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 26 Jul 2026, shaikh.kamal wrote:

> Fix spelling error reported by codespell: threashold -> threshold.
> No functional change.
> 
> Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>

Does your name contain . ??

For more information about signing off you change, please see 
Documentation/process/submitting-patches.rst

> ---
>  Documentation/ABI/testing/sysfs-class-intel_pmt-features | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt-features b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
> index cddb30e5bdf6..476ba070fb1e 100644
> --- a/Documentation/ABI/testing/sysfs-class-intel_pmt-features
> +++ b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
> @@ -121,7 +121,7 @@ Example 'caps' content for the 'tracing' feature:
>  	watcher                                  Available: Yes
>  	crashlog                                 Available: No
>  	streaming                                Available: No
> -	threashold                               Available: No
> +	threshold                               Available: No

I think that anyone can see what's wrong with that alignment. Perhaps you 
didn't even look but sent the patch blindly!?! :-/

Please read through your own changes to avoid a reviewer having to point 
out trivial things like this to you. It wastes everyone's time (including 
yours) to send obviously half-baked patches to review. :-(

-- 
 i.

