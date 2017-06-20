From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Mon, 19 Jun 2017 20:37:25 -0700
Message-ID: <20170620033725.GC16249@fury>
References: <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <20170613155000.GA24483@kroah.com>
 <20170613162242.GF27850@fury>
 <20170613165247.GA32546@kroah.com>
 <20170613170719.GK27850@fury>
 <20170614043853.GE10146@kroah.com>
 <CALCETrWvkXe7yjMYK8GrY8LMfMWWLL7GoWq4_H0nDWJ+ay8-fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49428 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbdFTDhf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2017 23:37:35 -0400
Content-Disposition: inline
In-Reply-To: <CALCETrWvkXe7yjMYK8GrY8LMfMWWLL7GoWq4_H0nDWJ+ay8-fg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Mon, Jun 19, 2017 at 03:10:09PM -0700, Andy Lutomirski wrote:
> On Tue, Jun 13, 2017 at 9:38 PM, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jun 13, 2017 at 10:07:19AM -0700, Darren Hart wrote:
> >> On Tue, Jun 13, 2017 at 06:52:47PM +0200, Greg Kroah-Hartman wrote:
> >> > > As a concrete example, Dell has specifically made the request that we
> >> > > work on a solution that doesn't require them to come back to the kernel
> >> > > community each time they add a WMI GUID to their BIOS. They would like
> >> > > to see those GUIDs automatically exposed.
> >> >
> >> > What do you mean exactly by "exposed"?  What do they do with these?  Why
> >>
> >> By exposed I meant: the chardev for the WMI GUID is created
> >>
> >> The idea being the kernel maps WMI GUIDs to chardevs and shepherds the
> >> userspace calls through to the ACPI method evaluation and back. But the
> >> kernel wmi driver doesn't, in general, have specific knowledge of the
> >> methods or input and output formats.
> >
> > Hah, and those people who insist on "secure boot" are going to allow
> > userspace access to ACPI methods like this?  Well, I guess as Windows
> > does it, it must be ok...
> >
> > I'll shut up now and just wait for patches :)
> >
> 
> Darren, Pali, etc, I wanted to throw out another idea for handling some of this
> stuff without risking blobification: make WMI button work declaratively.  Here's
> what I mean:
> 
> Currently, we have a whole bunch of WMI drivers that have a bunch of code
> to do more or less the same thing.  They bind to a WMI event device,
> parse events,
> turn them into scancodes, and feed them to sparse_keymap_report_event.
> 
> What if we created a single driver that did this generically?  The core would
> filter a WMI event device and look up each event by trying to match
> it to a pattern.  A pattern is literally a bunch of bytes, where 1-4
> of those bytes
> are all NULL in the pattern but are marked as containing a scancode.  If there's
> a match, the result is fed to sparse_keymap_report_event().  A pattern
> would look
> like (totally made up):
> 
> 05 74 AB [0] [1] FF [2] [3]
> 
> [0] means that this byte is the low byte of the scancode.  [1] means
> second byte of the scancode.  05 is a literal.
> 
> The scancode would also be programmable.
> 
> Then we let WMI drivers bind the device and feed the core a sparse
> keymap and a pattern or list of patterns.  We'd also let the keymap
> and the patterns be queried and edited from userspace.  Then, if a new
> laptop comes out, some hwdb could feed the pattern to the kernel, and
> the kernel would log the pattern that was fed in.  Then, later on, we
> could update the kernel driver, or we could just leave the whole
> pattern list in userspace.
> 
> Hmm?
> 

Hi Andy,

So here is what the documentation [1] says about events, in part:
-----
WMI allows notifications of significant events to be delivered to interested
user-mode applications. Each type of event is uniquely named by a GUID. Events
may also carry a data block with additional information about the event. 

...

The mapping process is similar for events. The _WDG control method provides a
mapping between the WMI event GUID that represents the event and the
notification code specified in the ASL notify instruction. For example, when
ACPI provides a callback to the mapper that a control method executed a
notify(mapper-device, 0x81) function, the mapper will look up the WMI GUID
mapped to 0x81 and use this WMI GUID in building the WMI event. Before launching
the WMI event, the mapper will evaluate _WED to retrieve any additional data
that belongs with the event.
-----

I like the idea of generalizing the work and creating this event-handler type
driver. My concern/objection is that there is nothing governing how hotkeys or
buttons are implemented with WMI. A single event could be used with a specific
scancode in the "additional data" for each hotkey/button. Alternatively, a
different event with no data could be used for each hotkey/button individually.
Other horrible stateful events could be constructed as well in which the
scancodes of event X are modified by the most recent event Y's 5th bit of
"additional data".

Let's have a look at the "additional data" structures from the various drivers.

acer_wmi:
struct event_return_value {
        u8 function;
        u8 key_num;
        u16 device_state;
        u32 reserved;
} __attribute__((packed));

asus*wmi:
ACPI_TYPE_INTEGER
Encodes keys, but also brightness values from a range.

dell-wmi:
Type and code, where type may be, for example, "sequence" and then each byte of
buffen length is processed as a key.

hp-wmi:
Event ID and Data, data size varies by version. Although a specific ID triggers
hotkeys, with a single scancode key for the hp_wmi_keymap.

msi-wmi:
ACPI_TYPE_INTEGER
scancode to key is straight forward, but includes a "dead zone" for a period to
avoid duplicate events, and check for acpi backlight handling prior to reporting
brightness keys.

All told, these 5 drivers use events for hotkey in very different ways. I expect
a high degree of variety across vendors. WMI was designed as a solution for
platform (model) specific features, and that's evident in the implementations we
know about. I think attempting anything more specific than the mapping driver in
feature drivers (as opposed to platform drivers) will be unsuccessful.

1. https://msdn.microsoft.com/en-us/library/windows/hardware/dn614028(v=vs.85).aspx

-- 
Darren Hart
VMware Open Source Technology Center
