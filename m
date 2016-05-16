From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Mon, 16 May 2016 12:04:28 -0400
Message-ID: <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
References: <1459544569-29865-1-git-send-email-list@eworm.de> <20160505234247.GG2113@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:36375 "EHLO
	mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752812AbcEPQFK convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 May 2016 12:05:10 -0400
Received: by mail-yw0-f195.google.com with SMTP id u62so20054938ywe.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 May 2016 09:05:09 -0700 (PDT)
In-Reply-To: <20160505234247.GG2113@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Christian Hesse <list@eworm.de>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, maxtram95@gmail.com, hdegoede@redhat.com, linux@endlessm.com

Adding Maxim Mikityanskiy and Hans de Goede to CC.

On 5 May 2016 at 19:42, Darren Hart <dvhart@infradead.org> wrote:
> On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse wrote:
>> From: Christian Hesse <mail@eworm.de>
>>
>> When Lenovo Yoga 700 is flipped to tablet mode it emmits event 10. L=
et's
>> send touchpad key codes so software can disable touchpad.
>>
>> Signed-off-by: Christian Hesse <mail@eworm.de>
>> Signed-off-by: Michael Gisbers <michael@gisbers.de>
>
> Queued, thanks.
>
>> ---
>>  drivers/platform/x86/ideapad-laptop.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platfor=
m/x86/ideapad-laptop.c
>> index be3bc2f..1d49db1 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_handle hand=
le, u32 event, void *data)
>>                       case 6:
>>                               ideapad_input_report(priv, vpc_bit);
>>                               break;
>> +                     case 10:
>>                       case 5:
>>                               ideapad_sync_touchpad_state(priv);

I'm not sure this is the right action here: ideapad_sync_touchpad()
sends a sequence of KEY_TOUCHPAD_DISABLE and KEY_TOUCHPAD_ENABLED,
which are interpreted by userspace as "the touchpad has been
{dis,en}abled by the hardware". The way userspace is expected to react
to it is by showing a notification of the fact to the user, but not
disabling the touchpad. This behavior can be confirmed in the original
commit message that introduced this change (I couldn't find any actual
documentation on this): "Input: add keycodes for touchpad on/off keys"
(0417596f66). I was actually going to propose a patch similar to Hans'
"ideapad-laptop: Disable touchpad interface on Yoga models"
(f79a901331) for the Yoga 900, to avoid an "touchpad ON" OSD
notification being shown to the user when returning for suspend.

Also, I've been investigating touchpad-related problems in the Lenovo
Yoga 900 recently, and trying to understand this code. IIUC
ideadpad_sync_touchpad_state() was created as part of "ideapad: add
Lenovo IdeaPad Z570 support (part 2)" (07a4a4fc8) to allow userspace
to syncronize a touchpad-state-indicator LED with the actual touchpad
state, although it seems to me it only works if the touchpad is always
enabled by the hardware on resume (cc'ing the original patch author
here for maybe a confirmation on how this is expected to work).

Additionally, while I indeed see an unknown event reported by
ideapad_laptop when closing the lid on the Yoga 900, it is not
vpc_bit=3D10, but vpc_bit=3D1. But I also see the keyboard device sendi=
ng
the same scancode that is sent when the actual touchpad-toggle media
key is pressed (F6 on the Yoga 900), so I'm not 100% sure how all of
this play together yet. I think it would be great if we could
understand the problem a bit better and find a more generic solution.
Were you able to trace the DSDT code that generates this notification?

Best regards,

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
