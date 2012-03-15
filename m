From: Akio Idehara <zbe64533@gmail.com>
Subject: Re: [PATCH] xf86-video-intel: Add support for toshiba backlight interface
Date: Thu, 15 Mar 2012 22:20:26 +0900
Message-ID: <4F61EC9A.5070508@gmail.com>
References: <1331735859-6337-1-git-send-email-zbe64533@gmail.com> <20120314145740.GA8693@ubuntu-macmini>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:58769 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761898Ab2CONUa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 09:20:30 -0400
Received: by dadp12 with SMTP id p12so4879659dad.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Mar 2012 06:20:30 -0700 (PDT)
In-Reply-To: <20120314145740.GA8693@ubuntu-macmini>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: seth.forshee@canonical.com
Cc: chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

Seth Forshee wrote:

> On Wed, Mar 14, 2012 at 11:37:39PM +0900, Akio Idehara wrote:
>> xfce4-power-manager cannot control backlight brightness via
>> toshiba backlight sysfs interface.
>> The reason is that xf86-video-intel doesn't treat it.
>> This patch adds support for toshiba backlight sysfs interface.
>>
>> This was tested on a Toshiba Portege R500.
>>
>> Signed-off-by: Akio Idehara <zbe64533@gmail.com>
> 
> This isn't a good idea. On many (probably most) Toshibas the platform
> backlight interface is read-only. I think this patch will break more
> machines than it fixes.
> 
> I have a patch for toshiba_acpi that (among other things) makes it only
> register the backlight device if it can be written. I've just been
> sitting on it though because I haven't been able to get anyone with a
> read/write backlight interface to test it. If you'd be willing to help
> with testing then I can work on getting that patch into the kernel, then
> I wouldn't object to your patch.
> 
> Seth
> 


Hi Seth.

Thank you for telling me about this.
If I had known it, I'd never send this patch.
And I'd be happy to help with testing.
So please feel free to send me your patch!

Regards,
Akio
