From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Asus WMI : Add lightbar led support
Date: Fri, 22 Sep 2017 17:18:27 -0700
Message-ID: <20170923001827.GD20327@fury>
References: <20170921112001.14788-1-maxime.bellenge@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:56833 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751995AbdIWASd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Sep 2017 20:18:33 -0400
Content-Disposition: inline
In-Reply-To: <20170921112001.14788-1-maxime.bellenge@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxime =?iso-8859-1?Q?Belleng=E9?= <maxime.bellenge@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 21, 2017 at 01:20:01PM +0200, Maxime Bellengé wrote:
> Some asus laptops (ROG series for example) are provided with a lightbar behind the monitor.
> This patch make posible to switch it on and off. This lightbar works exactly as any other led.
> 

Hi Maxime,

The patch looks good from a functional implementation perspective.

There are 3 mechanical and style errors the checkpatch script catches. Please
update the patch and resubmit:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#85: 
Some asus laptops (ROG series for example) are provided with a lightbar behind the monitor.

WARNING: 'posible' may be misspelled - perhaps 'possible'?
#86: 
This patch make posible to switch it on and off. This lightbar works exactly as any other led.

WARNING: please, no space before tabs
#101: FILE: drivers/platform/x86/asus-wmi.c:122:
+#define ASUS_WMI_DEVID_LIGHTBAR ^I0x00050025$

total: 0 errors, 3 warnings, 103 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

/home/dvhart/incoming/PATCH_Asus_WMI_Add_lightbar_led_support.mbox has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

-- 
Darren Hart
VMware Open Source Technology Center
