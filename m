From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 0/2] Asus Wireless Radio Control driver
Date: Tue, 5 Jan 2016 11:18:27 -0500
Message-ID: <CA+A7VXWZnFsudjK9znpPDonapVzhbYD78o_KsBzNWCSrvDtO0w@mail.gmail.com>
References: <1452000361-13640-1-git-send-email-jprvita@endlessm.com> <CAHp75VeFvqvWNcNtOLnzoxsW+MRk8G__QQjZ73H4S-vz9oR9og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:36089 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbcAEQTH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 11:19:07 -0500
In-Reply-To: <CAHp75VeFvqvWNcNtOLnzoxsW+MRk8G__QQjZ73H4S-vz9oR9og@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 5 January 2016 at 08:58, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
> On Tue, Jan 5, 2016 at 3:25 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@g=
mail.com> wrote:
>> This series implements the driver for the "Asus Wireless Radio Contr=
ol" device,
>> as named on the vendor website, which handles notifications from the=
 airplane
>> mode hotkey and drives the airplane mode indicator LED. This device =
appears in
>> the DSDT as "ASHS".
>>
>> I decided to split the series and move the commits that drive the LE=
D to a
>> separate series, so this part can be merged without waiting for feed=
back on the
>> new airplane mode RFKill LED trigger.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> (I'm fine with current version but please take into consideration
> comments to the first patch, most important 'default m' thing)
>

I wasn't really sure about the "default m", so I've followed your
suggestions and just sent an updated patch in reply to that one.
Thanks for your review, it certainly made the code a lot better.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
