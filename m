Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636B83A0E85;
	Thu, 15 Jan 2026 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485671; cv=none; b=kFA5eWPy0vSCC7F42Anbywh3r5EZuTK4nIINPCjSEIpj2fam3xU254zX+XyuBj81JRYWz2vQwekT2NsoSNFFEt2nIIQQJdqBSeMrp8rD/sdpoFo3YPmwhF5nwGPoHzGixXZ9OUs3oQHlGzkftzXmtq8RjdBPSJn4os1hIGkTGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485671; c=relaxed/simple;
	bh=NY56gSrCfddQq8TILMmRYuu0qRjwWj2aOtJfEsVoGDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cz6Mzi3aMEhHcvY4oGDVz0Gqau0CVQKM0qUSD/qnMKpbFB8569eJlk7LZG9py7UGYpV17wN+rY+3fV7DQ3mJEZUV9zCrkIXzFqynfkD6OiNmlFR9u6OJz31OLE8fSPoSVLGhkU+pQK078QuA8yaWNMQbe8E0nZt5dC8jhk51iBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcBx675g; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcBx675g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768485669; x=1800021669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NY56gSrCfddQq8TILMmRYuu0qRjwWj2aOtJfEsVoGDA=;
  b=JcBx675gmpVlLDG6G0k4RHcmlJD1Q+aTVMN/7m6cKm47jgC3KiTl3tt2
   MG7JbiGlcLOhdHFjPpQcr9McONdseDsYtRIrZJtd2ICyELSECLULLqcw/
   NlEobpoJZZJanFaBIhy4THg0ye2rE5Hr/G0FMlASIZ/5OKfQ5kgtVkDt/
   C6a2ZAW2YSR8P9sqA+f2VqvPjqfGVrbgDo7aAi+0uhOlvYeULSUAOOa+K
   eEK14VgGL1NT09U0TXqB72L9pFKsbFKF+3ExawKHvqF7Xr/bHQiPOZKw7
   Y9aBmlpUjZq7npXEU1/a4OgyfkijjBDAU6sj7TOVub8uwLdoUkethgjTt
   g==;
X-CSE-ConnectionGUID: WUYyYIe/RuO1vtCO+AwEJw==
X-CSE-MsgGUID: qDG1wa6mSAaCpzTl73f8cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="72375527"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="72375527"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:01:09 -0800
X-CSE-ConnectionGUID: fTBPd5/jQGimTqOsUba12A==
X-CSE-MsgGUID: pibZMDtIS+uNB34QaOfB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205452425"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jan 2026 06:01:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgNuK-00000000I2C-2GRX;
	Thu, 15 Jan 2026 14:01:04 +0000
Date: Thu, 15 Jan 2026 22:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ciju Rajan K <crajank@nvidia.com>, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, christophe.jaillet@wanadoo.fr,
	andriy.shevchenko@linux.intel.com, vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ciju Rajan K <crajank@nvidia.com>
Subject: Re: [PATCH platform-next v4 1/2] kernel/irq: Add generic interrupt
 storm detection mechanism
Message-ID: <202601152136.LGHBo3k1-lkp@intel.com>
References: <20260115074909.245852-2-crajank@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115074909.245852-2-crajank@nvidia.com>

Hi Ciju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc5]
[cannot apply to tip/irq/core next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciju-Rajan-K/kernel-irq-Add-generic-interrupt-storm-detection-mechanism/20260115-155438
base:   linus/master
patch link:    https://lore.kernel.org/r/20260115074909.245852-2-crajank%40nvidia.com
patch subject: [PATCH platform-next v4 1/2] kernel/irq: Add generic interrupt storm detection mechanism
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260115/202601152136.LGHBo3k1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152136.LGHBo3k1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152136.LGHBo3k1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/spurious.c:41:6: warning: no previous prototype for 'irq_register_storm_detection' [-Wmissing-prototypes]
      41 | bool irq_register_storm_detection(unsigned int irq, unsigned int max_freq,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/irq/spurious.c:79:6: warning: no previous prototype for 'irq_unregister_storm_detection' [-Wmissing-prototypes]
      79 | void irq_unregister_storm_detection(unsigned int irq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/irq_register_storm_detection +41 kernel/irq/spurious.c

    30	
    31	
    32	/**
    33	 * irq_register_storm_detection - register interrupt storm detection for an IRQ
    34	 * @irq: interrupt number
    35	 * @max_freq: maximum allowed frequency (interrupts per second)
    36	 * @cb: callback function to invoke when storm is detected
    37	 * @dev_id: device identifier passed to callback
    38	 *
    39	 * Returns: true on success, false on failure
    40	 */
  > 41	bool irq_register_storm_detection(unsigned int irq, unsigned int max_freq,
    42					  irq_storm_cb_t cb, void *dev_id)
    43	{
    44		struct irq_storm *storm;
    45		bool ret = false;
    46	
    47		if (max_freq < IRQ_STORM_MIN_FREQ_HZ || !cb)
    48			return false;
    49	
    50		storm = kzalloc(sizeof(*storm), GFP_KERNEL);
    51		if (!storm)
    52			return false;
    53	
    54		/* Adjust to count per 10ms */
    55		storm->max_cnt = max_freq / (IRQ_STORM_MAX_FREQ_SCALE);
    56		storm->cb = cb;
    57		storm->dev_id = dev_id;
    58	
    59		scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
    60			if (scoped_irqdesc->action && !scoped_irqdesc->irq_storm) {
    61				storm->last_cnt = scoped_irqdesc->tot_count;
    62				storm->next_period = jiffies + msecs_to_jiffies(IRQ_STORM_PERIOD_WINDOW_MS);
    63				scoped_irqdesc->irq_storm = storm;
    64				ret = true;
    65			}
    66		}
    67	
    68		if (!ret)
    69			kfree(storm);
    70	
    71		return ret;
    72	}
    73	EXPORT_SYMBOL_GPL(irq_register_storm_detection);
    74	
    75	/**
    76	 * irq_unregister_storm_detection - unregister interrupt storm detection
    77	 * @irq: interrupt number
    78	 */
  > 79	void irq_unregister_storm_detection(unsigned int irq)
    80	{
    81		scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
    82			if (scoped_irqdesc->irq_storm) {
    83				kfree(scoped_irqdesc->irq_storm);
    84				scoped_irqdesc->irq_storm = NULL;
    85			}
    86		}
    87	}
    88	EXPORT_SYMBOL_GPL(irq_unregister_storm_detection);
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
