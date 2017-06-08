From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Thu, 8 Jun 2017 20:44:39 +0300
Message-ID: <CAHp75VcH__FDMfUWxDMfga3acBrUxKMqS9y+W6RLzAWsc6OmcA@mail.gmail.com>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
 <201705271517.30111@pali> <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
 <201705272248.13257@pali> <CAHp75VdmMwEvho-2tRoYz3CGz2QvLr40G6Nf7wQ76LCtxFjT4g@mail.gmail.com>
 <20170608151618.GE32509@fury> <1496936287.1929.18.camel@perches.com> <CAHp75VdRwuc5ZL-80=HBgUxHsuZ-MvMRBJxRQuTo8Bz9=RjxYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdRwuc5ZL-80=HBgUxHsuZ-MvMRBJxRQuTo8Bz9=RjxYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 8, 2017 at 8:42 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jun 8, 2017 at 6:38 PM, Joe Perches <joe@perches.com> wrote:
>> On Thu, 2017-06-08 at 08:16 -0700, Darren Hart wrote:
>>> On Sat, May 27, 2017 at 11:49:22PM +0300, Andy Shevchenko wrote:
>>> > On Sat, May 27, 2017 at 11:48 PM, Pali Roh=C3=A1r <pali.rohar@gmail.c=
om> wrote:
>>> > > On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:

>> Perhaps
>>         pr_info("\t%*pE\n", (int)sizeof(g->object_id), g->object_id);
>
> It will print some noisy characters as far as I understood the initial
> intention.

Ah, sorry, it will work, though sligtly differently. It will take
extra argument from the stack which we can avoid. I don't expect the
size of that growing. Pali?


--=20
With Best Regards,
Andy Shevchenko
