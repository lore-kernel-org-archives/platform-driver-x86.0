From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony_laptop bug - Can't change usb_charge attribute
Date: Thu, 11 Jun 2015 06:22:19 +0900
Message-ID: <20150610212218.GA7272@taihen.jp>
References: <CALH0XhkxrWw7dps6=+KSfiJ6NQtf=1Hu_NqtGydK3amjvUHG5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34584 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751389AbbFJVWZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 10 Jun 2015 17:22:25 -0400
Received: by payr10 with SMTP id r10so41733154pay.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2015 14:22:25 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CALH0XhkxrWw7dps6=+KSfiJ6NQtf=1Hu_NqtGydK3amjvUHG5g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dalton Fury <daltonfury42@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Dalton,

On Wed, Jun 10, 2015 at 03:30:32AM +0530, Dalton Fury wrote:
> [1.] [Sony VAIO SVF14212SNB] Can't change usb_charge attribute in
> /sys/devices/platform/sony-laptop
> 
> [2.] I am on a Sony VAIO svf43142sn. My laptop has the ability to
...
> echo -n 0 | sudo tee -a /sys/devices/platform/sony-laptop/usb_charge
> 
> these are the curresponding kernel log entries:
> 
> [  495.400140] sony_laptop: found handle 0x0155 (offset: 0x07)
> [  495.400955] sony_laptop: __call_snc_method: [SN07:0x0000000000000107]
> [  495.400961] sony_laptop: called SN07 with 0x0107 (result: 0x0000)
> 
> After attempting to change, and when I cat the value of usb_charge, I
> find that it is unchanged. But when the cat cammand is executed, I get
> these kernel messages:
> 
> [  683.170315] sony_laptop: found handle 0x0155 (offset: 0x07)
> [  683.170458] sony_laptop: __call_snc_method: [SN07:0x0000000000000007]
> [  683.170462] sony_laptop: called SN07 with 0x0007 (result: 0x0001)

I have the same behaviour on my laptop (a Pro11), I believe usb_charge
was working correctly sometime in the past.
It may take me some time but I should be able to take a look. In the
meantime it would be good if you could attach the DSDT from your model
to the Ubuntu bug report and send a link here too.

> I don't know if it is relevent, but for writing this bug report, when
> I booted into the latest upstream kernel, I could not boot. The second
> time it booted successfully.

I don't think it is.

Thanks
-- 
mattia
:wq!
