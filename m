Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485854;
	b=4HKEzej+y7+z4QNpMfRC2jrUF7jQGl3XYGY1qDbEdP+Ngqpy1lTqgVdUBaK9lH9iBhuq
	 mjzyEZEpeeV4B0k2+jv7VD1EfN8oFDhD6KbxHrGKudTDu0jMjPbB2QXbO1gmyIpL0mb9V
	 sw8Hl4HV2PA1KcJNRhgWoQSN9Lhj0OdnRLYLxjdIZVDRDlRNsXm7/fQFNyBwatRSb5nTW
	 R/00h7uCxsprsuLMt+cg3cBjR7n+XIuqnD8h4GHqFFWZ2aA/GSovrPsmuKnO3e677hl27
	 8NAUEuwH5V2FaYopp1R5xbej/3aKah4l/jcbesY1/SxXds37SyBf+b13OPYAQNYRyyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485854;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=V6N4jKFEoFJnWzWXtAuiRyoVySHfgo+fDpFW2tFh5qk=;
	b=njl0FyoVdipeuIFe8320iDqnvdDeI/WVzX3YZaUElGh8DV5wTdFNSKBYJzGp55yhvVYH
	 PWgWC105a2UK5k/4Y86AjJVA8MmO+KCh+8NJYdWF7I3T8ZUmpVztV2PH0e21dEzkizjUp
	 2usx0ZCWnZl1KimmhOIgbe4D7E8Ru4GGX3hf4fjvvHN7VwB+RKdBivoBO2roLfL5OxxaV
	 nDS/OeqPYD7c7ex8n9MhZpBmvTfCQr9VCpMp9OgqTbZjS1Tvn/hvSzjFP9cdEAmhJPkiK
	 ZnfYYRtenGuZAHiDYvrRJybhQbTytN+OqYXmGZgkEYrGZOAd6a4VCGESxO76WiFQ12Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VOUw5BNO;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDCD606A31A;
	Tue, 20 Oct 2026 08:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDCD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VOUw5BNO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792485854; x=1824021854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u27kHqiIoujdMzMP2aI/98ASbvcc7rD9N5A/VJEm2qo=;
  b=VOUw5BNOyZb2b7LsIPPiZbuT73yRConNfGtPsB4Ti3qj1qhF52u25sji
   /Cx72vAFQ7LRD2hx3L5LchbFxh/QyLCoABycd3JjH0qpR628q8XOTNR4Z
   WJDtmrMBEWd93I0+lZD3bFB8eB2u6RQPqcgmwViR5NceSNSWPLqPZ0IsJ
   vsH/Vkly0LnpIq7SUNfLA2UUBgD7/AkqdQlJ54dhAe/qkyaGzJULc8C93
   JLWc6QdE8CDZL0bg6gKWi5fm9EiIDs4Ie3XkJlsnygOh5IyxlpQ6yQWcM
   K8lVrf4K1c5tF23oIULEaQGrPKkYPR0sy2F51FGxUJ+GfN1PyFlillMAG
   A==;
X-CSE-ConnectionGUID: 0js+rKJ2T/moKundIF0g4A==
X-CSE-MsgGUID: YKd2H2VlSe6Vv6lwg8cNfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1194862"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1194862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:42:13 -0700
X-CSE-ConnectionGUID: KqvvKLLdRACcUzN6d2u/Bg==
X-CSE-MsgGUID: dmo6uf32QiyHYJp23AT1aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2742637"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:42:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9576F11F7E8;
	Tue, 20 Oct 2026 11:42:07 +0300 (EEST)
Date: Tue, 20 Oct 2026 11:42:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org,
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com,
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
Message-ID: <atcpXzA6KQfgiD7J@kekkonen.localdomain>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
 <20261020015001.15672-3-patrakov@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020015001.15672-3-patrakov@gmail.com>

Hi Alexander,

