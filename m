From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Add DMI check before binding to
 the WMI interface
Date: Thu, 5 Oct 2017 21:12:39 +0300
Message-ID: <CAHp75VdBVjL8Pg2CY2HKnzHKgazB4v-BTHtWQZYt86psC=7_8Q@mail.gmail.com>
References: <20171005142021.4899-1-hdegoede@redhat.com> <CAHp75VezzgBXscqiVg_eFkpQdk8NPjQVyxh2FH_DuXop74KzLw@mail.gmail.com>
 <acc2d503-877b-5862-b978-4aea41eca4b8@redhat.com> <CAHp75VcPvwusgznA_rx7+1bdqjHSJ-Z8CE36EktpegMBoWWCzg@mail.gmail.com>
 <ef9ba92b-df20-301e-e63d-6605de0246a6@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <ef9ba92b-df20-301e-e63d-6605de0246a6@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 9:04 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> On 05-10-17 19:59, Andy Shevchenko wrote:
>> On Thu, Oct 5, 2017 at 5:27 PM, Hans de Goede <hdegoede@redhat.com> wrote:

>> ... however, the patch can't be dropped.
>>
>> Either me, or you in v2 need to revert it. Tell me what you prefer here.

> Isn't the whole purpose of having a testing branch that patches can
> actually be dropped. AFAIK this has not even hit -next yet, so IMHO
> it should just be dropped ?

It used to be until the problem had been discovered, i.e. absence of
committer's Signed-off-by.

So, starting from this cycle testing branch is categorized as
'published' where we can't do any non-fast-forward work anymore.

> If it really should be reverted instead I'll leave doing a revert up
> to you.

I heard you.

-- 
With Best Regards,
Andy Shevchenko
