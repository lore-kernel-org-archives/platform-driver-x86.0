Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD4737187F;
	Fri, 20 Mar 2026 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994711; cv=none; b=D1MSsGTuvn86gXjY7oLVN8W+qxnoOrEGGIMwPeb1SzCjcsOH0I3Gt5AVYFIdFKT1MqgxU7jjz9OKNNmclrSLNvVJIwd5Mo4AvbhuAL0EvW/4bAB1KryDrnOtZj4aKeSengt8Gy7G3oGq/NDatWojJB7Lw87antO9flO+2fqCUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994711; c=relaxed/simple;
	bh=G4qzFM91Cq/KwjTG467lZhhZy8Vek//vRFJJReoD7Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivfn0+pvlRQ7FZEgMGvYXhIfq4S6/p5FUaFUEZEAaSGJFzjpDIFc1ux1lxfz3qNxHIEWPQtmR/9Wu5aivo84viwaxIQ90ud1zOPBKvS+v2BeXgSaXI3Hhr3PibT0v6hGIaGUROCsoCdJqnO1e2fGvTmcFsXK3Sld71pZusTw8ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WunHQ7sd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WunHQ7sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773994710; x=1805530710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4qzFM91Cq/KwjTG467lZhhZy8Vek//vRFJJReoD7Uo=;
  b=WunHQ7sdOBUD5q/4B7bsYbDFFvsvoJDKrfoJoO8O9FJd7CxVjuzVCUul
   m1gCPH3QaEMtnzQ/sX6MS1L73+lBF2B4zMIX+I4XSQEl3IDLouYwGyOJL
   FMWz+FE8xQOr3j4gNXpSK4ugBQ0UFT2tWYIexvKLOfZe3D/nhu0pN8r2g
   llM4FQ8+jhGGBuXIFIvy3YKlmm30GvX8zLpr1pbqF3F+9PqXqOySBkPG5
   1qZF949/kCPehtSeyLnvuer89kiUh9haGXzv1fkj2xl1fSxA+6PcVTJ/C
   vPZzSE1ma3EZMOoUQdQpSpG3VhMdKLxglUS83Kt9q5pBoSbrqZDrZZ2i2
   w==;
X-CSE-ConnectionGUID: 2PtLNN6ZSCGlMa6OUwreCw==
X-CSE-MsgGUID: g94SbCeMQrKXCTV/wRParA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86438791"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86438791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:18:29 -0700
X-CSE-ConnectionGUID: WAA/2MESSyO9sDpVxHMjjw==
X-CSE-MsgGUID: 4kGiw3TiTlWLF8pDwe7DKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227347705"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 01:18:26 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3V3n-0000000028T-1629;
	Fri, 20 Mar 2026 08:18:23 +0000
Date: Fri, 20 Mar 2026 16:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3] platform/x86: meraki-mx100: use real software node
 references
Message-ID: <202603201641.qJ8m8Nhn-lkp@intel.com>
References: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/platform-x86-meraki-mx100-use-real-software-node-references/20260316-165120
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260316-meraki-swnodes-v3-1-15501a52300e%40oss.qualcomm.com
patch subject: [PATCH v3] platform/x86: meraki-mx100: use real software node references
config: x86_64-buildonly-randconfig-001-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201641.qJ8m8Nhn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `lkdtm_rodata_do_nothing':
>> (.rodata+0xa9b6c0): undefined reference to `lpc_ich_gpio_swnode'
>> ld: (.rodata+0xa9b840): undefined reference to `lpc_ich_gpio_swnode'
   ld: (.rodata+0xa9b960): undefined reference to `lpc_ich_gpio_swnode'
   ld: (.rodata+0xa9ba80): undefined reference to `lpc_ich_gpio_swnode'
   ld: (.rodata+0xa9bba0): undefined reference to `lpc_ich_gpio_swnode'
   ld: vmlinux.o:(.rodata+0xa9bcc0): more undefined references to `lpc_ich_gpio_swnode' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
