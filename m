From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Tue, 24 May 2016 16:32:48 -0400
Message-ID: <CA+A7VXW8qCu-j4QGoDBZUym+sEsXgkzPTVTv7A4UoSDe+D1mig@mail.gmail.com>
References: <1459544569-29865-1-git-send-email-list@eworm.de>
 <20160505234247.GG2113@f23x64.localdomain> <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
 <CAKErNvrs4300M+ap+O1R-44z_EE97O=hk74nOGT+MSsVmfL6Ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.161.176]:34328 "EHLO
	mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754710AbcEXUd3 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 16:33:29 -0400
Received: by mail-yw0-f176.google.com with SMTP id c127so28004571ywb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2016 13:33:28 -0700 (PDT)
In-Reply-To: <CAKErNvrs4300M+ap+O1R-44z_EE97O=hk74nOGT+MSsVmfL6Ew@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com

On 19 May 2016 at 05:17, Maxim Mikityanskiy <maxtram95@gmail.com> wrote=
:
> 2016-05-16 19:04 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.=
com>:
>>
>> Adding Maxim Mikityanskiy and Hans de Goede to CC.
>>
>> On 5 May 2016 at 19:42, Darren Hart <dvhart@infradead.org> wrote:
>> > On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse wrote:
>> >> From: Christian Hesse <mail@eworm.de>
>> >>
>> >> When Lenovo Yoga 700 is flipped to tablet mode it emmits event 10=
=2E Let's
>> >> send touchpad key codes so software can disable touchpad.
>> >>
>> >> Signed-off-by: Christian Hesse <mail@eworm.de>
>> >> Signed-off-by: Michael Gisbers <michael@gisbers.de>
>> >
>> > Queued, thanks.
>> >
>> >> ---
>> >>  drivers/platform/x86/ideapad-laptop.c | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/plat=
form/x86/ideapad-laptop.c
>> >> index be3bc2f..1d49db1 100644
>> >> --- a/drivers/platform/x86/ideapad-laptop.c
>> >> +++ b/drivers/platform/x86/ideapad-laptop.c
>> >> @@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_handle h=
andle, u32 event, void *data)
>> >>                       case 6:
>> >>                               ideapad_input_report(priv, vpc_bit)=
;
>> >>                               break;
>> >> +                     case 10:
>> >>                       case 5:
>> >>                               ideapad_sync_touchpad_state(priv);
>>
>> I'm not sure this is the right action here: ideapad_sync_touchpad()
>> sends a sequence of KEY_TOUCHPAD_DISABLE and KEY_TOUCHPAD_ENABLED,
>> which are interpreted by userspace as "the touchpad has been
>> {dis,en}abled by the hardware". The way userspace is expected to rea=
ct
>> to it is by showing a notification of the fact to the user, but not
>> disabling the touchpad. This behavior can be confirmed in the origin=
al
>> commit message that introduced this change (I couldn't find any actu=
al
>> documentation on this): "Input: add keycodes for touchpad on/off key=
s"
>> (0417596f66). I was actually going to propose a patch similar to Han=
s'
>> "ideapad-laptop: Disable touchpad interface on Yoga models"
>> (f79a901331) for the Yoga 900, to avoid an "touchpad ON" OSD
>> notification being shown to the user when returning for suspend.
>>
>> Also, I've been investigating touchpad-related problems in the Lenov=
o
>> Yoga 900 recently, and trying to understand this code. IIUC
>> ideadpad_sync_touchpad_state() was created as part of "ideapad: add
>> Lenovo IdeaPad Z570 support (part 2)" (07a4a4fc8) to allow userspace
>> to syncronize a touchpad-state-indicator LED with the actual touchpa=
d
>> state, although it seems to me it only works if the touchpad is alwa=
ys
>> enabled by the hardware on resume (cc'ing the original patch author
>> here for maybe a confirmation on how this is expected to work).
>
> This is a short explanation of this function.
>
> We call ideapad_sync_touchpad_state when a touchpad state changed
> event arrives (touchpad on/off button pressed) or we need to read  ou=
t
> the initial touchpad state. It is also called on resume because
> possibly the touchpad state may be changed after resume, but I don't
> know which devices behave like that (and unfortunately I'm unable to
> test it on my Z570 because now it's dead).
>

So if I'm following this correctly, on some ideapads (Z570 and maybe
others) there is a ACPI notification when the touchpad on/off hotkey
is pressed, is that correct? This is not what I see on the Yoga 900 or
the Yoga 3, but a special scancode (0xbf on the Yoga 900, 0xbe on the
Yoga 3) come through the AT keyboard device. So here I'm using hwdb to
map these to KEY_TOUCHPAD_TOGGLE (pending upstream submission to
udev).

