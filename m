From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Fri, 4 Dec 2015 08:04:09 -0800
Message-ID: <CALCETrXbif87UhfMZDD5NFMxQY8rLA7WKsyAf_aaimGKMg2Edw@mail.gmail.com>
References: <20151130211542.GE30553@malice.jf.intel.com> <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
 <20151204011606.GI1800@malice.jf.intel.com> <20151204125521.GA13406@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151204125521.GA13406@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Dec 4, 2015 at 4:55 AM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@ke=
mpniu.pl> wrote:
>> > On some laptop models (e.g. Dell Vostro V131), pressing the Dell I=
nstant
>> > Launch hotkey does not raise an i8042 interrupt - only WMI event 0=
xe025
>> > is generated.  As there seems to be no ACPI method or SMI call to
>> > determine without possible side effects whether a given machine is
>> > capable of simulating a keypress when this hotkey is pressed, DMI
>> > matching is used to whitelist the models for which an input event =
should
>> > be generated when WMI event 0xe025 is received.
>> >
>> > Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
>> > ---
>> > Changes from v1:
>> >
>> >   - Use DMI matching instead of a module parameter
>> >   - Change flag name to improve readability
>> >
>> > Darren, I am aware this patch conflicts with Andy's WMI rework ser=
ies
>> > posted yesterday, so please just let me know if you want me to reb=
ase.
>>
>> Thanks for the heads' up. Andy's series is longer and likely going t=
o need more
>> review from more people, so I don't necessarily want to hold this on=
e up on it -
>> unless it makes sense to include it in that series so they can evolv=
e together.
>> I'll leave that to you and Andy to decide.
>
> As merging my patch with Andy's work is just a matter of moving code
> around, not actually changing it, personally I don't feel this patch
> should be somehow linked to the WMI rework.  Andy, please let me know=
 if
> you disagree, I don't really have any strong feelings about this.
>'

I think it's just a matter of which lands first.  It shouldn't be a big=
 deal.

--Andy
