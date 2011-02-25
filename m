From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH] eeepc-wmi: set the touchpad toggle key code to F21
Date: Fri, 25 Feb 2011 09:14:06 -0600
Message-ID: <AANLkTinV+bnSBe+5CSuYYCU4gCq9Z2c9ELdy-LFAvdf0@mail.gmail.com>
References: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com>
	<AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com>
	<20110225071827.GA14053@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:36712 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754300Ab1BYPOH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Feb 2011 10:14:07 -0500
In-Reply-To: <20110225071827.GA14053@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, tyson.chen@canonical.com

On Fri, Feb 25, 2011 at 1:18 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Fri, Feb 25, 2011 at 07:52:11AM +0100, Corentin Chary wrote:
>> On Fri, Feb 25, 2011 at 6:19 AM, Keng-Yu Lin <keng-yu.lin@canonical.=
com> wrote:
>> > Signed-off-by: Keng-Yu Lin <keng-yu.lin@canonical.com>
>> > ---
>> > =A0drivers/platform/x86/eeepc-wmi.c | =A0 =A02 +-
>> > =A01 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > https://bugs.freedesktop.org/show_bug.cgi?id=3D31333
>> >
>> > diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x=
86/eeepc-wmi.c
>> > index d399775..da00cbc 100644
>> > --- a/drivers/platform/x86/eeepc-wmi.c
>> > +++ b/drivers/platform/x86/eeepc-wmi.c
>> > @@ -113,7 +113,7 @@ static const struct key_entry eeepc_wmi_keymap=
[] =3D {
>> > =A0 =A0 =A0 =A0{ KE_KEY, 0x32, { KEY_MUTE } },
>> > =A0 =A0 =A0 =A0{ KE_KEY, 0x5c, { KEY_F15 } }, /* Power Gear key */
>> > =A0 =A0 =A0 =A0{ KE_KEY, 0x5d, { KEY_WLAN } },
>> > - =A0 =A0 =A0 { KE_KEY, 0x6b, { KEY_F13 } }, /* Disable Touchpad *=
/
>> > + =A0 =A0 =A0 { KE_KEY, 0x6b, { KEY_F21 } }, /* Disable Touchpad *=
/
>> > =A0 =A0 =A0 =A0{ KE_KEY, 0x82, { KEY_CAMERA } },
>> > =A0 =A0 =A0 =A0{ KE_KEY, 0x83, { KEY_CAMERA_ZOOMIN } },
>> > =A0 =A0 =A0 =A0{ KE_KEY, 0x88, { KEY_WLAN } },
>>
>> Hum, I'm not very comfortable with this patch now that we got
>> KEY_TOUCHPAD_TOGGLE.
>> I know, it doesn't work with current Xorg, but if we continue to
>> workaround that, it'll never be fixed.
>>
>> Dmitry, Matthew, any advice ?
>
> I believe that the kernel should use KEY_TOUCHPAD_TOGGLE and userspac=
e
> should use udev's key re-mapping facilities while X is unable to proc=
ess
> keycodes above 255 to adjust to the keycode du jour. If all kernel
> drivers were to use KEY_TOUCHPAD_TOGGLE then remapping would be much
> easier (the utility would simply check capabilities for
> KEY_TOUCHPAD_TOGGLE and do the remap).

I submitted last month a patch to udev to do the scancode-to-F21
mapping.  So that part should be covered for near term.

I also agree if we are going to change kernel side, we should change
to KEY_TOUCHPAD_TOGGLE in both eeepc-laptop and eeepc-wmi.

http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dcommit;h=3D0d8b6b=
e5f5238360d2d8e220d6da280f842c5358

Chris
