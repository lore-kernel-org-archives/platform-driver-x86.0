Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD516F0FE;
	Tue, 16 Dec 2025 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765848009; cv=none; b=Mfpa9E1n6qDVrAkb+NDNQWnaXYoWxV8eFh1M2VuHoe/BkEVZWQ+mNa7vngXfgRoUcnOqtNAVzXymeTq7+gsXQva1jn5wVdmkvibAlu7xnKLVvP94JuLZznpRF41r0vl8E1e7lgsNLqZsLWWeFGPy63f4Qd/YSv3NzAiFpfgVFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765848009; c=relaxed/simple;
	bh=ScgYSo3EduCW+pIDLm1vy1gEwheWdwYV3Vh3DGHlyXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JivlS/8ZOnWs59m53tja1+EHPmpvj/PckEBYhE5NG85J6pvNMZ52CTks1kKWDii9oxNNddGCoRfKPXCIQYWu+l7tp0ZoAI/DAXwH0Kglte088i4uO+SJjaMtCinXhq/ZcOzQ27fM2OHCQYn9IlzDJdEvCw/ekh3/7Bv3CByIw2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvFF4jst; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvFF4jst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765848008; x=1797384008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ScgYSo3EduCW+pIDLm1vy1gEwheWdwYV3Vh3DGHlyXw=;
  b=hvFF4jstFihD4GZDqehVX6a4JM+4puk5r1+yQz+E8CLnwmRtD4Nf2Ayv
   9bzE3fp9A4ag2/VZplcvIyciMVgxNTqlU0Ukiyet9Pvr1HNriZga12ya4
   fLwWI9EkhJyjTinsnfpZx3dxFE7AJw0ivimxxVxZnIBkeUPzsMhe/7Wq1
   /H9+eA/54enpVEOTI7PvTI/AQ2eFhCSDbhVC0PYo/mArZF7Xn4GFtHC0B
   l6hQT2GknW8qDx+wmReEmQP+vQpA+DAfr0/90kkzOUxruSfeTG3W0OIgI
   bCiKWevs9DCk/oKc+OoesXN//gdeY/JMsS81dWQTWTeIW9Z2813UH8e9h
   g==;
X-CSE-ConnectionGUID: n8UIKSF2S3CNrGE2rqDbTg==
X-CSE-MsgGUID: 3jz9CMOsTcCiJYeFVuwTOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78399559"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78399559"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 17:20:06 -0800
X-CSE-ConnectionGUID: veGie3YzQ8uRmPXG7AQ9/g==
X-CSE-MsgGUID: Vbur8HBwSGqfMV1qD7FYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="198134039"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Dec 2025 17:20:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVJjN-000000002no-2m50;
	Tue, 16 Dec 2025 01:20:01 +0000
Date: Tue, 16 Dec 2025 02:19:36 +0100
From: kernel test robot <lkp@intel.com>
To: Nitin Joshi <nitjoshi@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to
 detect hardware damage detection capability.
Message-ID: <202512160219.94nMjvxO-lkp@intel.com>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210151133.7933-1-nitjoshi@gmail.com>

Hi Nitin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitin-Joshi/platform-x86-thinkpad_acpi-Add-sysfs-to-display-details-of-damaged-device/20251210-231409
base:   linus/master
patch link:    https://lore.kernel.org/r/20251210151133.7933-1-nitjoshi%40gmail.com
patch subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160219.94nMjvxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160219.94nMjvxO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title underline too short.
--
   Hardware damage detection capability
   ----------------- [docutils]
>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title underline too short.


vim +1581 Documentation/admin-guide/laptops/thinkpad-acpi.rst

  1579	
  1580	Hardware damage detection capability
> 1581	-----------------
  1582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
