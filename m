Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50093A3822;
	Tue, 29 Sep 2026 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667333; cv=none; b=jM6/VKdFkFlC9Xybpx+xA+KOfb4yGWB8gxl6hi2G5d3FtPAzDI9MVN1bNpwirwx0LmuQt1Ss73CtJe+n2d43evfiZk4AkeQJKw2b2SG5z0/adpiTSlhUaaQObA2K3e8a4DkQdOLkWE66x2EyWI990EEXK24xKxUw70K/PX3YZ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667333; c=relaxed/simple;
	bh=8YaqNxIVkHWBbekbBEjn/R/Q6HDx905wxaJp7LWE9Sw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q3ws0Ax+a5Imhewhvcf7h8hEFqXdYyqYaL+xvwkr1Xm2l7hjdUeDXLmAx87RKVVTO3gS9qLTjptxTE1Y0MHEy24Cneokg0v+ZN+1c0jyy6+nknonHqbGhwECRIvKCNTCq4bGUipNEwrEtwqI96NGV4XrsKjJMuh4kfOs/HDLaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URZCcpyB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URZCcpyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790667331; x=1822203331;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8YaqNxIVkHWBbekbBEjn/R/Q6HDx905wxaJp7LWE9Sw=;
  b=URZCcpyBPjHBuDDyc7ylSdo8+u088DXEon6WBJN6s9/yXT/+i2+glTTY
   bgqRE+nhwf8OhNFdLApt/b7NaRZIQPhArJzSPlrmgZ2+ii5gNnz9q2N5c
   OtiB2wOINk1guCv00+4Vc+b+NvX2D5Z91N4jIuzvn4AltAv54U0MXYrwt
   0/bxPo17+bHjr4phcnAx+WIMGYBODVSfAw5Spp9wPRNK/D1JF4D+t0AGp
   9Hc4ornETw8NByYroRgk7Wcb6AYm8Pe7eIF8hItKDlozVcG/ij8WpnMzx
   y24UryW0xIgk4JLS2xEkY3gTzm63eN6l73qpeAX2+6V7esqyzFCDziyMj
   Q==;
X-CSE-ConnectionGUID: VgLRhAgYQQiepVnNf3cbWg==
X-CSE-MsgGUID: 155RbxuDSa2srt71dfuxdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90598187"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90598187"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 00:35:30 -0700
X-CSE-ConnectionGUID: K19r+w76RK+c8HkI0Bgfgw==
X-CSE-MsgGUID: hqq9ixKIQjChlcbB/wPkiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275327386"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 00:35:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Sep 2026 10:35:21 +0300 (EEST)
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: qcom-hamoa-ec: Add thermistor
 sensors
In-Reply-To: <20260928-ec_thermistor_support-v1-2-d9c1bae4cd0d@oss.qualcomm.com>
Message-ID: <c15405f3-db75-410d-045b-996db4f83110@linux.intel.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com> <20260928-ec_thermistor_support-v1-2-d9c1bae4cd0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2026, Anvesh Jain P wrote:

