From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/3] platform/wmi: Expose the raw WDG data in sysfs
Date: Tue, 1 Aug 2017 22:40:40 +0200
Message-ID: <20170801204040.GH25574@pali>
References: <cover.1501601667.git.luto@kernel.org>
 <e6df9d038af0a0ce4d4119395aaea58366ade26d.1501601667.git.luto@kernel.org>
 <20170801200313.GC3110@fury>
 <CALCETrX0zqq3xQgNBx41R9ZCT3_bB4EoXGrY3jWLK0e0Koo=EQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38450 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752502AbdHAUkn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 16:40:43 -0400
Received: by mail-wm0-f67.google.com with SMTP id y206so4667066wmd.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Aug 2017 13:40:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CALCETrX0zqq3xQgNBx41R9ZCT3_bB4EoXGrY3jWLK0e0Koo=EQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Tuesday 01 August 2017 13:19:16 Andy Lutomirski wrote:
> On Tue, Aug 1, 2017 at 1:03 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Tue, Aug 01, 2017 at 08:37:28AM -0700, Andy Lutomirski wrote:
> >> This adds a sysfs binary attribute 'wdg' on the bus device
> >> (i.e. /sys/class/wmi_bus/wmi_bus-*/wdg) that contains the raw _WDG
> >> data from ACPI.  This can be used along with the wmi-bmof driver to
> >> decode the raw interface data from ACPI.
> >
> > I don't recall seeing mention of this is the documentation I read as a
> > requirement to decoding the interface with the bmof. Do Windows systems export
> > _WDG to userspace?
> >
> > Why do we need to export _WDG?
> 
> This was a feature that Pali asked for.  Pali, since you seem to be
> working on userspace tooling, can you explain exactly what you'd use
> it for?

Take raw BMOF and WDG buffers from ACPI and parse them in userspace.
Then provide needed information like mapping from MOF event name to ACPI
event name based on info from WDG buffer.

Ideally ability to create dump of BMOF and WDG on one computer and then
parse those data on another.

Having original BMOF and WDG structures is a good for debugging and
development purpose.

> On my laptop, at the very least, it would allow user code to determine
> that there's a WMI GUID that doesn't show up in sysfs.  It doesn't
> show up in sysfs because the ACPI methods are completely missing, but
> it's still there in WDG.  This prints a warning when wmi.ko is loaded,
> but maybe the userspace tooling would care, for debugging if nothing
> else.

-- 
Pali Rohár
pali.rohar@gmail.com
