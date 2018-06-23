From: Damjan Georgievski <gdamjan@gmail.com>
Subject: Re: [ibm-acpi-devel] ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Sat, 23 Jun 2018 14:46:39 +0200
Message-ID: <CAEk1YH7RJx8y-tcNZ5SwR9ruX_HZmH61=f4Vb+CN4zfoJM-oiw@mail.gmail.com>
References: <s5hk1r01acc.wl-tiwai@suse.de> <20180615190959.pqipwnm6a3tf3lxc@pali>
 <s5hmuvvtdmi.wl-tiwai@suse.de> <20180616154309.ualrx2py6ndr5xgz@pali>
 <s5hh8m2u3cp.wl-tiwai@suse.de> <20180618102806.vwm4rhvxhn6hi43z@pali>
 <s5ha7rsz8i8.wl-tiwai@suse.de> <20180618112121.cl76a3oozsbbbqnb@pali>
 <20180618112618.hcwiacfzzu4swwd2@pali> <s5h1sd4xg3t.wl-tiwai@suse.de>
 <20180621113031.gv53yv3g46uaetwm@pali> <CAEk1YH6-b3HtBN335XNxeYRWCCsBm52kC95_EZH3B4G-_TP5Pw@mail.gmail.com>
 <s5hvaacjrm4.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5hvaacjrm4.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 21 June 2018 at 13:39, Takashi Iwai <tiwai@suse.de> wrote:
> On Thu, 21 Jun 2018 13:35:21 +0200,
> Damjan Georgievski wrote:
>>
>> > I applied them to Debian's kernel (with slightly modification) and they
>> > are working fine. Via "alsamixer -c 0" I can change "Mic Mute-LED Mode"
>> > to "Follow Capture" and then led is ON only when microphone is ON.
>> > Recording from microphone is working in both configurations.
>>
>> hm this is the opposite of how it works on my T450s and X1, where the
>> led is ON when microphone is muted.
>> (I do wish the led would be ON when the microphone is not muted ie. listening)
>
> Don't worry, it's still the default behavior ("Follow Mute").
> Only when user chooses another mode (e.g. "Follow Capture"), the
> behavior changes.

Yeah, sorry, I didn't notice that the topic changed in the thread.

Anyways, I was intrigued and applied the patches on top of 4.18.0-rc1
and I can report it works fine on X1 Carbon (5th gen).



-- 
damjan