> The Qualcomm embedded controller has exclusive access to multiple onboard
> thermistors programmatically discoverable through the
> EC_THERMAL_CAPABILITIES command. The temperature values are reported in
> degree Celsius through the EC_THERMISTOR_TEMP_CMD.
> 
> Register these thermistors with the thermal framework by adding support to
> the EC_THERMISTOR_TEMP_CMD and convert it to millidegree units as required
> by the thermal framework.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 74 ++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 4d2ad042a7f8..acf3d7f53026 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -16,16 +16,19 @@
>  #include <linux/pm.h>
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
> +#include <linux/unaligned.h>
>  
>  #define EC_SCI_EVT_READ_CMD	0x05
>  #define EC_FW_VERSION_CMD	0x0e
>  #define EC_MODERN_STANDBY_CMD	0x23
> +#define EC_THERMISTOR_TEMP_CMD	0x29	/* + thermistor_id (0-6) selects thermistor 1-7 */
>  #define EC_FAN_DBG_CONTROL_CMD	0x30
>  #define EC_SCI_EVT_CONTROL_CMD	0x35
>  #define EC_THERMAL_CAP_CMD	0x42
>  
>  #define EC_FW_VERSION_RESP_LEN	4
>  #define EC_THERMAL_CAP_RESP_LEN	3
> +#define EC_THERMISTOR_TEMP_RESP_LEN	3
>  #define EC_FAN_DEBUG_CMD_LEN	6
>  #define EC_FAN_SPEED_DATA_SIZE	4
>  
> @@ -39,6 +42,7 @@
>  #define EC_MAX_FAN_CNT		2
>  #define EC_FAN_NAME_SIZE	20
>  #define EC_FAN_MAX_PWM		255
> +#define EC_MAX_THERMISTOR_CNT	7
>  
>  enum qcom_ec_sci_events {
>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
> @@ -64,6 +68,7 @@ struct qcom_ec_thermal_cap {
>  #define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>  #define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>  #define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
> +#define EC_THERMISTOR_PRESENT(mask, id)	((mask) & BIT(id))
>  	u8 fan_cnt;
>  	u8 fan_type;
>  	u8 thermistor_mask;
> @@ -81,6 +86,12 @@ struct qcom_ec {
>  	struct qcom_ec_thermal_cap thermal_cap;
>  	struct qcom_ec_version version;
>  	struct i2c_client *client;
> +	struct qcom_ec_thermal_zone *ec_tz;
> +};
> +
> +struct qcom_ec_thermal_zone {
> +	struct qcom_ec *ec;
> +	u8 thermistor_id;
>  };
>  
>  static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
> @@ -183,6 +194,43 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
>  	return 0;
>  }
>  
> +/*
> + * EC Thermistor Temperature (cmd 0x29 + thermistor_id, id 0-6 selects
> + * thermistor 1-7):
> + *
> + * Read Response:
> + * ----------------------------------------------------------------------
> + * | Offset	| Name		| Description				|
> + * ----------------------------------------------------------------------
> + * | 0x00	| Byte count	| Number of bytes in response (=2)	|
> + * ----------------------------------------------------------------------
> + * | 0x01 (LSB)| Temperature	| Signed 16-bit, unit of 0.1 degC,	|
> + * | 0x02 (MSB)|		| range -40..+125 degC			|
> + * ----------------------------------------------------------------------
> + */
> +static int qcom_ec_thermistor_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct qcom_ec_thermal_zone *ec_tz = thermal_zone_device_priv(tz);
> +	struct qcom_ec *ec = ec_tz->ec;
> +	u8 resp[EC_THERMISTOR_TEMP_RESP_LEN];
> +	s16 raw;
> +	int ret;
> +
> +	ret = qcom_ec_read(ec, EC_THERMISTOR_TEMP_CMD + ec_tz->thermistor_id,
> +			   EC_THERMISTOR_TEMP_RESP_LEN, resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	raw = (s16)get_unaligned_le16(&resp[1]);
> +	*temp = raw * 100;

MILLIDEGREE_PER_DECIDEGREE?

Make sure you have the include for it if changing to it.

> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_device_ops qcom_ec_thermistor_ops = {
> +	.get_temp = qcom_ec_thermistor_get_temp,
> +};
> +
>  static irqreturn_t qcom_ec_irq(int irq, void *data)
>  {
>  	struct qcom_ec *ec = data;
> @@ -376,6 +424,32 @@ static int qcom_ec_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>  
> +	if (ec->thermal_cap.thermistor_mask) {
> +		ec->ec_tz = devm_kcalloc(dev, EC_MAX_THERMISTOR_CNT, sizeof(*ec->ec_tz),
> +					 GFP_KERNEL);
> +		if (!ec->ec_tz)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < EC_MAX_THERMISTOR_CNT; i++) {
> +			struct qcom_ec_thermal_zone *ec_tz = &ec->ec_tz[i];
> +			struct thermal_zone_device *tzd;
> +
> +			if (!EC_THERMISTOR_PRESENT(ec->thermal_cap.thermistor_mask, i))
> +				continue;
> +
> +			ec_tz->ec = ec;
> +			ec_tz->thermistor_id = i;
> +
> +			tzd = devm_thermal_of_zone_register(dev, i, ec_tz, &qcom_ec_thermistor_ops);
> +			if (IS_ERR(tzd)) {
> +				ret = PTR_ERR(tzd);
> +				if (ret != -ENODEV)

I'd prefer ret == -ENODEV check + continue.

> +					dev_warn(dev, "Failed to register thermistor%u zone: %d\n",
> +						 i, ret);
> +			}
> +		}
> +	}
> +
>  	if (ec->thermal_cap.fan_cnt == 0) {
>  		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>  		return 0;
> 
> 

-- 
 i.

