Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D222F53E31
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 May 2024 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490692; cv=none; b=oVmkHFXB/WOrSSyZ39f5rKzxlBJiOWTQgZe/aO43k5lglHnlyp+9fNRdxQc5DifEjLTMbxaIRPcJnb/eACiGjKkj6x/R5W5td3XurijAwHgJawDsnOCDtyGUZ/kApULQ66J11CozalNIa0CaphjCUD6T45PVw6WnMKaWgZ6yI0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490692; c=relaxed/simple;
	bh=HMQo//966hk3t7whRm8ibfKz4OYUgtys6YLiR6IuPuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlrZ+3gLxPlFQfb30ZwoUDhnYtNjb1VCwGUAmgmSo+6stNyaF1tovlykExn++jgCblqI+9uei0OivMuB3Eno6XN1beg5Y7r89yAfYiCREARYp4mc8+0M0o0v65djkm/AmkmtS+padlxlZiJZZFW3oRl5CrvLXnSKyVNY8gmxtCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1Gd6D6H8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1Gd6D6H8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mHjpc1ug1aWwOTdw2xlHELMFlD5zl9R32NQy0ZXNB84=; b=1Gd6D6H8ecJD5m+bWJqG+gdSf8
	+luYZmFaWObZGEOp3CshmEwOCEWYwtPfzqT1tJ0ksvyipMuKc4ET6biyNORyZBtVIZR24Q29hYzvg
	mnaw3LeyKot4Xw200RCCbiMJmgE+mqqbFnqh/vAIiEgWtvLD/o9rUfm4wOKs7DcXF0Qn5YhoM+25W
	TxKnl0VYjSqxf/yRu+49rq3YbJSU8uy9HMeddv3VQKRi7uMKjZ7fCyIPKWlE0Uwc3v3ugxHICJXy1
	Ej0hg2Zqjoqk3Uf/RjTemusLIRCLkGyzsXSEkVK7i1Nh4ajIL6JIxBSQ8JpA44zvyFwaghovBkdSn
	VQeuuRxg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sADdi-000000074m8-0ypP;
	Thu, 23 May 2024 18:58:10 +0000
Message-ID: <613dfc89-a849-4ae4-9396-4eb631c96fb4@infradead.org>
Date: Thu, 23 May 2024 11:58:08 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
References: <20240523143601.47555-1-hdegoede@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240523143601.47555-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hans,

On 5/23/24 7:36 AM, Hans de Goede wrote:
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
> ---
>  .../admin-guide/kernel-parameters.txt         | 22 +++++
>  drivers/platform/x86/touchscreen_dmi.c        | 81 ++++++++++++++++++-
>  2 files changed, 99 insertions(+), 4 deletions(-)

The __setup() function return value and the documentation look good (well, a couple of nits
in the documentation, but no big deal).

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 396137ee018d..7ac315a7c0c7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1899,6 +1899,28 @@
>  				Format:
>  				<bus_id>,<clkrate>
>  

I would use:

> +	i2c_touchscreen_props= [HW,ACPI,X86]
> +			Set device-properties for ACPI enumerated I2C attached

			                          ACPI-enumerated I2C-attached

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

Thanks.
-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
