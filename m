Received: from mta0.migadu.com (out-195.mta0.migadu.com [91.218.175.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3523E342
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386895; cv=none; b=n/CZ0ALEZRiLOupgIAem8nTSYnfxxElFm1zZ9155fk4K6tm/m1pEwK7iLD18DLOO034czvBgHpS1nSfrBnhxIIBg8Efqabv1428MvbywAS5IcD0VhJxdCWvLiAYAqPWtxzVHiYyw+0ClvmjNhjkc6NPP1aXUCQBHFK3QXMwyYmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386895; c=relaxed/simple;
	bh=PKFI4CAgpsF0c7UevfCcZPOfjizkfAt5zLk68ph2gnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+hVI8qj3MeK+/oIe1Jsip8nkVhOqQrl0K7nK6inVSXsWGXw+FzxGcchRhJP1h00QpATQIIXhKm9vFJsMiDqzhiXm3M1bDCpJqoTg8Z9/uWNn9y4imRQBn2jTbGhDETzNRhDH25tYnacVkozE2QI+C8DuJvjzUepTUaaMLz5GWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tmkGjQlU; arc=none smtp.client-ip=91.218.175.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tmkGjQlU"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PKFI4CAgpsF0c7UevfCcZPOfjizkfAt5zLk68ph2gnY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790386890; v=1; x=1790991690;
 b=tmkGjQlUjRkCflFoKDxhiSWcx0Pyjl0/jZE1D2SY2VmO68KibpW/RqDjd/plmiXeDyhkAm7j
 w+ROm5U+vsDmW0kXhMJ8+ArAyx36NL5/i14JIXGR1bMjo5c+aSXMKkGvK662DZxXr2+h2S5ZN0M
 dVui4UR01CYVQK8w0FzMrygQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2e14a66ee420801c;
	Sat, 26 Sep 2026 01:41:30 +0000
X-Mizu-Trace-ID: 2e14a66ee420801c
X-Migadu-Flow: FLOW_OUT
Message-ID: <c0301eb2-62b9-4dbd-ba24-3a2c40675b20@linux.dev>
Date: Sat, 26 Sep 2026 03:41:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: add TUF keyboard RGB
 readback support
To: Bartu Alev <bartualev@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>
References: <20260925200744.129714-1-bartualev@gmail.com>
 <20260926005625.171560-1-bartualev@gmail.com>
 <20260926005625.171560-3-bartualev@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260926005625.171560-3-bartualev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/26/26 02:56, Bartu Alev wrote:
> TUF Gaming laptops expose kbd_rgb_mode and kbd_rgb_state as write-only
> attributes (DEVICE_ATTR_WO), preventing userspace from querying the
> active hardware configuration.
>
> Add readback support by querying ASUS_WMI_DEVID_TUF_RGB_READBACK
> (0x0010005B) via the WMI DSTS method. On supported platforms this
> evaluates the DSDT method EC0.KBLS(), which returns a 16-byte buffer
> containing the active lighting mode, RGB color channels, effect speed
> and power-state flags.
>
> Introduce kbd_rgb_read_status() to evaluate and validate the buffer,
> and convert both attributes to DEVICE_ATTR_RW. Map the hardware speed
> codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2).
>
> The command field is not part of the status buffer: "immediate vs
> save-to-flash" is a property of the write verb (0xb3/0xb4), not of
> readable state, and the EC mirror is updated identically by both.
> Readback therefore emits a synthetic leading '1' - the canonical
> input form userspace writes - so that output matches input.
>
> Suggested-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Bartu Alev <bartualev@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c            | 79 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h |  3 +
>  2 files changed, 80 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index db6ee1974838..fe1dcc7701ad 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1046,7 +1046,58 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
>  static DEVICE_ATTR_RW(gpu_mux_mode);
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
> +static int kbd_rgb_read_status(u8 data[16])
> +{
> +	int err;
> +
> +	err = asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
> +					   ASUS_WMI_DEVID_TUF_RGB_READBACK,
> +					   0, data, 16);
> +
> +	if (err)
> +		return err < 0 ? err : -ENODEV;
> +
> +	/* DUBF[0] is a constant 1 set by the AML: anything else is not KBLS */
> +	if (data[0] != 1)
> +		return -ENODEV;
> +

-ENODEV or -ENOTSUPP ? Which one is better suited for these kind of things?

If we go with two separate sysfs attrs you don't register the read one,
otherwise I am not sure.

> +	return 0;
> +}
> +
>  /* TUF Laptop Keyboard RGB Modes **********************************************/
> +static ssize_t kbd_rgb_mode_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	u8 data[16] = {};
> +	u32 speed;
> +	int err;
> +
> +	err = kbd_rgb_read_status(data);
> +	if (err)
> +		return err;
> +
> +	/* Map hardware speed codes back to sysfs index:
> +	 * 0xe1 -> 0 (slow), 0xeb -> 1 (normal), 0xf5 -> 2 (fast)
> +	 */
> +	switch (data[5]) {
> +	case 0xe1:
> +		speed = 0;
> +		break;
> +	case 0xeb:
> +		speed = 1;
> +		break;
> +	case 0xf5:
> +		speed = 2;
> +		break;
> +	default:
> +		speed = 1;
> +		break;
> +	}
> +
> +	return sysfs_emit(buf, "1 %d %d %d %d %d\n",
> +			  data[1], data[2], data[3], data[4], speed);