On Tue, Oct 20, 2026 at 09:50:01AM +0800, Alexander Patrakov wrote:
> The front camera of the Lenovo Yoga Duet 7 13ITL6 and of the Dell
> Latitude 7320 Detachable is described in ACPI as OVTI5678. The part
> reports the chip id of the OV5675 and takes its register settings, but
> its color filter array is a complex 4x4 RGB-IR one.
> 
> The silicon is likely the same as the one of the OVTI5675, so it still
> has some features (binned mode, hardware defective pixel concealment)
> that assume the classic 2x2 GRBG Bayer array and thus produce meaningless
> output with the RGB-IR array. Disable them for OVTI5678.
> 
> NOTE: This patch cannot be upstreamed as there is no way to properly
> describe the color filter array layout of the OVTI5678. The color format
> is a placeholder at this point.
> 
> Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
> ---
>  drivers/media/i2c/ov5675.c | 149 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 131 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 9cf600c9c94a..7563a462abea 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -6,8 +6,10 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

#include <linux/device-id/acpi.h>

>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/unaligned.h>
>  
> @@ -28,6 +30,10 @@
>  #define OV5675_REG_CHIP_ID		0x300a
>  #define OV5675_CHIP_ID			0x5675
>  
> +/* On-chip processing; bits 1 and 2 enable the defect pixel correction */
> +#define OV5675_REG_ISP_CTRL		0x5000
> +#define OV5675_ISP_CTRL_NO_DPC		0x71
> +
>  #define OV5675_REG_MODE_SELECT		0x0100
>  #define OV5675_MODE_STANDBY		0x00
>  #define OV5675_MODE_STREAMING		0x01
> @@ -492,8 +498,58 @@ static const struct ov5675_mode supported_modes[] = {
>  	}
>  };
>  
> +/* The modes of the RGB-IR part, see ov5675_get_modes() */
> +static const struct ov5675_mode ov5678_supported_modes[] = {
> +	{
> +		.width = 2592,
> +		.height = 1944,
> +		.hts = 1500,
> +		.vts_def = OV5675_VTS_30FPS,
> +		.vts_min = OV5675_VTS_30FPS_MIN,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
> +			.regs = mode_2592x1944_regs,
> +		},
> +		.link_freq_index = OV5675_LINK_FREQ_900MBPS,
> +	}
> +};
> +
> +/**
> + * struct ov5675_variant - What differs between the parts this driver handles
> + * @model: Name of the sub-device, by which user space tells the parts apart
> + * @code: Media bus code of the output
> + */
> +struct ov5675_variant {
> +	const char *model;
> +	u32 code;
> +};
> +
> +static const struct ov5675_variant ov5675_variant_bayer = {
> +	.model = "ov5675",
> +	.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +};
> +
> +/*
> + * The part ACPI calls OVTI5678 reports the chip id of the OV5675 and takes
> + * its register settings, but has a 4x4 RGB-IR color filter array:
> + *
> + *	G I G I
> + *	R G B G
> + *	G I G I
> + *	B G R G
> + *
> + * No media bus code describes that. MEDIA_BUS_FMT_Y10_1X10 is used because it
> + * is the 10-bit code that claims no Bayer order, so that nothing demosaics the
> + * data as if it were Bayer. The samples are not luma.
> + */
> +static const struct ov5675_variant ov5675_variant_rgbir = {
> +	.model = "ov5678",
> +	.code = MEDIA_BUS_FMT_Y10_1X10,

This needs to wait until we have proper non-Bayer pattern support in.
Hopefully this will be in for 7.5 or 7.6, but let's see.

> +};
> +
>  struct ov5675 {
>  	struct device *dev;
> +	const struct ov5675_variant *variant;
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -857,12 +913,30 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
>  	return ret;
>  }
>  
> -static void ov5675_update_pad_format(const struct ov5675_mode *mode,
> +/*
> + * The 1296x972 mode is 2x2 binned. The hardware averages pixels two positions
> + * apart, which have the same color in a Bayer array, but not in the RGB-IR
> + * array. Therefore, the RGB-IR color filter array is incompatible with binning.
> + */
> +static const struct ov5675_mode *ov5675_get_modes(const struct ov5675 *ov5675,
> +						  unsigned int *num_modes)
> +{
> +	if (ov5675->variant->code != MEDIA_BUS_FMT_SGRBG10_1X10) {
> +		*num_modes = ARRAY_SIZE(ov5678_supported_modes);
> +		return ov5678_supported_modes;
> +	}
> +
> +	*num_modes = ARRAY_SIZE(supported_modes);
> +	return supported_modes;
> +}
> +
> +static void ov5675_update_pad_format(struct ov5675 *ov5675,
> +				     const struct ov5675_mode *mode,
>  				     struct v4l2_mbus_framefmt *fmt)
>  {
>  	fmt->width = mode->width;
>  	fmt->height = mode->height;
> -	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->code = ov5675->variant->code;
>  	fmt->field = V4L2_FIELD_NONE;
>  }
>  
> @@ -914,6 +988,25 @@ static int ov5675_start_streaming(struct ov5675 *ov5675)
>  		return ret;
>  	}
>  
> +	/*
> +	 * The mode settings enable the on-chip defect pixel correction. It
> +	 * compares a pixel with the ones two positions away, which have the
> +	 * same color in a Bayer array. In the RGB-IR array the pixel two
> +	 * positions from a red one is blue, and so comparing or mixing them
> +	 * makes no sense. So defect pixel correction is on for the Bayer part
> +	 * only. Intel's Windows driver for the OVTI5678 turns it off in the
> +	 * same way, by writing 0x71 to this register.
> +	 */
> +	if (ov5675->variant->code != MEDIA_BUS_FMT_SGRBG10_1X10) {
> +		ret = ov5675_write_reg(ov5675, OV5675_REG_ISP_CTRL,
> +				       OV5675_REG_VALUE_08BIT,
> +				       OV5675_ISP_CTRL_NO_DPC);
> +		if (ret) {
> +			dev_err(ov5675->dev, "failed to disable defect correction");
> +			return ret;
> +		}
> +	}
> +
>  	ret = __v4l2_ctrl_handler_setup(ov5675->sd.ctrl_handler);
>  	if (ret)
>  		return ret;
> @@ -1020,16 +1113,16 @@ static int ov5675_set_format(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_format *fmt)
>  {
>  	struct ov5675 *ov5675 = to_ov5675(sd);
> -	const struct ov5675_mode *mode;
> +	const struct ov5675_mode *modes, *mode;
> +	unsigned int num_modes;
>  	s32 vblank_def, h_blank;
>  
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes), width,
> -				      height, fmt->format.width,
> -				      fmt->format.height);
> +	modes = ov5675_get_modes(ov5675, &num_modes);
> +	mode = v4l2_find_nearest_size(modes, num_modes, width, height,
> +				      fmt->format.width, fmt->format.height);
>  
>  	mutex_lock(&ov5675->mutex);
> -	ov5675_update_pad_format(mode, &fmt->format);
> +	ov5675_update_pad_format(ov5675, mode, &fmt->format);
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
>  	} else {
> @@ -1067,7 +1160,8 @@ static int ov5675_get_format(struct v4l2_subdev *sd,
>  		fmt->format = *v4l2_subdev_state_get_format(sd_state,
>  							    fmt->pad);
>  	else
> -		ov5675_update_pad_format(ov5675->cur_mode, &fmt->format);
> +		ov5675_update_pad_format(ov5675, ov5675->cur_mode,
> +					 &fmt->format);
>  
>  	mutex_unlock(&ov5675->mutex);
>  
> @@ -1104,10 +1198,12 @@ static int ov5675_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
>  {
> +	struct ov5675 *ov5675 = to_ov5675(sd);
> +
>  	if (code->index > 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	code->code = ov5675->variant->code;
>  
>  	return 0;
>  }
> @@ -1116,15 +1212,20 @@ static int ov5675_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> +	struct ov5675 *ov5675 = to_ov5675(sd);
> +	const struct ov5675_mode *modes;
> +	unsigned int num_modes;
> +
> +	modes = ov5675_get_modes(ov5675, &num_modes);
> +	if (fse->index >= num_modes)
>  		return -EINVAL;
>  
> -	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +	if (fse->code != ov5675->variant->code)
>  		return -EINVAL;
>  
> -	fse->min_width = supported_modes[fse->index].width;
> +	fse->min_width = modes[fse->index].width;
>  	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> +	fse->min_height = modes[fse->index].height;
>  	fse->max_height = fse->min_height;
>  
>  	return 0;
> @@ -1133,9 +1234,13 @@ static int ov5675_enum_frame_size(struct v4l2_subdev *sd,
>  static int ov5675_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>  	struct ov5675 *ov5675 = to_ov5675(sd);
> +	const struct ov5675_mode *modes;
> +	unsigned int num_modes;
> +
> +	modes = ov5675_get_modes(ov5675, &num_modes);
>  
>  	mutex_lock(&ov5675->mutex);
> -	ov5675_update_pad_format(&supported_modes[0],
> +	ov5675_update_pad_format(ov5675, &modes[0],
>  				 v4l2_subdev_state_get_format(fh->state, 0));
>  	mutex_unlock(&ov5675->mutex);
>  
> @@ -1281,6 +1386,7 @@ static void ov5675_remove(struct i2c_client *client)
>  static int ov5675_probe(struct i2c_client *client)
>  {
>  	struct ov5675 *ov5675;
> +	unsigned int num_modes;
>  	bool full_power;
>  	int ret;
>  
> @@ -1290,11 +1396,17 @@ static int ov5675_probe(struct i2c_client *client)
>  
>  	ov5675->dev = &client->dev;
>  
> +	ov5675->variant = device_get_match_data(ov5675->dev);
> +	if (!ov5675->variant)
> +		ov5675->variant = &ov5675_variant_bayer;
> +
>  	ret = ov5675_get_hwcfg(ov5675);
>  	if (ret)
>  		return ret;
>  
>  	v4l2_i2c_subdev_init(&ov5675->sd, client, &ov5675_subdev_ops);
> +	v4l2_i2c_subdev_set_name(&ov5675->sd, client, ov5675->variant->model,
> +				 NULL);
>  
>  	ret = ov5675_power_on(ov5675->dev);
>  	if (ret) {
> @@ -1312,7 +1424,7 @@ static int ov5675_probe(struct i2c_client *client)
>  	}
>  
>  	mutex_init(&ov5675->mutex);
> -	ov5675->cur_mode = &supported_modes[0];
> +	ov5675->cur_mode = ov5675_get_modes(ov5675, &num_modes);
>  	ret = ov5675_init_controls(ov5675);
>  	if (ret) {
>  		dev_err(ov5675->dev, "failed to init controls: %d", ret);
> @@ -1363,7 +1475,8 @@ static const struct dev_pm_ops ov5675_pm_ops = {
>  
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id ov5675_acpi_ids[] = {
> -	{"OVTI5675"},
> +	{"OVTI5675", (kernel_ulong_t)&ov5675_variant_bayer},
> +	{"OVTI5678", (kernel_ulong_t)&ov5675_variant_rgbir},
>  	{}
>  };
>  
> @@ -1371,7 +1484,7 @@ MODULE_DEVICE_TABLE(acpi, ov5675_acpi_ids);
>  #endif
>  
>  static const struct of_device_id ov5675_of_match[] = {
> -	{ .compatible = "ovti,ov5675", },
> +	{ .compatible = "ovti,ov5675", .data = &ov5675_variant_bayer },

It'd be nice to add DT bindings, too.

>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, ov5675_of_match);

-- 
Regards,

Sakari Ailus
