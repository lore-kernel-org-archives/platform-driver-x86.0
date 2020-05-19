From: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: Low Latency Tolerance preventing Intel Package from entering
 deep sleep states
Date: Tue, 19 May 2020 09:03:36 -0700
Message-ID: <d0022af356cf9bd5b544187d9a396734d85a76b3.camel@linux.intel.com>
References: <1505028180.591737.1589564161284.ref@mail.yahoo.com>
         <1505028180.591737.1589564161284@mail.yahoo.com>
         <CAHp75VfC0NdyyR1zXbk47G_9y5ResrpV+w3cOntDqP_naocuvQ@mail.gmail.com>
         <2952287.p5mUHPKNZq@kreacher>
Reply-To: david.e.box@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <2952287.p5mUHPKNZq@kreacher>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "larsh@apache.org" <larsh@apache.org>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> > > Does anybody know what's going on or how to debug this further?
> > > As stated above, I was able to work around this problem by
> > > ignoring SOUTHPORT_A via /sys/kernel/debug/pmc_core/ltr_ignore.
> > > There has to be a better way, and I'm sure I'm not the only one
> > > running into this.

ltr_show shows the PMC's (Power Management Controller) view of SoC
devices and busses. The SOUTHPORTs are the PCIe root ports on your
system. When you run lspci they are the PCI bridges. Generally, the
bridges are enumerated in the same order as the SOUTHPORTs, so
SOUTHPORT_A is your first bridge and the device attached to it (shown
in lspci -t) is the device that was blocking deeper PC states according
to your debug.

Determine what this device is on your system. If the ltr was low it's
because that is what the device requested. You should first check that
runtime pm is enabled for the device. To do this, check the control
file in /sys/bus/pci/devices/<SSSS:BB:DD.F>/power, where SSSS:BB:DD.F
is the enumeration of your device as shown in lspci. If it is 'on' then
runtime pm is disabled. To enable it echo 'auto' into the file with
root privileges. Enabling runtime pm should allow the driver to reduce
functionality of the device when idle. This should lead to a larger
latency request on the PCI bus which should be reflected in ltr_show.
You can see if the device is actually runtime suspended and how much
time it's been suspended (or active) by reading the associated files in
the power folder.

If this doesn't work, then it's possible that your device doesn't
support runtime pm. This may be purposely for reliability reasons or
the driver may just lack support. Check forums discussing issues with
the device and look for possible options in the driver to force pm
support (generally this will be centered around enabling ASPM).

You can also download powertop to see the package c-state residencies
more clearly as percentages of time. powertop also has a tunables tab
that will show the status of runtime pm on all devices on the system
and allow you to enable them individually.

David