We had this discussion in discord so I want to update everyone reading:
the status returned is the current one and both cmd=0 and cmd=1 on write
update the current status.

Therefore this is an asymmetry that doesn't really need to be,
what if we introduce another sysfs that is RO? Ilpo?

> +}
>  static ssize_t kbd_rgb_mode_store(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
> @@ -1099,7 +1150,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
>  
>  	return count;
>  }
> -static DEVICE_ATTR_WO(kbd_rgb_mode);
> +static DEVICE_ATTR_RW(kbd_rgb_mode);
>  
>  static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
>  			     "cmd mode red green blue speed");
> @@ -1115,6 +1166,30 @@ static const struct attribute_group kbd_rgb_mode_group = {
>  };
>  
>  /* TUF Laptop Keyboard RGB State **********************************************/
> +static ssize_t kbd_rgb_state_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	u8 data[16] = {};
> +	u8 flags;
> +	int err;
> +
> +	err = kbd_rgb_read_status(data);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * data[6] power-state bitmask:
> +	 * BIT(1) boot, BIT(3) awake, BIT(5) sleep, BIT(7) shutdown
> +	 */
> +	flags = data[6];
> +
> +	return sysfs_emit(buf, "1 %d %d %d %d\n",
> +			  !!(flags & BIT(1)),
> +			  !!(flags & BIT(3)),
> +			  !!(flags & BIT(5)),
> +			  !!(flags & BIT(7)));
> +}
>  static ssize_t kbd_rgb_state_store(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
> @@ -1146,7 +1221,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
>  
>  	return count;
>  }
> -static DEVICE_ATTR_WO(kbd_rgb_state);
> +static DEVICE_ATTR_RW(kbd_rgb_state);
>  
>  static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
>  			     "cmd boot awake sleep shutdown");
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index b5ed8c83ace1..1447c7f354bc 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -161,6 +161,9 @@
>  /* TUF laptop RGB power/state */
>  #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
>  

The pre-existing one should probably be renamed to make clear
it's write only and it is a command... In its own patch.

ASUS_WMI_DEVID_TUF_RGB_CMD probably?

> +/* TUF laptop RGB keyboard status readback*/
> +#define ASUS_WMI_DEVID_TUF_RGB_READBACK	0x0010005B
> +

ASUS_WMI_DEVID_TUF_RGB_READ_STATUS ?


>  /* Bootup sound control */
>  #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
>  
