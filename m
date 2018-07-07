From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: intel-hid: Add support for Device
 Specific Methods
Date: Sat, 07 Jul 2018 16:37:52 -0700
Message-ID: <82968804b607bf33550ba6fbaebc658db3953804.camel@linux.intel.com>
References: <20180628181906.54910-1-srinivas.pandruvada@linux.intel.com>
         <74ac9bf130074e0a8f86a7904783d091@ausx13mpc120.AMER.DELL.COM>
         <95b3748fcb911c7305bd2bbcfd4e368f044f8b14.camel@linux.intel.com>
         <CAHp75VdX+i_N_GttiL3QZrpivpUeJa0ofGfeJR1FkfuiBWocqA@mail.gmail.com>
         <cc4bc804434a40d9bdd2fa03bbb875aa@ausx13mpc120.AMER.DELL.COM>
         <CAHp75VerxQrPwHTU9PF_q_8xkRm7=cBTPf2tb_5xPEoBQKcL8A@mail.gmail.com>
         <20180706235907.GE3041@fury> <1530935335264.5774@Dell.com>
         <CAHp75VeW9y2z2N7bzwY-kztLvgJYmHECHRF1q5Mr8ude8LOMUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeW9y2z2N7bzwY-kztLvgJYmHECHRF1q5Mr8ude8LOMUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2018-07-07 at 19:24 +0300, Andy Shevchenko wrote:
> On Sat, Jul 7, 2018 at 6:48 AM,  <Mario.Limonciello@dell.com> wrote:
> > > I strongly advocate for vendors to have more control over their
> > > drivers,
> > > but this scenario really frustrates me. I don't think I can
> > > justify this
> > > to Linus as a fix. But before we just say "no" (because hey, I
> > > want
> > > these fixes available as early as possible too), let's ask Rafael
> > > if he
> > > has an opinion or if there is precedent for this in his
> > > experience with
> > > ACPI drivers in general:
> > 
> > Full disclosure - an updated FW has since been rolled out that
> > reverted this
> > behavior back to previous FW behavior due to lack of Linux support
> > for the
> > new _DSM.  There is desire to use the new interface (as it did fix
> > actual
> > problems with the old one) so at some point it may return.  When
> > that happens
> > it would be ideal that people who are (for example) running an LTS
> > kernel
> > or distro kernel that tracks stable can pick it up too.
> 
> I am all for the better user experience and bugs especially in FW
> should be fixed, but I think to support all kind of behaviour the new
> FW release should always provide a knob by which we can check if some
> feature is supported or not.
> 
> Above sounds to me as mistake in design of the fix.
The fix here takes care of all the combination. If the new _DSM is
available, it checks what functionality the _DSM interface can provide
(Fn 0). For those functionality it gets using _DSM matching new FW
interface. If there is no _DSM or _DSM doesn't provide the
functionality or _DSM provided method fails, it still revert to old FW
interface style using standalone method. Eventually because of
configurable 5-button array, all platforms will be using new FW
interface with consideration of backward compatibility.

Thanks,
Srinivas
