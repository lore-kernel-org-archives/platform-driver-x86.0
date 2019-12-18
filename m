From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Make buffer for HPWMI_FEATURE2_QUERY
 128 bytes
Date: Wed, 18 Dec 2019 17:08:15 +0200
Message-ID: <CAHp75Ve7wsd96yn97JihBq1QpLkKLtuhqKvcp-o8yeviCTvkwA@mail.gmail.com>
References: <20191217190604.638467-1-hdegoede@redhat.com> <CAHp75Vf8CDwW731uD4OMzB69P-D1AN3PzCMFBGGD4fvBFccpLg@mail.gmail.com>
 <92800c93-9d03-ab26-e71f-ce40df1ad3bc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <92800c93-9d03-ab26-e71f-ce40df1ad3bc@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 18, 2019 at 1:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 18-12-2019 11:17, Andy Shevchenko wrote:
> > On Tue, Dec 17, 2019 at 9:06 PM Hans de Goede <hdegoede@redhat.com> wrote:

> > Fixes tag?
>
> The HPWMI_FEATURE2_QUERY call was introduced in 8a1513b4932, so I guess
> this should have a:
>
> Fixes: 8a1513b4932 ("hp-wmi: limit hotkey enable")
>
> Tag, shall I send a v2 with this, or can you add it while applying the patch?

I added it.

-- 
With Best Regards,
Andy Shevchenko
