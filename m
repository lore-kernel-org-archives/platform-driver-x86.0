From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Mon, 21 Mar 2016 13:17:36 +0100
Message-ID: <20160321121736.GH8413@pali>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
 <1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34110 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754426AbcCUMRk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Mar 2016 08:17:40 -0400
Content-Disposition: inline
In-Reply-To: <1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: dvhart@infradead.org, Jared_Dominguez@dell.com, platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net, alex.hung@canonical.com, arvidjaar@gmail.com, linux-kernel@vger.kernel.org

On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrote:
> +#ifdef CONFIG_PM_SLEEP
> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *context)
> +{
> +	struct rbtn_data *rbtn_data =3D context;
> +
> +	rbtn_data->suspended =3D false;
> +}
> +
> +static int rbtn_suspend(struct device *dev)
> +{
> +	struct acpi_device *device =3D to_acpi_device(dev);
> +	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> +
> +	rbtn_data->suspended =3D true;
> +
> +	return 0;
> +}
> +
> +static int rbtn_resume(struct device *dev)
> +{
> +	struct acpi_device *device =3D to_acpi_device(dev);
> +	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> +	acpi_status status;
> +
> +	/*
> +	 * Clear the flag only after we received the extra
> +	 * ACPI notification.
> +	 */
> +	status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
> +			 rbtn_acpi_clear_flag, rbtn_data);
> +	if (ACPI_FAILURE(status))
> +		rbtn_data->suspended =3D false;

I case when acpi_os_execute success it calls rbtn_acpi_clear_flag,
right? And that will set suspended to false. When acpi_os_execute fails=
,
then it set suspended too to false... Then whole acpi_os_execute doing
just "barrier" after which suspended flag can be set to false. So I
think rbtn_acpi_clear_flag function is not needed here.

Cannot you pass NULL or empty function pointer as callback? Or what was
reason to do that flag clearing at "two places"?

> +	return 0;
> +}
> +#endif

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
