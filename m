From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 14:22:37 +0000
Message-ID: <d8678883f1164ca4b3be13d56293cb2c@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
        <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
 <20171005145911.06a5644c@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005145911.06a5644c@alans-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: gnomes@lxorguk.ukuu.org.uk
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Alan Cox [mailto:gnomes@lxorguk.ukuu.org.uk]
> Sent: Thursday, October 5, 2017 8:59 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Gr=
eg
> KH <greg@kroah.com>
> Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> On Wed,  4 Oct 2017 17:48:39 -0500
> Mario Limonciello <mario.limonciello@dell.com> wrote:
>=20
> > This userspace character device will be used to perform SMBIOS calls
> > from any applications.
> >
> > It provides an ioctl that will allow passing the 32k WMI calling
> > interface buffer between userspace and kernel space.
>=20
> What is your security model for firing 32K of random crap at the BIOS ?

Adding new class and select methods requires a review with the security
team.  They will do STRIDE analysis and threat modeling.

> Do you fuzz test the BIOS interface ?

Yes there has been internal fuzz testing classes and selects used in the=20
ACPI interface in the past.  I can't comment on how regularly that is done.
I do think it's interesting is to use the interface in Linux for further fu=
zz
testing though.

>=20
> How do we know that between now and the end of the universe every call is
> safe to execute as any random user without upsetting other users on the
> same PC ?

Any random user shouldn't be executing the ioctl.
Only root should be executing any of these calls.

If there is a particular call that is deemed too dangerous to have availabl=
e the ioctl
call can be filtered by the kernel module.

>=20
> Right now this patch is scary. U've fuzzed tested BIOS firmware in thepas=
t
> and it almost universally ended up in reaching for the power cord because
> PC firmware is usually closed and usually crap.
>

Can you please share more context?

> In addition you are assuming that every function you ever provide via
> that ioctl has the same securiy model. So if one of them should only be
> usable by the user logged in on the console the system would have to
> enforce that for all. If you have two conflicting security policies we'd
> have to make it root only and owned by a daemon. If a BIOS turns out to
> have a hole then we have to make it CAP_SYS_RAWIO.
>=20
> /dev/dorandomvendorspecificshit is not an API and not a security policy.
>=20
> Alan

All functionality offered through this interface has the same security mode=
l.
This should only be made available to root, but I don't see the need for a
daemon to further sit between calls.  The two applications that I see using
this in the short term (fwupd and fwupdate) both run as root and would
directly use this interface.
