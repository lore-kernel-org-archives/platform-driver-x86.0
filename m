From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Thu, 21 Jun 2018 13:30:31 +0200
Message-ID: <20180621113031.gv53yv3g46uaetwm@pali>
References: <s5hk1r01acc.wl-tiwai@suse.de>
 <20180615190959.pqipwnm6a3tf3lxc@pali>
 <s5hmuvvtdmi.wl-tiwai@suse.de>
 <20180616154309.ualrx2py6ndr5xgz@pali>
 <s5hh8m2u3cp.wl-tiwai@suse.de>
 <20180618102806.vwm4rhvxhn6hi43z@pali>
 <s5ha7rsz8i8.wl-tiwai@suse.de>
 <20180618112121.cl76a3oozsbbbqnb@pali>
 <20180618112618.hcwiacfzzu4swwd2@pali>
 <s5h1sd4xg3t.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <s5h1sd4xg3t.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 18 June 2018 17:35:18 Takashi Iwai wrote:
> On Mon, 18 Jun 2018 13:26:18 +0200,
> Pali Rohár wrote:
> > 
> > On Monday 18 June 2018 13:21:21 Pali Rohár wrote:
> > > Now I see that in Debian backports is some 4.16.12 kernel version. I can
> > > try this one (and later compile one from Linus tree).
> > 
> > Tested, this version is working fine and leds works as expected. And now
> > also snd_hda_codec_realtek is loaded.
> 
> Good to hear :)
> 
> Below are test patches to allow user choosing the mic mute LED
> behavior on Thinkpad, too.  Note: totally untested!
> 
> Let me know if these work for you.

I applied them to Debian's kernel (with slightly modification) and they
are working fine. Via "alsamixer -c 0" I can change "Mic Mute-LED Mode"
to "Follow Capture" and then led is ON only when microphone is ON.
Recording from microphone is working in both configurations.

If testing with Debian's kernel is enough, you can add my:

Tested-by: Pali Rohár <pali.rohar@gmail.com>

Anyway, (this question is also for Henrique), what can we do with MUTE
led to work? Support for controlling it was there, but was revered in
commit 3530febb5c7636f6b26d15637f68296804d26491.

-- 
Pali Rohár
pali.rohar@gmail.com
