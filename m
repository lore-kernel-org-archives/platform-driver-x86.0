From: Nish Aravamudan <nish.aravamudan@gmail.com>
Subject: "special" key when Lenovo Yoga 900 in tablet mode
Date: Tue, 15 Dec 2015 11:27:42 -0800
Message-ID: <CAOhV88N1A3Y2BfBsUNhQ8PNM42teJdDrx-r4GdzkV2U6Y3cwww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:37303 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754133AbbLOT1n (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Dec 2015 14:27:43 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

So the Lenovo Yoga 900 has 4 "modes" (laptop, tent, stand and tablet).
In tablet mode, it appears that the following is printed roughly every
second:

atkbd serio0: Unknown key pressed (translated set 2, code 0xbf on
isa0060/serio0).
atkbd serio0: Use 'setkeycodes e03f <keycode>' to make it known.
ideapad_laptop: Unknown event: 1
atkbd serio0: Unknown key released (translated set 2, code 0xbf on
isa0060/serio0).
atkbd serio0: Use 'setkeycodes e03f <keycode>' to make it known.
ideapad_laptop: Unknown event: 1

What I would like to do is rotate the screen when I see the unknown
key (a la https://gist.github.com/emiller/6488449), although that's not
super-efficient, but is fine. But I'm wondering if the ideapad event
should actually be properly handled and how that would be done? I
guess it could also just emit a key like the other ideapad values?

Thanks,
Nish
