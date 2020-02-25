From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support laptops where the
 first battery is named BATT
Date: Tue, 25 Feb 2020 11:55:27 +0200
Message-ID: <CAHp75VfGkn_oGCNyP=RWo9fHvh8YzEy6e7cDCczJefsq2HMRFw@mail.gmail.com>
References: <20200223181832.17131-1-kristian@klausen.dk> <20200224011017.C5207208C4@mail.kernel.org>
 <e700ebdc-3dce-c151-3ea5-f7ab1e4cb07f@klausen.dk> <CAHp75VcAZZ-d1BQON0ciLoCGt5=1qh4s1jLGhDdApicT+7BEGg@mail.gmail.com>
 <af54a82e-0b9f-1e88-8741-bd4a3658d8e7@klausen.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <af54a82e-0b9f-1e88-8741-bd4a3658d8e7@klausen.dk>
Sender: stable-owner@vger.kernel.org
To: Kristian Klausen <kristian@klausen.dk>
Cc: Sasha Levin <sashal@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 25, 2020 at 11:51 AM Kristian Klausen <kristian@klausen.dk> wrote:
> On 25.02.2020 10.30, Andy Shevchenko wrote:
> > On Mon, Feb 24, 2020 at 3:15 AM Kristian Klausen <kristian@klausen.dk> wrote:
> >> On 24.02.2020 02.10, Sasha Levin wrote:
> >>> NOTE: The patch will not be queued to stable trees until it is upstream.
> >>>
> >>> How should we proceed with this patch?
> >> The patch should only be applied to the v5.4 and v5.5 trees.
> > I'm not sure I got this right. Do we have already this change in upstream?
> > I don't see it there. So, why there is no mention of the v5.6 and
> > current upstream in above list?
>
> Sorry about that, my response does not make any sense.
> The change isn't upstream yet, and should be applied upstream first and
> the 5.4 and 5.6 tree tree if possible.

The usual pattern is to add Fixes tag and Cc: stable@.

> Was I wrong CC'ing stable@vger.kernel.org? (suggested by git send-email
> due to "Cc: stable@vger.kernel.org")

-- 
With Best Regards,
Andy Shevchenko
