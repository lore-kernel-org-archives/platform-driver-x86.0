From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Wed, 11 Oct 2017 13:33:18 +0100
Message-ID: <20171011133318.59765227@alans-desktop>
References: <cover.1507589249.git.mario.limonciello@dell.com>
        <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
        <20171010191130.5octjwhbxouayxfv@pali>
        <a8de75f5894f4b888e3ca16fea6c308a@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.llwyncelyn.cymru ([82.70.14.225]:44280 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751958AbdJKMeH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2017 08:34:07 -0400
In-Reply-To: <a8de75f5894f4b888e3ca16fea6c308a@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

On Tue, 10 Oct 2017 19:24:11 +0000
<Mario.Limonciello@dell.com> wrote:

> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Tuesday, October 10, 2017 2:12 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > Andy Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>
> > Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices when
> > requested by drivers
> > 
> > On Monday 09 October 2017 17:51:51 Mario Limonciello wrote:  
> > > +	/* make sure we're not calling a higher instance than exists*/
> > > +	if (_IOC_NR(cmd) > wblock->gblock.instance_count - 1)
> > > +		return -EINVAL;  
> > 
> > Is this condition really working? instance_count is unsigned, cmd is
> > also unsigned... and when instance_count is zero, then IIRC error would
> > not be thrown.
> >   
> 
> But instance count can't be zero.  MOF would fall apart with a zero instance count.
> If a broken BIOS was shipped with an instance count of zero bigger problems would
> have happened.

Maybe but you can still write the test correctly using >= instead.

Alan
