Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B86D612FF
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 01:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707786124; cv=none; b=Qw/f+p7wv8tvP4lonKTE0xF1rAc7T/DUimbQlP+35oXLcu+QqsW+AIhTvDuuDPNXdELAtAgaX8W/FHdnSasg2vwNEI71bf8YX8mbIXE2KqYnpyt0usmBlbn6NBHJTsn/YQeawj+fWbofH7oAOUeilg/VUvIvpMHlziO++0JsUjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707786124; c=relaxed/simple;
	bh=L/Wg3iSGmH2lCOWoWP+j3RWzDZoBODZrxyYbJUuVxqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoF/yYrs57gKnEa0U60iSnU1m9rZIZFCBYP9+fXe9N6KOhab7NEL0sIhuc+25DCHGsmjgPdrcUgK8Q8dm7t0xr5kLNP+plvAt4o+yI95HCcoLPOyIsUxprR4cFxtav7qGDP4iiOJbEucyF8yIB2D1GklfjZ3RLjgWVW9CMSLM/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiMGiD0S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiMGiD0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707786112; x=1739322112;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L/Wg3iSGmH2lCOWoWP+j3RWzDZoBODZrxyYbJUuVxqk=;
  b=jiMGiD0SRgPH/m+zyoXwp6neb7N7AzUDtobgCxk82vkE+s8V9ANhkboA
   CsG858E5jDL4kMt4a5EHEbZsacD1LeNqlm0f2RJc8iub3MdbU1C9UOhxD
   KTk3xR3ZTQGqVKjFf3R0v2pbY/DPg+BHYFvfrrsjy0eFYMrfiC4UQl6k8
   yyROkBeHqeAV10WYpcUI0xRKS+WTS+9hK5a7m8nMvVW7NVnc/gJuh11VA
   v1sDUa+8lxjy8S5UPstneoVbADunDKCTYtSv2zYfQl3StZLsu3rcTDiyT
   WYfTZGxMVERhqgw2kntIoOH89+7TDJ0Mis119WehpNya3ZTjLEt9HP9WK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27229258"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="27229258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 17:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7370939"
Received: from rramanuj-mobl1.amr.corp.intel.com (HELO [10.209.30.67]) ([10.209.30.67])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 17:01:51 -0800
Message-ID: <a4e81ce3-2ac7-4898-83d2-2907b183fb63@linux.intel.com>
Date: Mon, 12 Feb 2024 17:01:51 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: touchscreen_dmi: Consolidate Goodix
 upside-down touchscreen data
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240212120608.30469-1-hdegoede@redhat.com>
 <20240212120608.30469-2-hdegoede@redhat.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240212120608.30469-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/12/24 4:06 AM, Hans de Goede wrote:
> Now that prefix matches for ACPI names are supported, the ts_dmi_data
> structs for "GDIX1001:00" and "GDIX1001:01" can be consolidated into
> a single match matching on "GDIX1001".
>
> For consistency also change gdix1002_00_upside_down_data to match.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  drivers/platform/x86/touchscreen_dmi.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 969477c83e56..975cf24ae359 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -415,18 +415,13 @@ static const struct property_entry gdix1001_upside_down_props[] = {
>  	{ }
>  };
>  
> -static const struct ts_dmi_data gdix1001_00_upside_down_data = {
> -	.acpi_name	= "GDIX1001:00",
> +static const struct ts_dmi_data gdix1001_upside_down_data = {
> +	.acpi_name	= "GDIX1001",
>  	.properties	= gdix1001_upside_down_props,
>  };
>  
> -static const struct ts_dmi_data gdix1001_01_upside_down_data = {
> -	.acpi_name	= "GDIX1001:01",
> -	.properties	= gdix1001_upside_down_props,
> -};
> -
> -static const struct ts_dmi_data gdix1002_00_upside_down_data = {
> -	.acpi_name	= "GDIX1002:00",
> +static const struct ts_dmi_data gdix1002_upside_down_data = {
> +	.acpi_name	= "GDIX1002",
>  	.properties	= gdix1001_upside_down_props,
>  };
>  
> @@ -1412,7 +1407,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  	},
>  	{
>  		/* Juno Tablet */
> -		.driver_data = (void *)&gdix1002_00_upside_down_data,
> +		.driver_data = (void *)&gdix1002_upside_down_data,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
>  			/* Both product- and board-name being "Default string" is somewhat rare */
> @@ -1658,7 +1653,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  	},
>  	{
>  		/* Teclast X89 (Android version / BIOS) */
> -		.driver_data = (void *)&gdix1001_00_upside_down_data,
> +		.driver_data = (void *)&gdix1001_upside_down_data,
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "WISKY"),
>  			DMI_MATCH(DMI_BOARD_NAME, "3G062i"),
> @@ -1666,7 +1661,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  	},
>  	{
>  		/* Teclast X89 (Windows version / BIOS) */
> -		.driver_data = (void *)&gdix1001_01_upside_down_data,
> +		.driver_data = (void *)&gdix1001_upside_down_data,
>  		.matches = {
>  			/* tPAD is too generic, also match on bios date */
>  			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
> @@ -1684,7 +1679,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  	},
>  	{
>  		/* Teclast X98 Pro */
> -		.driver_data = (void *)&gdix1001_00_upside_down_data,
> +		.driver_data = (void *)&gdix1001_upside_down_data,
>  		.matches = {
>  			/*
>  			 * Only match BIOS date, because the manufacturers
> @@ -1788,7 +1783,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  	},
>  	{
>  		/* "WinBook TW100" */
> -		.driver_data = (void *)&gdix1001_00_upside_down_data,
> +		.driver_data = (void *)&gdix1001_upside_down_data,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "TW100")
> @@ -1796,7 +1791,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  	},
>  	{
>  		/* WinBook TW700 */
> -		.driver_data = (void *)&gdix1001_00_upside_down_data,
> +		.driver_data = (void *)&gdix1001_upside_down_data,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "TW700")

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

