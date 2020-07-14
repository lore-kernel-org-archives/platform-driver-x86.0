From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 5.8 regression fix] platform/x86: thinkpad_acpi: Revert:
 Use strndup_user() in dispatch_proc_write()
Date: Tue, 14 Jul 2020 13:43:01 +0300
Message-ID: <CAHp75Vc=ZAH4YeDF+o-89hJZCz2r2csRDcYjBVA30nzbyikFMg@mail.gmail.com>
References: <20200714081510.6070-1-hdegoede@redhat.com> <CAHp75Vd6uGNw5m3-Tc1tkABLT_Wi7CtW2yo8+B5TpYV4U8XE9A@mail.gmail.com>
 <CAHp75Ve9HF4WVkiUA77s9LsN6d8oaFPRgjLi86FnDSHgmVvTNA@mail.gmail.com> <af1a7c41-071f-4c26-9a9a-7c6ffb5dde88@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <af1a7c41-071f-4c26-9a9a-7c6ffb5dde88@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 14, 2020 at 12:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/14/20 10:27 AM, Andy Shevchenko wrote:
> > On Tue, Jul 14, 2020 at 11:21 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >> On Tue, Jul 14, 2020 at 11:15 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>
> >>> Commit 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user()
> >>> in dispatch_proc_write()") cleaned up dispatch_proc_write() by replacing
> >>> the code to copy the passed in data from userspae with strndup_user().
> >>
> >> user space
>
> Ack, do you want me to send a v2, or can you fix this up after applying.
>
> >>> But strndup_user() expects a 0 terminated input buffer and the buffer
> >>> passed to dispatch_proc_write() is NOT 0 terminated.
> >
> > Second though, perhaps it's a simple wrong count parameter?
> > strndup_user(..., min(count, PAGE_SIZE)) or so would work?
>
> I honestly have not looked at a better fix and given that you've just come
> up with 2 suggestions which may or may not work, combined with
> where we are in the 5.8 cycle I believe it would be best to just
> play it safe and go with the revert for 5.8.
>
> If you then take a second attempt at cleaning this up for 5.9 and
> send it to me, I can test it for you.

I guess there is no need to revert. I have looked at the documentation
and see that all of the procfs parameters are normal strings, but you
are right they are not NULL terminated per se. So, the problematic
place is the size of data we retrieve from user space.

I have sent a patch.


-- 
With Best Regards,
Andy Shevchenko
