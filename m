From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/4] platform/x86: Fix check for method instance number
Date: Thu, 17 Aug 2017 20:31:09 +0300
Message-ID: <CAHp75VcS2hX=b=2hGj+-N0M-t5DD6WAEhBp6-UdNNv3hBC6R1g@mail.gmail.com>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75Ve-umOB8U2HZ7iVf-0HfQX=A3-7KanEa0AY=iEhWpFuaA@mail.gmail.com> <20170817152525.GB19276@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170817152525.GB19276@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 17, 2017 at 6:25 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Sun, Aug 13, 2017 at 03:54:26PM +0300, Andy Shevchenko wrote:
>> On Sat, Aug 12, 2017 at 10:44 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
>> > This patch series fixes remaining mxm-wmi and asus-wmi drivers to eval=
uate
>> > WMI methods with correct and available instance number. Now all WMI dr=
ivers
>> > should call WMI functions with correct instance number and last patch =
fixes
>> > WMI check for invalid instances. Patch for paeq-wmi is optional as mac=
hine
>> > has 10 instances but instance number is ignored at all. But for consis=
tency
>> > with other drivers first instance would be used (instead of second).
>> >
>>
>> I pushed first 3 to testing, which seems to me right thing to do, and
>> left the last one to be ACK by Darren and/or others (I'm not familiar
>> so far with that code).
>
> Reviewed with one question to Pali. Since you merged 1-3, I'll leave 4 to=
 you
> unless you prefer I merge it.

I will do. Thanks!

--=20
With Best Regards,
Andy Shevchenko
