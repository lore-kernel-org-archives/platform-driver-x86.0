Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3051272C9
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2024 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556887; cv=none; b=V/REngK48I6zSOp3Oev+gdQrrnvRe/q7MW4agwUwIu5Iha8+TSQgmAKEI7jGCOFJ5WHe35O9KXDe/BifRMS79ugWIOM7OVIYh/syJN2CdiTfJeUU1khqqgrSAZM+qSVi4GdrZ8J08YqZuy2MeMpi5r4UTdqQzbDc3+fKbA/TDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556887; c=relaxed/simple;
	bh=NNvXGXc2y2vgE71IlYHjPc6ndPSqjbrVkPALQhpxZEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDPULPCCp6LJQJ2PibmEBY7AP4yGd5oKisEZKNFIUa4oDXC41beMLRJca0Y1ld4YcS4pMjFRwysEViuzp+qs1VyHzSCzjM4CHihL46xbKYF8HTMk6PxQ6DxhUUbxLJwFfntQuEd0fMv4YPHw7ATYdk1WSLLqsf/mDl+RAQo1ncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTZlUFXQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTZlUFXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716556883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1CRC5NyGi1Fb0r2QAXREwL49lpQp1JEsxWsAfWPEXU=;
	b=GTZlUFXQSpM1kU+sxu0/TSmNc7U/JKWOvYobQP3d3ZVpT41QHZvf8jAezg9nKNBH+XnaOP
	H6MBA/vYo5BKmq+R+lSDYVpOWW0jD2tbtZLV2lb+i+0khKPRpjBgbTkdqAGNiGyq2mGw2w
	OKVoYYuQghszcwWPWpnA4sdtJxfzmrY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-ZB_enBohNuawu416mObPNg-1; Fri, 24 May 2024 09:21:22 -0400
X-MC-Unique: ZB_enBohNuawu416mObPNg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5295ed311f1so657521e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2024 06:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556880; x=1717161680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1CRC5NyGi1Fb0r2QAXREwL49lpQp1JEsxWsAfWPEXU=;
        b=lK3wHaTfnTOeIDog+22XQhAYs1sRXBJRzbn8rdrX3woH09i+0V8aJjjaJmf8gr5bqm
         vIf0J7BhUwZYGHobUnuKDqCethPHD2sQnAMrn5WNDGvCCzgA9oDb4CO3LStCwlsJzFvj
         t3yWnbxRuBMwkHRoU/XODgTARWAPDcniCKfkVhJszmaMXQqQqpHm6atZhvpURo0k1qWB
         cn/xLF5l1tch1SJczTHOm8zILaIDbMPyMz3m9ChanLKMr9S8vHKXdnopvwJff10oTiOm
         Ky3y4Ghmzp4sitKsQSjmF295aP5sSeBr8l381zxdGAaDiI3wrLwXZKRoHQOBjj+9DDdK
         n23A==
X-Gm-Message-State: AOJu0YzC8WliCYn4YTee19MI6FpGm/K3lg3uwgYdQCWqlP3vDrZNT7ov
	dnTIIKKFhlsXDi2lAJsTbjPwSb/OnSNYRuMyqVL8f5U+SO2KKyWxzm+xB75QBRnIm6K2jWc1flR
	nifV5JnWcrRAODw6NqhqT1b0cFdHKiOXqUiFzhVzjBveD3xoG1KLjoCKhMZyfTe5yerh4XCs=
X-Received: by 2002:ac2:4a6f:0:b0:516:be80:178f with SMTP id 2adb3069b0e04-529668c4a18mr1219927e87.43.1716556880569;
        Fri, 24 May 2024 06:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZv/bP+fR7vELJ6X+iC8DMfklal9+ankoJIl5YWh5WCJAYHm68QuQ200VHpt7RtbxDifwyew==
X-Received: by 2002:ac2:4a6f:0:b0:516:be80:178f with SMTP id 2adb3069b0e04-529668c4a18mr1219916e87.43.1716556880072;
        Fri, 24 May 2024 06:21:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524b5898sm1721266a12.82.2024.05.24.06.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 06:21:19 -0700 (PDT)
