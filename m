Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C514C9A;
	Thu,  2 Jan 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735833066; cv=none; b=oNz1Mh6DCRrkMbJJ3wBVWS3uchS+7lGja1XgHMNKQyiTXu/Gp57hIXJ4ehRkkRoc9jMRPdhvNPi3qzDX+LREby1mUFHxxmXkCeHUOlZpZXpYEWtzhVs+MRQmAXEsQc+F4aeDme0jLgvCatAgnqmjVJDNcEBssW8mZXoDbhUr2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735833066; c=relaxed/simple;
	bh=Kvtu2P13IQOB8MJ5TGI1JuX0pta8afOYeEdw7O5EkZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoH4ks8LsibfE5XQP59+VEGZOoC8DEbSEjCQTRMyFAnTxjv07BKlRurWsN3Fn84hTWyHDzVXwa0GT4MEtJ7Etm4QrpOHfFlz6roSlmkajl2QY1OJ7rLdDB4ZaikFQh0RKNrmvrtvJbxwL0rbYxK2wxDOjNPxjMMa3lBLAX7B0FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tXD2/GP1; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tXD2/GP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735833051; x=1736437851; i=w_armin@gmx.de;
	bh=3V3/lskVbI9mpCFx3/3WgVlClDYzeapWJOSfyOirUU4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tXD2/GP1kzCjXpI4FSEb+9js7Be4NwatZ5jtoY4oHo1I4+yR1lYYiLHpVh/80CTJ
	 BDyn0TfqRo18P9ZHWWxX6WQqrCmncjU7f/WIT0iWS7ddXau8mDBI6Nvvs24oNUpPj
	 RhiMSt1bT8+d2qZ5L1NjVawgH0I0dQr7D2D5nbkkWRmwjwd7B+lYfaeny6YMU86Ov
	 YYze76/fbPIkv1uVQ4YJMz1OPCK/AHqq/Oy0eG0t54FrmAzi2FKa/25uJtn/5eqFw
	 x7AblGutayjGnL4tZYRprq4xUUuiIY7MY46MFWQm4a/WOWvsebUUciiuoH41Q34nq
	 kg8ChGeo60pxLicnSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1tlSmj03aA-017NbC; Thu, 02
 Jan 2025 16:50:51 +0100
Message-ID: <a16d0785-d136-47a6-ae0b-07e5b7a6ec19@gmx.de>
Date: Thu, 2 Jan 2025 16:50:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] alienware_wmi: General cleanup of WMAX methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-8-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-8-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HQFL9jUP/8m/vqGmPdDIVc+B2rvTtKupRpmtBRsv7El4lCxuZSS
 z12C99WmchH+JjgMk25gD13kD4Edm+pkZbiFbutgoFg++GBPTXhYsQPJRirmTMU4PAGW2W3
 fWjJidVR2xO2aPDvEI2HJ+ZEAfXKxHaf0qn3sfo1YtwGMDyABHMEj2S6UPhFVvy4AWYS9hw
 JLFLwoQ3yu4aDV6/AvwCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BytYzvRJezo=;Bd/abTimolRoJPOjo1K7kQA9AyU
 febzGdnbRFN1/U6faGWsLImWGMrZr5BkNeBMAnuAdkbDphjbUcZaxYYtvB6C9T2jVKsKi81iY
 biKVXbAbyPAup8A8m8WzMiVrwMbd8wstvqAq/rIovdjzK54C4O7buTk9Sm3eqltMcQ0YQzund
 PWUV9aWTeduU/4G/Te6koNZgEv7ne33GMIkT9iFF2zcUpNtnRxLnn9CXKJ0nUhduWBNLWMpxH
 SPskJ1thNKaq+vq7xbXfK8c2hvdXhwbVmd72wQFsLpmGnRFaSlWa5jMTBy0a5siExopIYZwCZ
 S4e6LkoLolkatQr/B/1wy5ClxYKcvnGzwTznMtwBa24uklbHGYBBfvAcZzMmTF9+Xea/tZrdo
 2OdRSaOoYoE/tIQATLzkkqLWFOnj3td0ZYpHITNV8pJg9bE8GxIWnPNdDenyfyjAVtoUy9ibT
 OOhveS33Ufa5m9g5c8in3kX5zqgzNQ8jut85eHRNbu5ob2Tbw6VoET9RJTyHf3QwYIdf5INAO
 ALUYpElKsut8rp9FBC201JULSLNGA+1HJ9cP+FMwD6E12zAaKXO5RcQm/tKs3WMs6/rfng/RH
 ochbo4bZ6UhqeksgUv2DV06k7t49k4kUOFG/HU2JX3pVNrM+4F4NS9M6b6EZUhdklu9Y9H5+m
 0rys/9XXnK3QniqbZDiKfXFUcsKfd2yYQHu31uua/OBPpFHhq3U93MGB04pS+KE0eKB0/9/Vq
 Rz1OOka5SqFi76u4cB78AtVgZJYMpNF8Rd2OZ4qlvlENdGdCxLWgm8JiqX+oroZOf5LKPmqsK
 ECIOxJWJpopWGY77M7rgqY9iPr3IfdIDpS7fo8JDvVWEnAfCLeN9Dcx8vQ0fB/1XSpU25LECV
 g77kg8SBvWLRjcjTfRd/sc6ECxCzT9Ss2a5sKRbSfMW2NFkWK9nxkdDrfYVGZMl6VngyzaKQN
 oqu5ZrjUuITBdP1+dInHiwrWlTnpkI2w9qIrgI+VOJ9n6Mbu6ww/KfFZhv4oM1496jIQQYTx5
 f3+eLGS/bK9bDKsLjsfnQYAeM0KNE5dfghlYf2I2hodSR45DONLfqZ89SPJSK9vgzBiY2o4NJ
 /s4V1/HebcDVyerpJBRAOG6SBHCaLE

