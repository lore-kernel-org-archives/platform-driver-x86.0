From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Thu, 17 Sep 2015 19:43:38 -0700
Message-ID: <20150918024338.GA66179@vmdeb7>
References: <1441708182-66875-1-git-send-email-qipeng.zha@intel.com>
 <40786695AB8ED34B85C0BFEA910C834433C576F1@IRSMSX103.ger.corp.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD0195E6D4@SHSMSX104.ccr.corp.intel.com>
 <20150917174504.GA12959@vmdeb7>
 <C6287702A945AC47BE5DB5DFD4B5C6DD019678BE@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38472 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751785AbbIRCnk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Sep 2015 22:43:40 -0400
Content-Disposition: inline
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD019678BE@SHSMSX104.ccr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

On Fri, Sep 18, 2015 at 01:29:11AM +0000, Zha, Qipeng wrote:
> >> >> +/* Some modules are dependent on this, so init earlier */ 
> >> >> +fs_initcall(intel_punit_ipc_init);
> >> 
> >> >So, what exactly requires this?
> >> Those drivers which need to use this Punit APIs in its Probe when do module init.
> 
> >As you know, cross driver calls is something we work to avoid specifically for the issues of load order, etc. As this is a new driver, there shouldn't be in users of this currently. Is it expected there will be in the near future?
> 
> No users currently,  Telemetry driver will use Punit APIs.
> So you suggest don't support Punit calls for other modules in init stage ?

I just saw the Telemetry driver today hit the list, so we have a user. No
objection. That patch series had some issues, so I'm waiting for a v2 which I
can apply and review properly.

Both of these are 4.4 candidates and I'd like them in next for as long as
possible, so please watch for Andriy's upcoming review. Thanks for sticking with
it.

-- 
Darren Hart
Intel Open Source Technology Center
