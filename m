From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 09/15] samsung-laptop: add usb charge support
Date: Tue, 22 Nov 2011 14:22:03 -0800
Message-ID: <20111122222203.GI24283@suse.de>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
 <1321999366-23784-10-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1321999366-23784-10-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Matthew Garrett <mjg@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02:40PM +0100, Corentin Chary wrote:
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
>  .../ABI/testing/sysfs-driver-samsung-laptop        |    8 ++
>  drivers/platform/x86/samsung-laptop.c              |   82 ++++++++++++++++++++
>  2 files changed, 90 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-samsung-laptop b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> index a6a56e1..f05b897 100644
> --- a/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> @@ -27,3 +27,11 @@ Description:	Max battery charge level can be modified, battery cycle
>  		level.
>  		0 means normal battery mode (100% charge)
>  		1 means battery life extender mode (80% charge)
> +
> +What:		/sys/devices/platform/samsung/usb_charge
> +Date:		December 1, 2011
> +KernelVersion:	3.3
> +Contact:	Corentin Chary <corentin.chary@gmail.com>
> +Description:	Use your USB ports to charge devices, even
> +		when your laptop is powered off.
> +		1 means enabled, 0 means disabled.

Very cool.

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
