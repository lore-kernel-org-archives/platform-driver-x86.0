From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 08/15] samsung-laptop: add battery life extender support
Date: Tue, 22 Nov 2011 14:21:49 -0800
Message-ID: <20111122222149.GH24283@suse.de>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
 <1321999366-23784-9-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1321999366-23784-9-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Matthew Garrett <mjg@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02:39PM +0100, Corentin Chary wrote:
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
>  .../ABI/testing/sysfs-driver-samsung-laptop        |   10 +++
>  drivers/platform/x86/samsung-laptop.c              |   82 ++++++++++++++++++++
>  2 files changed, 92 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-samsung-laptop b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> index 0a81023..a6a56e1 100644
> --- a/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> @@ -17,3 +17,13 @@ Description:	Some Samsung laptops have different "performance levels"
>  		Specifically, not all support the "overclock" option,
>  		and it's still unknown if this value even changes
>  		anything, other than making the user feel a bit better.
> +
> +What:		/sys/devices/platform/samsung/battery_life_extender
> +Date:		December 1, 2011
> +KernelVersion:	3.3
> +Contact:	Corentin Chary <corentin.chary@gmail.com>
> +Description:	Max battery charge level can be modified, battery cycle
> +		life can be extended by reducing the max battery charge
> +		level.
> +		0 means normal battery mode (100% charge)
> +		1 means battery life extender mode (80% charge)

Really?  Huh, learn something new every day, that's rally cool, nice
job.

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
