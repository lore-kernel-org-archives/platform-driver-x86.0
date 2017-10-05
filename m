From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 14:59:11 +0100
Message-ID: <20171005145911.06a5644c@alans-desktop>
References: <cover.1507156392.git.mario.limonciello@dell.com>
        <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed,  4 Oct 2017 17:48:39 -0500
Mario Limonciello <mario.limonciello@dell.com> wrote:

> This userspace character device will be used to perform SMBIOS calls
> from any applications.
> 
> It provides an ioctl that will allow passing the 32k WMI calling
> interface buffer between userspace and kernel space.

What is your security model for firing 32K of random crap at the BIOS ?
Do you fuzz test the BIOS interface ?

How do we know that between now and the end of the universe every call is
safe to execute as any random user without upsetting other users on the
same PC ?

Right now this patch is scary. U've fuzzed tested BIOS firmware in thepast
and it almost universally ended up in reaching for the power cord because
PC firmware is usually closed and usually crap.

In addition you are assuming that every function you ever provide via
that ioctl has the same securiy model. So if one of them should only be
usable by the user logged in on the console the system would have to
enforce that for all. If you have two conflicting security policies we'd
have to make it root only and owned by a daemon. If a BIOS turns out to
have a hole then we have to make it CAP_SYS_RAWIO.

/dev/dorandomvendorspecificshit is not an API and not a security policy.

Alan
