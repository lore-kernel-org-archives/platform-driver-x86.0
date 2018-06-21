From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Thu, 21 Jun 2018 13:37:39 +0200
Message-ID: <20180621113739.24smnyxma2g2yjdt@pali>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
 <20180615113728.h7snxhe2juaqvjyx@pali>
 <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
 <20180615190915.cdntdeesc52ei35u@pali>
 <20180615233628.gy2ffgupctheyqof@khazad-dum.debian.net>
 <20180618101144.l5azlrg5jq32fpbf@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618101144.l5azlrg5jq32fpbf@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: Pavel Machek <pavel@ucw.cz>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Takashi Iwai <tiwai@suse.de>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 18 June 2018 12:11:44 Pali Rohár wrote:
> On Friday 15 June 2018 20:36:28 Henrique de Moraes Holschuh wrote:
> > On Fri, 15 Jun 2018, Pali Rohár wrote:
> > > means set. What is SHDA doing, I have not figured out. It does not
> > 
> > Look at the HDA mixer state, SHDA is likely to be directly messing with
> > it.
> 
> Now I found following email thread between you and Alex with patch which
> configures HDA mixer via that SHDA method:
> 
> https://www.spinics.net/lists/platform-driver-x86/msg03206.html
> 
> But looks like that patch was never included into mainline kernel...
> 
> Seems it would be needed in some part (to not break older Thinkpads) for
> that LED support in alsa mixer about which Takashi Iwai wrote.

Hi Alex, do you have other details or documentation for your patch
"thinkpad_acpi: added BIOS mute interfaces for volume" (linked above)
which you sent to platform-driver-x86 list 6 years ago?

It calls SHDA thinkpad ACPI function and I would like to know more what
is this function doing...

-- 
Pali Rohár
pali.rohar@gmail.com
