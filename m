From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Tue, 10 Oct 2017 19:51:58 +0000
Message-ID: <dba822e525c7468a9687a7d819182ac6@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
        <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
        <20171005145911.06a5644c@alans-desktop>
        <d8678883f1164ca4b3be13d56293cb2c@ausx13mpc120.AMER.DELL.COM>
        <20171005154445.GC29347@kroah.com>      <20171005155619.GA10938@pali>
        <20171005162810.GB4993@kroah.com>
        <9b58d0a8796948f39776d6bb38bcb9d6@ausx13mpc120.AMER.DELL.COM>
 <20171010204035.1b827bfe@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171010204035.1b827bfe@alans-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: gnomes@lxorguk.ukuu.org.uk
Cc: gregkh@linuxfoundation.org, pali.rohar@gmail.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

Alan,

> -----Original Message-----
> From: Alan Cox [mailto:gnomes@lxorguk.ukuu.org.uk]
> Sent: Tuesday, October 10, 2017 2:41 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: gregkh@linuxfoundation.org; pali.rohar@gmail.com; dvhart@infradead.or=
g;
> andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> > There are some "write once" items that for the general purpose user tha=
t
> > won't brick a box, but should probably be blacklisted though.
> > I'll think this through some more.
>=20
> I would strongly urge you to do whitelisting as it's good security. If
> you can divide the calls into something like this it fits the Linxu
> desktop model well:
>=20
> Safe -> anyone can do it
> Console -> only console owner
> Superuser -> administrator level (things that can be irritating but
> don't persist a reboot)

I've added filtering in my most recent submission (v6).

I don't feel that any single one of these calls or pieces of data should
be accessible without root.  Furthermore discussion on the merits of differ=
ent
levels is stepping into bikeshedding territory.=20
If someone wants to bubble up things that they feel are safe to read or wri=
te=20
as user, that can be the job of a daemon or other service to decide not the=
 kernel.

>=20
> Beyond that it's trickier - if you are an enterprise business then you
> don't for example want to allow someone with root on the system to
> subvert BIOS level settings they can't access.

This level of split is actually comprehended already by the BIOS itself.  W=
hen you
enable an administrative password on the BIOS, you aren't able to access (r=
ead
or write) a variety of settings without a security key (which requires some=
 handshaking).

>=20
> You need a minimum of CAP_SYS_RAWIO for anything that can (through bugs
> or design) subvert secure boot type stuff. It's also probably an
> appropriate check for 'anything goes' if you decide to have that
> category. CAP_SYS_RAWIO implies total power over the machine although
> with secureboot it's less clear.
>=20
Secure boot can't programmatically be disabled from within OS.
