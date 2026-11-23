Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426480;
	b=DRSrqa2PpE9Nep0leb0aUWQEHME0zRnmhMPJth0XuwvUxlhky+AyHRtcyiYLK3uiwJFX
	 MJEneJLHNsNZrs0wE5D2TBpgSMDQXfXQkvkOCsFv5FE5YFzPKRkgxYY/PkkkOWa/iNsxU
	 rUlWAwNL0DzvChSKUhntVFvw6UQ8HMXW1HuFfIdm/AEJqvR+Y9Y8Fm7zj4QIXxAN0ptqb
	 FdlQv9udhyGLnNXXPo+YwVkp6zXIuS2tkl9AN97r+SFpJoorWdfoS35j/1W0dULYhk2SL
	 jIQiuNXYC0d8WfPQRlbv+rS5UWGW8QtH5ogDplmlswIV+Lv2UN+ZMuc5CTm78VjZmUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426480;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=dJ3HYzxVNeg74z4ggDemkqnyxqUQZf0GIPxoSzT5ayg=;
	b=tEfSmntO94nu9JyUVnIQ7ufQY/VuTt51EtLSqrB40gpxrai9RcJ0KLlxtZOzabEpQ9jZ
	 +AJ1sKgo6doLt81LBK3nn8uV4OmxGFv79ZyaGdUNC/igSU1WJhF2ekMEIkdoOs3YIGUWP
	 z7GAVDQAVNTpOWKEtu+lrjxZuC2AJe9sh1O8bOLzuU+LH7nG687KMyZVCDduB+KvBEYJa
	 7qAz8+xnP5LvIo9KZy+XPNzKVvyNiwCFiv3ATB9yCIShicBdVMaRDXM7t7Ou4kBQpiivH
	 42XvAQHhaTCMg8LVyjQyTKpW8rDVEpWEiMVOADqHl0z1gcRdmn1aY/3G9JMMaezGroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bw9vs8EJ;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97706606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97706606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bw9vs8EJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795426480; x=1826962480;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ShJ4wXhHNVs7Hnq95yCHl23ZRJpIJ4BV5CMYOxApH+c=;
  b=bw9vs8EJsPDuNhU24m23KR+Pj2iQAyqRHrUZAvgi5WoXpf39uBPKwsm+
   yrNRt20lJGpiNjPaEnkWAAdS2xfJXwDVYa/DHIeytOFk04o9sFOtxjbS3
   +TwMR5f4OkG6kEv/b2w9aU/d1/EHxmbUjQP/jM1CtlPzejM06B17Qr4aX
   VJ5U9UKK6oHDDMH9GylF3MKNK4mPSDev15Biy8TbhKksv7TPDHHC5QKR+
   08aQOaPNALm+NkEQGLT/0NrBNQGhlg+mgsGSomv5ab8BKfYgv6GG2VOzs
   z4K0BZprmvmrDV8PvgKr2dGFFzCYFMlxb69TFiEU6HYCIMdR9FH9tDORI
   Q==;
X-CSE-ConnectionGUID: +vNfuLKpRKaFjEsRoShgew==
X-CSE-MsgGUID: icU/vnyxSmGVHaapmkTEPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4136793"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4136793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:34:39 -0800
X-CSE-ConnectionGUID: 5r6dWNThRjGetMENqNI+EA==
X-CSE-MsgGUID: 8b5/oVlbTzmQr+I/r7fZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11269861"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:34:36 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 11:34:33 +0200 (EET)
To: Martiya Aryan Mehr <martiya.ar@gmail.com>
cc: platform-driver-x86@vger.kernel.org, qby140326@gmail.com, 
    ilya.gladyshev@linux.dev, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 1/1] platform/x86: bitland-mifs-wmi: add profile support
 for Xiaomi TM2309
In-Reply-To: <20261122163658.23920-2-Martiya.ar@gmail.com>
Message-ID: <6610f046-b98d-06ad-2fd9-183ce33ad88f@linux.intel.com>
References: <20261122163658.23920-1-Martiya.ar@gmail.com> <20261122163658.23920-2-Martiya.ar@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Nov 2026, Martiya Aryan Mehr wrote:

> Add platform profile support for Xiaomi Redmi Book Pro 16 2024
> (TM2309), using firmware QFAN values 2, 1, 3 and 4 for low-power,
> balanced, performance and max-power, respectively.
> 
> The firmware can report QFAN 0 as a stale balanced state after
> resume. Map it to balanced for readback, but mark it non-settable
> so selecting balanced writes QFAN 1.
> 
> Add a battery-specific performance entry and skip the AC-type
> check, which is not implemented by this model's firmware.

Hi.

Cut start...

> ChatGPT (GPT-6) assisted with analyzing the existing profile-entry
> implementation, interpreting firmware observations, proposing
> the TM2309 profile table and DMI match, and drafting the changelog.
> The submitter reviewed the changes and tested the profile behavior
> on the device using the local development driver.
> 
> Both patched and unmodified driver objects were built against
> linux-next-20261120 without compiler warnings. The exact standalone
> patch was not independently loaded as a module; full modpost and
> runtime testing of that isolated patch were not performed.


...cut end.

If you want to put how the patch came to be details, please place them 
under --- lines.

> Link: https://lore.kernel.org/all/20260930015058.3076905-1-uselessfire@gmail.com/
> Signed-off-by: Martiya Aryan Mehr <Martiya.ar@gmail.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index f71c93a..53c5a14 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -153,6 +153,22 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
>  	.skip_ac_type_check = true,
>  };
>  
> +/* Xiaomi Redmi Book Pro 16 2024 (TM2309) */
> +static const struct bitland_profile_entry tm2309_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   2 },
> +	{ PLATFORM_PROFILE_BALANCED,    0, .no_set = true },
> +	{ PLATFORM_PROFILE_BALANCED,    1 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 3 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 3, .battery = true },
> +	{ PLATFORM_PROFILE_MAX_POWER,   4 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2309_quirks = {
> +	.profile_entries = tm2309_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2309_profile_entries),
> +	.skip_ac_type_check = true,
> +};
> +
>  static const struct dmi_system_id bitland_mifs_dmi_table[] = {
>  	{
>  		.matches = {
> @@ -176,6 +192,13 @@ static const struct dmi_system_id bitland_mifs_dmi_table[] = {
>  		},
>  		.driver_data = (void *)&tm2424_quirks,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2309"),
> +		},
> +		.driver_data = (void *)&tm2309_quirks,
> +	},
>  	{}
>  };

Please put both into places determined by the alphanumerically increasing 
order within the respective structures.


-- 
 i.

