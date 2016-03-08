From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH 1/2] hp-wmi: fix unregister order in hp_wmi_rfkill_setup()
 once again
Date: Tue, 08 Mar 2016 16:58:40 +0100
Message-ID: <56DEF6B0.9050902@maciej.szmigiero.name>
References: <56DCB16C.80608@maciej.szmigiero.name> <20160308123649.GC31742@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vi37-28-154-113.vibiznes.pl ([37.28.154.113]:48842 "EHLO
	vps-vb.mhejs.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932275AbcCHP6u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Mar 2016 10:58:50 -0500
In-Reply-To: <20160308123649.GC31742@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Kirill Tkhai <tkhai@yandex.ru>

Hi Darren,

Thanks for review, see also my comments below.

On 08.03.2016 13:39, Darren Hart wrote:
> On Sun, Mar 06, 2016 at 11:38:36PM +0100, Maciej S. Szmigiero wrote:
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -746,7 +746,7 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
>>  						(void *) HPWMI_BLUETOOTH);
>>  		if (!bluetooth_rfkill) {
>>  			err = -ENOMEM;
>> -			goto register_wifi_error;
>> +			goto register_bluetooth_error;
> 
> In this and all cases below, the goto label should match the situation, jumping
> to register_bluetooth_error would be incorrect as we experienced a wifi error. 

Here we experienced an BT error - BT rkill allocation failed,
so jump is to "register_bluetooth_error".

The second jump to "register_bluetooth_error" is in another case of BT error:
when its rfkill registration failed.

It is the same label since if BT rfkill allocation had failed
rfkill_destroy(bluetooth_rfkill) call in cleanup does nothing but we still
need to possibly unregister WiFi rfkill that might have been registered in
a previews block (and then fall through to next label to destroy WiFi rfkill).

It would be possible to have separate jump labels skipping unnecessary
rfkill_destroy() calls on allocation failure, but this would mean
that we would have 7 labels in such small block of cleanup code.

> A better solution would be to reorder the labels in the exit block
> such that they enforce the necessary reverse order.

Cleanup labels already are in reverse order with regard to registration:
Registration:
1) WiFi,
2) BT,
3) WWAN,
5) GPS.

Cleanup:
1) GPS,
2) WWAN,
3) BT,
4) WiFi.

Best regards,
Maciej Szmigiero
