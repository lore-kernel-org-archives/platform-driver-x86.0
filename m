Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009C44582DA
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931677; cv=none; b=ebOHDrujCZgCxwseuob7PfRaRfniSbTOXd7Qobf9QJ85OD12PwYATzBtUJaT7l4FEktcg+SQnDxA+NINsyVqE19YH8OLogcKjUpz2k1QciBBKyJE/F6Q0+lXNQfPvc073KAORlv+7fv9t1oz0dLfz+QfsJYzyhPP378XHj/7ZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931677; c=relaxed/simple;
	bh=FN1ZZId7duQ0X+vbQkcgab/DNksV1Essa+ID/PwO4L4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htnf+DYZ4lzKnfjKF+hfXsPLH3Eev1MiUfVcq87WdcIHBSPej3aS8Q1F5CuEAMC2flAnxBUAWVe9PmJKa7XqG5LNqdtG1GiDXuzaPoCkjyE2PQszZGkSBBNVF2SVhknwwi9cR5Xek994BrrSZ9o4MO5ogIjjgEYYN/e15z/JOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OKtp/EHn; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OKtp/EHn"
Message-ID: <9d712362-6630-49c1-b47a-e01afd1b23c8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785931671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6A1NDQ3Mdi1nCzCJYqjt5UVLZ9EVRWQznDVMPgoX2XE=;
	b=OKtp/EHnifvkXvHgoM8IqX6s/jdu1o8o3EK+DKeHSEdiHnzADubJhkh8L5kv3mRqr142Oh
	OXP4EDTLC/ybCIKiXvZ+HZSAvyAUAoL3Z+VQmpeJrgBIabJjcfYJD4nDsc8N6c4cMD3hlL
	qVDBLQqwAib2KpPeRuKzCvbBZTtP7Cg=
Date: Wed, 5 Aug 2026 14:07:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: keep the lid-flip state when
 UNKNOWN is set
To: Robin Everaars <robineveraars@pm.me>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805101502.235668-1-robineveraars@pm.me>
 <20260805101502.235668-2-robineveraars@pm.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260805101502.235668-2-robineveraars@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 8/5/26 12:15, Robin Everaars wrote:
> On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
> alongside the state bit while the machine is folded. Measured on an ASUS
> ProArt PX13 (HN7306EAC), ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000
> open and 0x00010003 folded, that is presence | status | UNKNOWN.
>
> asus_wmi_get_devstate_simple() treats that bit as "the state is not known"
> and fails the call with -ENODEV, so asus_wmi_tablet_mode_get_state()
> discards a perfectly good state sitting in bit 0 and SW_TABLET_MODE never
> moves.
>
> Add asus_wmi_tablet_sw_get_state(), which gates on the presence bit only
> and returns the status bit. Use it from the two tablet-switch paths. Every
> other caller of asus_wmi_get_devstate_simple() is untouched, so the change
> is confined to the tablet switch.
Hi Robin,

Thanks for looking into this!
> Signed-off-by: Robin Everaars <robineveraars@pm.me>
> ---
>  drivers/platform/x86/asus-wmi.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86
> /asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8610663b8..f68fd2bcd 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -706,12 +706,40 @@ static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>  	input_sync(asus->inputdev);
>  }
>  
> +/*
> + * Read the lid-flip state directly rather than through
> + * asus_wmi_get_devstate_simple().
> + *
> + * On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
> + * alongside the state bit while folded. Measured on an ASUS ProArt PX13
> + * (HN7306EAC), devid ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000 open and
> + * 0x00010003 folded, i.e. presence | state | UNKNOWN. The generic helper reads
> + * that bit as "the state is not known" and rejects the whole call with -ENODEV,
> + * so asus_wmi_tablet_mode_get_state() discards a perfectly good state sitting in
> + * bit 0 and the switch never moves. Only presence gates the value here, which is
> + * safe because this path serves 
> the tablet switch alone.
> + */
> +static int asus_wmi_tablet_sw_get_state(struct asus_wmi *asus, u32 dev_id)
> +{
> +	u32 retval;
> +	int err;
> +
> +	err = asus_wmi_get_devstate(asus, dev_id, &retval);
> +	if (err < 0)
> +		return err;
> +
> +	if (!(retval & ASUS_WMI_DSTS_PRESENCE_BIT))
> +		return -ENODEV;
There are FIELD_GET and many more macros to do this,
please use those as it makes the code easier to read.
> +
> +	return !!(retval & ASUS_WMI_DSTS_STATUS_BIT);
Same here
> +}
> +
>  static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
>  {
>  	struct device *dev = &asus->platform_device->dev;
>  	int result;
>  
> -	result = asus_wmi_get_devstate_simple(asus, dev_id);
> +	result = asus_wmi_tablet_sw_get_state(asus, dev_id);
>  	if (result >= 0) {
>  		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>  		asus_wmi_tablet_sw_report(asus, result);
> @@ -786,7 +814,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
>  	if (!asus->tablet_switch_dev_id)
>  		return;
>  
> -	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
> +	result = asus_wmi
> _tablet_sw_get_state(asus, asus->tablet_switch_dev_id);
>  	if (result >= 0)
>  		asus_wmi_tablet_sw_report(asus, result);
>  }
