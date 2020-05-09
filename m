From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Do not load on Asus T100TA and T200TA
Date: Sat, 9 May 2020 15:23:16 +0300
Message-ID: <CAHp75VdTuwyJuGsAR4NwJm302Va+68dDdtC-kn3581asg-onvQ@mail.gmail.com>
References: <20200422220559.99726-1-hdegoede@redhat.com> <bcb4d40a-8971-22d6-959b-14b2d329cfd4@redhat.com>
 <CAHp75Vceqb4tpM_G7hcg2RWF6Cp+P61NiiYfQsf9tr8vtFJGHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vceqb4tpM_G7hcg2RWF6Cp+P61NiiYfQsf9tr8vtFJGHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, May 8, 2020 at 11:56 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 8, 2020 at 10:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 4/23/20 12:05 AM, Hans de Goede wrote:
>
> > Andy, Darren, I see that you have already added this to the for-next
> > branch of linux-platform-drivers-x86. I'm not sure what your vision
> > on forced pushed there is. If forced pushes are ok, please drop this
> > patch. If not let me know and I will send out a revert.
>
> Forced pushes are not okay, but we have exceptions in some cases.
> It would be done here, but there are complications, i.e. we have
> already immutable branch merged from MFD. Of course, I would remerge
> it again, but I think we better not to do this right now, so, revert
> seems a less painful in this case. Or, if you have already done
> something better, than keep it as follow up improvement rather than
> pure revert.

Oops, it seems I was quick enough to push this to v5.7-rc4. So, please
send revert!

-- 
With Best Regards,
Andy Shevchenko
