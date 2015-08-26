From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH] platform:x86: add Intel Punit mailbox IPC driver
Date: Wed, 26 Aug 2015 08:22:33 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD01949DAE@SHSMSX104.ccr.corp.intel.com>
References: <1438358336-79179-1-git-send-email-qipeng.zha@intel.com>
 <20150805212512.GD38348@vmdeb7> <1439219049.29746.222.camel@intel.com>
 <1439913056.3505.95.camel@intel.com> <20150825203307.GA50910@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:20709 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756072AbbHZIWj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 04:22:39 -0400
In-Reply-To: <20150825203307.GA50910@vmdeb7>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, "Fleming, Matt" <matt.fleming@intel.com>
Cc: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

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

> Qipeng?

> I saw the v2 come in, but didn't see this question addressed in the changelog.

When design P-unit driver, we got feedback from BIOS that there will allocate a dedicate
ACPI id for P-unit controller, and finally BIOS decide not do that, just put some necessary 
Resource in PMC acpi table.
After that, we got request to do same thing for iTco.

I agree it's better to update pmc driver to use mfd_add_devices to create punit and iTco device.

--
Darren Hart
Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
