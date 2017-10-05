From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 17:56:19 +0200
Message-ID: <20171005155619.GA10938@pali>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
 <20171005145911.06a5644c@alans-desktop>
 <d8678883f1164ca4b3be13d56293cb2c@ausx13mpc120.AMER.DELL.COM>
 <20171005154445.GC29347@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:48485 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751178AbdJEP4W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 11:56:22 -0400
Content-Disposition: inline
In-Reply-To: <20171005154445.GC29347@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mario.Limonciello@dell.com, gnomes@lxorguk.ukuu.org.uk, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Thursday 05 October 2017 17:44:45 Greg KH wrote:
> On Thu, Oct 05, 2017 at 02:22:37PM +0000, Mario.Limonciello@dell.com wrote:
> > > -----Original Message-----
> > > From: Alan Cox [mailto:gnomes@lxorguk.ukuu.org.uk]
> > > Sent: Thursday, October 5, 2017 8:59 AM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > > Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> > > pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Greg
> > > KH <greg@kroah.com>
> > > Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> > > userspace interface
> > > 
> > > On Wed,  4 Oct 2017 17:48:39 -0500
> > > Mario Limonciello <mario.limonciello@dell.com> wrote:
> > > 
> > > > This userspace character device will be used to perform SMBIOS calls
> > > > from any applications.
> > > >
> > > > It provides an ioctl that will allow passing the 32k WMI calling
> > > > interface buffer between userspace and kernel space.
> > > 
> > > What is your security model for firing 32K of random crap at the BIOS ?
> > 
> > Adding new class and select methods requires a review with the security
> > team.  They will do STRIDE analysis and threat modeling.
> > 
> > > Do you fuzz test the BIOS interface ?
> > 
> > Yes there has been internal fuzz testing classes and selects used in the 
> > ACPI interface in the past.  I can't comment on how regularly that is done.
> > I do think it's interesting is to use the interface in Linux for further fuzz
> > testing though.
> 
> That should be simple, start firing random data at this memory location
> and see what happens.  Can you brick the box?  Change the
> manufactured-date?  Change the serial number?  Normally these types of
> BIOS interfaces allow all sorts of "fun" things like this, which is why
> we have the kernel "own" the interface, to protect yourself from
> breaking the box.

There are also Dell calls to "permanently disable TPM" and similar which
are irreversible. So this can be really a problem.

> > > How do we know that between now and the end of the universe every call is
> > > safe to execute as any random user without upsetting other users on the
> > > same PC ?
> > 
> > Any random user shouldn't be executing the ioctl.
> > Only root should be executing any of these calls.
> 
> "only root" isn't the best protection method, you should know better :)
> 
> You are going to have to do some kind of parsing/whitelisting here,
> trust us...

That is also why I in past suggested to create fully transparent
whitelisting filter for all WMI calls. And properly implement particular
filter in kernel...

But that is of course hard as you need to know all details of internal
structures and data which may be sent via userspace. To prevent e.g.
action "permanently disable TPM" in kernel.

> thanks,
> 
> greg k-h

-- 
Pali Rohár
pali.rohar@gmail.com
