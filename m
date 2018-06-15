From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Fri, 15 Jun 2018 20:36:28 -0300
Message-ID: <20180615233628.gy2ffgupctheyqof@khazad-dum.debian.net>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
 <20180615113728.h7snxhe2juaqvjyx@pali>
 <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
 <20180615190915.cdntdeesc52ei35u@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180615190915.cdntdeesc52ei35u@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 15 Jun 2018, Pali Rohár wrote:
> This means that kernel should not export any led class device. Or when
> exported, then "set" operation should always fail.

"not export" is right.

> > 2. Otherwise implement it in-kernel, so that userspace cannot unmute
> >    when the human has activated the "mute" switch, and the LED cannot be
> >    controlled by userspace to lie (report mute when it is not mute).
> 
> This looks like a good candidate to use led "trigger" interface. Create
> a mute trigger and attach it to that led device.

Maybe, as long as done in-kernel and not possible to mess with from
userspace.

> means set. What is SHDA doing, I have not figured out. It does not

Look at the HDA mixer state, SHDA is likely to be directly messing with
it.

-- 
  Henrique Holschuh
