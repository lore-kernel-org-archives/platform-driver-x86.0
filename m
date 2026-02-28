Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E626158B;
	Sat, 28 Feb 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772297968; cv=none; b=dMhHA+E2gOshPZnwlboRLf+ZWG+ck6ZkCIJFhAvKYBINmoQ94ipPqce9cJ6T8t7e6PQYRU+XNxdt39YTvn6M36N3kXE85/2xSEFlW7Z5k2pgXslNV2konLjBWWcNPxYdGn3PUD8mFejzq7tCwsHpiUQu+p0okTcb/o7W7ArqOdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772297968; c=relaxed/simple;
	bh=lnM5u9m7cpcDnp2jhMP/qXb2+noJHrb9I2tKHR/BGQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nmi4Q4254DVPK0qyQ29LSzFOoIh6fONSoO5AoMfGqhTNkMcPGkqtSQF4nTL0RG1hAGHit4DB6BLmIJiRNcBMvugpB31J79EyTJdLmQHMN3I5I25kgZv1czs4rsTR2CwUC95sqrIDQzEqPWxjyCOhaKGnnCOinPl11gWyLS5S4oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZasrOEIx; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZasrOEIx"
Message-ID: <f55a6814-862e-46a9-91ca-f7bbf6921dde@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772297964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GmODGzsAeskH3T4/uB7uCNYyQELuBh/kkleAtup5VNQ=;
	b=ZasrOEIxSAf2eCPzIUTnCYqnBazHtwlj+3FKwq8LsS3TJYJIf95MVo0U2K+5YotRFEW3vb
	Qo77ohneYa9hti3Iscy1h+En9YQUU6ZcCYrrnvfdsioDMSk0vc2iXGhqp7MY5I1Urc1yCp
	UzK86ZgHwYp05+bnFi0R9SVw8vJ3hL0=
Date: Sat, 28 Feb 2026 17:59:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/4] platform/x86: asus-laptop: Register ACPI notify
 handler directly
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <5971620.DvuYhMxLoT@rafael.j.wysocki>
 <5082508.31r3eYUQgx@rafael.j.wysocki>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <5082508.31r3eYUQgx@rafael.j.wysocki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 2/28/26 16:10, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> To facilitate subsequent conversion of the driver to a platform one,
> make it install an ACPI notify handler directly instead of using
> a .notify() callback in struct acpi_driver.
>
> No intentional functional impact.
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/platform/x86/asus-laptop.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index d96f6af26ff7..c927665dfa96 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1517,9 +1517,9 @@ static void asus_input_exit(struct asus_laptop *asus)
>  /*
>   * ACPI driver
>   */
> -static void asus_acpi_notify(struct acpi_device *device, u32 event)
> +static void asus_acpi_notify(acpi_handle handle, u32 event, void *data)
>  {
> -	struct asus_laptop *asus = acpi_driver_data(device);
> +	struct asus_laptop *asus = data;
>  	u16 count;
>  
>  	/* TODO Find a better way to handle events count. */
> @@ -1881,6 +1881,11 @@ static int asus_acpi_add(struct acpi_device *device)
>  	if (result && result != -ENODEV)
>  		goto fail_pega_rfkill;
>  
> +	result = acpi_dev_install_notify_handler(device, ACPI_DEVICE_NOTIFY,
> +						 asus_acpi_notify, asus);
> +	if (result)
> +		goto fail_pega_rfkill;
> +
>  	asus_device_present = true;
>  	return 0;
>  
> @@ -1906,6 +1911,7 @@ static void asus_acpi_remove(struct acpi_device *device)
>  {
>  	struct asus_laptop *asus = acpi_driver_data(device);
>  
> +	acpi_dev_remove_notify_handler(device, ACPI_DEVICE_NOTIFY, asus_acpi_notify);
>  	asus_backlight_exit(asus);
>  	asus_rfkill_exit(asus);
>  	asus_led_exit(asus);
> @@ -1932,7 +1938,6 @@ static struct acpi_driver asus_acpi_driver = {
>  	.ops = {
>  		.add = asus_acpi_add,
>  		.remove = asus_acpi_remove,
> -		.notify = asus_acpi_notify,
>  		},
>  };
>  
