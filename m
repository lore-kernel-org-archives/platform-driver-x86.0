Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690CA3054DE;
	Fri, 28 Nov 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325530; cv=none; b=aCjaRcficNidrq2ia7t0meSAn4NeRej+tjtd9Nyf3giV4WvHUSCdWeH5UvYXncEWiPA0yqvE3+DucQmAacmWvPEGNhJm511Ova+acWfB5gMgAUeHBWI80SVxBXmb765kO/Mo+5pfENLtdX/KFNu8lHBtKvWGiViO3Lt5bFtMSps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325530; c=relaxed/simple;
	bh=+UPd69c3uCQEUerH3JffVdWKFCrvfaGg3OFt42G6gFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yy91S7YbMlf0Ei3PtLwLNl1NBUEuQN94FVq+rTKei27ynstO1SFSD0/8dchn/OXRUCMSGvg0RSFKKlEOX9CrqYNpR/mAcg6FlJU1C5Jw78Ey+9rmf8rW6R2c/aOFMnvQNpOsbi42x7i0Gdsm1vi3dhvoZEakWNOQWEOkzZkgpMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mlxw9Ixz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mlxw9Ixz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764325529; x=1795861529;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+UPd69c3uCQEUerH3JffVdWKFCrvfaGg3OFt42G6gFM=;
  b=Mlxw9IxzaSqnOXDsaKh76WiEdpC5i00g9KEmFRXP6PYSxVI2Y7sw8xBK
   JVbJN9w3BPqE/sDHLe7GjdylmvG5GLVKc5jICYRn+cpy627rekuDjEcC5
   y4S9chT2FfTR7UelvTzRMpyijXO7mkAjNtDoOXf9fhuZJgqgQhlxCkuaa
   +XuMbKG5iLm90/UXcDmUIIszKQivT1MPmc/zadbUAmAOOg4l0a0Hxc0WR
   FTExU2P7J8PwoecHC+IiRWgSF7l3hMCwebS9GB0858ZPKUlnQUEvAmQ3t
   njebJdMbK49scVXWJYNE/Hl++xeCR6DHOGsgbTE7sBsqW6Xp422acKSNN
   g==;
X-CSE-ConnectionGUID: 5JUAnQFoT7qG+wGVT0+KgQ==
X-CSE-MsgGUID: 6MbXCR0FQzmieZl8lz4wVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66255992"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66255992"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:25:28 -0800
X-CSE-ConnectionGUID: vd5D/beaTMqQLgv6t21X1g==
X-CSE-MsgGUID: KuZn0GKDSp+sCJo2CzdZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197905542"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.229])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:25:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: tiwai@suse.de, hansg@kernel.org, Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, andriy.shevchenko@linux.intel.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 13916275206@139.com, 
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
In-Reply-To: <20251126141434.11110-1-baojun.xu@ti.com>
References: <20251126141434.11110-1-baojun.xu@ti.com>
Subject: Re: [PATCH v5] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
Message-Id: <176432551630.7427.14238398482885718801.b4-ty@linux.intel.com>
Date: Fri, 28 Nov 2025 12:25:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 26 Nov 2025 22:14:33 +0800, Baojun Xu wrote:

> The tas2781-hda supports multi-projects. In some projects, GpioInt() was
> dropped due to no IRQ connection. See the example code below:
> 
> Device (SPKR)
> {
>     Name (_ADR, One)
>     Name (_HID, "TXNW2781")
>     Method (_CRS, 0, NotSerialized)
>     {
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0038, ...)
>             I2cSerialBusV2 (0x0039, ...)
>             // GpioInt (Edge, ...) { 0x0000 }
>             //"GpioInt (...) {}" was commented out due to no IRQ connection.
>         })
>         Return (RBUF)
>     }
> }
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ missing projects
      commit: 1d1b8b0734af5149946e687415bf6be05ae55bd6

--
 i.

