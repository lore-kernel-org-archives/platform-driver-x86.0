From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform:x86: add Intel Broxton PMC IPC driver
Date: Wed, 20 May 2015 12:03:45 +0200
Message-ID: <20150520100345.GD22037@vmdeb7>
References: <1431958130-75816-1-git-send-email-qipeng.zha@intel.com>
 <20150520092853.GC22037@vmdeb7>
 <C6287702A945AC47BE5DB5DFD4B5C6DD018B892B@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45098 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752442AbbETKDo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 May 2015 06:03:44 -0400
Content-Disposition: inline
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD018B892B@SHSMSX104.ccr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Yang, Fei" <fei.yang@intel.com>, "Zhong, Huiquan" <huiquan.zhong@intel.com>, "Chen, Jason CJ" <jason.cj.chen@intel.com>, "Zheng, Qi" <qi.zheng@intel.com>

On Wed, May 20, 2015 at 09:42:01AM +0000, Zha, Qipeng wrote:
> Hi Darren Hart
> 
> I double checked no compile fail on my side.
> And could you check if enable config  option " CONFIG_INTEL_PMC_IPC",
> Seems the error is due to this, please check intel_pmc_ipc.h for detail

Of course :-)

If set to =m it fails as described. If set to =y it compiles without error.

-- 
Darren Hart
Intel Open Source Technology Center
