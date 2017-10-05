From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 17:44:45 +0200
Message-ID: <20171005154445.GC29347@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
 <20171005145911.06a5644c@alans-desktop>
 <d8678883f1164ca4b3be13d56293cb2c@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d8678883f1164ca4b3be13d56293cb2c@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: gnomes@lxorguk.ukuu.org.uk, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 05, 2017 at 02:22:37PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Alan Cox [mailto:gnomes@lxorguk.ukuu.org.uk]
> > Sent: Thursday, October 5, 2017 8:59 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> > pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Greg
> > KH <greg@kroah.com>
> > Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> > userspace interface
> > 
> > On Wed,  4 Oct 2017 17:48:39 -0500
> > Mario Limonciello <mario.limonciello@dell.com> wrote:
> > 
> > > This userspace character device will be used to perform SMBIOS calls
> > > from any applications.
> > >
> > > It provides an ioctl that will allow passing the 32k WMI calling
> > > interface buffer between userspace and kernel space.
> > 
> > What is your security model for firing 32K of random crap at the BIOS ?
> 
> Adding new class and select methods requires a review with the security
> team.  They will do STRIDE analysis and threat modeling.
> 
> > Do you fuzz test the BIOS interface ?
> 
> Yes there has been internal fuzz testing classes and selects used in the 
> ACPI interface in the past.  I can't comment on how regularly that is done.
> I do think it's interesting is to use the interface in Linux for further fuzz
> testing though.

That should be simple, start firing random data at this memory location
and see what happens.  Can you brick the box?  Change the
manufactured-date?  Change the serial number?  Normally these types of
BIOS interfaces allow all sorts of "fun" things like this, which is why
we have the kernel "own" the interface, to protect yourself from
breaking the box.

> > How do we know that between now and the end of the universe every call is
> > safe to execute as any random user without upsetting other users on the
> > same PC ?
> 
> Any random user shouldn't be executing the ioctl.
> Only root should be executing any of these calls.

"only root" isn't the best protection method, you should know better :)

You are going to have to do some kind of parsing/whitelisting here,
trust us...

thanks,

greg k-h
