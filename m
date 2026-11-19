Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084832;
	b=BO3TMQFtoNQ+abxwE6vcK07eaVOkuWhzBfr6nX3jQxPY17Eg/dNH1Kj/iLQayIOj/Jr+
	 100e6YNPIOGADWB1clMlq1mmG2Ks5jbIvudlymf/cN6XjlT8ruC87farZRKMTBouUrJKY
	 D8xmYq6FLlxT3dixonIsBX/YTrddnjaKvoWB2bJ0PgMj2lKDnQ5So2VUHN5jGosml5do+
	 iuVci5QLhkr2lypztfwtaiXkkjfxXD472IQUKY6SWB3qK2lzEGgybXbDAXjsuXrAWp+WA
	 uXuvtlK4TLX1LddLbKkz5bF25LPxPvQ1iAaTzE9F42iuV3rxSX2J1yoU2+1yKSirsTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084832;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=RFVNFIjcO3Ulwy6sX7nyHl/0N7duaX0bxilnZGTC340=;
	b=ZR/Q9I46Fot7L1mgmJemWKtvosU6eWwwilk/gZlJ20b14EmP9002UYeAnXGHVzjbULR5
	 VdITebL/ZUVG+sco6EaEScgYb4WXV6hhFMma8mwEY9R6ac2I1MjLbzLCMQdg8pKO5Dkb8
	 cnoet7Pzj09d8G7lzKf700XGJY+mhTY2qXTSqYLAszh+MYrSwA8JPvqKYbQAuLJoOAD2u
	 03ttGj51QcW17LkKXLW5vYtrX+grq3ZcwcWVnqkIxtl4jIPcsrWyMBvFV7/CtqsyKQuL4
	 7hW3d3AZBu/AyStpt5uNF1X0kLjvUDBW40R5PLH7HuaQefq+ExMlB84G6Kp1FOoplUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hML5TMmW;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9F60A2621;
	Thu, 19 Nov 2026 10:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC9F60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hML5TMmW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795084832; x=1826620832;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mPpMjSeIGhMjsSaMwto+FI2cmIsMqJh5ruksgFdlOIY=;
  b=hML5TMmW5yw3IN6hsMBN0DbdR9dWE+88dKnO2KOjDRafLPfm3mzJpbuk
   3bJgZb4/0XesD6vU1a14WLGcPCet9U0bN/nroBxMePw9egCQQdTMtHtsq
   e851SuopOM9nQVXSLcBs+1Xtr1ggYol11YI2ZOvmCWn/8qsRpY6y3gqQD
   ZhBNlFusFIKi9TWlq1VTkctFi1fshZMi0Qz/SSGKAgRbQlzhJr05bktRC
   cFl8QYG6Org9DqI1UqL+NL88Hp0UzWPcDpkdQBHDG7QLOVRmGmL4TXrZ/
   M/mAxnxS8h4eOpi0p+dV+sKuv2pZs9g5nXIr4eZqvm8TKcDfXYQYr6FIZ
   g==;
X-CSE-ConnectionGUID: WL8zJLjQRh2lrPtf7skmaA==
X-CSE-MsgGUID: AjyhEjZCTYa0qD7Xyr5OcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3967513"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3967513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 02:40:32 -0800
X-CSE-ConnectionGUID: MnAGk6eFQPutZL+Ld+oaiw==
X-CSE-MsgGUID: rjbvI8TuR+WOcTkIYt0L8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10737590"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 02:40:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 19 Nov 2026 12:40:25 +0200 (EET)
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, erenozen@protonmail.com
Subject: Re: [RFC PATCH v2 1/2] platform/x86: huawei-wmi: serialize WMI
 retries and validate responses
In-Reply-To: <B27C5CB9EBA10EE0+20261118161311.17252-2-12313607@mail.sustech.edu.cn>
Message-ID: <196e894e-6f66-eb2b-765d-8eacee81a979@linux.intel.com>
References: <20261118161311.17252-1-12313607@mail.sustech.edu.cn> <B27C5CB9EBA10EE0+20261118161311.17252-2-12313607@mail.sustech.edu.cn>
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

On Thu, 19 Nov 2026, Fuwei Xie wrote:

