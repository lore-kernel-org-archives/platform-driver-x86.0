Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392552;
	b=nAnQbW3BpwSU9h7T5+lfu4+5Z/HYA81NJXX802ulgJFiIn/Il7/eskA6fu1rPTEsretH
	 1gUG9vjcP8DPeVvBPC94YUNtZ/JfBZIvMZCUVrGPO1gseo+saHL1etxXq4GZwOaO3Khrr
	 JkwFiMz2NuZKzicW6gaYBLvudTzeO8OMiFDiwVbBH1NRZne8WCCf7Y5BgRqGOPWRr+Eae
	 ZdfJKb1qmDoc4aKbk8SRe+xYuUVQpDVVQYJ5ZV2n0cAHACMoejn5SYCzfY2D3hOZ8f4ov
	 K65GVYIPxZbEc8yyEjmYFyteA4IRFXd6x3/cQgIQ8uZjeJQlgd5zES2+cWWqgSfHskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392552;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=b3TtZnST5Ul1rjK7pJDK/9YjNwER3b2x4cnE8lLrqSw=;
	b=C36hIhEMQXwsCm6U3NzxTYEeWN6d3wnjeQ60xr6g2oVpTMk2Umuz8YsEpBAV/LtgbBjk
	 /FuVa3i2S8Frcjagjsx5UzqZ2YX14GTjwZV6ssCQohErRQbMawLi/wPiyNaZ/YB3+jIUx
	 g147E1NjcJh3JdpEdo15nimzuXGCDPgWmZKMk/r5ULXBordQ8APvxeZI4ED4EI/3abddc
	 yTj2HSzROufVNtOW5GonWDOel/3BaeuqhduBx5b7XQ4uRqyhNKts9vNWA9m/gAmQjopr5
	 q7R23B2otAfk0CqqvH3Htwr4sHot6tKLgbNkhlP1aqnzXYz/SiHCjfSS/V87j1ztAwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tpoyjv8K;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C5606A31C;
	Wed, 11 Nov 2026 10:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tpoyjv8K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794392552; x=1825928552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9K51dKhWt6HwRQUQmD1OAZoaNY7C7BdD6bMu1cC7VU=;
  b=Tpoyjv8KZPyPlkAEZ4HjEfIu5M/ailHGJhay1cCsoaSw/AyEepVbm21u
   ilZqnQ1hG+u9qj/vNPyNfEjfoBu2Ammylk3lPAFWrl+CKO3xwtIOGjnWg
   XHFUnQKTMsLG1zMwqugWsUl4RjAJ+UhSPobeUJnLpWgXHpblDV+jU9Uho
   b4niuTgxe/XXN9daTsk97S4w+6lZjFpP4ZXya3A+242qBLjBaCHne5yRf
   knbASkzJkplfgPbMi/JzH7smwyBDh3H+vemQSf5qut9yuLKA0YcIpN7Ld
   nJnFrccqTrIocZsnW1/XjyK5BhfNvqap/Jwrmp92mHScw7tH8a40nTYe1
   g==;
X-CSE-ConnectionGUID: bB1RuWDmSD6WEA4+BZF4Eg==
X-CSE-MsgGUID: eN5rfN1+TTSnJ/33GUkedQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3182323"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3182323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 02:22:31 -0800
X-CSE-ConnectionGUID: 2sSP1rB7RqqrwA9kg2JCPQ==
X-CSE-MsgGUID: cR3vU+dIR76F/4ye3zQXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8956239"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2026 02:22:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 59A2599; Wed, 11 Nov 2026 11:22:27 +0100 (CET)
Date: Wed, 11 Nov 2026 11:22:27 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: chitranshmandhaniya@gmail.com
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH v4 2/2] platform/x86: dell-uart-backlight: recover from
 stray EC response byte
Message-ID: <avRB4-aNxPc8cRJk@black.igk.intel.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
 <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
 <20261017073704.606497-3-chitranshmandhaniya@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017073704.606497-3-chitranshmandhaniya@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Oct 17, 2026 at 01:07:04PM +0530, chitranshmandhaniya@gmail.com wrote:
> 
> On some Dell All-in-One machines the EC occasionally inserts a spurious
> byte after the command echo in UART backlight response frames. For
> example a get-brightness reply that should be "04 0c 0a e5" arrives as
> "04 0c 0d 0a e5". The length field still reflects the original frame
> size, so the parser treats the stray byte as payload and the real
> payload as the checksum, producing a spurious -EIO.

This is very good example of the "bad" data. The character I believe is not
spurious at all. This is an UART communication which may be raw or line-based.
If you think of the UART line discipline, then the inserted character makes
a lot of sense, id est \n is replaced by \r\n.

Can you confirm that the only problematic one is 0x0a when we get 0x0d before?
If so, I think the issue can be addressed in a better way.

> Add single-attempt recovery inside dell_uart_bl_receive_data(): on a
> checksum mismatch for a frame longer than the minimum size, drop the
> byte at the first payload offset, shift the remaining data down by one,
> and decrement resp_idx so serdev re-delivers the real checksum byte on
> the next callback. Status remains -EBUSY, so no special handling is
> needed in the caller.
> 
> A per-transaction resync_used flag, cleared at the start of each
> command, limits recovery to one attempt. A second mismatch is a hard
> -EIO. Well-formed frames never enter the recovery path.
> 
> Tested on Dell OptiPlex AIO 7410 65W (board 0TKWC4) where the EC
> inserts a stray byte on every get-brightness response.


-- 
With Best Regards,
Andy Shevchenko


