From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [ibm-acpi-devel] [PATCH v5] thinkpad-acpi: Improve hardware
 volume controls
Date: Sat, 13 Sep 2014 09:13:06 -0700
Message-ID: <CAObL_7HqBrd2J6VfJxG1DODi5sP-hCwxeX+4kb6T62-ZiCNnFA@mail.gmail.com>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <CAObL_7F-w3f8R039JcenMeGpWx3dXrb6V3tVgxny7SJy717NNQ@mail.gmail.com>
 <20140912230344.GA8502@khazad-dum.debian.net> <CAObL_7EiSuP=vYo7sFF-0UxuO37Q_pNV6g5P5cwUe9oZuuTiFg@mail.gmail.com>
 <20140912233231.GA30851@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:62647 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbaIMQN2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 13 Sep 2014 12:13:28 -0400
Received: by mail-la0-f45.google.com with SMTP id b17so2567783lan.32
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2014 09:13:26 -0700 (PDT)
In-Reply-To: <20140912233231.GA30851@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, Sep 12, 2014 at 4:32 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Fri, 12 Sep 2014, Andrew Lutomirski wrote:
>> I think that v5 doesn't change behavior anywhere except for fixing
>> broken things.  I could easily be wrong, though.
>
> Well, I can test it on a T43 (old-style hardware mixer), but not on anything
> else.  I'll need to port the patch to 3.10 for that, though.
>
>> I kind of suspect that all laptops that don't default to the "none"
>> mode are at least a little bit broken, though.  Any laptop on which
>> pressing mute mutes the hardware mixer *and* sends KEY_MUTE is going
>> to screw up if any modern GUI volume manager is running.
>
> Ideed.
>
>> Do you mean getting rid of latch mode and only keeping "none" and
>> "toggle"?  I don't think that would be much simpler.  The issue (from
>
> Then let's not do it.  Latch mode is the sane one.
>
>> So most of the complexity is in the code that eats KEY_MUTE events and
>> does the right thing with them.  I think that this is needed to get
>> "latch" and "toggle" right.
>
> Well, code complexity _is_ an acceptable price to get those right if we can
> manage it.
>
>> TBH, anyone running newish userspace probably wants the completely
>> non-magical "none" behavior.  PulseAudio seems to do the right thing
>> if the mute button generates KEY_MUTE and does nothing else.  I'm not
>> entirely convinced that there's any need to support the other modes,
>> but maybe I'm missing something, or maybe there are users with no
>> KEY_MUTE handler, or maybe there are users that just really like the
>> latching behavior where pressing the mute button never unmutes.
>
> Support for the other modes is optional, as long as the old thinkpads with
> full EC-driven behaviour still keep working in latch mode (which is the only
> one they support in firmware, anyway).

I remain unconvinced that the latch and toggle modes are very useful
given the state of existing userspace code.  PulseAudio, at least,
appears to be entirely unable to understand that, if the "ThinkPad
Console Audio Control" is muted, that there won't be any sound output.
The only reason that this appears to work on current kernels is that
the hardware mute button also sends KEY_MUTE, so if you press it, you
have some chance of getting lucky and managing to keep your userspace
code in sync with the hardware.  But it's very easy to find
combinations of keypresses and drags on the GUI volume slider that
break.

If we were to try to teach ALSA that the ThinkPad hardware mute switch
were a part of the system's audio mixer, I think that all the modes
would make sense.  But, given how everything works now, I'm still
leaning toward just forcing completely software-controlled mode.

--Andy
