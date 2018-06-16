From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Sat, 16 Jun 2018 11:12:31 -0300
Message-ID: <20180616141231.dy4mvirgeax2tviq@khazad-dum.debian.net>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
 <20180615113728.h7snxhe2juaqvjyx@pali>
 <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
 <20180615190915.cdntdeesc52ei35u@pali>
 <20180615233628.gy2ffgupctheyqof@khazad-dum.debian.net>
 <20180616073334.GA13880@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180616073334.GA13880@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 16 Jun 2018, Pavel Machek wrote:
> Question is if we want flexibility or security.

For thinkpad-acpi, it is security by default.  Flexibility is allowed as
*compile*-time (Kconfig) option, and only as long as it defaults to
secure *and* the help text is very explicit at instructing distros to
NOT enable this option.

That said, if mic-mute is under HDA mixer control, it will only be
"secure" if ALSA is also blocking userspace access to the relevant bits,
and if that is not possible to do properly, might as well go for
flexibility.  But only in that case.

That would be why I use phisical shutters on embedded webcams unless the
hardware actually airgaps them from the USB bus when the privacy switch
is active.

-- 
  Henrique Holschuh
