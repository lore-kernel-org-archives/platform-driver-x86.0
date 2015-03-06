From: Darren Hart <dvhart@infradead.org>
Subject: Re: git tree
Date: Fri, 6 Mar 2015 09:30:04 -0800
Message-ID: <20150306173004.GA19001@vmdeb7>
References: <C6287702A945AC47BE5DB5DFD4B5C6DD01844A1A@SHSMSX104.ccr.corp.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD01844B76@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35607 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750815AbbCFRaI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 12:30:08 -0500
Content-Disposition: inline
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD01844B76@SHSMSX104.ccr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>

On Thu, Mar 05, 2015 at 07:47:18AM +0000, Zha, Qipeng wrote:
> Hi Dear
> 
> Could you confirm the git tree is below to maintain platform x86 driver ? If not , could you tell me which one Thanks.
> It report non reachable when I clone it.
> git clone https://git.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git

You can alsways find the latest information in the MAINTAINERS file:

$ grep platform-drivers MAINTAINERS
T:      git git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
