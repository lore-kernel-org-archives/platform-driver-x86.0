Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582531;
	b=rb6ejrK+/fah4eqY+lpfjrU1ozhjap4jkNFokmejwRZp9Vj+yymfZSrHlZJwXxAAB6Rj
	 ZDjBxPrIBZobt/bGW/9yT+Wb/UAviQO8xfISwpYKUAOo6Iyp5y3FFqG3ovo1cK3vVzjEM
	 gIRKTVvvg2w+e09FHIPGcMTGXFyh0qQ51/2+ModL7E/xam3NiC3mDmUYyR3w4EcBTqNAd
	 r7LjcaKQ0Xh+VXx+vIpMryzW1duPCdw1Gq4zBpUoSXLNdXHYS9/+bUIftyeyPNzmwXUJv
	 dfspwyF7WCYP2K22HwPXTz3saHWEI0i/MkZLd0Ea1qEJGkiGqWdbZuiuMlgDh4ZDutg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Cx1Omfyaca82v5is2yCAZpsaBqeUc6p8sVzDBGAlWPs=;
	b=MDZSMVrgj2Q0YKjXl1R8Fyng7RJ3Skx/II+k+Ee6VtawfeJK6FX4EZSr0X0dBu7ZmT/k
	 hr9Yk1fn+AdQpTzqV5lvVBFatt7uqpBaIMiwTlNwx0oja6hwrfP/3NGSwzKUi6LSmpG0L
	 csBfUTxxGNEd9ZhPBbRORnPEM1jk0Ko+DC0cCMU0TahQpTFdEUqCWP2c0mM5CXyBr9ReK
	 /QZd1SJ59PiUfpKUH4IeiJ2mz1Z6x7L0YRL41PIPd1BXrv57SKEpUMc9Bt8cwXMeU2BVL
	 JXvxSD/5+YxbDiAGDL9H6MEzX5BUpr9DrWQAtjTBN9U3JDp1HhAVwIfTV+68pWJejaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3vWzSNt;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B99606A321;
	Wed, 25 Nov 2026 04:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3vWzSNt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795582530; x=1827118530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mpdq3uSKN8ttNJvXd+YNSoqlifaG1JC4jLUHr6XomgY=;
  b=C3vWzSNto22KUNIjdL+ESZynLHX15KFfrCczz2lMr8jX25fWmDu6cBFO
   W769PwgWOpHxvv0UIOVu76qjbGHr21/mZDSOK9OjwkTFm2vHMnZmfA1/S
   QvOcDqRWggTSsGpk1CgwZROCs3qoRFGoVOIovfMplF/53Emy2a5E3Hwm/
   hC3wIL+lL3M2+fjhKFaZd45kUIOH5B32auRbiyIKqhk4yrs7+2r3xZo7J
   RbUDciGj/jfdvEAfxv/5Xqxhw7Y504XssMibPPVmYESEde5nuhfX4lwOc
   UdMODUMvtT9pQBFvmHahr1oTT5GaJCJzcl8eJ+7BzA3URyFd4ESUKVN7G
   A==;
X-CSE-ConnectionGUID: Nh2l1uTERr6ul4EB+qnsSw==
X-CSE-MsgGUID: Rv4kM2fhR6y1Uyo0IIe+Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4446852"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4446852"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 20:55:29 -0800
X-CSE-ConnectionGUID: YJPP7F0sTCO4jA6G1nUPlw==
X-CSE-MsgGUID: swp/MOFVTYu7DyJZn5r4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12353210"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2026 20:55:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW52O-00000001Qsc-3UJF;
	Wed, 25 Nov 2026 04:55:20 +0000
Date: Wed, 25 Nov 2026 12:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Armin Wolf <W_Armin@gmx.de>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Nick Dowsett <nick42d@gmail.com>
Subject: Re: [PATCH 4/4] platform/x86: clevo-laptop: register 5-step white
 keyboard backlight LED device
Message-ID: <20261125125051.uZKXewqY-lkp@intel.com>
References: <20261122-clevo-laptop-v1-4-881debf4d4b0@gmail.com>
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
In-Reply-To: <20261122-clevo-laptop-v1-4-881debf4d4b0@gmail.com>

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4843f6873f7c4835e62f2c73ba0fd538e57a2f22]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Dowsett-via-B4-Relay/platform-x86-clevo-laptop-add-minimal-WMI-driver-skeleton-and-Kbuild-plumbing/20261122-123538
base:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
patch link:    https://lore.kernel.org/r/20261122-clevo-laptop-v1-4-881debf4d4b0%40gmail.com
patch subject: [PATCH 4/4] platform/x86: clevo-laptop: register 5-step white keyboard backlight LED device
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261125/20261125125051.uZKXewqY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125125051.uZKXewqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125125051.uZKXewqY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0223]: ambiguous associated type
   --> drivers/platform/x86/clevo-laptop.rs:168:17
   |
   168 |         self: &<Self::Mode as led::Mode>::Device<'bound, Self>,
   |                 ^^^^^^^^^^
   |
   help: if there were a trait named `Example` with associated type `Mode` implemented for `FixedColorLedOperations<'a, MAX_BRIGHTNESS>`, you could use the fully-qualified path
   |
   168 -         self: &<Self::Mode as led::Mode>::Device<'bound, Self>,
   168 +         self: &<<FixedColorLedOperations<'a, MAX_BRIGHTNESS> as Example>::Mode as led::Mode>::Device<'bound, Self>,
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