Am 29.12.24 um 20:44 schrieb Kurt Borja:

> Reorder variable declaration from longest to shortest. Standarize
> show/store method names of WMAX's sysfs groups.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 67 +++++++++++------------
>   1 file changed, 32 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index d97e5e15a8f2..2c17160473a6 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -722,14 +722,14 @@ static acpi_status alienware_wmax_command(void *in=
_args, size_t in_size,
>    *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
>    *	It can toggle between standard system GPU output and HDMI input.
>    */
> -static ssize_t show_hdmi_cable(struct device *dev,
> -			       struct device_attribute *attr, char *buf)
> +static ssize_t cable_show(struct device *dev, struct device_attribute *=
attr,
> +			  char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status =3D
>   	    alienware_wmax_command(&in_args, sizeof(in_args),
>   				   WMAX_METHOD_HDMI_CABLE, &out_data);
> @@ -743,14 +743,14 @@ static ssize_t show_hdmi_cable(struct device *dev,
>   	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>   }
>
> -static ssize_t show_hdmi_source(struct device *dev,
> -				struct device_attribute *attr, char *buf)
> +static ssize_t source_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status =3D
>   	    alienware_wmax_command(&in_args, sizeof(in_args),
>   				   WMAX_METHOD_HDMI_STATUS, &out_data);
> @@ -765,12 +765,11 @@ static ssize_t show_hdmi_source(struct device *dev=
,
>   	return sysfs_emit(buf, "input gpu [unknown]\n");
>   }
>
> -static ssize_t toggle_hdmi_source(struct device *dev,
> -				  struct device_attribute *attr,
> -				  const char *buf, size_t count)
> +static ssize_t source_store(struct device *dev, struct device_attribute=
 *attr,
> +			    const char *buf, size_t count)
>   {
> -	acpi_status status;
>   	struct wmax_basic_args args;
> +	acpi_status status;
>   	if (strcmp(buf, "gpu\n") =3D=3D 0)
>   		args.arg =3D 1;
>   	else if (strcmp(buf, "input\n") =3D=3D 0)
> @@ -788,9 +787,8 @@ static ssize_t toggle_hdmi_source(struct device *dev=
,
>   	return count;
>   }
>
> -static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
> -static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
> -		   toggle_hdmi_source);
> +static DEVICE_ATTR_RO(cable);
> +static DEVICE_ATTR_RW(source);
>
>   static bool hdmi_group_visible(struct kobject *kobj)
>   {
> @@ -815,14 +813,14 @@ static const struct attribute_group hdmi_attribute=
_group =3D {
>    * - Currently supports reading cable status
>    * - Leaving expansion room to possibly support dock/undock events lat=
er
>    */
> -static ssize_t show_amplifier_status(struct device *dev,
> -				     struct device_attribute *attr, char *buf)
> +static ssize_t status_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status =3D
>   	    alienware_wmax_command(&in_args, sizeof(in_args),
>   				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
> @@ -836,7 +834,7 @@ static ssize_t show_amplifier_status(struct device *=
dev,
>   	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>   }
>
> -static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
> +static DEVICE_ATTR_RO(status);
>
>   static bool amplifier_group_visible(struct kobject *kobj)
>   {
> @@ -859,14 +857,14 @@ static const struct attribute_group amplifier_attr=
ibute_group =3D {
>    * Deep Sleep Control support
>    * - Modifies BIOS setting for deep sleep control allowing extra wakeu=
p events
>    */
> -static ssize_t show_deepsleep_status(struct device *dev,
> -				     struct device_attribute *attr, char *buf)
> +static ssize_t deepsleep_show(struct device *dev, struct device_attribu=
te *attr,
> +			      char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
>   	if (ACPI_SUCCESS(status)) {
> @@ -881,12 +879,11 @@ static ssize_t show_deepsleep_status(struct device=
 *dev,
>   	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
>   }
>
> -static ssize_t toggle_deepsleep(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t deepsleep_store(struct device *dev, struct device_attrib=
ute *attr,
> +			       const char *buf, size_t count)
>   {
> -	acpi_status status;
>   	struct wmax_basic_args args;
> +	acpi_status status;
>
>   	if (strcmp(buf, "disabled\n") =3D=3D 0)
>   		args.arg =3D 0;
> @@ -905,7 +902,7 @@ static ssize_t toggle_deepsleep(struct device *dev,
>   	return count;
>   }
>
> -static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status,=
 toggle_deepsleep);
> +static DEVICE_ATTR_RW(deepsleep);
>
>   static bool deepsleep_group_visible(struct kobject *kobj)
>   {
> @@ -953,13 +950,13 @@ static bool is_wmax_thermal_code(u32 code)
>
>   static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_dat=
a)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D operation,
>   		.arg1 =3D arg,
>   		.arg2 =3D 0,
>   		.arg3 =3D 0,
>   	};
> +	acpi_status status;
>
>   	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_THERMAL_INFORMATION,
> @@ -976,13 +973,13 @@ static int wmax_thermal_information(u8 operation, =
u8 arg, u32 *out_data)
>
>   static int wmax_thermal_control(u8 profile)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D WMAX_OPERATION_ACTIVATE_PROFILE,
>   		.arg1 =3D profile,
>   		.arg2 =3D 0,
>   		.arg3 =3D 0,
>   	};
> +	acpi_status status;
>   	u32 out_data;
>
>   	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
> @@ -1000,13 +997,13 @@ static int wmax_thermal_control(u8 profile)
>
>   static int wmax_game_shift_status(u8 operation, u32 *out_data)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D operation,
>   		.arg1 =3D 0,
>   		.arg2 =3D 0,
>   		.arg3 =3D 0,
>   	};
> +	acpi_status status;
>
>   	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_GAME_SHIFT_STATUS,
> @@ -1075,11 +1072,11 @@ static int thermal_profile_set(struct platform_p=
rofile_handler *pprof,
>
>   static int create_thermal_profile(struct platform_device *platform_dev=
ice)
>   {
> -	u32 out_data;
> +	enum platform_profile_option profile;
> +	enum wmax_thermal_mode mode;
>   	u8 sys_desc[4];
>   	u32 first_mode;
> -	enum wmax_thermal_mode mode;
> -	enum platform_profile_option profile;
> +	u32 out_data;
>   	int ret;
>
>   	ret =3D wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
