Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504CE3314C2
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109604; cv=none; b=UU3HvpFBM+PCMCp+yEofsaicuClC/+xq4OHjSu17B2tTvRnnfSDy/GJTBiscXtNYt0FpyZ2KPF9R7q2/7mVuatMrYJWquSzhJ0bdWl2zmhc3W5++M/7tXrDEGiTPk1j7iXfaBOpoPcCxIJqmdMnydHixG6lYoBjTKqIRS60Q2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109604; c=relaxed/simple;
	bh=cloJC9+oYqHuBraE6wBT4lV/FFNCDEQ+dbSpC4TpvvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGJ0FF32bzeQZubppjIs00pSD/2JNpOf/FKs+F5T68GZ7XpQNOBFLbtlocrspsghheTLAKNH0/7AAlHkxSDuaz3Hmf3qLQIcBPGiZqKuN6tjmudrQjsjmdh+9v4gP9qSH7n/XR/NKvqM/4PK5t3Kq07XVJxn3PGsIIy+IOoZuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BssFk+3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BssFk+3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3AB1F00893;
	Wed, 10 Jun 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109603;
	bh=qZ+f8eF6EaSUj+9JQwRNez4tqv28JTHg79CuAME9jxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BssFk+3tKAsBVG3Szr2xhsO69DWp74wzSo1TJzkg8YbWgC5V/DnoCXE42ncKYP/qT
	 M2zHPle6eyJWcVpyj6aDnTbfT4Dqj+ZAXjY9sExD/B+2FHH574lvWK0io9ODaF6blg
	 n16YzogXQtBbzAIpGlmvTarL+h0NO/VloOFZo1NbKUjzwzam09DCmPwLpDOJ5r7VAL
	 6W7J+FQ4T68VdIe3rvvpgzpHKaKoC483RxSSdCpvBYltvdryrpK166xAOHGKFEEYVQ
	 G/6T/RtA4/BUzg+N+xsNR10tf/3FB60M/YVJkiW7oE/Aa9Gicw0iQKE8fxVDaN2j7G
	 +FkaI6ICJjb4w==
Message-ID: <2ad6dda7-cfde-48b0-88b8-39dd8ae14bed@kernel.org>
Date: Wed, 10 Jun 2026 18:40:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on
 Yoga Book 9 14IAH10
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com
References: <20260610155340.342949-1-carvsdriver@gmail.com>
 <20260610155340.342949-2-carvsdriver@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260610155340.342949-2-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dave,

On 10-Jun-26 17:53, Dave Carey wrote:
> The Yoga Book 9 14IAH10 (DMI product name "83KJ") has a dedicated
> yb9-kbdock WMI driver that registers an input device reporting
> SW_TABLET_MODE to track the detachable Bluetooth keyboard.
> 
> lenovo-ymc also loads on this machine and creates an input node with the
> SW_TABLET_MODE capability bit set.  For input switches, the presence of
> the capability bit has semantic meaning: userspace (e.g. GNOME) reads
> the switch state at startup from every node advertising the capability
> and does not expect more than one such node.
> 
> Add a DMI match for the Yoga Book 9 14IAH10 to probe() so that
> lenovo-ymc returns -ENODEV on this hardware, leaving yb9-kbdock as the
> sole SW_TABLET_MODE source.  The ymc_ec_trigger EC write, the only
> other action taken in response to a YMC event, is guarded by a separate
> DMI table that excludes this machine; no other functionality is affected.
> 

You dropped my tags again, if there is going to be a v9 please
add:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

here, so just above your Signed-off-by.

> Signed-off-by: Dave Carey <carvsdriver@gmail.com>



Regards,

Hans





> ---
>  drivers/platform/x86/lenovo/ymc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
> --- a/drivers/platform/x86/lenovo/ymc.c
> +++ b/drivers/platform/x86/lenovo/ymc.c
> @@ -23,7 +23,23 @@ module_param(force, bool, 0444);
>  static bool force;
>  module_param(force, bool, 0444);
>  MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");
> 
> +static const struct dmi_system_id lenovo_ymc_nosupport_dmi_table[] = {
> +	{
> +		/*
> +		 * Yoga Book 9 14IAH10: SW_TABLET_MODE is reported by the
> +		 * yb9-kbdock driver.  Suppress lenovo-ymc on this machine to
> +		 * avoid userspace seeing two input nodes that both advertise
> +		 * the SW_TABLET_MODE capability.
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
>  	{
>  		.matches = {
> @@ -100,7 +116,10 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
>  	struct lenovo_ymc_private *priv;
>  	struct input_dev *input_dev;
>  	int err;
> 
> +	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
> +		return -ENODEV;
> +
>  	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
>  		if (force)
>  			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
> --
> 2.54.0

