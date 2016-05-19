From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Thu, 19 May 2016 12:17:31 +0300
Message-ID: <CAKErNvrs4300M+ap+O1R-44z_EE97O=hk74nOGT+MSsVmfL6Ew@mail.gmail.com>
References: <1459544569-29865-1-git-send-email-list@eworm.de>
 <20160505234247.GG2113@f23x64.localdomain> <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35275 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932394AbcESJSN convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 May 2016 05:18:13 -0400
Received: by mail-lf0-f68.google.com with SMTP id u64so5047756lff.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2016 02:18:07 -0700 (PDT)
In-Reply-To: <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com

2016-05-16 19:04 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.co=
m>:
>
> Adding Maxim Mikityanskiy and Hans de Goede to CC.
>
> On 5 May 2016 at 19:42, Darren Hart <dvhart@infradead.org> wrote:
> > On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse wrote:
> >> From: Christian Hesse <mail@eworm.de>
> >>
> >> When Lenovo Yoga 700 is flipped to tablet mode it emmits event 10.=
 Let's
> >> send touchpad key codes so software can disable touchpad.
> >>
> >> Signed-off-by: Christian Hesse <mail@eworm.de>
> >> Signed-off-by: Michael Gisbers <michael@gisbers.de>
> >
> > Queued, thanks.
> >
> >> ---
> >>  drivers/platform/x86/ideapad-laptop.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platf=
orm/x86/ideapad-laptop.c
> >> index be3bc2f..1d49db1 100644
> >> --- a/drivers/platform/x86/ideapad-laptop.c
> >> +++ b/drivers/platform/x86/ideapad-laptop.c
> >> @@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_handle ha=
ndle, u32 event, void *data)
> >>                       case 6:
> >>                               ideapad_input_report(priv, vpc_bit);
> >>                               break;
> >> +                     case 10:
> >>                       case 5:
> >>                               ideapad_sync_touchpad_state(priv);
>
> I'm not sure this is the right action here: ideapad_sync_touchpad()
> sends a sequence of KEY_TOUCHPAD_DISABLE and KEY_TOUCHPAD_ENABLED,
> which are interpreted by userspace as "the touchpad has been
> {dis,en}abled by the hardware". The way userspace is expected to reac=
t
> to it is by showing a notification of the fact to the user, but not
> disabling the touchpad. This behavior can be confirmed in the origina=
l
> commit message that introduced this change (I couldn't find any actua=
l
> documentation on this): "Input: add keycodes for touchpad on/off keys=
"
> (0417596f66). I was actually going to propose a patch similar to Hans=
'
> "ideapad-laptop: Disable touchpad interface on Yoga models"
> (f79a901331) for the Yoga 900, to avoid an "touchpad ON" OSD
> notification being shown to the user when returning for suspend.
>
> Also, I've been investigating touchpad-related problems in the Lenovo
> Yoga 900 recently, and trying to understand this code. IIUC
> ideadpad_sync_touchpad_state() was created as part of "ideapad: add
> Lenovo IdeaPad Z570 support (part 2)" (07a4a4fc8) to allow userspace
> to syncronize a touchpad-state-indicator LED with the actual touchpad
> state, although it seems to me it only works if the touchpad is alway=
s
> enabled by the hardware on resume (cc'ing the original patch author
> here for maybe a confirmation on how this is expected to work).

This is a short explanation of this function.

We call ideapad_sync_touchpad_state when a touchpad state changed
event arrives (touchpad on/off button pressed) or we need to read  out
the initial touchpad state. It is also called on resume because
possibly the touchpad state may be changed after resume, but I don't
know which devices behave like that (and unfortunately I'm unable to
test it on my Z570 because now it's dead).

ideadpad_sync_touchpad_state serves several purposes:

- It actually reads out current touchpad state. It is necessary when
we are reading the initial state, and also this read is necessary on
touchpad state changed events, because on some laptops (e.g. Z570)
touchpad LED only changes its state after this read.

- Then it disables/enables i8042 AUX port to disable/enable touchpad.
It is also necessary, because some laptops (Z570) do not disable
touchpad in hardware although they are storing touchpad state.

- Finally it sends userspace event with new touchpad state. It does
not send a sequence of KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON as you
mentioned, but only one of these key codes.

The second point is kinda hack. In Linux there are two ways of
reporting touchpad state events to the userspace:

- KEY_TOUCHPAD_TOGGLE for those laptops that do not disable touchpad
in hardware and thus don't store touchpad state. The userspace should
listen for those key presses and disable/enable touchpad
programmatically (e.g. TouchpadOff in synaptics X11 driver).

- KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF for those laptops that fully
manage touchpad state in hardware and just report its state to the
userspace so that notification can be shown. Userspace should not
disable touchpad programmatically on these events, because it is
managed by hardware and may easily get out of sync if using multiple
user sessions.

Ideapad Z570 matches none of these options. It looks more like the
second one, it stores the touchpad state in hardware, controls the
LED, but it lacks the ability to disable the touchpad in hardware. So
we need to keep track of the hardware state and disable i8042 AUX port
from the driver when necessary.

So if on event 10 the touchpad state may be changed, we need to call
ideadpad_sync_touchpad_state, otherwise I don't see why it is
necessary.

=46ell free to ask me any questions if something is still not clear,
I'll try to assist.

Best regards,
Maxim
