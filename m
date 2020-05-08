From: Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Fri, 8 May 2020 17:15:07 +0100
Message-ID: <CAD2FfiG2c4iXmTjUpQAUqRVBVyH0Hm4VfO5PBTXf03VXHR22ng@mail.gmail.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
 <aa217de398584fa7846cf4ac0c872036@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiEk8Fq3=i_3NHvtuwip=-v_cGfnYSowdPi86U_BcgP2gQ@mail.gmail.com>
 <61c7782cd2e64bb9ab2aaf6a016bbb6c@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiGweUHNJGdj7OUQFxEhQBYvMCbuWM-+ez=SpN=HbcaS4Q@mail.gmail.com>
 <70757953c25645baac2dddd7c6924d05@AUSX13MPC101.AMER.DELL.COM> <20200508082028.GP487496@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20200508082028.GP487496@lahna.fi.intel.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 8 May 2020 at 09:20, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Thanks for the information. I actually prefer that this would be in a
> separate driver because I do not want distros to enable intel-spi just
> for this. It is really only meant for special setups where firmware
> upgrade/access flow has been thoroughly tested.

Do you think the driver should be part of mtd (e.g. something like
drivers/mtd/spi-nor/controllers/intel-spi-pci-lpc.c) or be something
like I proposed in drivers/platform/x86? Ideas very welcome, thanks.

Richard
