From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch v5] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Thu, 22 Sep 2016 19:08:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609221902570.5599@nanos>
References: <1474365532-168129-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:38813 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934069AbcIVRLw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2016 13:11:52 -0400
In-Reply-To: <1474365532-168129-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: mingo@redhat.com, hpa@zytor.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org, kvalo@codeaurora.org, mchehab@kernel.org, linux@roeck-us.net, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Tue, 20 Sep 2016, vadimp@mellanox.com wrote:

Just a few nitpicks.

> +/* Regions for LPC I2C controller and LPC base register space */
> +static struct resource mlxplat_lpc_resources[] = {

Shouldnt this be const?

> +static int mlxplat_default_channels[][8] = {
> +	{

Ditto. And some more of these?

> +static struct dmi_system_id mlxplat_dmi_table[] __initdata = {

This one as well.

> +static int __init mlxplat_init(void)
> +{
> +	struct mlxplat_priv *priv;
> +	int i;
> +	int err;

Same types can go into one line.

> +
> +	return err;

err is unitialized if we get here. Just return 0 and be done with it.
> +
> +fail_platform_mux_register:

> +static void __exit mlxplat_exit(void)
> +{
> +	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
> +	int i;
> +
> +	for (i = ARRAY_SIZE(mlxplat_mux_data) - 1; i >= 0 ; i--)
> +		platform_device_unregister(priv->pdev_mux[i]);
> +
> +	platform_device_unregister(priv->pdev_i2c);
> +	platform_device_unregister(mlxplat_dev);
> +}
> +
> +module_init(mlxplat_init);
> +module_exit(mlxplat_exit);

Please move the module_xxx() right under the closing brace of the function
to which it belongs.

Otherwise this looks good.

Thanks,

	tglx
