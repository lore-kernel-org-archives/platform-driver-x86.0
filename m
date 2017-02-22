From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: LED devices & poll() for brightness attribute
Date: Wed, 22 Feb 2017 10:06:30 +0100
Message-ID: <20170222090630.GB21558@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hello,

now in linus tree appeared new support for brightness_hw_changed sysfs
attribute which provides poll() for reporting brightness changes from
hardware itself.

But this support is useful just for one single central userspace
application which will control all leds in system other application
which will change state by /sys/class/leds/ will de-synchronize that one
central application.

On linux system it is normal that more userspace application could
change brightness level and to make them happy and synchronized with
kernel state all those application should know that there was change (by
other application) of brightness level. Currently they will know only
about change done by hardware itself.

So I think new ABI is not sufficient and I would propose to add poll()
support also for changes done by userspace, write() to attribute
/sys/class/leds/.../brightness.

-- 
Pali Rohár
pali.rohar@gmail.com
