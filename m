From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] platform/x86: wmi: prefix sysfs files in
 /sys/bus/wmi with the ACPI device
Date: Wed, 28 Nov 2018 16:22:42 -0800
Message-ID: <20181129002242.GB2468@fedora.eng.vmware.com>
References: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com>
 <1512786861-1014-2-git-send-email-mario.limonciello@dell.com>
 <DDE9D9EA-D55D-41CC-94ED-EB2A590B7BCF@amacapital.net>
 <1512790860266.96149@Dell.com>
 <CALCETrWm9jY-jo9EN7KW+E4Gc1nDPrQAJ_g+07L-UgZpe5XgMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrWm9jY-jo9EN7KW+E4Gc1nDPrQAJ_g+07L-UgZpe5XgMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Dec 09, 2017 at 01:32:29PM -0800, Andy Lutomirski wrote:
> On Fri, Dec 8, 2017 at 7:41 PM,  <Mario.Limonciello@dell.com> wrote:
> >>> On Dec 8, 2017, at 6:34 PM, Mario Limonciello <mario.limonciello@dell.com> wrote:
> >>>
> >>> It's possible for the same GUID to show up on as system twice.
> >>> This means using solely the GUID for identify the file will not
> >>> be sufficient.
> >>
> >>Isn't the file already in a per-bus directory?
> >
> > Yep, but the symlink created in /sys/bus/wmi/devices isn't.
> > That's where the kernel complains about duplicate sysfs
> > attributes.
> >
> > It's not exactly a pretty path I submitted, but it does avoid
> > those collisions.
> >
> > Example (with this in place from /sys/bus/wmi/devices):
> > lrwxrwxrwx 1 root root 0 Dec  8 21:39 PNP0C14:04-70FE8229-D03B-4214-A1C6-1F884B1A892A -> ../../../devices/platform/PNP0C14:04/wmi_bus/wmi_bus-PNP0C14:04/PNP0C14:04-70FE8229-D03B-4214-A1C6-1F884B1A892A
> 
> Right, I saw that in the cover letter right after sending this.
> 
> Greg, is there a cleaner way to deal with this?  There are two
> instances of the same bus type, each of which would like to have a
> device called "70FE8229-D03B-4214-A1C6-1F884B1A892A".  Can we somehow
> rename the symlinks without renaming the device, or are we just
> supposed to prefix the device name like Mario is doing here?
> 

Mario, if this is still a concern (I presume it is) would you please
resend the patch Cc gregkh directly?

-- 
Darren Hart
VMware Open Source Technology Center
