From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix cpufv sysfs file permission
Date: Tue, 25 Apr 2017 15:27:34 +0300
Message-ID: <CAHp75VcB3SPW_HhS+403dLjr-O6cTT2iD=jKbSKXzrQDSEhY0w@mail.gmail.com>
References: <20170422021945.5260-1-jeremy.lefaure@lse.epita.fr>
 <CAHp75Vf7qKmbzJLfsHJXw_DQ3t8+WKHLEzLHweAq5eE2TTHKNA@mail.gmail.com> <20170424113117.03ba9c77@blatinox-laptop.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170424113117.03ba9c77@blatinox-laptop.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SsOpcsOpbXkgTGVmYXVyZQ==?= <jeremy.lefaure@lse.epita.fr>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 24, 2017 at 6:31 PM, J=C3=A9r=C3=A9my Lefaure
<jeremy.lefaure@lse.epita.fr> wrote:
> On Mon, 24 Apr 2017 12:14:14 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
>> On Sat, Apr 22, 2017 at 5:19 AM, J=C3=A9r=C3=A9my Lefaure
>> <jeremy.lefaure@lse.epita.fr> wrote:
>> > The cpufv sysfs file is defined as readable by anyone even if the
>> > attribute does not have a show function. The result of every read is a=
n
>> > IO error. This file should be write only.
>>
>> Per se patch looks good to me, though would be better to add show()
>> hook as well?
>>
> It depends if we want to keep it write-only as it is documented in
> Documentation/ABI/testing/sysfs-platform-asus-wmi.
>
> If we want to have this file read/write, I can send a v2 of this patch.

I dunno we need.
So, since no answer from anyone I pushed this to testing, thanks!

--=20
With Best Regards,
Andy Shevchenko
