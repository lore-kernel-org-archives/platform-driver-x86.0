Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA359140
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 01:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707786075; cv=none; b=aiqh54j+shMAMOMkar+QhURDOAw23YpEW8a+nCYTEvi+29McF1sh1vPmxkkxnXsE3rhGVzJ60UulYCdOmx/ySAjCKZFo0gFRYYHoxYKNc7I6BrNhgGxxnTZZ3294vdZcmwQxgTWvxdBvO0ay9W8RuQgHzBnSQO3hOXSqK+p+dN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707786075; c=relaxed/simple;
	bh=VAEfyfyOqUMMXMywoOSpc/f8ali3fOn3QVAueqiu++0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxgaUr6hTtCDL2qxi3Ws2L3gqWfrUqmmVX7SCZ4n1nXDBUlzf8QxYw62x84UAggIewSt3Efst/8YA4meJZP0aVq+e8QMLe5QCOtEcIpdbSfNfGCfUXKOlTX0n6KLPLGV5HI1owluUEOljqYPgu+04RBofSxrJ0JXm2apuhJ/rk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BToE/86G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BToE/86G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707786073; x=1739322073;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VAEfyfyOqUMMXMywoOSpc/f8ali3fOn3QVAueqiu++0=;
  b=BToE/86GbgwZPoffJUKEMiiuq8BDvdOElA9p6K7h3bIXEzjDE8dMpfjf
   TO2i1qm8L58QrDBJ0YBegd6FmaFaHHe8ZX9e8Q4Ds2qgl7yUxPkx/Kyj5
   CP6z+Wy/4bl8XwcgfWi18/TYM4E6hKZMZ3bgiSpKOJynGLo4DHPn2lsHH
   txgAV+Y/Lw+WiQkTEie9KbcQU8utDs5BPdriEsR3/KC5Tb0V0QfyM4ML2
   iEtMNzOutCwr//jgHPHlah2jfyWINVMTaCewnrTQv+1BzQfcXKQay0nLb
   M9UW26J3PJWektDq1FxwI5CqpA3gycfjHNYWNDHRRKYpMEtjSwfe0iXwb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27229222"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="27229222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 17:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7370909"
Received: from rramanuj-mobl1.amr.corp.intel.com (HELO [10.209.30.67]) ([10.209.30.67])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 17:01:12 -0800
Message-ID: <aaeb4332-e6a3-4e21-880f-69b4bcc42ba5@linux.intel.com>
Date: Mon, 12 Feb 2024 17:01:11 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Allow partial (prefix)
 matches for ACPI names
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240212120608.30469-1-hdegoede@redhat.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240212120608.30469-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/12/24 4:06 AM, Hans de Goede wrote:
> On some devices the ACPI name of the touchscreen is e.g. either
> MSSL1680:00 or MSSL1680:01 depending on the BIOS version.
>
> This happens for example on the "Chuwi Hi8 Air" tablet where the initial
> commit's ts_data uses "MSSL1680:00" but the tablets from the github issue
> and linux-hardware.org probe linked below both use "MSSL1680:01".
>
> Replace the strcmp() match on ts_data->acpi_name with a strstarts()
> check to allow using a partial match on just the ACPI HID of "MSSL1680"
> and change the ts_data->acpi_name for the "Chuwi Hi8 Air" accordingly
> to fix the touchscreen not working on models where it is "MSSL1680:01".
>
> Note this drops the length check for I2C_NAME_SIZE. This never was
> necessary since the ACPI names used are never more then 11 chars and
> I2C_NAME_SIZE is 20 so the replaced strncmp() would always stop long
> before reaching I2C_NAME_SIZE.
>
> Link: https://linux-hardware.org/?computer=AC4301C0542A
> Closes: https://github.com/onitake/gsl-firmware/issues/91
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Since this is a bug fix, don't you want to add stable tag?

Otherwise, it looks good.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  drivers/platform/x86/touchscreen_dmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 7aee5e9ff2b8..969477c83e56 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -81,7 +81,7 @@ static const struct property_entry chuwi_hi8_air_props[] = {
>  };
>  
>  static const struct ts_dmi_data chuwi_hi8_air_data = {
> -	.acpi_name	= "MSSL1680:00",
> +	.acpi_name	= "MSSL1680",
>  	.properties	= chuwi_hi8_air_props,
>  };
>  
> @@ -1821,7 +1821,7 @@ static void ts_dmi_add_props(struct i2c_client *client)
>  	int error;
>  
>  	if (has_acpi_companion(dev) &&
> -	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> +	    strstarts(client->name, ts_data->acpi_name)) {
>  		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
>  		if (error)
>  			dev_err(dev, "failed to add properties: %d\n", error);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

