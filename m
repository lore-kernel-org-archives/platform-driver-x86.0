From: Hu Tao <hutao@cn.fujitsu.com>
Subject: Re: [PATCH] pvevent: pvevent device driver
Date: Tue, 19 Mar 2013 13:45:32 +0800
Message-ID: <20130319054532.GD23780@localhost.localdomain>
References: <1363251073-20380-1-git-send-email-hutao@cn.fujitsu.com>
	<CAAu8pHs2jqSBGmeGdsHGHvxNcMab1zz9hPWHo6Vza7bDSAMBLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <CAAu8pHs2jqSBGmeGdsHGHvxNcMab1zz9hPWHo6Vza7bDSAMBLQ@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Blue Swirl <blauwirbel@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gleb Natapov <gleb@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Orit Wasserman <owasserm@redhat.com>, Matthew Garrett <matthew.garrett@nebula.com>, Juan Quintela <quintela@redhat.com>, Alexander Graf <agraf@suse.de>, Christian Borntraeger <borntraeger@de.ibm.com>, platform-driver-x86@vger.kernel.org, Andrew Jones <drjones@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Sasha Levin <levinsasha928@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@re>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 17, 2013 at 07:12:09PM +0000, Blue Swirl wrote:
> On Thu, Mar 14, 2013 at 8:51 AM, Hu Tao <hutao@cn.fujitsu.com> wrote:
> > pvevent device is a qemu simulated device through which guest panic
> > event is sent to host.
> >
> > ref: http://lists.nongnu.org/archive/html/qemu-devel/2013-03/msg02293.html
> >
> > Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> > ---
> >  drivers/platform/x86/Kconfig   |   7 +++
> >  drivers/platform/x86/Makefile  |   2 +
> >  drivers/platform/x86/pvevent.c | 115 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 124 insertions(+)
> >  create mode 100644 drivers/platform/x86/pvevent.c
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 7ab0b2f..369135e 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -768,4 +768,11 @@ config APPLE_GMUX
> >           graphics as well as the backlight. Currently only backlight
> >           control is supported by the driver.
> >
> > +config PVEVENT
> > +       tristate "pvevent device support"
> > +       depends on ACPI
> > +       ---help---
> > +         This driver provides support for pvevent device, which is a qemu
> > +         simulated device through which guest panic event is sent to host.
> > +
> >  endif # X86_PLATFORM_DEVICES
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index bf7e4f9..8779396 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -50,3 +50,5 @@ obj-$(CONFIG_INTEL_MID_POWER_BUTTON)  += intel_mid_powerbtn.o
> >  obj-$(CONFIG_INTEL_OAKTRAIL)   += intel_oaktrail.o
> >  obj-$(CONFIG_SAMSUNG_Q10)      += samsung-q10.o
> >  obj-$(CONFIG_APPLE_GMUX)       += apple-gmux.o
> > +
> > +obj-$(CONFIG_PVEVENT)           += pvevent.o
> > diff --git a/drivers/platform/x86/pvevent.c b/drivers/platform/x86/pvevent.c
> > new file mode 100644
> > index 0000000..00ef7f4
> > --- /dev/null
> > +++ b/drivers/platform/x86/pvevent.c
> > @@ -0,0 +1,115 @@
> > +/*
> > + *  pvevent.c - pvevent Device Support
> > + *
> > + *  Copyright (C) 2013 Fujitsu.
> > + *
> > + *  This program is free software; you can redistribute it and/or modify
> > + *  it under the terms of the GNU General Public License as published by
> > + *  the Free Software Foundation; either version 2 of the License, or
> > + *  (at your option) any later version.
> > + *
> > + *  This program is distributed in the hope that it will be useful,
> > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *  GNU General Public License for more details.
> > + *
> > + *  You should have received a copy of the GNU General Public License
> > + *  along with this program; if not, write to the Free Software
> > + *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> 
> Current address of FSF is:
> 
> 51 Franklin Street, Fifth Floor
> Boston, MA 02110-1301
> USA
> 
> I'd use the web version recommended by FSF.

Thanks, I'll update it in the next version.

-- 
Regards,
Hu Tao
