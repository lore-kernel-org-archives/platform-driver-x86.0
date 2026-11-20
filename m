Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169530;
	b=UDoXgrErcTgL0F1t6psTWjC7UefpB98MnmjMBin0/vvLnxMpayLFE14+8Q3bjZNcF/nu
	 vurSqqyVh+mijpsmVa6UK8RkHQApswgVjD5VHjEEYzrXcxsnouvFk6jY8tFz6Ux9ReDak
	 fKZbwIZZFHOOq9AgGDX0e/S85ejznT1PL+91JALd54Jb2FK86yZhXBh9gT3WZM9lvT5xV
	 7k2Ria39eJzO+pAU/ZtYDkGujNW51hNr2kzQAsJMsmbPvOigbSarGiyqV/f9iWWHoVQU3
	 mcjuM9DyOVU3ibi7aC0olI0Y5gne+S+e2qNp4etjrRrO55S0WXZq4MAyWe/aMEAgMqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=H3MuRZzFr5ou/OalDJ9VEoSCw1Kf/TF2fcG92pANMt0=;
	b=dvNy3nmr2/WwlX67Ae2F30YQRzWPTgf6FSng5x598/hE9MHu/hW9AN+NYPmHKXu26t2F
	 gpUWBgCn7NyH93bwh+E/hfbz+0GPurQOCU422m69O9IxvYr4FBBMc/rvuqCTTxJ2brGXy
	 OIEYV7NgClF04Fbwc1Bl7ibb+Mzn25l6/FZYQsNGtUNxtfTq7/p5ShtyLAgRxzmCJ5Zyy
	 rWYPYT+Sgu8LvTsMKZ90lKLuXuw2E7KqKDJaoZqQK9mqm2KU90BPjEpxbST7SbKc+4D/2
	 /yzCoDFGLKGcZlYG29xqFGvoB/zBvKztP90x6Og+9088IIL22LGa0uGeBePTx1D4NNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FCPQiAkk;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8858606A325;
	Fri, 20 Nov 2026 10:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8858606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FCPQiAkk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795169530; x=1826705530;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=z3a2wY9Cv9mFoR0oX0nPw+Bkp4VC7ZFQZ008/e0tRnY=;
  b=FCPQiAkkdltsw6ns6Es3ufTNRSM0hORXsL/AUAgK0DYdqRSTRkDsx5/f
   1dVBKcoAs+sWD/46nOBSjJ7W+NhPyN/myipVgoIHCDH1iCCbPSVi2cQtX
   iobh0H1B6JqqGE4qFdzdhczKb1iu1rc+sDqbHVTfDVzVIPQ5SK+0keBst
   SGMnhzOdrIPvMHF0RApMaEriZDbZeX753tZ5b+S9uzLIl+EBuXcbRTgRJ
   8bWm2PBAsNxnohhaAAh+ofT8UfmAJ5bIPFkp1JX2ySz0BzToRIbgrswK2
   bIrxdE8WF67S/74BMMajDhKTdsrXXu/bVWwRp4OTAJB45ZtH0uFAPMYux
   A==;
X-CSE-ConnectionGUID: YhEay1mSR5+h2FsTLg6MJA==
X-CSE-MsgGUID: A8xoSgqqS9mqDFWcjku02w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3957860"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3957860"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 02:12:09 -0800
X-CSE-ConnectionGUID: rAiprtyYTd2jVN8dTK7Tzg==
X-CSE-MsgGUID: zfeIKBhoQWqlbZniEsTqXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11006928"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 02:12:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 12:12:03 +0200 (EET)
To: Mario Limonciello <superm1@kernel.org>
cc: Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hansg@kernel.org>, Ma Jun <Jun.Ma2@amd.com>, 
    Evan Quan <quanliangl@hotmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86/amd: send WBRF DSM payload as buffer
In-Reply-To: <20261102-superm1-wbrf-v2-1-28b02bb4ce61@kernel.org>
Message-ID: <65fb4293-0c29-266b-28bb-7f7540735a70@linux.intel.com>
References: <20261102-superm1-wbrf-v2-1-28b02bb4ce61@kernel.org>
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

On Mon, 2 Nov 2026, Mario Limonciello wrote:

> Spec defines the WBRF record _DSM argument as a single buffer that packs
> the header and frequency ranges. The driver instead built a package of
> integers, so firmware on some systems abort \WBRF with AE_AML_OPERAND_TYPE
> when dereferencing Arg2[0].
> 
> Encode the payload into a little-endian buffer and hand it as the lone
> package element.
> 
> Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wifi band RFI mitigation feature")
> Signed-off-by: Mario Limonciello <superm1@kernel.org>
> ---
> Changes in v2:
> - Declare payload with __free(kfree) at the kzalloc() site, after input
>   validation, instead of initializing it to NULL at the top of
>   wbrf_record() (Sashiko)
> - Compute payload length with struct_size_t() so it no longer depends on
>   payload being declared earlier (Sashiko)
> - Link to v1: https://patch.msgid.link/20261102-superm1-wbrf-v1-1-b58d8d85277c@kernel.org
> ---
>  drivers/platform/x86/amd/wbrf.c | 75 +++++++++++++++++++++++------------------
>  1 file changed, 43 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
> index 3281357185d1f..2afb574e4327d 100644
> --- a/drivers/platform/x86/amd/wbrf.c
> +++ b/drivers/platform/x86/amd/wbrf.c
> @@ -6,6 +6,8 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/acpi_amd_wbrf.h>
> +#include <asm/byteorder.h>
> +#include <linux/slab.h>

