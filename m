From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] hp-wmi: fix unregister order in
 hp_wmi_rfkill_setup() once again
Date: Tue, 8 Mar 2016 18:01:11 +0100
Message-ID: <20160308170111.GE31742@dvhart-mobl5.amr.corp.intel.com>
References: <56DCB16C.80608@maciej.szmigiero.name>
 <20160308123649.GC31742@dvhart-mobl5.amr.corp.intel.com>
 <56DEF6B0.9050902@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38005 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932071AbcCHRBf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Mar 2016 12:01:35 -0500
Content-Disposition: inline
In-Reply-To: <56DEF6B0.9050902@maciej.szmigiero.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Kirill Tkhai <tkhai@yandex.ru>

On Tue, Mar 08, 2016 at 04:58:40PM +0100, Maciej S. Szmigiero wrote:
> Hi Darren,
> 
> Thanks for review, see also my comments below.
> 
> On 08.03.2016 13:39, Darren Hart wrote:
> > On Sun, Mar 06, 2016 at 11:38:36PM +0100, Maciej S. Szmigiero wrote:
> >> --- a/drivers/platform/x86/hp-wmi.c
> >> +++ b/drivers/platform/x86/hp-wmi.c
> >> @@ -746,7 +746,7 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
> >>  						(void *) HPWMI_BLUETOOTH);
> >>  		if (!bluetooth_rfkill) {
> >>  			err = -ENOMEM;
> >> -			goto register_wifi_error;
> >> +			goto register_bluetooth_error;
> > 
> > In this and all cases below, the goto label should match the situation, jumping
> > to register_bluetooth_error would be incorrect as we experienced a wifi error. 
> 
> Here we experienced an BT error - BT rkill allocation failed,
> so jump is to "register_bluetooth_error".
> 
> The second jump to "register_bluetooth_error" is in another case of BT error:
> when its rfkill registration failed.
> 
> It is the same label since if BT rfkill allocation had failed
> rfkill_destroy(bluetooth_rfkill) call in cleanup does nothing but we still
> need to possibly unregister WiFi rfkill that might have been registered in
> a previews block (and then fall through to next label to destroy WiFi rfkill).
> 
> It would be possible to have separate jump labels skipping unnecessary
> rfkill_destroy() calls on allocation failure, but this would mean
> that we would have 7 labels in such small block of cleanup code.

My apologies, I read through this too quickly. The patch is correct as is.
I have wrapped the commit message at 75 characters and queued to the testing
branch.

The one thing that's missing in the commit message is a description of how this
was failing. It can, however, be inferred.

Thanks for the patient reply, I deserved a slap for my initial response.

-- 
Darren Hart
Intel Open Source Technology Center
