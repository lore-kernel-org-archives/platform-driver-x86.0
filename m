From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] platform/x86: never 'select DMI' from a driver
Date: Mon, 29 Feb 2016 15:13:54 -0800
Message-ID: <CALCETrXCvX_btgePvpW7=BU+u3qg+rkZEfM5pbREcF-VJ-2-ow@mail.gmail.com>
References: <1456748014-358588-1-git-send-email-arnd@arndb.de>
 <CALCETrVxj0rt=5k7-tfTqwWOfshkkQkajQdhF6OE1we1h_2trw@mail.gmail.com> <20160229230711.GH7499@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35753 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388AbcB2XOO convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 18:14:14 -0500
Received: by mail-oi0-f45.google.com with SMTP id c203so24359791oia.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Feb 2016 15:14:14 -0800 (PST)
In-Reply-To: <20160229230711.GH7499@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andy Lutomirski <luto@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 29, 2016 at 3:07 PM, Darren Hart <dvhart@infradead.org> wro=
te:
> On Mon, Feb 29, 2016 at 07:46:58AM -0800, Andy Lutomirski wrote:
>> On Mon, Feb 29, 2016 at 4:13 AM, Arnd Bergmann <arnd@arndb.de> wrote=
:
>> > CONFIG_DMI is a user-selectable Kconfig symbol that some drivers
>> > depend on. As part of a recent patch, other drivers started
>> > adding a 'select' for the same symbol, which now causes
>> > a recursive dependency:
>>
>> Darren, it may make sense for you to fold the DELL_LAPTOP change in.
>
> Andy, I didn't quite follow you. Are you referring to this patch from=
 Arnd, or
> from the dell-smbios series from Micha=C5=82?
>
> I'm planning on merging both (Micha=C5=82's is pending a v5).
>

I meant to fold the "select DMI" -> "depends on DMI" for DELL_WMI into =
my patch.

--Andy

--=20
Andy Lutomirski
AMA Capital Management, LLC
