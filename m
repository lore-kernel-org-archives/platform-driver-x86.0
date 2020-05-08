From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI
 chip
Date: Fri, 8 May 2020 11:20:28 +0300
Message-ID: <20200508082028.GP487496@lahna.fi.intel.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
 <aa217de398584fa7846cf4ac0c872036@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiEk8Fq3=i_3NHvtuwip=-v_cGfnYSowdPi86U_BcgP2gQ@mail.gmail.com>
 <61c7782cd2e64bb9ab2aaf6a016bbb6c@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiGweUHNJGdj7OUQFxEhQBYvMCbuWM-+ez=SpN=HbcaS4Q@mail.gmail.com>
 <70757953c25645baac2dddd7c6924d05@AUSX13MPC101.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <70757953c25645baac2dddd7c6924d05@AUSX13MPC101.AMER.DELL.COM>
Sender: owner-linux-security-module@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: hughsient@gmail.com, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 07, 2020 at 08:03:21PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Richard Hughes <hughsient@gmail.com>
> > Sent: Thursday, May 7, 2020 2:49 PM
> > To: Limonciello, Mario
> > Cc: Platform Driver; linux-security-module; mika.westerberg@linux.intel.com
> > Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI
> > chip
> > 
> > 
> > [EXTERNAL EMAIL]
> > 
> > On Thu, 7 May 2020 at 20:22, <Mario.Limonciello@dell.com> wrote:
> > > By default the driver exposes SPI serial flash contents as read-only but it
> > can
> > > be changed from kernel command line, passing “intel-spi.writeable=1”.
> > 
> > Ahh, that was the bit I didn't know; having the SPI as readonly by
> > default is certainly a good idea, and probably sane enough to enable
> > for Fedora/RHEL as you still need to "do" something manual to enable
> > SPI writing. I guess I can add my securityfs additions to
> > intel-spi-pci.c with Mikas approval.
> > 
> > Richard
> 
> Mika,
> 
> Since you're being joined into the thread late, here is the context:
> https://www.spinics.net/lists/platform-driver-x86/msg21646.html

Thanks for the information. I actually prefer that this would be in a
separate driver because I do not want distros to enable intel-spi just
for this. It is really only meant for special setups where firmware
upgrade/access flow has been thoroughly tested.
