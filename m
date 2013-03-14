From: Gleb Natapov <gleb@redhat.com>
Subject: Re: [PATCH] pvevent: pvevent device driver
Date: Thu, 14 Mar 2013 11:07:44 +0200
Message-ID: <20130314090744.GB11223@redhat.com>
References: <1363251073-20380-1-git-send-email-hutao@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
Content-Disposition: inline
In-Reply-To: <1363251073-20380-1-git-send-email-hutao@cn.fujitsu.com>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Hu Tao <hutao@cn.fujitsu.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>, Orit Wasserman <owasserm@redhat.com>, Matthew Garrett <matthew.garrett@nebula.com>, Juan Quintela <quintela@redhat.com>, Alexander Graf <agraf@suse.de>, Christian Borntraeger <borntraeger@de.ibm.com>, platform-driver-x86@vger.kernel.org, Andrew Jones <drjones@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Sasha Levin <levinsasha928@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 14, 2013 at 04:51:13PM +0800, Hu Tao wrote:
> pvevent device is a qemu simulated device through which guest panic
> event is sent to host.
> 
> ref: http://lists.nongnu.org/archive/html/qemu-devel/2013-03/msg02293.html
> 
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
>  drivers/platform/x86/Kconfig   |   7 +++
>  drivers/platform/x86/Makefile  |   2 +
>  drivers/platform/x86/pvevent.c | 115 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 124 insertions(+)
>  create mode 100644 drivers/platform/x86/pvevent.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7ab0b2f..369135e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -768,4 +768,11 @@ config APPLE_GMUX
>  	  graphics as well as the backlight. Currently only backlight
>  	  control is supported by the driver.
>  
> +config PVEVENT
> +	tristate "pvevent device support"
> +	depends on ACPI
May be adding something like "default y if PARAVIRT_GUEST"?

--
			Gleb.
