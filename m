From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH v4] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Fri, 18 Sep 2015 01:29:11 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD019678BE@SHSMSX104.ccr.corp.intel.com>
References: <1441708182-66875-1-git-send-email-qipeng.zha@intel.com>
 <40786695AB8ED34B85C0BFEA910C834433C576F1@IRSMSX103.ger.corp.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD0195E6D4@SHSMSX104.ccr.corp.intel.com>
 <20150917174504.GA12959@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:29037 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751702AbbIRB3U convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Sep 2015 21:29:20 -0400
In-Reply-To: <20150917174504.GA12959@vmdeb7>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

>> >> +/* Some modules are dependent on this, so init earlier */ 
>> >> +fs_initcall(intel_punit_ipc_init);
>> 
>> >So, what exactly requires this?
>> Those drivers which need to use this Punit APIs in its Probe when do module init.

>As you know, cross driver calls is something we work to avoid specifically for the issues of load order, etc. As this is a new driver, there shouldn't be in users of this currently. Is it expected there will be in the near future?

No users currently,  Telemetry driver will use Punit APIs.
So you suggest don't support Punit calls for other modules in init stage ?