Please put asm one into own group.

>  
>  /*
>   * Functions bit vector for WBRF method
> @@ -29,6 +31,17 @@ struct amd_wbrf_ranges_out {
>  	struct freq_band_range	band_list[MAX_NUM_OF_WBRF_RANGES];
>  } __packed;
>  
> +struct wbrf_record_entry {
> +	__le64		start;
> +	__le64		end;

Include

> +} __packed;

Include

> +
> +struct wbrf_record_payload {
> +	__le32			num_of_ranges;
> +	__le32			action;
> +	struct wbrf_record_entry	ranges[];
> +} __packed;
> +
>  static const guid_t wifi_acpi_dsm_guid =
>  	GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
>  		  0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
> @@ -42,8 +55,9 @@ static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
>  static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ranges_in_out *in)
>  {
>  	union acpi_object argv4;
> +	union acpi_object args[1];
>  	u32 num_of_ranges = 0;
> -	u32 num_of_elements;
> +	size_t payload_len;
>  	u32 arg_idx = 0;
>  	int ret;
>  	u32 i;
> @@ -64,45 +78,39 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
>  	if (num_of_ranges != in->num_of_ranges)
>  		return -EINVAL;
>  
> -	/*
> -	 * Every input frequency band comes with two end points(start/end)
> -	 * and each is accounted as an element. Meanwhile the range count
> -	 * and action type are accounted as an element each.
> -	 * So, the total element count = 2 * num_of_ranges + 1 + 1.
> -	 */
> -	num_of_elements = 2 * num_of_ranges + 2;
> -
> -	union acpi_object *tmp __free(kfree) = kzalloc_objs(*tmp,
> -							    num_of_elements);
> -	if (!tmp)
> +	payload_len = struct_size_t(struct wbrf_record_payload, ranges, num_of_ranges);

Include.

> +	struct wbrf_record_payload *payload __free(kfree) =

Include for __free()

> +		kzalloc(payload_len, GFP_KERNEL);
> +	if (!payload)
>  		return -ENOMEM;
>  
> -	argv4.package.type = ACPI_TYPE_PACKAGE;
> -	argv4.package.count = num_of_elements;
> -	argv4.package.elements = tmp;
> -
> -	/* save the number of ranges*/
> -	tmp[0].integer.type = ACPI_TYPE_INTEGER;
> -	tmp[0].integer.value = num_of_ranges;
> -
> -	/* save the action(WBRF_RECORD_ADD/REMOVE/RETRIEVE) */
> -	tmp[1].integer.type = ACPI_TYPE_INTEGER;
> -	tmp[1].integer.value = action;
> +	payload->num_of_ranges = cpu_to_le32(num_of_ranges);
> +	payload->action = cpu_to_le32(action);

Include

> -	arg_idx = 2;
> +	arg_idx = 0;
>  	for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
>  		if (!in->band_list[i].start || !in->band_list[i].end)
>  			continue;
>  
> -		tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> -		tmp[arg_idx++].integer.value = in->band_list[i].start;
> -		tmp[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> -		tmp[arg_idx++].integer.value = in->band_list[i].end;
> +		payload->ranges[arg_idx].start = cpu_to_le64(in->band_list[i].start);
> +		payload->ranges[arg_idx].end = cpu_to_le64(in->band_list[i].end);
> +		arg_idx++;
>  	}
>  
> +	argv4.package.type = ACPI_TYPE_PACKAGE;
> +	argv4.package.count = ARRAY_SIZE(args);

Include.

You're missing lots of headers, admittedly, many are pre-existing 
problems.

> +	argv4.package.elements = args;
> +
> +	args[0].type = ACPI_TYPE_BUFFER;
> +	args[0].buffer.length = payload_len;
> +	args[0].buffer.pointer = (u8 *)payload;
> +



>  	union acpi_object *obj __free(kfree) =
> -		acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> -				  WBRF_REVISION, WBRF_RECORD, &argv4);
> +		acpi_evaluate_dsm(adev->handle,
> +				  &wifi_acpi_dsm_guid,
> +				  WBRF_REVISION,
> +				  WBRF_RECORD,
> +				  &argv4);
>  
>  	if (!obj)
>  		return -EINVAL;
> @@ -236,8 +244,11 @@ int amd_wbrf_retrieve_freq_band(struct device *dev, struct wbrf_ranges_in_out *o
>  	param.string.length = 0;
>  	param.string.pointer = NULL;
>  
> -	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> -							WBRF_REVISION, WBRF_RETRIEVE, &param);
> +	obj = acpi_evaluate_dsm(adev->handle,
> +				&wifi_acpi_dsm_guid,
> +				WBRF_REVISION,
> +				WBRF_RETRIEVE,
> +				&param);
>  	if (!obj)
>  		return -EINVAL;

Two unrelated space only changes.

I don't think the n line version is even an improvement in the former 
case.

-- 
 i.

