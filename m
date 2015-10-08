From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH v4] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Thu, 8 Oct 2015 03:16:02 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD0196B567@SHSMSX104.ccr.corp.intel.com>
References: <1441708182-66875-1-git-send-email-qipeng.zha@intel.com>
 <40786695AB8ED34B85C0BFEA910C834433C576F1@IRSMSX103.ger.corp.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD0195E6D4@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:50462 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750730AbbJHDQF convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Oct 2015 23:16:05 -0400
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD0195E6D4@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>


>>> +	ipcdev.base[BIOS_MAILBOX] = addr;
>>> +	addr += MAILBOX_REGISTER_SPACE;
>>> +	ipcdev.base[GTDRIVER_MAILBOX] = addr;
>>> +	addr += MAILBOX_REGISTER_SPACE;
>>> +	ipcdev.base[ISPDRIVER_MAILBOX] = addr;

>>Looks akward, does the platform have the several resources for different purpose? Why do you unify them (who does guarantee the non-breakable segment for all resources?) first and then split up?
>>Please, refactor.

From spec, these three parts are consecutive, so only define one acpi resource entry is reasonable way,
>But BIOS maintainer finally make the resource like this due to request from Window os driver,
>So can't treat these three as three separate parts.

 Andriy, Darren:  this is my before feedback, and
a) Punit function is configured as ACPI device in BIOS, not PCI device(seems can't configure as PCI).
b) To make it compatible(same acpi entry) for WOS, BIOS define Punit mem resource as res0,  so this driver is coding as this.
     So this driver is depend on acpi entry in BIOS to get device resource like all acpi device drivers.
     In future, I don't think BIOS will change current defined resource for Punit function.
 
