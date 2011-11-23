From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 11/15] samsung-laptop: add keyboard backlight support
Date: Wed, 23 Nov 2011 17:51:35 +0100
Message-ID: <CAHR064hKKXfnnwj9mc+ZKwqXw2yyu0sOokdo8KqpMnM5Ju_5Dw@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-12-git-send-email-corentincj@iksaif.net>
	<20111122222354.GK24283@suse.de>
	<CAHR064iYVHhWgte1vE4xTaS5K4xhVUFHnYkVB1JA_PD8tPFGkQ@mail.gmail.com>
	<CANq1E4QHhYqz0R+g9fj-iAd8QZpfAAgZoz_iA5FjHLHSFDJzCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:56883 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753336Ab1KWQvh convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Nov 2011 11:51:37 -0500
In-Reply-To: <CANq1E4QHhYqz0R+g9fj-iAd8QZpfAAgZoz_iA5FjHLHSFDJzCg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@googlemail.com>
Cc: Greg KH <gregkh@suse.de>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Wed, Nov 23, 2011 at 5:41 PM, David Herrmann
<dh.herrmann@googlemail.com> wrote:
> On Wed, Nov 23, 2011 at 7:35 AM, Corentin Chary
> <corentin.chary@gmail.com> wrote:
>> On Tue, Nov 22, 2011 at 11:23 PM, Greg KH <gregkh@suse.de> wrote:
>>> On Tue, Nov 22, 2011 at 11:02:42PM +0100, Corentin Chary wrote:
>>>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>>>
>>> What happens on boxes that don't have this type of hardware? =C2=A0=
Will the
>>> LED device still show up, yet it will not work?
>>>
>>> You should be able to trigger this off of the model type somehow, m=
uch
>>> like the video backlight should work.
>>
>> kbd_backlight_enable(samsung) will be called, it will fire a {0x78,
>> 0xaabb} command on machines using swsmi and this command will fail i=
f
>> the feature is not available. I did some test, and unknown commands
>> seems to fail gracefully, and that makes sabi_command() (and callers=
)
>> return -EINVAL).
>>
>> It think {0x78, 0x80} is also here to tell if the backlight is
>> available or not, but I can't test it, since it always returns 1 her=
e.
>
> I do not have a keyboard backlight and hence always get an error
> message on boot up. It would be great to suppress this error message
> as this is not really an error (for me):
> samsung_laptop: SABI command 0x0078 failed with completion flag 0xaa
>
>> So yeah, if someone could test that on a swsmi laptop without keyboa=
rd
>> backlight, that would be great.

Yep I've seen that, working on it.



--=20
Corentin Chary
http://xf.iksaif.net
