From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 08/15] samsung-laptop: add battery life extender support
Date: Wed, 23 Nov 2011 07:28:31 +0100
Message-ID: <CAHR064jWCgy3HwiwJkTRU3pTwz30wUasv33M0wEAwF_==T7+VA@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-9-git-send-email-corentincj@iksaif.net>
	<20111122222149.GH24283@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:64751 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754473Ab1KWGga convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Nov 2011 01:36:30 -0500
In-Reply-To: <20111122222149.GH24283@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Matthew Garrett <mjg@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 22, 2011 at 11:21 PM, Greg KH <gregkh@suse.de> wrote:
> On Tue, Nov 22, 2011 at 11:02:39PM +0100, Corentin Chary wrote:
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>> ---
>> =C2=A0.../ABI/testing/sysfs-driver-samsung-laptop =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 10 +++
>> =C2=A0drivers/platform/x86/samsung-laptop.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 82 ++++++++++++++++++++
>> =C2=A02 files changed, 92 insertions(+), 0 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-samsung-laptop b=
/Documentation/ABI/testing/sysfs-driver-samsung-laptop
>> index 0a81023..a6a56e1 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-samsung-laptop
>> +++ b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
>> @@ -17,3 +17,13 @@ Description: =C2=A0 =C2=A0 =C2=A0 Some Samsung la=
ptops have different "performance levels"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Specifically, not a=
ll support the "overclock" option,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and it's still unkn=
own if this value even changes
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 anything, other tha=
n making the user feel a bit better.
>> +
>> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/d=
evices/platform/samsung/battery_life_extender
>> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Decemb=
er 1, 2011
>> +KernelVersion: =C2=A0 =C2=A0 =C2=A0 3.3
>> +Contact: =C2=A0 =C2=A0 Corentin Chary <corentin.chary@gmail.com>
>> +Description: Max battery charge level can be modified, battery cycl=
e
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 life can be extended by =
reducing the max battery charge
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 means normal battery m=
ode (100% charge)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 means battery life ext=
ender mode (80% charge)
>
> Really? =C2=A0Huh, learn something new every day, that's rally cool, =
nice
> job.

Maybe it's only marketing bullshit... but the option is present both
in the BIOS and on windows, so it looks like a real feature.


--=20
Corentin Chary
http://xf.iksaif.net
