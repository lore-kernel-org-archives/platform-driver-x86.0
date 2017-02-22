From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: LED devices & poll() for brightness attribute
Date: Wed, 22 Feb 2017 13:39:29 +0100
Message-ID: <20170222123929.GD21558@pali>
References: <20170222090630.GB21558@pali>
 <20170222122557.GA3807@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170222122557.GA3807@amd>
Sender: linux-leds-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 22 February 2017 13:25:57 Pavel Machek wrote:
> Hi!
> 
> > But this support is useful just for one single central userspace
> > application which will control all leds in system other application
> > which will change state by /sys/class/leds/ will de-synchronize that one
> > central application.
> 
> Yes. Does it matter for some real use case?

Yes. E.g. systemd has already some support for changing leds. And I do
not want to be forced to use systemd (or any other specific application)
just because it already controls leds.

And my own application for controlling leds should know current state of
them if it is possible.

> > So I think new ABI is not sufficient and I would propose to add poll()
> > support also for changes done by userspace, write() to attribute
> > /sys/class/leds/.../brightness.
> 
> Not easily possible, as we have triggers, and this was discussed in
> great great lengths before. Please go through that discussion.

Without triggers and blinking it should be possible.

Just notify only when some application do echo > brightness.

-- 
Pali Rohár
pali.rohar@gmail.com