> ideadpad_sync_touchpad_state serves several purposes:
>
> - It actually reads out current touchpad state. It is necessary when
> we are reading the initial state, and also this read is necessary on
> touchpad state changed events, because on some laptops (e.g. Z570)
> touchpad LED only changes its state after this read.
>

On the Yogas I've been testing this the state being read on
ideapad_sync_touchpad_state() never changes, so even if I press the
touchpad disable/enable hotkey before suspending, I always get
KEY_TOUCHPAD_ON.

> - Then it disables/enables i8042 AUX port to disable/enable touchpad.
> It is also necessary, because some laptops (Z570) do not disable
> touchpad in hardware although they are storing touchpad state.
>

Ok, but this will only work if the touchpad is connected through that
bus. On the Yoga 900 and Yoga 3 the are connected via I2C, and I guess
this might be true for other machines as well.

> - Finally it sends userspace event with new touchpad state. It does
> not send a sequence of KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON as you
> mentioned, but only one of these key codes.
>

Right, I got confused when I wrote this email by the comments in the
function implementation, but when I checked with evtest I did see only
one event being sent, indeed.

> The second point is kinda hack. In Linux there are two ways of
> reporting touchpad state events to the userspace:
>
> - KEY_TOUCHPAD_TOGGLE for those laptops that do not disable touchpad
> in hardware and thus don't store touchpad state. The userspace should
> listen for those key presses and disable/enable touchpad
> programmatically (e.g. TouchpadOff in synaptics X11 driver).
>

Yes, when the notification for the disable/enable touchpad hotkey goes
through ACPI.

> - KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF for those laptops that fully
> manage touchpad state in hardware and just report its state to the
> userspace so that notification can be shown. Userspace should not
> disable touchpad programmatically on these events, because it is
> managed by hardware and may easily get out of sync if using multiple
> user sessions.
>

Yes, and that is what I tried to explain on my previous comment. In
this case userspace will usually want to notify the user that the
touchpad state has been changed.

> Ideapad Z570 matches none of these options. It looks more like the
> second one, it stores the touchpad state in hardware, controls the
> LED, but it lacks the ability to disable the touchpad in hardware. So
> we need to keep track of the hardware state and disable i8042 AUX por=
t
> from the driver when necessary.
>

Isn't the case that what it actually stores under VPCCMD_R_TOUCHPAD is
only the touchpad LED state? If so, wouldn't it work if when ACPI
notifies the kernel of event 5 (the touchpad disable/enable key has
been pressed) we simply sent KEY_TOUCHPAD_TOGGLE to userspace? I'm not
entirely sure what would be best way to keep the LED in sync with the
touchpad state in that case, the only way I can think of if to expose
the LED to userspace so it can update it accordingly.

> So if on event 10 the touchpad state may be changed, we need to call
> ideadpad_sync_touchpad_state, otherwise I don't see why it is
> necessary.
>

The commit message on the original commit on this thread says "Let's
send touchpad key codes so software can disable touchpad.", but as we
just discussed userspace is not supposed to disable the touchpad on
KEY_TOUCHPAD_DISABLE, so I guess it falls under the same category as
the IdeaPad Z570: the touchpad is connected via i8042 and it has a
variable in ACPI to store the touchpad LED state.

It seems to me that at least we should have some quirks in place so
this only gets executed on hardware where it will actually work, to
avoid notifying userspace of touchpad events when there were actually
none. Darren, what do you think is the best way to move forward here?
If we can reach an agreement I can provide some patches for this.

> Fell free to ask me any questions if something is still not clear,
> I'll try to assist.
>

Thank you very much for taking the time to explain how this piece of
code currently works, and sorry for a bit of confusion in my previous
message.

Regards,

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
