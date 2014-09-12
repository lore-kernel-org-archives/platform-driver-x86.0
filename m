From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [ibm-acpi-devel] [PATCH v5] thinkpad-acpi: Improve hardware
 volume controls
Date: Fri, 12 Sep 2014 16:14:12 -0700
Message-ID: <CAObL_7EiSuP=vYo7sFF-0UxuO37Q_pNV6g5P5cwUe9oZuuTiFg@mail.gmail.com>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <CAObL_7F-w3f8R039JcenMeGpWx3dXrb6V3tVgxny7SJy717NNQ@mail.gmail.com> <20140912230344.GA8502@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33226 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752370AbaILXOe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Sep 2014 19:14:34 -0400
Received: by mail-lb0-f173.google.com with SMTP id w7so1751829lbi.32
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Sep 2014 16:14:33 -0700 (PDT)
In-Reply-To: <20140912230344.GA8502@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Fri, Sep 12, 2014 at 4:03 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Fri, 12 Sep 2014, Andrew Lutomirski wrote:
>> > This behavior is unfortunate, since modern userspace will also
>> > handle the hotkeys and change the other mixer.  If the software
>> > mixer is muted and the hardware mixer is unmuted and you push mute,
>> > hilarity ensues as they both switch state.
>>
>> This patch seems to have fallen into oblivion.  My X220s still has
>
> Mostly because I was out of time to review it due to its size, and ended up
> forgetting about it.  I am deeply sorry about that.

No problem.

>
> We can bring this patch back into the light, though.
>
>> screwy mute controls.  (To reproduce in GNOME 3, get into an unmuted,
>> nonzero volume state, then press volume down a bunch of times until a
>> mute icon shows up, then press mute, then press volume up.  You are
>> now have no sound until you fiddle with the hardware controls a bunch
>> and undo it.)
>>
>> I can rebase this to 3.17-whatever, but I'm also somewhat inclined to
>> get rid of all the compatibility bits and just modify the driver to
>> force all Thinkpads into nonmagical software-only mode.  The latter
>> approach will be *much* simpler
>
> Changing the behaviour on the newer ones is okay, but not the old ones
> (where old == not broken).  That would be a regression.

I think that v5 doesn't change behavior anywhere except for fixing
broken things.  I could easily be wrong, though.

I kind of suspect that all laptops that don't default to the "none"
mode are at least a little bit broken, though.  Any laptop on which
pressing mute mutes the hardware mixer *and* sends KEY_MUTE is going
to screw up if any modern GUI volume manager is running.

>
> Syncing the hardware and software mute gating is fine, though, as long as
> they are always kept in sync.  If "toggle mode" is much easier to implement
> than the v5 version of your patch, we could try that.

Do you mean getting rid of latch mode and only keeping "none" and
"toggle"?  I don't think that would be much simpler.  The issue (from
rather stale memory) is that, if the mute button is programmed in
either of the EC-controlled modes, the only notification from the EC
that it just twiddled the mute state is either nothing at all (in
which case we have no way to notify ALSA that anything happened) or a
KEY_MUTE event (which confuses volume managers and is annoying to
handle in the driver).

So most of the complexity is in the code that eats KEY_MUTE events and
does the right thing with them.  I think that this is needed to get
"latch" and "toggle" right.

TBH, anyone running newish userspace probably wants the completely
non-magical "none" behavior.  PulseAudio seems to do the right thing
if the mute button generates KEY_MUTE and does nothing else.  I'm not
entirely convinced that there's any need to support the other modes,
but maybe I'm missing something, or maybe there are users with no
KEY_MUTE handler, or maybe there are users that just really like the
latching behavior where pressing the mute button never unmutes.

--Andy
