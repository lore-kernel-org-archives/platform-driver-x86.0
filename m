From: Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Tue, 12 May 2020 21:37:13 +0100
Message-ID: <CAD2FfiEOqTUO-XOgar1RtR9PtXWf4tKtsdZX6oS-Q-_y=k6tig@mail.gmail.com>
References: <CAD2FfiEk8Fq3=i_3NHvtuwip=-v_cGfnYSowdPi86U_BcgP2gQ@mail.gmail.com>
 <61c7782cd2e64bb9ab2aaf6a016bbb6c@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiGweUHNJGdj7OUQFxEhQBYvMCbuWM-+ez=SpN=HbcaS4Q@mail.gmail.com>
 <70757953c25645baac2dddd7c6924d05@AUSX13MPC101.AMER.DELL.COM>
 <20200508082028.GP487496@lahna.fi.intel.com> <CAD2FfiG2c4iXmTjUpQAUqRVBVyH0Hm4VfO5PBTXf03VXHR22ng@mail.gmail.com>
 <20200511104504.GK487496@lahna.fi.intel.com> <CAD2FfiHn0PNaC3aFXE-hn9Mmtt5JW_D8BK0hOScYXR9EJLNbcw@mail.gmail.com>
 <20200511162811.GA487496@lahna.fi.intel.com> <CAD2FfiHo1EzRupjgKhtLX0Zguq-bVeW5+u_PNQGAzV0x+AtfVw@mail.gmail.com>
 <20200512064401.GF487496@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20200512064401.GF487496@lahna.fi.intel.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 12 May 2020 at 07:44, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I mean for the SPI-NOR controller PCI device registers (not the LPC PCI
> device, sorry about not being clear), like config space.

I don't think I need to care about those, but I'll admit I'm a bit of
a newbie with all the terminology. I'll respin the patch now and cc
you on the new version too.

> If that's the case then I guess this should go to intel-spi-pci/platform
> drivers after all. I think one option is that we add Kconfig option that
> makes the driver load but only provide the security bits without
> actually calling intel_spi_probe().

I think getting distros to enable any of the SPI_INTEL_SPI* options
might be an uphill battle.

Richard.
