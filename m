From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony_laptop: Default values for keyboard backlight
Date: Tue, 19 Nov 2013 07:30:08 +0900
Message-ID: <20131118223008.GA4397@taihen.jp>
References: <5289F067.40201@babioch.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42013 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751286Ab3KRWgc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Nov 2013 17:36:32 -0500
Content-Disposition: inline
In-Reply-To: <5289F067.40201@babioch.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Karol Babioch <karol@babioch.de>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Nov 18, 2013 at 11:48:07AM +0100, Karol Babioch wrote:
> Hi,
> 
> the keyboard backlight has been working for me for the last couple of
> years without any problems and I was fine with the default values, so I
> wasn't too happy when I realized that a recent kernel upgrade has
> changed this by leaving the backlight always on.
> 
> I've tracked down the "issue" to a specific commit (see [1]) from Mattia
> itself, so I guess he had every reason to make this change. I've dealt
> with the "problem" with a specific modprobe.d file.

This should work of course but if I broke the majority of older models
then maybe a different approach is a better idea.

...
> But to my understanding the commit shouldn't change the default behavior
> for the keyboard backlight itself, as it actually doesn't touch the

that's right, the new code specifically doesn't do aanything with
keyboard backlight unless you have a module parameter that sets a value.

> registers involved. But as the behavior has actually changed, something
> is definitely going on here, which might not necessarily be intentional.

The code was changed on the assumption that keyboard backlight settings
value are persisted across reboots. I guess this is not the case on your
machine. If you don't load sony-laptop module you still have the 10
seconds timeout that you see in the BIOS? Only _after_ you load the
module the backlight never goes off?

One alternative approach is the following.
From the DSDTs I have hanging around these models may see the same
behaviour as you're seeing:
VPCF127FX
VPCS11E7E
VPCS12A7R
VPCS12C5E
VPCZ12C5E
i.e. VPC F/S/Z series.
They all have handle 0x137 which is what the very original code was
developed for and, after all, 0x137 is special cased in the keyboard
backlight code.
One approach could be to make the default setting handle based with
again 0x137 being different from all others.

-- 
mattia
:wq!
