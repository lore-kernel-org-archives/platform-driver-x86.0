From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v2] asus-laptop: Add key found on Asus F3M
Date: Wed, 12 Aug 2015 09:06:08 +0200
Message-ID: <CAHR064g5YRt-ru=3wTzkrPFgNUPABmCuf9Lv086Pu=j7pfR7uQ@mail.gmail.com>
References: <20150729044329.GA80946@vmdeb7>
	<1438198283-2180-1-git-send-email-stlman@poczta.fm>
	<20150805202907.GD12131@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:33318 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754017AbbHLHGJ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 12 Aug 2015 03:06:09 -0400
In-Reply-To: <20150805202907.GD12131@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <stlman@poczta.fm>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Aug 5, 2015 at 10:29 PM, Darren Hart <dvhart@infradead.org> wro=
te:
> On Wed, Jul 29, 2015 at 09:31:23PM +0200, =C5=81ukasz Stelmach wrote:
>> Asus F3M has two keys labeled with an icon of a touchpad. The first,
>> reported as 0x6B is next to the power key and the second, reported a=
s
>> 0x6A, is F9 combined with Fn button. When I was pressing the latter,=
 I was
>> getting "Unknown key 6a pressed" message before applying this patch.
>>
>> Asus F3M does not support WMI so the commit does not update key mapp=
ings
>> in the asus-nb-wmi.c file.
>>
>> I have not tested this mapping on any other Asus laptop.
>>
>> Signed-off-by: =C5=81ukasz Stelmach <stlman@poczta.fm>
>
> Thanks =C5=81ukasz.
>
> Corentin, any concerns?

Acked-by: Corentin Chary <corentin.chary@gmail.com>

Sorry for the delay, I won't really have a stable internet connection
until October.

>
>> ---
>>  drivers/platform/x86/asus-laptop.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x=
86/asus-laptop.c
>> index 58d29c4..f2b5d0a 100644
>> --- a/drivers/platform/x86/asus-laptop.c
>> +++ b/drivers/platform/x86/asus-laptop.c
>> @@ -332,6 +332,7 @@ static const struct key_entry asus_keymap[] =3D =
{
>>       {KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
>>       {KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
>>       {KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + =
TV */
>> +     {KE_KEY, 0x6A, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad Fn =
+ F9 */
>>       {KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad */
>>       {KE_KEY, 0x6C, { KEY_SLEEP } }, /* Suspend */
>>       {KE_KEY, 0x6D, { KEY_SLEEP } }, /* Hibernate */
>> --
>> 2.1.4
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center



--=20
Corentin Chary
http://xf.iksaif.net
