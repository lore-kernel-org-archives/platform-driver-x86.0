From: Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Mon, 11 May 2020 21:08:31 +0100
Message-ID: <CAD2FfiHo1EzRupjgKhtLX0Zguq-bVeW5+u_PNQGAzV0x+AtfVw@mail.gmail.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
 <aa217de398584fa7846cf4ac0c872036@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiEk8Fq3=i_3NHvtuwip=-v_cGfnYSowdPi86U_BcgP2gQ@mail.gmail.com>
 <61c7782cd2e64bb9ab2aaf6a016bbb6c@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiGweUHNJGdj7OUQFxEhQBYvMCbuWM-+ez=SpN=HbcaS4Q@mail.gmail.com>
 <70757953c25645baac2dddd7c6924d05@AUSX13MPC101.AMER.DELL.COM>
 <20200508082028.GP487496@lahna.fi.intel.com> <CAD2FfiG2c4iXmTjUpQAUqRVBVyH0Hm4VfO5PBTXf03VXHR22ng@mail.gmail.com>
 <20200511104504.GK487496@lahna.fi.intel.com> <CAD2FfiHn0PNaC3aFXE-hn9Mmtt5JW_D8BK0hOScYXR9EJLNbcw@mail.gmail.com>
 <20200511162811.GA487496@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20200511162811.GA487496@lahna.fi.intel.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 11 May 2020 at 17:28, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> #if IS_ENABLED(CONFIG_SECURITY)
> static int lpc_ich_init_securityfs(struct pci_dev *dev)

I've done that, thanks.

> For the security stuff you are adding, do you need to look at the PCI
> device registers as well?

No, just the config space. I guess at some point I might want to put
some of the chipsec vulnerability checks into the module, although I'm
not happy adding anything remotely dangerous.

>   $ scripts/get_maintainers.pl path/to/the/patch

Will do, thanks. I'll polish up the list of DIDs and submit it again.

Richard.
