From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform: x86: dell-smo8800: remove redundant
 assignments to byte_data
Date: Tue, 31 Oct 2017 19:41:23 +0100
Message-ID: <20171031184123.ssv5yolajiv7u7gj@pali>
References: <20171031110318.20985-1-colin.king@canonical.com>
 <CAHp75Vec3Hjd_keMid-x6ub5ZJqUmq1nUFiHPsxuWt8V+vzrnQ@mail.gmail.com>
 <20171031135548.u5vtsxj7hbnuioz3@pali>
 <CAHp75VfAzk4n1HQETp+r5KGE5B_HmQ0JcsOwesvowuvt=wju5g@mail.gmail.com>
 <20171031141351.yrjhwweubwxptb4j@pali>
 <CAHp75Ve852xEsng4cCxznGpkt+P0pnCTX1k9qmVkkZPU3FskOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Ve852xEsng4cCxznGpkt+P0pnCTX1k9qmVkkZPU3FskOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 31 October 2017 20:08:45 Andy Shevchenko wrote:
> On Tue, Oct 31, 2017 at 4:13 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > On Tuesday 31 October 2017 16:07:25 Andy Shevchenko wrote:
> >> On Tue, Oct 31, 2017 at 3:55 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> >> > On Tuesday 31 October 2017 15:47:58 Andy Shevchenko wrote:
> >> >> On Tue, Oct 31, 2017 at 1:03 PM, Colin King <colin.king@canonical.com> wrote:
> 
> >> OK, though it doesn't clarify the intention of the byte_data
> >> (useless?) assignments.
> >
> > Probably similar code pattern exists in that lis3lv* driver...
> 
> So, it seems to me OK to apply the patch. No objections?

No objections, you can add my:

Acked-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
