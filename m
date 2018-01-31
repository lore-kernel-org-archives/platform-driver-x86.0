From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Allocate buffer on heap rather
 than globally
Date: Wed, 31 Jan 2018 19:15:33 +0200
Message-ID: <CAHp75Vc5OCrKUF+c6LkqN_QtQox7P0bUb8nZEQeO5mzhc=860w@mail.gmail.com>
References: <1517331540-13266-1-git-send-email-mario.limonciello@dell.com>
 <20180130171745.i5wwcwr4qdbcoxhm@pali> <CAHp75VcqCdEQjUCoSGz87Mb3HFomfOwKWxC7S2CjtqSAZQEpsA@mail.gmail.com>
 <20180131090758.v6eyj35gymlfyzhk@pali> <bb29662337484ad8bd2350e6b68133d3@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VcqYgDCTPqjn9F1SpAbamgPk8B7s4zYAb8csD8oFpLihw@mail.gmail.com> <20180131170639.fhmodmamu4mi6ubw@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180131170639.fhmodmamu4mi6ubw@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 31, 2018 at 7:06 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Wednesday 31 January 2018 18:53:19 Andy Shevchenko wrote:
>> On Wed, Jan 31, 2018 at 6:46 PM,  <Mario.Limonciello@dell.com> wrote:

>> >> Ok. Then we need to stick with 5 arguments... What about name
>> >> dell_fill_request()? E.g.

>> > +       struct calling_interface_buffer buffer =3D {CLASS_INFO,
>> > +                                                 SELECT_RFKILL,
>> > +                                                 {0, 0, 0, 0},
>> > +                                                 {0, 0, 0, 0}};
>>
>> Looking to this approach I would rather provide a macro then.
>>
>> #define FILL_REQUEST(a,b,c,d,...) \ // variant FILL_RFKILL_REQUEST(a,b,c=
,d)
>> (struct calling_interface_buffer) { \
>>  ... \
>> }
>>
>> But then it is macro(s) vs. function(s) debate.
>
> Does not matter, I'm fine with either macro or function.

Mario, it's now up to you. Choose one of the option and send new version.
Thanks!

--=20
With Best Regards,
Andy Shevchenko
