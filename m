From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for Fujitsu e7x6
Date: Wed, 29 Jun 2016 18:38:38 +0300
Message-ID: <87k2h8qa2p.fsf@intel.com>
References: <20160623111819.GA4284@eudyptula.hq.kempniu.pl> <576BD150.6050304@fbihome.de> <20160623123506.GA4461@eudyptula.hq.kempniu.pl> <576C1B0C.5050206@fbihome.de> <20160624071224.GA5289@eudyptula.hq.kempniu.pl> <576CFBC6.2000309@fbihome.de> <20160624102024.GA5461@eudyptula.hq.kempniu.pl> <576D5523.7030309@fbihome.de> <20160624201737.GA5843@eudyptula.hq.kempniu.pl> <20160625085052.GA5137@marvin.atrad.com.au> <20160625091522.GA6423@eudyptula.hq.kempniu.pl> <5770E484.4030009@fbihome.de> <87por0qenj.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:54108 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752808AbcF2Pir convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 11:38:47 -0400
In-Reply-To: <87por0qenj.fsf@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>, =?utf-8?B?TWljaGHFgiBLxJlw?= =?utf-8?B?aWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org, intel-gfx@lists.freedesktop.org, "Lankhorst, Maarten" <maarten.lankhorst@intel.com>

On Wed, 29 Jun 2016, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 27 Jun 2016, Jan-Marek Glogowski <glogow@fbihome.de> wrote:
>> Am 25.06.2016 um 11:15 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>>>>> ...though if you think about it, the whole thing is absolutely hi=
deous:
>>>>> an *ACPI* driver requires cooperation from a *video* driver to no=
tify
>>>>> the operating system about a *key press*.
>>>>
>>>> Yeah.  On one hand I'm utterly amazed.  On the other, I've seen an=
d read
>>>> about other really bizarre things which go on in the BIOSes of com=
puters
>>>> over the years, so nothing really surprises me anymore. :-)
>>>=20
>>> Yes, I am a rookie in this field, so perhaps I simply have not seen
>>> enough weirdness yet to just get over something like this.
>>>=20
>>>> My understanding based on this latest information is that the patc=
h to the
>>>> i915 driver fixes the brightness control on these laptops and that=
 no
>>>> changes to fujitsu-laptop are required for this.  Is this correct?
>>>=20
>>> This is my understanding as well.
>>
>> Yup. AFAIK the patchset registers the active output ports of the gra=
phic
>> chip within ACPI, and this is checked by the brightness keys EC, so =
if
>> the port of the display is disabled, the keys don't work.
>
> I take it you refer to series at [1]. Sadly, I haven't had the time t=
o
> figure out a proper solution to patch 5/5 yet. Maarten, if you have a
> moment of inspiration, go for it! ;)

Okay, I pushed the first three patches, and updated the other two
[1]. Please test.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/4783/

>
> Anyway, someone somewhere thought it's a great idea to filter out
> backlight key events at the firmware (possibly AML) level if the flat
> panel is not active. It's not a decision in in either i915 or ACPI
> driver. In Linux, the obvious thing to have done is to defer all such
> policy to userspace. Just provide the mechanism, and the userspace wi=
ll
> figure out what to do with the keypress. Seriously, someone could hav=
e
> used that information to change the brightness of the *external*
> display. But can't have that. </rant>. So in the driver we'll just ha=
ve
> to tell ACPI what outputs are active. That's what the patches are abo=
ut.
>
> BR,
> Jani.
>
>
> [1] http://mid.gmane.org/cover.1465810007.git.jani.nikula@intel.com
>
>
>
>>
>> So no additional change is needed, as long as it just has to work in=
 X11.
>>
>> And I just realized the events are generated on key release, which f=
eels
>> strange, but since we don't get press and release events, stuff like
>> auto-repeat for brightness wouldn't work.
>>
>>>> As to
>>>> the touch keys, it sounds like this might be a BIOS thing to - is =
it?
>>>=20
>>> Are you referring to the "touchpad toggle" key?  If you are, I will=
 soon
>>> post a patch adding support for this key so that Jan-Marek can test=
 it.
>>> I just need to find some time to actually write it.
>>
>> This needs a small patch. But getting the keycode into X11 seems to =
be
>> impossible, as X / xev can't handle keycodes > 255 (KEY_TOUCHPAD_TOG=
GLE).
>>
>> I'm currently running evrouter, to call a script on the event, which
>> dis-/enables the input device using xinput. I would definitely prefe=
r
>> any HW or kernel driver solution. I couldn't find a way to map the 5=
30
>> keycode to something < 255 to suit xev and skip the evrouter. Maybe
>> Fujitsu will offer a better solution.
>>
>> Regards,
>>
>> Jan-Marek

--=20
Jani Nikula, Intel Open Source Technology Center
