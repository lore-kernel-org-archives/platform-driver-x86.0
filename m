From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Fri, 15 Jun 2018 09:30:07 -0300
Message-ID: <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
 <20180615113728.h7snxhe2juaqvjyx@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180615113728.h7snxhe2juaqvjyx@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 15 Jun 2018, Pali Rohár wrote:
> Henrique, any idea why there are no exported led classes for mute and
> micmute? And how are suppose to be controlled?

I have to look into the code, it was contributed by someone who had
access to the proper hardware to test it.

But the way *I* would like it to work is this:

1. When implemented in *hardware* or *EC*, let the hardware and EC take
   full control, and never allow the operating system to mess with it.
   So, it becomes much harder for that LED to "lie".

2. Otherwise implement it in-kernel, so that userspace cannot unmute
   when the human has activated the "mute" switch, and the LED cannot be
   controlled by userspace to lie (report mute when it is not mute).

It might, or might not be possible to achieve the above.

> > With thinkpad_acpi.ko unloaded, hardware drives the LEDs, so nothing
> > for us to do...
> 
> So somehow tell thinkpad_acpi.ko to let hardware control those LEDs when
> thinkpad_acpi.ko is loaded?

I.e. look into the DSDT and XSDT, to find out what it is doing.  It will
be there: it is very rare for the thinkpad EC itself to implement these
behavior changes.

-- 
  Henrique Holschuh
