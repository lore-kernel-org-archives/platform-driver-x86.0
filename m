From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
Date: Mon, 16 Oct 2017 15:37:05 +0200
Message-ID: <20171016133705.cf4f5jqgq4ebhfcj@pali>
References: <cover.1507958847.git.mario.limonciello@dell.com>
 <20171016073307.ahdc6ogzytzwckpq@pali>
 <0aebeec94bad4ca9baae335ef9e591b8@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:54683 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752151AbdJPNhI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Oct 2017 09:37:08 -0400
Content-Disposition: inline
In-Reply-To: <0aebeec94bad4ca9baae335ef9e591b8@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk

On Monday 16 October 2017 13:23:04 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, October 16, 2017 2:33 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy
> > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > <gnomes@lxorguk.ukuu.org.uk>
> > Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
> > 
> > Hi! Just a small idea, what about including example userspace
> > application which would use this new API? I think such application can
> > be useful for documentation purpose to see how this new API should be
> > used. And in review process other people can point if there would be
> > some problems with usage.
> > 
> > I do not know if it is requirement or not for introducing new kernel
> > API, but still example code is very useful for developers when they
> > would start to use this new API and correctly.
> > 
> > --
> > Pali Rohár
> > pali.rohar@gmail.com
> 
> Pali,
> 
> I've produced a small sample application available here:
> https://github.com/superm1/smbios-wmi-poc

Simple one-file example application. Great!

Darren, Greg, Mario, I think it would be better to have this example
application in tools/ or in Documentation/... What do you think?

Looking for examples on random github repos is harder and less official
as part of linux source tree.

-- 
Pali Rohár
pali.rohar@gmail.com
