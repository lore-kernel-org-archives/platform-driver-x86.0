Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845E45025
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732781314; cv=none; b=gV1kmAsYm/TRFEjW5mFgaIWh5T08TSJrYKSn8zflohnX0fzuginyfZ49ctz9adBtR6aHdrrrWpE6yrVt/a4mJnadtc4rIRm1wMWU4Bz8lcN7iCLnF/NSS9Bwn6hpCerZbdDFjEU4oRmt6t7xthsqya0vHab/eSJMHTg10x507WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732781314; c=relaxed/simple;
	bh=7QnTt+rmV2W8qShEsJHrbtLUG5wAYHr0ydR7asOwSf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFFf9Lo96ajGD9Vr94qygUhCVxxT00nFcArHnCObaHh+Ci6YLw2kFnm0HGUmvAIX6Z8OTMC+Ke4PQKRSgKb3clpd8wZex/lGWVa6eRBLnnVi1PzSY7G0/SGO6pj4ZGKLtrMPZbalTntlY+22W5D5pTVsI6L8k+eR/doGoQS5TNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZy/pOIN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZy/pOIN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso4756845e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732781311; x=1733386111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4mPUotoMKLtEnInook2LJELRWJKdb1KxSRlXcVsAls=;
        b=CZy/pOINDao9VHRRoKHwpCN7WQzewlQT+VfWg6syWkFoBQKcYexoBs1VpAU+yX4vOT
         igLqiNIpBT47RFIhhtuVRJtbCh87IDy7vooySzJbwXLkvr7V/b9OwEd2wedHl9EyVCnn
         cRyNCPzi6NoDmkcc578S/VkQx+rZONjVOGoNGXXVS9j0sAOZwn2/NUqAOBhyAD5o44/r
         RjHZyZlcBIRwou4p/8gcK6btjTe7ajRqcqE8744GOoRGwjusND1fb1Cjw96GasVSsyJw
         dHSSPmVYC4282NT/PsTL6k7n6CSHju8vaEABTL9hARC/rxoTxIiftC+k+NQIwl2pcqki
         9URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732781311; x=1733386111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4mPUotoMKLtEnInook2LJELRWJKdb1KxSRlXcVsAls=;
        b=LdWvYnJiKwdDIN7n/VaLqnA9akonVOSrqxmglDuTI4vqr5LU6iR1NHj3IZlEldffsW
         LnPX/2AU2kMHqzK+9zFYWF9mYIPeAe9SFzGWc9PiYJJJ+phPEGFvgNe0VwQGoGGlueyZ
         z/OfpRHtFxyma1thUgmfLa4CgLrrP378ARpARxzpv9KGmLOmOGobEcfelI7qLWm0WHUh
         KDsaof56ivyeQeC1gdIUUi66sUVddY57gKd0kpEDvZPfMUU8TxaIaCrLRAuoBHq1zN26
         DMGAv4p6QEA+gXCT4pj3yYyIyHNdYbmNwBOAb8uky8SnzrJLq/M17MIFRj6Ao2B2U1sR
         g69w==
X-Gm-Message-State: AOJu0YzPvzPJN1kz9mMLCYYUmb/SW5YEsPPQv1/xCfe8LFpD9fo6aZ2Q
	ROzx2MD98HpLj7SX8ps5kfE+ml4WqIWT/nS4hQrGTZMD65ZsPSZmk5hKkw==
X-Gm-Gg: ASbGncsonqNZpEqEo5ig8JlKkUkaNBWbPbmXu4zZ563JdobfGEiXfJaOKYQVaDioX97
	5IW7TE8EfWR2wk7aE8YDEbxkmXCzgbcGZFhfGKuqoGDw8wjW4GP/Q3TqZk2RVYp3QpjQ09YJk9o
	usKYBRQpXbsIldzwTiSJlBxYktYPp/OCamcCOkRLp6XgvPydjgSXRPX+fQkpFRui+XJ2KRzRyty
	zmlyXxY2IavAvjJBSqEuqj3mYaY13ZWAomKQY9QXvGR1gnrWMyQ0hG7gCur818VCk3LkNtQZNDT
	9AiwinpM/c8/3dRtcjj4gj58wqY=
X-Google-Smtp-Source: AGHT+IGMiQaeCobP9DyPlH3y4/gdycKVzYvFM5KhHglu1qsJVGpZcZDWxXYzuhNouucmoqRzu/LP2w==
X-Received: by 2002:a05:600c:5106:b0:434:9df4:5472 with SMTP id 5b1f17b1804b1-434a9df09b4mr58770165e9.31.1732781310771;
        Thu, 28 Nov 2024 00:08:30 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70cb2sm13593285e9.37.2024.11.28.00.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 00:08:30 -0800 (PST)
Message-ID: <cc6cdbeb-10fd-4f5a-9528-5651edf19186@gmail.com>
Date: Thu, 28 Nov 2024 09:08:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/surface: Switch back to struct
 platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20241125101107.5677-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20241125101107.5677-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/24 11:11 AM, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/platform/surface to use
> .remove(), with the eventual goal to drop struct
> platform_driver::remove_new(). As .remove() and .remove_new() have the
> same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Looks good to me.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

