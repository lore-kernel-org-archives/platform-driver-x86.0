From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Wed, 27 Jul 2016 16:07:54 -0700
Message-ID: <CAKdAkRRG8DwofYxcGe8dQmFAg86b8gcWM3pMAp0pv=VwBO-ZQg@mail.gmail.com>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
 <201607271805.57123@pali> <13ec06e37e284263b6bf4fe4a6a04a78@ausx13mpc120.AMER.DELL.COM>
 <201607272215.12385@pali> <20160727224338.GA36353@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:33587 "EHLO
	mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1163142AbcG0XH4 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2016 19:07:56 -0400
In-Reply-To: <20160727224338.GA36353@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Mario Limonciello <Mario_Limonciello@dell.com>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

Hi Darren,

On Wed, Jul 27, 2016 at 3:43 PM, Darren Hart <dvhart@infradead.org> wro=
te:
> Dmitry, we'd appreciate your thoughts as the input maintainer on a qu=
estion
> below (left the thread in tact so you have all the context).
>
> On Wed, Jul 27, 2016 at 10:15:12PM +0200, Pali Roh=C3=A1r wrote:
>> On Wednesday 27 July 2016 21:03:57 Mario_Limonciello@dell.com wrote:
>> > > -----Original Message-----
>> > > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
>> > > Sent: Wednesday, July 27, 2016 11:06 AM
>> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
>> > > Cc: dvhart@infradead.org; linux-kernel@vger.kernel.org;
>> > > platform-driver- x86@vger.kernel.org
>> > > Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged
>> > > 2-in-1s
>> > >
>> > > On Wednesday 27 July 2016 17:55:09 Mario_Limonciello@dell.com wr=
ote:
>> > > > > Hi! I'm not sure if KEY_PROG1/2/3 are good names here as we
>> > > > > already use
>> > > > >
>> > > > >those for other actions (see bios_to_linux_keycode). Also the=
re
>> > > > >is:
>> > > > I had missed this, do you have some recommendations on what wo=
uld
>> > > > be better codes to map this to?
>> > >
>> > > Problem is that I do not know when those KEY_PROG keys from
>> > > bios_to_linux_keycode table are emitted. There are missing comme=
nts
>> > > or description.
>> > >
>> > > Are you able to find out description for all those keys in that
>> > > table? Maybe now (when linux key constants are extended), there
>> > > could be better candidates...
>> >
>> > I'll ask around.  It's not immediately obvious to me though, maybe
>> > from old specs?
>>
>> Do not know if it is old. At least some codes from it are used on my
>> E6440 machine. Table itself was added by Rezwanul Kabir in this comm=
it:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D5ea2559726b786283236835dc2905c23b36ac91c
>>
>> Maybe commit message could help you to indentify what it is...
>>
>> > > > I'll double check what the things that "were" mapping to
>> > > > KEY_PROG1 etc actually were.  This might be a case of an
>> > > > expected clash if the functions aren't in current generations.
>> > > >
>> > > > >/* Wifi Catcher */
>> > > > >
>> > > > > { KE_KEY,    0xe011, { KEY_PROG2 } },
>> > > >
>> > > > It's worth mentioning that Wifi Catcher hasn't been used for a=
ny
>> > > > Dell laptops for a handful generations.  The rugged 2in1's are
>> > > > current generation that have these programmable buttons and
>> > > > don't have wifi catcher.
>> > >
>> > > Anyway, what is "Wifi Catcher"? HW switch buttton which
>> > > enable/disable wifi? Or something else?
>> >
>> > Wifi catcher was a special hardware switch slider switch.  When th=
e
>> > machine was turned in S3 the sliding the switch beyond the on
>> > position would scan for available wifi networks and light up an LE=
D
>> > if some from your predefined list were found.
>> >
>> > When the machine was on, it would open up the applet that let you
>> > configure the behavior for the switch in S3.
>>
>> Hm... maybe it better fit KEY_WLAN then? Just speculation.
>>
>> > > > So there should be no "real" clash here.
>> > >
>> > > Problem can be in future. This driver is unified for all Dell
>> > > products with wmi interface and so future product could do some
>> > > nasty things...
>> >
>> > I agree with Darren here.
>> >
>> > At least on Dell side we're creating new codes for "new" buttons a=
nd
>> > the limitation is really on the kernel side for how many KEY_PROG#
>> > or similar functions they can be re-assigned to.
>>
>> Ok.
>>
>> > Maybe it's time to think of another way to get this information to
>> > userspace rather that always translating them into key codes?
>>
>> If event is generated by pressing key, button or hw switch, then inp=
ut
>> key is correct way. If there is no KEY define which fit for new vend=
or
>> hw button, then I think we should start discussion with input subsys=
tem
>> how to handle such situation.
>>
>> > There's a lot that are marked as KE_IGNORE because the kernel can'=
t
>> > do anything interesting with them as no 1-1 mapping exists to a
>> > keycode.
>>
>> Most marked as KE_IGNORE are because duplicate event is sent via
>> keyboard controller or via other subsystem (e.g. rfkill).
>>
>> But events which are not keys or buttons should not be sent via inpu=
t
>> devices. At least I think it is against usage of input devices.
>>
>> Events like "battery was removed" or "keyboard backlight was changed=
" or
>> "battery lifetime decreased under X %" can be useful for userspace
>> applications. I agree. But I think we do not have any subsystem or
>> interface for sending them from kernel to userspace.
>>
>> If we start talking about creating interface for it, I would rather =
see
>> something more generic, not Dell-only specific or created specially =
for
>> Dell machines which will not fit for others...
>>
>> Darren, what do you think about it?
>
> It sounds like a good Kernel Summit topic... and they just happen to =
have the
> call for topics going on right now... first step would be to get the =
input
> maintainers thoughts...
>
> +Dmitry Torokhov
>
> Dmitry, what are your thoughts with respect to handing events up to u=
serspace
> which are not strictly key presses via the input system? Pali's sugge=
stion makes
> sense to me - do you think this is something we should discuss at KS.=
=2E. or is
> this already decided and can you set us straight?

So here is what I believe:

- Stuff that are not keys/buttons/switches/other bits of hardware
directly manipulated by user, but rather state change notifications
should not be delivered via input subsystem

- Even if something is a key/button/switch it does not necessarily
need to be sent through input subsystem or we may want to wait until
we add a new input event. This is because vendors love to come up with
"value add" features that require vendor specific driver that noone
ends up using. I mean, for the "WiFi catcher" do you have any kind of
numbers for the users of the feature?

- In the same vein, we can come up with something generic to shuffle
the crap over to userspace ("com.vendor.crap.morecrap..." over
connector? I think I just threw into my mouth a little), but do we
have consumer for this?

Actually it might be fun topic to discuss at KS, even if in hallway
only. We might end up deciding that we should work events that make
sense generically into existing subsystems and leave "value add"
suppressed.

Thanks.

--=20
Dmitry
