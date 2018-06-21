From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [ibm-acpi-devel] ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Thu, 21 Jun 2018 13:40:45 +0200
Message-ID: <20180621114045.tffl5duczhunuzcl@pali>
References: <s5hmuvvtdmi.wl-tiwai@suse.de>
 <20180616154309.ualrx2py6ndr5xgz@pali>
 <s5hh8m2u3cp.wl-tiwai@suse.de>
 <20180618102806.vwm4rhvxhn6hi43z@pali>
 <s5ha7rsz8i8.wl-tiwai@suse.de>
 <20180618112121.cl76a3oozsbbbqnb@pali>
 <20180618112618.hcwiacfzzu4swwd2@pali>
 <s5h1sd4xg3t.wl-tiwai@suse.de>
 <20180621113031.gv53yv3g46uaetwm@pali>
 <CAEk1YH6-b3HtBN335XNxeYRWCCsBm52kC95_EZH3B4G-_TP5Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEk1YH6-b3HtBN335XNxeYRWCCsBm52kC95_EZH3B4G-_TP5Pw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Damjan Georgievski <gdamjan@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 21 June 2018 13:35:21 Damjan Georgievski wrote:
> > I applied them to Debian's kernel (with slightly modification) and they
> > are working fine. Via "alsamixer -c 0" I can change "Mic Mute-LED Mode"
> > to "Follow Capture" and then led is ON only when microphone is ON.
> > Recording from microphone is working in both configurations.
> 
> hm this is the opposite of how it works on my T450s and X1, where the
> led is ON when microphone is muted.

Purpose of this patch it to allow user to configure that LED. As I wrote
above, when I *changed* "Mic Mute-LED Mode" to "Follow Capture" in
alsamixer, then led is ON when mic is ON. Default configuration (prior
changing anything) in alsamixer is "Follow Mute" when led is ON when mic
is OFF. That patch allows you to change how LED behave.

> (I do wish the led would be ON when the microphone is not muted ie. listening)

-- 
Pali Rohár
pali.rohar@gmail.com
