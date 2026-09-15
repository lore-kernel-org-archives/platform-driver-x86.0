Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658EC3D5668;
	Tue, 15 Sep 2026 17:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492524; cv=none; b=M8h39IztJSokMlxAJCOb4l3FyuHP1+/jeGo2rD/g1ws6nbLIuI2G+kTyzLDUpaxf5V2fqgMEGXmLT8YBZ661DnCKPMBx1Oc4EW1pb52PB+aYcso/AVQccIvMsD53TB8woKtlPiCbqf5RhhY0j7bHQZIH4YEVK1R8uXYSVCqFBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492524; c=relaxed/simple;
	bh=JSnrrUerhX6XIiLOJ75mEb5KmPDcfgIUqP84XdLG+tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvuIMd9UiDAowBlbbpJwiglEMX1X7wlM6BqpGRV8kFitjKK3pBDAasyWn2fXeSLiLwSThYe5MAlwnRjD8kksank3g1k9raPPEOx/mzgRBXI3XaVuFzCpo+e20fS4gNOAXQyAIrn3wZ1ZA3KYC2r3NqUWKqbmj66/j4umkrO+Hh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAEWfhnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAEWfhnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFAD1F000FF;
	Tue, 15 Sep 2026 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789492523;
	bh=dRAAFZIaKcsYaqholK9IaZ/X5XQMKTOVgGcmMe+WExI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YAEWfhnxiz+pff8UqN7PGX+QZseoFNEkiBrdcXixdJTXDV2IzY2TPhnuMCXaZVFvt
	 cyFIjKzRBJuoDNtwdHEXdkOKk0fZ6H1zZkv0wb/onbUg01keE8fL8Ad4+u5JGdUuz4
	 lbcq0jlp/MQ3odiXv1nX0nl6YjjIZ8IQnNVbqFrMFOP2hLeSdlqKmQJ/+AzMa4kCIB
	 2DZF9gSMFtkchNheR8LnlkJFOx4go3DNQ005cJaFz8/QGnLt2TjqNvUyXcNI7db1EL
	 6YHB48GlG0degVaYfGnw/VR0MHl/jeAbLGT9fcS7/hk58u9Br9gojC2WMmsCk1JubH
	 x0FX2XoeYbzIQ==
Message-ID: <75ddef3a-c32d-473b-bebc-1bc6b41a0862@kernel.org>
Date: Tue, 15 Sep 2026 12:15:20 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
Content-Language: en-US
To: Asai Neko <sugar@sne.moe>, Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/15/26 11:32, Asai Neko wrote:
> asus-wmi attempts to register its LPS0 suspend-to-idle callback during
> probe. acpi_register_lps0_dev() returns -ENODEV when the LPS0 interface
> is unavailable or explicitly disabled, but the driver treats this
> expected condition as a registration failure and prints:
> 
>    failed to register LPS0 sleep handler in asus-wmi
> 
> This occurs on the ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
> The system exposes no PNP0D80 ACPI device and uses deep suspend. The
> warning therefore misleadingly suggests a sleep-related malfunction
> on a platform where the LPS0 callback is not applicable.
> 
> Suppress the warning for -ENODEV while retaining it for other errors.
> Leave callback registration and suspend/resume behavior unchanged.
> 
> Signed-off-by: Asai Neko <sugar@sne.moe>
> ---
> Avoid the misleading ASUS WMI warning when LPS0 is unavailable.
> The diagnosis and rationale are included in the patch commit
> message.
> ---
>   drivers/platform/x86/asus-wmi.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a65090429ca7..f7d009b742b3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -5421,8 +5421,11 @@ static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
>   
>   static void asus_s2idle_check_register(void)
>   {
> -	if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
> -		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> +	int ret;
> +
> +	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> +	if (ret && ret != -ENODEV)
> +		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n", ret);
>   }
>   
>   static void asus_s2idle_check_unregister(void)
> 
> ---
> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
> change-id: 20260916-asus-wmi-lps0-unavailable-warn-9a72be44b9ed
> 
> Best regards,
> --
> Asai Neko <sugar@sne.moe>
> 
> 
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
