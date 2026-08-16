Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02F223DFF;
	Sun, 16 Aug 2026 01:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786843632; cv=none; b=WUZex1Ri2HRs8vJ1plJliGiDua5Wo/QhDdGm/HWzCoQegKRUWrO1EUZZjNbxWeYCMWbwf3Ex3skvL5XGSke8yfI/bxsFyk1mokO30bUGEQYjBWFbxO3vgIVu6gy8TjIgmz6OI2TSheAJ1ek2/eRCT2RqQCBM/qQQHvwoYo6/nWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786843632; c=relaxed/simple;
	bh=+EzY5xESG8t5EuSAJPatP6xi7yjKMC6KN/N2UZ4Yk3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuGoRG82FIM9yzpHHGgzfBnpG5RLq8I6D4W8iHMqzSMi581Cfye1llSfRqkbqQ+V5f6NYMDOLysr8EQFNEXAPz4N9WTzL6KQSUYBGZOqofEKOLRmjF8Xiy3p9eRUXctAqtWiuMwfCGGYmsS89/nt+8XpsqITI9mDMnpDJGWigxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awYpWJkB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awYpWJkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786843631; x=1818379631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+EzY5xESG8t5EuSAJPatP6xi7yjKMC6KN/N2UZ4Yk3Y=;
  b=awYpWJkBGIrcAMq4NaCSdE2Ivzm1Ks10trLKIdMDuUQVHgBoFy+p3OiA
   QyPMOFtvmdnFLl+aUuJBaZJ0dNfZkSAvMgWfgQIjI6ThgTAzd+y/odyuY
   IiZwwAvKC0en9b/d/aX4HCHRyoqlXv+rngUI2B57HGqX+7poFdZHbps1t
   zSt2J7pB/C8qh+be0h4j8ZUmZVzM4uqwkBNO6EAHHiKqWuAgLtnoE0gyn
   LyvMP2pA2i8yfvBLI9fAU7nDq2IScA5vt73eXMFG5YOo7IvgaQMLqDcSR
   Egk1uloABLZOSUVUHdhcV9e30qMVuoMdleJW0LIa7R7lrrEBa+FEdflAL
   g==;
X-CSE-ConnectionGUID: oGexAbObT2mNZ0ddwHO68Q==
X-CSE-MsgGUID: Ng6W9PWARG2ODkhCyiNYtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87578479"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87578479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 18:27:10 -0700
X-CSE-ConnectionGUID: VRRW2CZxR5e/w4g42CpDIQ==
X-CSE-MsgGUID: tDpOTD74SHa9wNL2PIYs4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260336122"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2026 18:27:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvPeT-00000000cdW-15EN;
	Sun, 16 Aug 2026 01:27:05 +0000
Date: Sun, 16 Aug 2026 09:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Ertu=C4=9Frul_Top=C3=A7u?= <ertugtopcu0@gmail.com>,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?Q?Ertu=C4=9Frul_Top=C3=A7u?= <ertugtopcu0@gmail.com>
Subject: Re: [PATCH] platform/x86: Add Goodix fingerprint EC mailbox transport
Message-ID: <202608160824.RMzAY05S-lkp@intel.com>
References: <20260727205837.91413-1-ertugtopcu0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727205837.91413-1-ertugtopcu0@gmail.com>

Hi Ertuğrul,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2-rc7 next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ertu-rul-Top-u/platform-x86-Add-Goodix-fingerprint-EC-mailbox-transport/20260815-121223
base:   linus/master
patch link:    https://lore.kernel.org/r/20260727205837.91413-1-ertugtopcu0%40gmail.com
patch subject: [PATCH] platform/x86: Add Goodix fingerprint EC mailbox transport
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260816/202608160824.RMzAY05S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160824.RMzAY05S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160824.RMzAY05S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c: In function 'goodix_ec_mmio_write_tx':
>> drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c:204:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Wimplicit-function-declaration]
     204 |                 writeq(value, gdev->mailbox + GOODIX_EC_TX_OFFSET + offset);
         |                 ^~~~~~
         |                 writel
   drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c: In function 'goodix_ec_mmio_read_rx':
>> drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c:216:29: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Wimplicit-function-declaration]
     216 |                 u64 value = readq(gdev->mailbox + GOODIX_EC_RX_OFFSET + offset);
         |                             ^~~~~
         |                             readl


vim +204 drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c

   196	
   197	static void goodix_ec_mmio_write_tx(struct goodix_device *gdev, size_t len)
   198	{
   199		size_t offset;
   200	
   201		for (offset = 0; offset < len; offset += sizeof(u64)) {
   202			u64 value = get_unaligned_le64(gdev->tx_buf + offset);
   203	
 > 204			writeq(value, gdev->mailbox + GOODIX_EC_TX_OFFSET + offset);
   205		}
   206	
   207		/* Publish every qword before asserting the write-done doorbell. */
   208		wmb();
   209	}
   210	
   211	static void goodix_ec_mmio_read_rx(struct goodix_device *gdev)
   212	{
   213		size_t offset;
   214	
   215		for (offset = 0; offset < GOODIX_EC_RX_SIZE; offset += sizeof(u64)) {
 > 216			u64 value = readq(gdev->mailbox + GOODIX_EC_RX_OFFSET + offset);
   217	
   218			put_unaligned_le64(value, gdev->rx_buf + offset);
   219		}
   220	
   221		/* Complete the mailbox snapshot before parsing its headers. */
   222		rmb();
   223	}
   224	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
