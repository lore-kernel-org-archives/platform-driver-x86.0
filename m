From: Rajat Jain <rajatja@google.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
Date: Thu, 20 Feb 2020 11:13:12 -0800
Message-ID: <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
References: <20200220074637.7578-1-njoshi1@lenovo.com> <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com> <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Pearson <mpearson@lenovo.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nitin Joshi <nitjoshi@gmail.com>, Mat King <mathewk@google.com>, Jani Nikula <jani.nikula@linux.intel.com>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Nitin Joshi1 <njoshi1@lenovo.com>, Benjamin Berg <bberg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Mark,


On Thu, Feb 20, 2020 at 11:03 AM Mark Pearson <mpearson@lenovo.com> wrote:
>
> Hi Rajat,
>
> > -----Original Message-----
> > From: Rajat Jain <rajatja@google.com>
> > Sent: Thursday, February 20, 2020 1:39 PM
> > >
> > > For this particular issue what is the best way to contribute and get
> > > involved? We'd like to make it so ePrivacy can be used more easily fr=
om
> > > Linux. I agree a more generic way of controlling it would be good.
> > > I looked at the proposed patch from Rajat
> > > (https://lkml.org/lkml/2019/10/22/967) - it seems like a good solutio=
n to me.
> > > We can help with testing that on our platforms if that would be usefu=
l.
> >
> > Thanks you, just so that you know, the latest patchset is at:
> > https://lkml.org/lkml/2019/12/20/794
> >
> > It would be great to get some additional testing if possible. I can
> > send a sample ACPI (for our platform) in case it helps.
> >
> Sounds good - we'll definitely try this out and see how it goes. I suspec=
t we'll have some questions once we try it out and get more familiar.
>
> > >
> > > I need to understand how we connect that implementation with the ACPI
> > > controls we have (as I believe what we have are thinkpad specific and=
 not to
> > > a drm spec; we need to confirm that). We also have the ACPI events th=
at
> > > notify if ePrivacy was changed by the hotkeys and that seems like som=
ething
> > > that should be done in thinkpad_acpi.c and not the drm code.
> > >
> > > Not sure if the two need to be connected somehow (or if handling the
> > > event is actually not important and polling is acceptable)?
> >
> > So there was some brief discussion about this on my patches - but
> > atleast on  the platforms I have seen, there was no way to change the
> > privacy screen out of software / kernel control. Essentially, if there
> > are hotkeys, they would send an input event to the kernel, who'd send
> > them to userspace, who'd use the DRM method to toggle the privacy
> > screen. Thus the current version of the patch only supports
> > controlling the privacy screen via set() method. The get() method just
> > returns the cached value.I hope that works for you.
> >
> OK - on the thinkpads we have function+D as a 'hotkey' to control the fea=
ture...and my understanding is that bypasses everything and goes straight t=
o the firmware.
>
> The changes Nitin had been working on in thinkpad_acpi.c was to make this=
 more Linux and friendly - provide a sysfs hook for user space to connect t=
o with the aim of allowing it to be configured from user space and have on =
screen display when it was triggered etc.
>
> I'm personally not sure yet how this ties up with the DRM method - more d=
igging required. I'm intrigued to see if it works on our systems (sadly I d=
on't have anything with that feature available on my desk right now...I nee=
d to get my hands on one)

Just FYI, Here is the brief discussion we had about an interrupt
mechanism to support a (hardware based) "kill switch" for the privacy
screen.
https://lkml.org/lkml/2019/10/25/992

Thanks,

Rajat

>
> Thanks
> Mark
