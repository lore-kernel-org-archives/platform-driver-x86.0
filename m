From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: LED devices & poll() for brightness attribute
Date: Fri, 24 Feb 2017 09:50:55 +0100
Message-ID: <20170224085055.GA2157@pali>
References: <20170222090630.GB21558@pali>
 <20170223144852.GD24201@pali>
 <20170223202333.GA19376@amd>
 <201702232144.54558@pali>
 <20170223210321.GB19376@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35783 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751218AbdBXI5s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2017 03:57:48 -0500
Content-Disposition: inline
In-Reply-To: <20170223210321.GB19376@amd>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Thursday 23 February 2017 22:03:21 Pavel Machek wrote:
> So, if you seriously want to do this, can you
> 
> 1) write specification explaining how desktops should poll() the
> brightness files
> 
> 2) get someone to volunteer to implement that specification for at
> least GNOME and KDE?

Hm... Probably I should try to implement it myself :-) and look deeply
what I'm proposing...

Hans, you probably already did some changes for hw brightness changed
attribute... Do you have some links or application parts which handle
this for GNOME, KDE or other DE? So I could look at correct application?

IIRC KDE4 uses upowerd for controlling keyboard backlight.

-- 
Pali Rohár
pali.rohar@gmail.com
