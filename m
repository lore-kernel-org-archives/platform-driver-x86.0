Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620108;
	b=UZpstt8dQMPueljQKQ+mopS+EW5olPr5n4Qjt2xhgZcEvWs2tYU7WzNG30v66M2PwJvi
	 PQesOSgYWgjsfhebQiWYnRG7c40VX62vUkCd8X1NZIN2P63yAfWn1FJ2Nz8SeqXP9ZxVN
	 2D8ecK79p/Sx+3AX7/oZhoXHB7fcmhMBa1bsNMRGjVPyjhHZ4aRP0hyrgrhqHMzQrAsTA
	 EjHPecTJbqqrKBxN9VxlqsxwQh1J0zTvebhyLgHYM/CeEJCsbw2QHgXSX6qS94QWUC647
	 0H5x09pLR/oMDQjTxNh1XOx2uUuwE9utFYgd2qU4P5fAwd07GBj6MCYDjFgdDfqEcqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620108;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ulHjbf0kgFJcdCUJDgxXSCxhRutSTtFhlHDOXO8sUCI=;
	b=i9bFNzzTT3yU90908hV9HXDpvSWmGHKcGMoa20vUV9iL5L3iBnjvNcYBjwCsNy7VIqjW
	 dZUUhqw1+E8Im5ZnkC7bKJeJl8tyX8hKb7BW5q/XdRzeQ2U7JQFrcKGxHjIClSCVj0/ze
	 UiEZJXn8W/8evneologjwnGBMUb9f/rWqtXXjWc1JR7spnSWQFK3jHClTNMuWBg1flJ0x
	 cUx9/X3foDLYG9cskBONzdnBu3mJd0eU9blAVl1+Cx2cxfmSp9pGWoJSYFU6SeFxJ2KQs
	 gtAf72nISa1PQVG8XrAHtVYPEbynHLIv1MO/OB78tPxDTA9kBE18ycLeH/PKXNB8VRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OssesDnn;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D947606A329;
	Mon,  2 Nov 2026 11:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D947606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OssesDnn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793620107; x=1825156107;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=0qt+dGtXk0t56WrBURqj7MB+Ryqck7hkgEP/i19sXLw=;
  b=OssesDnncdCVF4rbfWhd6nfoV+B8Dy0MbZLLFONp4a27+UCNG6jrzpAQ
   7P9Pb8O88/r/EeJbQhlMq2+ociU4MaymFYQifmMAsQ4C9FwQebBf9V9Pi
   yttK0zATZCQnrDpKY7aFmld0sBgLnhg7vqeeLiwdkkqiTJGAXKSSF7AT9
   oaVBbpKr7NoKXkViOUvcy/ELU3VPiBVZdwhDtT54clbkZU9P0Rid5RBdQ
   55kNXBkXY0QnVXJxvKi6G03lbpV22wvMy/g7LPfKxlDm2dhD6E04AMNaI
   iHb0deLHMl9cKXikQb3xBQV+QK6B63b9t7Ylw/cIoozQFDN0CXxKioGlF
   g==;
X-CSE-ConnectionGUID: Cg6EXAj0ROWuvjK3Ph4IGQ==
X-CSE-MsgGUID: 9TpNn3dlT9OwDDO5JSBZvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2184887"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2184887"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 03:48:26 -0800
X-CSE-ConnectionGUID: 1Zjgx5UwSd6VHgFpROoAdQ==
X-CSE-MsgGUID: Ra9s+CRWQc20s6J8qdTFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5955506"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.12])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 03:48:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030194704.424388-1-W_Armin@gmx.de>
References: <20261030194704.424388-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Implement .hw_offloaded
 trigger callback
Message-Id: <179362009806.1659.9035755040374496694.b4-ty@b4>
Date: Mon, 02 Nov 2026 13:48:18 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 30 Oct 2026 20:46:44 +0100, Armin Wolf wrote:

> Since commit 8e04e5382aa9 ("leds: trigger: Add hw_offloaded() callback
> and provide trigger_may_offload_to_hw attribute") the LED subsystem
> allows triggers to report if they are being offloaded to the underlying
> hardware. Implement the necessary callback so that the LED subsystem
> knows that the lightbar trigger is always offloaded to hardware.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: uniwill-laptop: Implement .hw_offloaded trigger callback
      commit: 086aeca907789bd2604f16f07bfc073b19015015

--
 i.

