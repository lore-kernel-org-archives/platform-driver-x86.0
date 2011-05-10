From: Colin Guthrie <gmane-D409yXkIzt2rnn0nCzrM/w@public.gmane.org>
Subject: Re: [Regression] Problem with rfkill on 2.6.38
Date: Tue, 10 May 2011 16:12:00 +0100
Message-ID: <4DC955C0.2040905@colin.guthr.ie>
References: <ip6j66$o5f$1@dough.gmane.org> <1304930195.3475.17.camel@jlt3.sipsolutions.net> <4DC81FC7.9040503@colin.guthr.ie> <20110509171144.GA7194@srcf.ucam.org> <4DC9072D.4030103@colin.guthr.ie> <BANLkTinVwnSei_VobfKtgzrwSP+cJSvxaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTinVwnSei_VobfKtgzrwSP+cJSvxaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <keng-yu.lin-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Backlund <tmb-odJJhXpcy38dnm+yROfE0A@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

'Twas brillig, and Keng-Y=C3=BC Lin at 10/05/11 15:48 did gyre and gimb=
le:
> On Tue, May 10, 2011 at 11:36 AM, Colin Guthrie <mageia-D409yXkIzt1YnqJbiw7iEA@public.gmane.org=
e> wrote:
>> 'Twas brillig, and Matthew Garrett at 09/05/11 18:11 did gyre and gi=
mble:
>>> On Mon, May 09, 2011 at 06:09:27PM +0100, Colin Guthrie wrote:
>>>
>>>> Just a quick (non-compile) followup from my last email... blacklis=
ting
>>>> the dell-laptop module works around the issue, so I think the comm=
it
>>>> previously mentioned is indeed the culprit (as it's the only recen=
t
>>>> commit and does fiddle with the rfkill stuff).
>>>>
>>>> Not sure what the best track forward is, but it's certainly a
>>>> regression, so should probably be fixed or reverted until a more
>>>> complete fix is found.
>>>
>>> If you can confirm that with a build then I'll do that.
>>
>> ACK. Reverting that commit and unblacklisting the dell_laptop module
>> restores the previous, working functionality. I've flipped rfkill a =
few
>> times and it's always worked fine.
>>
>=20
> May I have the model of your Dell laptop?

Absolutely! I have a Inspiron 6400 MM061. The WIFI PCI card is an after
market addition (upgrade from bg only to agn), but I suspect that
particular detail is unimportant.

> dell_latop has a debugfs node in /sys/kernel/debug/dell_latop/rfkill,
> can you attach the logs at both the moment when the radio devices are
> enabled and disabled? the output of the command `rfkill list` at both
> moments will helpful too.

OK, do you want this on the previous kernel (with the problem commit in
it) or the one when I've reverted it?

Here is the info from the reverted kernel (as I'm running it now!):

Wifi+BT starts enabled.


status: 0x1030C
Bit 0 : Hardware switch supported:   0
Bit 1 : Wifi locator supported:      0
Bit 2 : Wifi is supported:           1
Bit 3 : Bluetooth is supported:      1
Bit 4 : WWAN is supported:           0
Bit 5 : Wireless keyboard supported: 0
Bit 8 : Wifi is installed:           1
Bit 9 : Bluetooth is installed:      1
Bit 10: WWAN is installed:           0
Bit 16: Hardware switch is on:       1
Bit 17: Wifi is blocked:             0
Bit 18: Bluetooth is blocked:        0
Bit 19: WWAN is blocked:             0

hwswitch_state: 0x3
Bit 0 : Wifi controlled by switch:      1
Bit 1 : Bluetooth controlled by switch: 1
Bit 2 : WWAN controlled by switch:      0
Bit 7 : Wireless switch config locked:  0
Bit 8 : Wifi locator enabled:           0
Bit 15: Wifi locator setting locked:    0


$ rfkill list
0: dell-wifi: Wireless LAN
  Soft blocked: no
  Hard blocked: no
1: dell-bluetooth: Bluetooth
  Soft blocked: no
  Hard blocked: no
3: phy0: Wireless LAN
  Soft blocked: no
  Hard blocked: no
8: hci0: Bluetooth
  Soft blocked: no
  Hard blocked: no




<PRESS SWITCH TO DISABLE>


status: 0x6030C
Bit 0 : Hardware switch supported:   0
Bit 1 : Wifi locator supported:      0
Bit 2 : Wifi is supported:           1
Bit 3 : Bluetooth is supported:      1
Bit 4 : WWAN is supported:           0
Bit 5 : Wireless keyboard supported: 0
Bit 8 : Wifi is installed:           1
Bit 9 : Bluetooth is installed:      1
Bit 10: WWAN is installed:           0
Bit 16: Hardware switch is on:       0
Bit 17: Wifi is blocked:             1
Bit 18: Bluetooth is blocked:        1
Bit 19: WWAN is blocked:             0

hwswitch_state: 0x3
Bit 0 : Wifi controlled by switch:      1
Bit 1 : Bluetooth controlled by switch: 1
Bit 2 : WWAN controlled by switch:      0
Bit 7 : Wireless switch config locked:  0
Bit 8 : Wifi locator enabled:           0
Bit 15: Wifi locator setting locked:    0


$ rfkill list
0: dell-wifi: Wireless LAN
  Soft blocked: yes
  Hard blocked: yes
1: dell-bluetooth: Bluetooth
  Soft blocked: yes
  Hard blocked: yes
3: phy0: Wireless LAN
  Soft blocked: no
  Hard blocked: yes


> In my experience that different models of Dell laptop may have
> different reaction/behaviour on the rfkill handling. Reverting the
> patch may make your laptop working, but can cause others non-working.

Yes I suspect so, but as this is still a regression in behaviour, it
should still be reverted by policy I believe (not that it shouldn't be
fixed properly of course!)

> It should make sense and be appreciated that you attach more debug
> information for investigation on the bug.

Sure, I fully appreciate the need for this. Please feel free to ask me
for any other additional details and/or testing etc.

All the best.

Col

--=20

Colin Guthrie
gmane(at)colin.guthr.ie
http://colin.guthr.ie/

Day Job:
  Tribalogic Limited [http://www.tribalogic.net/]
Open Source:
  Mageia Contributor [http://www.mageia.org/]
  PulseAudio Hacker [http://www.pulseaudio.org/]
  Trac Hacker [http://trac.edgewall.org/]
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
