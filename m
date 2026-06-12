Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757CB3EF0A4
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265575; cv=none; b=C8dG5lMB2J/iBjJkgV/hFghW6vhN+EzjPAAyN5tw7kU3igAx4fwbNYaOD/T59H5K8glolfKENE8vfXCLNcnTj58OU7zhuLHNGTgsurfgONxV9AA67zb/+Qel5jvJbqi/Y0STCcRtUbF+JaKjorFrwXC2Eim22AypdbQAw+7FqDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265575; c=relaxed/simple;
	bh=I+sT2w2kaxhNNlEB7U78GtzB2Lt4Up3qttFy0DvK+i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImnbQihjAZ5NXi89XaMVX8QKr3c3Oe6VJ3woosReh2axUItda0M8tyJFhm3N4bngwH1HGv2pTSrIDKZMggCr8fhuED9xVXAkFuuWEReBR26bIxA3UCfW7BP5A+fK+hx+Bwwtl5LdxRW/Ww7j/vULYUtIwURrqXHamBU+3RkwEhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ir6VWNLz; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ir6VWNLz"
Message-ID: <96f0a98a-3140-4cc1-b6d1-92277fa6e165@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781265565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fV2gTMGcbLA/FMk7cCTZur1VQCp+x5h1dzJRbeQaeDw=;
	b=Ir6VWNLzyyJlnxnnJMizukZqtXwXApYO21cVmRxQVKAUXeJndLz3tdyZWZbg6orcY1bIDd
	YuuISQ81jQihobAqRFT+np95+oKdOoYLJEoRWZ+DIeCw4M1pWsrfoBCuXMp7AbPurqxGLp
	hCenevKlJkZxXHimu0UOfgCnx4CmXjs=
Date: Fri, 12 Jun 2026 13:59:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: fix mini-LED mode get/set on
 MODE2 devices
To: linux-kernel@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Mateusz Schyboll <dragonn@op.pl>,
 Denis Benato <benato.denis96@gmail.com>, Ahmed Yaseen <yaseen@ghoul.dev>
References: <20260612115628.964152-1-denis.benato@linux.dev>
 <20260517182957.11069-1-yaseen@ghoul.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260517182957.11069-1-yaseen@ghoul.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

This has no business being here. I used *.patch to send and missed this. Apologies!

On 6/12/26 13:56, Denis Benato wrote:
> From: Ahmed Yaseen <yaseen@ghoul.dev>
>
> The mini-LED current_value attribute does not work on devices that use
> ASUS_WMI_DEVID_MINI_LED_MODE2 (2024 and newer models).
>
> Reading is broken: mini_led_mode_current_value_show() fetches the mode
> from the device but then decodes a literal 0 instead of the value it
> just read:
>
>     mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
>
> So mode is always 0, and the attribute always reports the same thing
> regardless of the real hardware state.
>
> Writing is broken too. The number a user writes is an index; the value
> the firmware actually wants is looked up from that index in
> mini_led_mode_map[]. mini_led_mode_current_value_store() skips that
> lookup and passes the raw index straight to armoury_attr_uint_store().
> On 2024 devices the firmware numbers its modes differently from the
> index, so some writes are rejected with -EINVAL and the rest send the
> wrong mode to the hardware.
>
> Fix both paths: decode the value actually read from the device when
> reading, and look up the firmware value before sending it when
> writing. Older (MODE1) devices were unaffected because there the index
> and the firmware value are the same.
>
> Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to asus-armoury module")
> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
>  drivers/platform/x86/asus-armoury.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 5b0987ccc270..495dc1e31d40 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -370,7 +370,7 @@ static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> -	mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
> +	mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, mode);
>  
>  	for (i = 0; i < mini_led_mode_map_size; i++)
>  		if (mode == mini_led_mode_map[i])
> @@ -386,6 +386,7 @@ static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
>  {
>  	u32 *mini_led_mode_map;
>  	size_t mini_led_mode_map_size;
> +	char mapped_value[12];
>  	u32 mode;
>  	int err;
>  
> @@ -414,9 +415,16 @@ static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
>  		return -ENODEV;
>  	}
>  
> -	return armoury_attr_uint_store(kobj, attr, buf, count,
> -				       0, mini_led_mode_map[mode],
> -				       NULL, asus_armoury.mini_led_dev_id);
> +	/*
> +	 * armoury_attr_uint_store() parses and sends the value from the
> +	 * passed buffer; hand it the mapped firmware value so the device
> +	 * receives the translated mode instead of the raw index.
> +	 */
> +	snprintf(mapped_value, sizeof(mapped_value), "%u", mini_led_mode_map[mode]);
> +
> +	return armoury_attr_uint_store(kobj, attr, mapped_value, count, 0,
> +				       mini_led_mode_map[mode], NULL,
> +				       asus_armoury.mini_led_dev_id);
>  }
>  
>  static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