> ---
> Hello,
> 
> this is based on todays next, feel free to drop changes that result in a
> conflict when you come around to apply this. I'll care for the fallout
> at a later time then. (Having said that, if you use b4 am -3 and git am
> -3, there should be hardly any conflict.)
> 
> The change isn't urgent (as there are still quite a few users of
> .remove_new()) and merge window material. Still it would be nice if you
> scheduled it for v6.14-rc1.
> 
> Best regards
> Uwe
> 
>   drivers/platform/surface/surface3-wmi.c                | 2 +-
>   drivers/platform/surface/surface_acpi_notify.c         | 2 +-
>   drivers/platform/surface/surface_aggregator_cdev.c     | 2 +-
>   drivers/platform/surface/surface_aggregator_registry.c | 2 +-
>   drivers/platform/surface/surface_dtx.c                 | 2 +-
>   drivers/platform/surface/surface_gpe.c                 | 2 +-
>   drivers/platform/surface/surface_hotplug.c             | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/surface/surface3-wmi.c
> index c15ed7a12784..6c8fb7a4dde4 100644
> --- a/drivers/platform/surface/surface3-wmi.c
> +++ b/drivers/platform/surface/surface3-wmi.c
> @@ -247,7 +247,7 @@ static struct platform_driver s3_wmi_driver = {
>   		.name = "surface3-wmi",
>   		.pm = &s3_wmi_pm,
>   	},
> -	.remove_new = s3_wmi_remove,
> +	.remove = s3_wmi_remove,
>   };
>   
>   static int __init s3_wmi_init(void)
> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
> index 14a9d8a267cb..3b30cfe3466b 100644
> --- a/drivers/platform/surface/surface_acpi_notify.c
> +++ b/drivers/platform/surface/surface_acpi_notify.c
> @@ -850,7 +850,7 @@ MODULE_DEVICE_TABLE(acpi, san_match);
>   
>   static struct platform_driver surface_acpi_notify = {
>   	.probe = san_probe,
> -	.remove_new = san_remove,
> +	.remove = san_remove,
>   	.driver = {
>   		.name = "surface_acpi_notify",
>   		.acpi_match_table = san_match,
> diff --git a/drivers/platform/surface/surface_aggregator_cdev.c b/drivers/platform/surface/surface_aggregator_cdev.c
> index 165b1416230d..bfaa09d1648b 100644
> --- a/drivers/platform/surface/surface_aggregator_cdev.c
> +++ b/drivers/platform/surface/surface_aggregator_cdev.c
> @@ -762,7 +762,7 @@ static struct platform_device *ssam_cdev_device;
>   
>   static struct platform_driver ssam_cdev_driver = {
>   	.probe = ssam_dbg_device_probe,
> -	.remove_new = ssam_dbg_device_remove,
> +	.remove = ssam_dbg_device_remove,
>   	.driver = {
>   		.name = SSAM_CDEV_DEVICE_NAME,
>   		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 06e45f0b9817..d4f32ad66530 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -554,7 +554,7 @@ static void ssam_platform_hub_remove(struct platform_device *pdev)
>   
>   static struct platform_driver ssam_platform_hub_driver = {
>   	.probe = ssam_platform_hub_probe,
> -	.remove_new = ssam_platform_hub_remove,
> +	.remove = ssam_platform_hub_remove,
>   	.driver = {
>   		.name = "surface_aggregator_platform_hub",
>   		.acpi_match_table = ssam_platform_hub_acpi_match,
> diff --git a/drivers/platform/surface/surface_dtx.c b/drivers/platform/surface/surface_dtx.c
> index 89ca6b50e812..97ae010069e4 100644
> --- a/drivers/platform/surface/surface_dtx.c
> +++ b/drivers/platform/surface/surface_dtx.c
> @@ -1180,7 +1180,7 @@ MODULE_DEVICE_TABLE(acpi, surface_dtx_acpi_match);
>   
>   static struct platform_driver surface_dtx_platform_driver = {
>   	.probe = surface_dtx_platform_probe,
> -	.remove_new = surface_dtx_platform_remove,
> +	.remove = surface_dtx_platform_remove,
>   	.driver = {
>   		.name = "surface_dtx_pltf",
>   		.acpi_match_table = surface_dtx_acpi_match,
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
> index 62fd4004db31..b359413903b1 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -278,7 +278,7 @@ static void surface_gpe_remove(struct platform_device *pdev)
>   
>   static struct platform_driver surface_gpe_driver = {
>   	.probe = surface_gpe_probe,
> -	.remove_new = surface_gpe_remove,
> +	.remove = surface_gpe_remove,
>   	.driver = {
>   		.name = "surface_gpe",
>   		.pm = &surface_gpe_pm,
> diff --git a/drivers/platform/surface/surface_hotplug.c b/drivers/platform/surface/surface_hotplug.c
> index a404f26cfae8..c0d83ed5a208 100644
> --- a/drivers/platform/surface/surface_hotplug.c
> +++ b/drivers/platform/surface/surface_hotplug.c
> @@ -259,7 +259,7 @@ MODULE_DEVICE_TABLE(acpi, surface_hotplug_acpi_match);
>   
>   static struct platform_driver surface_hotplug_driver = {
>   	.probe = surface_hotplug_probe,
> -	.remove_new = surface_hotplug_remove,
> +	.remove = surface_hotplug_remove,
>   	.driver = {
>   		.name = "surface_hotplug",
>   		.acpi_match_table = surface_hotplug_acpi_match,
> 
> base-commit: 85a2dd7d7c8152cb125712a1ecae1d0a6ccac250

