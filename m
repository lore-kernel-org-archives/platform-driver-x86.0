From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Low Latency Tolerance preventing Intel Package from entering deep
 sleep states
Date: Fri, 22 May 2020 11:58:44 +0300
Message-ID: <CAHp75VcQSECZeK-5OhJqXaZdW0r8gnvt_PBSKGK4+BKpa9D9KQ@mail.gmail.com>
References: <1505028180.591737.1589564161284.ref@mail.yahoo.com>
 <1505028180.591737.1589564161284@mail.yahoo.com> <CAHp75VfC0NdyyR1zXbk47G_9y5ResrpV+w3cOntDqP_naocuvQ@mail.gmail.com>
 <2952287.p5mUHPKNZq@kreacher> <d0022af356cf9bd5b544187d9a396734d85a76b3.camel@linux.intel.com>
 <193598853.2172716.1590128099214@mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <193598853.2172716.1590128099214@mail.yahoo.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "larsh@apache.org" <larsh@apache.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "David E. Box" <david.e.box@linux.intel.com>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: Adrian

On Fri, May 22, 2020 at 9:15 AM larsh@apache.org <larsh@apache.org> wrote:
>
> Thanks David!
>
> With this I tracked down the SD Card Reader (Genesys Logic, Inc Device 9755) as the culprit.
> These are standard in many ThinkPads.
> The curious part is that resume from suspend (S3 or S0iX) also fixes the problem.
> Looks like the driver is not initializing correctly at boot time.
>
> Transcript:
>
> $ cat /sys/kernel/debug/pmc_core/ltr_show | grep SOUTHPORT
> SOUTHPORT_A                             LTR: RAW: 0x88018c01            Non-Snoop(ns): 1024             Snoop(ns): 32768
> SOUTHPORT_B                             LTR: RAW: 0x0                   Non-Snoop(ns): 0                Snoop(ns): 0
> SOUTHPORT_C                             LTR: RAW: 0x9f409f4             Non-Snoop(ns): 0                Snoop(ns): 0
> SOUTHPORT_D                             LTR: RAW: 0x88aa88aa            Non-Snoop(ns): 174080           Snoop(ns): 174080
> SOUTHPORT_E                             LTR: RAW: 0x0                   Non-Snoop(ns): 0                Snoop(ns): 0
>
> $ lspci -t
> -[0000:00]-+-00.0
>            +-01.0-[01]--+-00.0
>            |            \-00.1
>            +-02.0
>            +-04.0
>            +-08.0
>            +-12.0
>            +-14.0
>            +-14.2
>            +-15.0
>            +-16.0
>            +-1c.0-[53]----00.0
>            +-1d.0-[02]----00.0
>            +-1d.6-[52]----00.0
>            +-1e.0
>            +-1f.0
>            +-1f.3
>            +-1f.4
>            +-1f.5
>            \-1f.6
>
> $ lspci | grep 53
> 53:00.0 SD Host controller: Genesys Logic, Inc Device 9755
>
> $ cat /sys/bus/pci/devices/0000\:53\:00.0/power/control
> auto
>
> $ echo 1 > /sys/bus/pci/devices/0000\:53\:00.0/remove
> 1
>
> $ cat /sys/kernel/debug/pmc_core/ltr_show | grep SOUTHPORT
> SOUTHPORT_A                             LTR: RAW: 0x8010c01             Non-Snoop(ns): 0                Snoop(ns): 0
> SOUTHPORT_B                             LTR: RAW: 0x0                   Non-Snoop(ns): 0                Snoop(ns): 0
> SOUTHPORT_C                             LTR: RAW: 0x9f409f4             Non-Snoop(ns): 0                Snoop(ns): 0
> SOUTHPORT_D                             LTR: RAW: 0x8c548c54            Non-Snoop(ns): 2752512          Snoop(ns): 2752512
> SOUTHPORT_E                             LTR: RAW: 0x0                   Non-Snoop(ns): 0                Snoop(ns): 0
>
> Cheers.
>
> -- Lars
>
>
>
>
>
>
>
>
> On Tuesday, May 19, 2020, 9:03:53 AM PDT, David E. Box <david.e.box@linux.intel.com> wrote:
>
>
>
>
>
> > > > Does anybody know what's going on or how to debug this further?
> > > > As stated above, I was able to work around this problem by
> > > > ignoring SOUTHPORT_A via /sys/kernel/debug/pmc_core/ltr_ignore.
> > > > There has to be a better way, and I'm sure I'm not the only one
> > > > running into this.
>
> ltr_show shows the PMC's (Power Management Controller) view of SoC
> devices and busses. The SOUTHPORTs are the PCIe root ports on your
> system. When you run lspci they are the PCI bridges. Generally, the
> bridges are enumerated in the same order as the SOUTHPORTs, so
> SOUTHPORT_A is your first bridge and the device attached to it (shown
> in lspci -t) is the device that was blocking deeper PC states according
> to your debug.
>
> Determine what this device is on your system. If the ltr was low it's
> because that is what the device requested. You should first check that
> runtime pm is enabled for the device. To do this, check the control
> file in /sys/bus/pci/devices/<SSSS:BB:DD.F>/power, where SSSS:BB:DD.F
> is the enumeration of your device as shown in lspci. If it is 'on' then
> runtime pm is disabled. To enable it echo 'auto' into the file with
> root privileges. Enabling runtime pm should allow the driver to reduce
> functionality of the device when idle. This should lead to a larger
> latency request on the PCI bus which should be reflected in ltr_show.
> You can see if the device is actually runtime suspended and how much
> time it's been suspended (or active) by reading the associated files in
> the power folder.
>
> If this doesn't work, then it's possible that your device doesn't
> support runtime pm. This may be purposely for reliability reasons or
> the driver may just lack support. Check forums discussing issues with
> the device and look for possible options in the driver to force pm
> support (generally this will be centered around enabling ASPM).
>
> You can also download powertop to see the package c-state residencies
> more clearly as percentages of time. powertop also has a tunables tab
> that will show the status of runtime pm on all devices on the system
> and allow you to enable them individually.
>
>
> David
>


-- 
With Best Regards,
Andy Shevchenko
