From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba_acpi.c: Add key_entry for a lone FN keypress
Date: Mon, 25 Oct 2010 12:42:41 -0600
Message-ID: <AANLkTikcnJQnWYP+BTpUAvizU1iwwUo4=Nabe0L6xMXa@mail.gmail.com>
References: <20101023221253.GA4829@hathor>
	<201010251127.37374.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:57341 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750875Ab0JYSmm convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Oct 2010 14:42:42 -0400
In-Reply-To: <201010251127.37374.dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jon Dowland <jmtd@debian.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

It actually generates on key press/release with different key codes,
0x17f and 0x100 respectively. So I think that both should be added.

On Mon, Oct 25, 2010 at 12:27 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Saturday, October 23, 2010 03:12:53 pm Jon Dowland wrote:
>> A lone FN key press on a Toshiba Port=C3=A9g=C3=A9 R700 without anot=
her key in
>> conjunction results in an ACPI event and a spurious error message on
>> the console.
>>
>> Add a key entry to map this event to a KEY_UNKNOWN keypress silences
>> this message.
>>
>
> Well, if FN key can generate separate events then we should report
> KEY_FN, not KEY_UNKNOWN.
>
> Thanks.
>
> --
> Dmitry
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
-- El mundo apesta y vosotros apestais tambien --
