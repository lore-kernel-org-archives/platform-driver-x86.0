From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform: x86: dell-smo8800: remove redundant assignments
 to byte_data
Date: Tue, 31 Oct 2017 20:08:45 +0200
Message-ID: <CAHp75Ve852xEsng4cCxznGpkt+P0pnCTX1k9qmVkkZPU3FskOA@mail.gmail.com>
References: <20171031110318.20985-1-colin.king@canonical.com>
 <CAHp75Vec3Hjd_keMid-x6ub5ZJqUmq1nUFiHPsxuWt8V+vzrnQ@mail.gmail.com>
 <20171031135548.u5vtsxj7hbnuioz3@pali> <CAHp75VfAzk4n1HQETp+r5KGE5B_HmQ0JcsOwesvowuvt=wju5g@mail.gmail.com>
 <20171031141351.yrjhwweubwxptb4j@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171031141351.yrjhwweubwxptb4j@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 31, 2017 at 4:13 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Tuesday 31 October 2017 16:07:25 Andy Shevchenko wrote:
>> On Tue, Oct 31, 2017 at 3:55 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> =
wrote:
>> > On Tuesday 31 October 2017 15:47:58 Andy Shevchenko wrote:
>> >> On Tue, Oct 31, 2017 at 1:03 PM, Colin King <colin.king@canonical.com=
> wrote:

>> OK, though it doesn't clarify the intention of the byte_data
>> (useless?) assignments.
>
> Probably similar code pattern exists in that lis3lv* driver...

So, it seems to me OK to apply the patch. No objections?

--=20
With Best Regards,
Andy Shevchenko