> Serialize the two-call firmware handshake and release the first
> ACPI allocation before retrying. Check the response shape before
> reading the firmware status.
> 
> Accept short package payloads for Fn lock and battery thresholds
> when they contain the required fields. Zero-fill the rest of the
> destination so the legacy parsers can scan their buffers safely.
> 
> Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
> ---
>  drivers/platform/x86/huawei-wmi.c | 144 ++++++++++++++++--------------
>  1 file changed, 75 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index 96ee9a97c..9894424e7 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -150,14 +150,12 @@ static const struct dmi_system_id huawei_quirks[] = {
>  
>  /* Utils */
>  
> -static int huawei_wmi_call(struct huawei_wmi *huawei,
> -			   struct acpi_buffer *in, struct acpi_buffer *out)
> +static int __huawei_wmi_call(struct huawei_wmi *huawei,
> +			     struct acpi_buffer *in, struct acpi_buffer *out)
>  {
>  	acpi_status status;
>  
> -	mutex_lock(&huawei->wmi_lock);
>  	status = wmi_evaluate_method(HWMI_METHOD_GUID, 0, 1, in, out);
> -	mutex_unlock(&huawei->wmi_lock);
>  	if (ACPI_FAILURE(status)) {
>  		dev_err(huawei->dev, "Failed to evaluate wmi method\n");
>  		return -ENODEV;
> @@ -166,98 +164,106 @@ static int huawei_wmi_call(struct huawei_wmi *huawei,
>  	return 0;
>  }
>  
> -/* HWMI takes a 64 bit input and returns either a package with 2 buffers, one of
> - * 4 bytes and the other of 256 bytes, or one buffer of size 0x104 (260) bytes.
> - * The first 4 bytes are ignored, we ignore the first 4 bytes buffer if we got a
> - * package, or skip the first 4 if a buffer of 0x104 is used. The first byte of
> - * the remaining 0x100 sized buffer has the return status of every call. In case
> - * the return status is non-zero, we return -ENODEV but still copy the returned
> - * buffer to the given buffer parameter (buf).
> +static int huawei_wmi_call(struct huawei_wmi *huawei,
> +			   struct acpi_buffer *in, struct acpi_buffer *out)
> +{
> +	int ret;
> +
> +	mutex_lock(&huawei->wmi_lock);
> +	ret = __huawei_wmi_call(huawei, in, out);

Use guard and direct return.

> +	mutex_unlock(&huawei->wmi_lock);
> +	return ret;
> +}
> +
> +/* Return a borrowed payload without modifying the ACPI allocation. */
> +static int huawei_wmi_response(const union acpi_object *obj,
> +			       const u8 **data, size_t *len)
> +{
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type == ACPI_TYPE_BUFFER) {
> +		if (obj->buffer.length != 0x104 || !obj->buffer.pointer)
> +			return -EIO;
> +		*data = obj->buffer.pointer + 4;
> +		*len = 0x100;
> +	} else if (obj->type == ACPI_TYPE_PACKAGE) {
> +		if (obj->package.count != 2 || !obj->package.elements)
> +			return -EIO;
> +		obj = &obj->package.elements[1];
> +		if (obj->type != ACPI_TYPE_BUFFER || !obj->buffer.length ||
> +		    !obj->buffer.pointer)
> +			return -EIO;
> +		*data = obj->buffer.pointer;
> +		*len = obj->buffer.length;
> +	} else {
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * The payload starts with the firmware status byte. Legacy variable-length
> + * replies may omit trailing zeroes. Require the fields used by the caller
> + * and zero-fill any unused part of its destination.
>   */
> -static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
> +static int huawei_wmi_cmd_min(u64 arg, u8 *buf, size_t buflen, size_t minlen)

The new WMI API provides min_size functionality so this driver should be 
converted to that instead.

>  {
>  	struct huawei_wmi *huawei = huawei_wmi;
>  	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
>  	struct acpi_buffer in;
> -	union acpi_object *obj;
> +	const u8 *data;
>  	size_t len;
>  	int err, i;
>  
>  	in.length = sizeof(arg);
>  	in.pointer = &arg;
> +	/* Keep both halves of the firmware handshake in one transaction. */
> +	mutex_lock(&huawei->wmi_lock);

guard()

You should also convert the kfree() in another patch before this to use 
__free().

-- 
 i.


>  
>  	/* Some models require calling HWMI twice to execute a command. We evaluate
>  	 * HWMI and if we get a non-zero return status we evaluate it again.
>  	 */
>  	for (i = 0; i < 2; i++) {
> -		err = huawei_wmi_call(huawei, &in, &out);
> +		out.length = ACPI_ALLOCATE_BUFFER;
> +		out.pointer = NULL;
> +		err = __huawei_wmi_call(huawei, &in, &out);
>  		if (err)
>  			goto fail_cmd;
>  
> -		obj = out.pointer;
> -		if (!obj) {
> -			err = -EIO;
> +		err = huawei_wmi_response(out.pointer, &data, &len);
> +		if (err)
>  			goto fail_cmd;
> -		}
> -
> -		switch (obj->type) {
> -		/* Models that implement both "legacy" and HWMI tend to return a 0x104
> -		 * sized buffer instead of a package of 0x4 and 0x100 buffers.
> -		 */
> -		case ACPI_TYPE_BUFFER:
> -			if (obj->buffer.length == 0x104) {
> -				// Skip the first 4 bytes.
> -				obj->buffer.pointer += 4;
> -				len = 0x100;
> -			} else {
> -				dev_err(huawei->dev, "Bad buffer length, got %d\n", obj->buffer.length);
> -				err = -EIO;
> -				goto fail_cmd;
> -			}
> -
> -			break;
> -		/* HWMI returns a package with 2 buffer elements, one of 4 bytes and the
> -		 * other is 256 bytes.
> -		 */
> -		case ACPI_TYPE_PACKAGE:
> -			if (obj->package.count != 2) {
> -				dev_err(huawei->dev, "Bad package count, got %d\n", obj->package.count);
> -				err = -EIO;
> -				goto fail_cmd;
> -			}
> -
> -			obj = &obj->package.elements[1];
> -			if (obj->type != ACPI_TYPE_BUFFER) {
> -				dev_err(huawei->dev, "Bad package element type, got %d\n", obj->type);
> -				err = -EIO;
> -				goto fail_cmd;
> +		if (!data[0] || i == 1) {
> +			err = data[0] ? -ENODEV : 0;
> +			if (buf) {
> +				if (len < minlen) {
> +					if (!err)
> +						err = -ENODATA;
> +					goto fail_cmd;
> +				}
> +				len = min(len, buflen);
> +				memcpy(buf, data, len);
> +				memset(buf + len, 0, buflen - len);
>  			}
> -			len = obj->buffer.length;
> -
> -			break;
> -		/* Shouldn't get here! */
> -		default:
> -			dev_err(huawei->dev, "Unexpected obj type, got: %d\n", obj->type);
> -			err = -EIO;
>  			goto fail_cmd;
>  		}
> -
> -		if (!*obj->buffer.pointer)
> -			break;
> -	}
> -
> -	err = (*obj->buffer.pointer) ? -ENODEV : 0;
> -
> -	if (buf) {
> -		len = min(buflen, len);
> -		memcpy(buf, obj->buffer.pointer, len);
> +		kfree(out.pointer);
> +		out.pointer = NULL;
>  	}
>  
>  fail_cmd:
>  	kfree(out.pointer);
> +	mutex_unlock(&huawei->wmi_lock);
>  	return err;
>  }
>  
> +static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
> +{
> +	return huawei_wmi_cmd_min(arg, buf, buflen, buflen);
> +}
> +
>  /* LEDs */
>  
>  static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
> @@ -329,7 +335,7 @@ static int huawei_wmi_battery_get(int *start, int *end)
>  	u8 ret[0x100];
>  	int err, i;
>  
> -	err = huawei_wmi_cmd(BATTERY_THRESH_GET, ret, sizeof(ret));
> +	err = huawei_wmi_cmd_min(BATTERY_THRESH_GET, ret, sizeof(ret), 3);
>  	if (err)
>  		return err;
>  
> @@ -627,7 +633,7 @@ static int huawei_wmi_fn_lock_get(int *on)
>  		return huawei_acpi_fn_lock_get(on);
>  
>  	/* WMI fallback */
> -	err = huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
> +	err = huawei_wmi_cmd_min(FN_LOCK_GET, ret, sizeof(ret), 2);
>  	if (err)
>  		return err;
>  
> 
