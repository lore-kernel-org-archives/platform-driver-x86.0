From: Philip Prindeville <philipp@redfish-solutions.com>
Subject: Re: [PATCH v3 1/1] alix2: supplement driver to include GPIO button
 support
Date: Wed, 25 Jan 2012 18:37:17 -0700
Message-ID: <4F20AE4D.2040906@redfish-solutions.com>
References: <1327348589-9601-1-git-send-email-philipp@redfish-solutions.com> <20120125145742.338086b8.akpm@linux-foundation.org> <4F208A70.1050709@redfish-solutions.com> <20120125151622.6621f6ce.akpm@linux-foundation.org> <4F20949F.1000602@redfish-solutions.com> <20120125170859.49cbf10b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.redfish-solutions.com ([66.232.79.143]:53632 "EHLO
	mail.redfish-solutions.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751863Ab2AZBhz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jan 2012 20:37:55 -0500
In-Reply-To: <20120125170859.49cbf10b.akpm@linux-foundation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: platform-driver-x86@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Richard Purdie <rpurdie@rpsys.net>, Andres Salomon <dilinger@queued.net>, Ed Wildgoose <kernel@wildgooses.com>, David Woodhouse <dwmw2@infradead.org>

On 1/25/12 6:08 PM, Andrew Morton wrote:
>>> Out-of-tree drivers are unpopular.  Where is this driver, what is its
>>> license and what are the prospects of making it in-tree?
>>
>> It's complicated. Generic GPIO supports polled-keys for input, and LEDs for outputs as you know.
>>
>> There's no generic output mechanism for (say) an RFKILL line on the bus. If/when this materialized, I'll modify the alix driver to register that device in addition to the soft-reset button and the output LEDs (for the alix.6 device only).
>>
>> There's also a certain amount of churn going on right now in coreboot about supporting the 'alix.6' as a variant of the 'alix.2' (the coreboot build machinery doesn't support this, and we need to hack kconfig to make this happen, i.e. have kconfig be queryable from shell scripts like coreboot's abuild)... so for now most people burn an alix.2 coreboot image onto their alix.6.
>>
>> So there's a chain of dependencies that need to be resolved to get the ideal solution in place... but not wanting the perfect be the enemy of the good, I wanted to get what's available today out there with the caveat that something better is in the pipeline.
> 
> That didn't really answer my question about the whereabouts of the
> mystery wireless driver.  Oh well, it doesn't matter much.

Oh, yeah, sorry.  The driver is currently only in my tree, though I had wanted to get it into OpenWRT but after having even linux-atm upstream patches not get retrofitted into the OpenWRT sources, I've given up on submitting additional patches.

The short answer was that in a perfect world, I won't need the out-of-tree driver and will be able to do everything in the alix2.c platform driver when GPIO support for non-button-or-LED-thingies gets added... at which point alix_model can be deprecated.

>>> I don't personally have problems with helping out-of-tree drivers but
>>> making it EXPORT_SYMBOL_GPL() would set minds at rest.
>>
>> Ok.  I'll make that patch and resubmit...
> 
> Add a comment there too, otherwise someone will come along and zap it.
> 

Ok, will do.
