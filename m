From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86: add Intel Punit mailbox IPC driver
Date: Tue, 25 Aug 2015 13:33:07 -0700
Message-ID: <20150825203307.GA50910@vmdeb7>
References: <1438358336-79179-1-git-send-email-qipeng.zha@intel.com>
 <20150805212512.GD38348@vmdeb7>
 <1439219049.29746.222.camel@intel.com>
 <1439913056.3505.95.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44383 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753566AbbHZGTg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 02:19:36 -0400
Content-Disposition: inline
In-Reply-To: <1439913056.3505.95.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matt Fleming <matt.fleming@intel.com>
Cc: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

On Tue, Aug 18, 2015 at 04:50:56PM +0100, Matt Fleming wrote:
> On Mon, 2015-08-10 at 16:04 +0100, Shevchenko, Andriy wrote:
> > 
> > Matt, by the way intel_pmc_ipc.c module creates iTCO device (LPC bus).
> > Does it look correct?
> 
> Yeah, it looks OK to me. Note there are changes queued up in Lee Jones'
> tree for changing the lpc_ich_info into itco_wdt_platform_data.
> 
> Btw, is there a reason that intel_pmc_ipc doesn't use the mfd_* API
> since it's concerned with multiple functions?

Qipeng?

I saw the v2 come in, but didn't see this question addressed in the changelog.

-- 
Darren Hart
Intel Open Source Technology Center
