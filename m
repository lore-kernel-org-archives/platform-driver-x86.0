From: Matt Fleming <matt.fleming@intel.com>
Subject: Re: [PATCH] platform:x86: add Intel Punit mailbox IPC driver
Date: Tue, 18 Aug 2015 16:50:56 +0100
Message-ID: <1439913056.3505.95.camel@intel.com>
References: <1438358336-79179-1-git-send-email-qipeng.zha@intel.com>
	 <20150805212512.GD38348@vmdeb7> <1439219049.29746.222.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:38313 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753342AbbHRPvA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Aug 2015 11:51:00 -0400
In-Reply-To: <1439219049.29746.222.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

On Mon, 2015-08-10 at 16:04 +0100, Shevchenko, Andriy wrote:
> 
> Matt, by the way intel_pmc_ipc.c module creates iTCO device (LPC bus).
> Does it look correct?

Yeah, it looks OK to me. Note there are changes queued up in Lee Jones'
tree for changing the lpc_ich_info into itco_wdt_platform_data.

Btw, is there a reason that intel_pmc_ipc doesn't use the mfd_* API
since it's concerned with multiple functions?
