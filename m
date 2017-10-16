From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
Date: Mon, 16 Oct 2017 14:56:47 -0700
Message-ID: <20171016215647.GD14419@fury>
References: <cover.1507958847.git.mario.limonciello@dell.com>
 <20171016073307.ahdc6ogzytzwckpq@pali>
 <0aebeec94bad4ca9baae335ef9e591b8@ausx13mpc120.AMER.DELL.COM>
 <20171016133705.cf4f5jqgq4ebhfcj@pali>
 <a9a6d127cdc94f1ba40ce0d2dff78156@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47121 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753253AbdJPV4v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Oct 2017 17:56:51 -0400
Content-Disposition: inline
In-Reply-To: <a9a6d127cdc94f1ba40ce0d2dff78156@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk

On Mon, Oct 16, 2017 at 01:48:05PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, October 16, 2017 8:37 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.org;
> > quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> > greg@kroah.com; gnomes@lxorguk.ukuu.org.uk
> > Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
> > 
> > On Monday 16 October 2017 13:23:04 Mario.Limonciello@dell.com wrote:
> > > > -----Original Message-----
> > > > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > > > Sent: Monday, October 16, 2017 2:33 AM
> > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > > > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > Andy
> > > > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > > > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > > > <gnomes@lxorguk.ukuu.org.uk>
> > > > Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
> > > >
> > > > Hi! Just a small idea, what about including example userspace
> > > > application which would use this new API? I think such application can
> > > > be useful for documentation purpose to see how this new API should be
> > > > used. And in review process other people can point if there would be
> > > > some problems with usage.
> > > >
> > > > I do not know if it is requirement or not for introducing new kernel
> > > > API, but still example code is very useful for developers when they
> > > > would start to use this new API and correctly.
> > > >
> > > > --
> > > > Pali Rohár
> > > > pali.rohar@gmail.com
> > >
> > > Pali,
> > >
> > > I've produced a small sample application available here:
> > > https://github.com/superm1/smbios-wmi-poc
> > 
> > Simple one-file example application. Great!
> > 
> > Darren, Greg, Mario, I think it would be better to have this example
> > application in tools/ or in Documentation/... What do you think?
> > 
> > Looking for examples on random github repos is harder and less official
> > as part of linux source tree.
> > 
> 
> If others also agree, I'm fine with including it with the kernel.
> Please advise where it should be located.
> 
> It was originally a POC made just for my own testing of this API.  
> I will probably need to clean it up a little though for wider distribution 
> to the kernel so I would prefer to send it in a follow up patch if no other
> feedback requiring changes to this series as is.
> 
> One possible issue is that it currently uses glib.  Is that OK?

In my opinion, what is important is that there is an open-source
userspace consumer of the interface. I don't think it needs to be in the
kernel. If this was a more generic interface which could be tested on
any hardware, then I think a selftests target would be sensible. As it
is, this is a very specific use case, and a simple reference to the
smbios-wmi-poc project URL in documentation someplace (or even in the
dell-smbios driver comments) seems more than adequate to me.

-- 
Darren Hart
VMware Open Source Technology Center
