From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI
 chip
Date: Tue, 12 May 2020 09:44:01 +0300
Message-ID: <20200512064401.GF487496@lahna.fi.intel.com>
References: <CAD2FfiEk8Fq3=i_3NHvtuwip=-v_cGfnYSowdPi86U_BcgP2gQ@mail.gmail.com>
 <61c7782cd2e64bb9ab2aaf6a016bbb6c@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiGweUHNJGdj7OUQFxEhQBYvMCbuWM-+ez=SpN=HbcaS4Q@mail.gmail.com>
 <70757953c25645baac2dddd7c6924d05@AUSX13MPC101.AMER.DELL.COM>
 <20200508082028.GP487496@lahna.fi.intel.com>
 <CAD2FfiG2c4iXmTjUpQAUqRVBVyH0Hm4VfO5PBTXf03VXHR22ng@mail.gmail.com>
 <20200511104504.GK487496@lahna.fi.intel.com>
 <CAD2FfiHn0PNaC3aFXE-hn9Mmtt5JW_D8BK0hOScYXR9EJLNbcw@mail.gmail.com>
 <20200511162811.GA487496@lahna.fi.intel.com>
 <CAD2FfiHo1EzRupjgKhtLX0Zguq-bVeW5+u_PNQGAzV0x+AtfVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD2FfiHo1EzRupjgKhtLX0Zguq-bVeW5+u_PNQGAzV0x+AtfVw@mail.gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Richard Hughes <hughsient@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 11, 2020 at 09:08:31PM +0100, Richard Hughes wrote:
> > For the security stuff you are adding, do you need to look at the PCI
> > device registers as well?
> 
> No, just the config space. I guess at some point I might want to put
> some of the chipsec vulnerability checks into the module, although I'm
> not happy adding anything remotely dangerous.

I mean for the SPI-NOR controller PCI device registers (not the LPC PCI
device, sorry about not being clear), like config space. Typically it is
PCI device 1f.5 and in that case you can't use the LPC driver because it
should not touch other devices than what it is bound to (OK, there are
exceptions but still).

If that's the case then I guess this should go to intel-spi-pci/platform
drivers after all. I think one option is that we add Kconfig option that
makes the driver load but only provide the security bits without
actually calling intel_spi_probe().
