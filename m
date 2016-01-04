From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is valid
Date: Mon, 4 Jan 2016 10:23:52 -0800
Message-ID: <CALCETrUBkkc_TGcQfFKmGOtNy_URjzsibrkmWU066hXMTqpM9g@mail.gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <201512281508.20683@pali> <20151229124413.GB2467@eudyptula.hq.kempniu.pl>
 <201512291705.43939@pali> <20151230112707.GA3352@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35906 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752720AbcADSYN convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 13:24:13 -0500
Received: by mail-ob0-f170.google.com with SMTP id ba1so254742501obb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2016 10:24:12 -0800 (PST)
In-Reply-To: <20151230112707.GA3352@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 30, 2015 at 3:27 AM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@k=
empniu.pl> wrote:
>> > If you feel like I'm nit-picking and none of the above matters,
>> > please feel free to disregard my input and just follow your gut.
>>
>> It's ok. We just understand it quite differently. And in this case w=
hat
>> about changing commit message to something like this?
>>
>> =3D=3D=3D
>> dell-wmi: Check if Dell WMI descriptor structure is valid
>>
>> After examining existing DSDT ACPI tables of more laptops and lookin=
g
>> into Dell WMI document mentioned in ML dicussion archived at
>> http://www.spinics.net/lists/platform-driver-x86/msg07220.html we wi=
ll
>> parse and check WMI descriptor if contains expected data. It is beca=
use
>> WMI descriptor contains interface version number and it is needed to
>> know in next commit.
>> =3D=3D=3D
>
> I like it way more than the previous one.
>

=46WIW, the original version of this series works fine on my laptop
(after fixing the separate dmi_walk misuse bug).

--Andy
