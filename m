From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_menlow: prevent NULL pointer dereference
Date: Wed, 8 Jun 2016 13:38:46 -0700
Message-ID: <20160608203846.GG28348@f23x64.localdomain>
References: <1464186011-732-1-git-send-email-vincent.stehle@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43887 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756777AbcFHUit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 16:38:49 -0400
Content-Disposition: inline
In-Reply-To: <1464186011-732-1-git-send-email-vincent.stehle@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Sujith Thomas <sujith.thomas@intel.com>, Zhang Rui <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>, Rafael Wysocki <rjw@rjwysocki.net>

On Wed, May 25, 2016 at 04:20:11PM +0200, Vincent Stehl=E9 wrote:
> The function acpi_driver_data() will dereference its parameter; make =
sure
> to check for NULL pointer before we call it.

+Rafael

Under what circumstances can the .remove op be called with a NULL struc=
t
acpi_device * as a parameter? From what I can see, most acpi_* calls ac=
cpeting
an acpi_device rely on it not being null, and they are regularly called=
 from
driver remove functions.

Did you observe an explicit failure or can you describe a call path whe=
re this
can occur?


>=20
> Signed-off-by: Vincent Stehl=E9 <vincent.stehle@intel.com>
> Cc: Sujith Thomas <sujith.thomas@intel.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Len Brown <len.brown@intel.com>
> ---
>  drivers/platform/x86/intel_menlow.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x=
86/intel_menlow.c
> index 0a919d8..185a1bd 100644
> --- a/drivers/platform/x86/intel_menlow.c
> +++ b/drivers/platform/x86/intel_menlow.c
> @@ -196,9 +196,13 @@ static int intel_menlow_memory_add(struct acpi_d=
evice *device)
> =20
>  static int intel_menlow_memory_remove(struct acpi_device *device)
>  {
> -	struct thermal_cooling_device *cdev =3D acpi_driver_data(device);
> +	struct thermal_cooling_device *cdev;
> +
> +	if (!device)
> +		return -EINVAL;
> =20
> -	if (!device || !cdev)
> +	cdev =3D acpi_driver_data(device);
> +	if (!cdev)
>  		return -EINVAL;
> =20
>  	sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
> --=20
> 2.8.1
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