Message-ID: <792e7722-8e93-4414-9665-2bddd888173c@redhat.com>
Date: Fri, 24 May 2024 15:21:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
References: <20240523143601.47555-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240523143601.47555-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 5/23/24 4:36 PM, Hans de Goede wrote:
> On x86/ACPI platforms touchscreens mostly just work without needing any
> device/model specific configuration. But in some cases (mostly with Silead
> and Goodix touchscreens) it is still necessary to manually specify various
> touchscreen-properties on a per model basis.
> 
> touchscreen_dmi is a special place for DMI quirks for this, but it can be
> challenging for users to figure out the right property values, especially
> for Silead touchscreens where non of these can be read back from
> the touchscreen-controller.
> 
> ATM users can only test touchscreen properties by editing touchscreen_dmi.c
> and then building a completely new kernel which makes it unnecessary
> difficult for users to test and submit properties when necessary for their
> laptop / tablet model.
> 
> Add support for specifying properties on the kernel commandline to allow
> users to easily figure out the right settings. See the added documentation
> in kernel-parameters.txt for the commandline syntax.
> 
> Cc: Gregor Riepl <onitake@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Refactor ts_data / ts_data_dmi handling a bit (addressing Andy's review)
> - Accept hex/octal numbers (addressing Andy's review)
> - Fix ts_parse_props return value (addressing Randy's review)
> - Use ':' as separator instead of ',', ',' is used in "vendor,option" style
>   property names, e.g. "silead,home-button"
> - pr_warn() on invalid syntax since init/main.c does not do this
> ---
> Note assuming this gets favourable review(s) in a reasonable timeframe
> I'm thinking about maybe even adding this to 6.10 as a fix since users
> not being able to easily test Silead touchscreen settings has been an
> issue for quite a while now. Without the cmdline option being used this
> is a no-op so the chance of this causing regressions is close to 0.

Ok, so here is the other half of this in the form of documentation how
to use this to figure out the right configuration parameters for Silead
touchscreens on laptop/tablet models which are not supported yet:

https://github.com/jwrdegoede/gsl-firmware/blob/master/README.md#determining-the-touchscreens-parameters

As mentioned above I would like to merge this through the fixes branch
since this resolves a long standing issue with users not being able to
use Silead touchscreens on unknown models.

Ilpo, do you have any objections against me merging this through
the fixes branch ?

Regards,

Hans




> ---
>  .../admin-guide/kernel-parameters.txt         | 22 +++++
>  drivers/platform/x86/touchscreen_dmi.c        | 81 ++++++++++++++++++-
>  2 files changed, 99 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 396137ee018d..7ac315a7c0c7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1899,6 +1899,28 @@
>  				Format:
>  				<bus_id>,<clkrate>
>  
> +	i2c_touchscreen_props= [HW,ACPI,X86]
> +			Set device-properties for ACPI enumerated I2C attached
> +			touchscreen, to e.g. fix coordinates of upside-down
> +			mounted touchscreens. If you need this option please
> +			submit a drivers/platform/x86/touchscreen_dmi.c patch
> +			adding a DMI quirk for this.
> +
> +			Format:
> +			<ACPI_HW_ID>:<prop_name>=<val>[:prop_name=val][:...]
> +			Where <val> is one of:
> +			Omit "=<val>" entirely	Set a boolean device-property
> +			Unsigned number		Set a u32 device-property
> +			Anything else		Set a string device-property
> +
> +			Examples (split over multiple lines):
> +			i2c_touchscreen_props=GDIX1001:touchscreen-inverted-x:
> +			touchscreen-inverted-y
> +
> +			i2c_touchscreen_props=MSSL1680:touchscreen-size-x=1920:
> +			touchscreen-size-y=1080:touchscreen-inverted-y:
> +			firmware-name=gsl1680-vendor-model.fw:silead,home-button
> +
>  	i8042.debug	[HW] Toggle i8042 debug mode
>  	i8042.unmask_kbd_data
>  			[HW] Enable printing of interrupt data from the KBD port
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index c6a10ec2c83f..b021fb9e579e 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -9,10 +9,13 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/ctype.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
>  #include <linux/efi_embedded_fw.h>
>  #include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kstrtox.h>
>  #include <linux/notifier.h>
>  #include <linux/property.h>
>  #include <linux/string.h>
> @@ -1817,7 +1820,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  	{ }
>  };
>  
> -static const struct ts_dmi_data *ts_data;
> +static struct ts_dmi_data *ts_data;
>  
>  static void ts_dmi_add_props(struct i2c_client *client)
>  {
> @@ -1852,6 +1855,64 @@ static int ts_dmi_notifier_call(struct notifier_block *nb,
>  	return 0;
>  }
>  
> +#define MAX_CMDLINE_PROPS 16
> +
> +static struct property_entry ts_cmdline_props[MAX_CMDLINE_PROPS + 1];
> +
> +static struct ts_dmi_data ts_cmdline_data = {
> +	.properties = ts_cmdline_props,
> +};
> +
> +static int __init ts_parse_props(char *str)
> +{
> +	/* Save the original str to show it on syntax errors */
> +	char orig_str[256];
> +	char *name, *value;
> +	u32 u32val;
> +	int i, ret;
> +
> +	strscpy(orig_str, str, sizeof(orig_str));
> +
> +	/*
> +	 * str is part of the static_command_line from init/main.c and poking
> +	 * holes in that by writing 0 to it is allowed, as is taking long
> +	 * lasting references to it.
> +	 */
> +	ts_cmdline_data.acpi_name = strsep(&str, ":");
> +
> +	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
> +		name = strsep(&str, ":");
> +		if (!name || !name[0])
> +			break;
> +
> +		/* Replace '=' with 0 and make value point past '=' or NULL */
> +		value = name;
> +		strsep(&value, "=");
> +		if (!value) {
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
> +		} else if (isdigit(value[0])) {
> +			ret = kstrtou32(value, 0, &u32val);
> +			if (ret)
> +				goto syntax_error;
> +
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
> +		} else {
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
> +		}
> +	}
> +
> +	if (!i || str)
> +		goto syntax_error;
> +
> +	ts_data = &ts_cmdline_data;
> +	return 1;
> +
> +syntax_error:
> +	pr_err("Invalid '%s' value for 'i2c_touchscreen_props='\n", orig_str);
> +	return 1; /* "i2c_touchscreen_props=" is still a known parameter */
> +}
> +__setup("i2c_touchscreen_props=", ts_parse_props);
> +
>  static struct notifier_block ts_dmi_notifier = {
>  	.notifier_call = ts_dmi_notifier_call,
>  };
> @@ -1859,13 +1920,25 @@ static struct notifier_block ts_dmi_notifier = {
>  static int __init ts_dmi_init(void)
>  {
>  	const struct dmi_system_id *dmi_id;
> +	struct ts_dmi_data *ts_data_dmi;
>  	int error;
>  
>  	dmi_id = dmi_first_match(touchscreen_dmi_table);
> -	if (!dmi_id)
> -		return 0; /* Not an error */
> +	ts_data_dmi = dmi_id ? dmi_id->driver_data : NULL;
> +
> +	if (ts_data) {
> +		/*
> +		 * Kernel cmdline provided data takes precedence, copy over
> +		 * DMI efi_embedded_fw info if available.
> +		 */
> +		if (ts_data_dmi)
> +			ts_data->embedded_fw = ts_data_dmi->embedded_fw;
> +	} else if (ts_data_dmi) {
> +		ts_data = ts_data_dmi;
> +	} else {
> +		return 0; /* Not an error */
> +	}
>  
> -	ts_data = dmi_id->driver_data;
>  	/* Some dmi table entries only provide an efi_embedded_fw_desc */
>  	if (!ts_data->properties)
>  		return 0;

