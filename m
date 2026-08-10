Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32566378D72;
	Mon, 10 Aug 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349388; cv=none; b=LpayDgS32naTiuIJ6J0P4MxYFCaoELmtD/N3JFA3fR+oRABo/DG+ZRtfbahmF2QlRVaSKNWzMRmDOo8BxsHTtjF+gSRL4LP/f3xBABL7cAO9gDgu2+0VhIuotrF0Y2FNMUS1dwkyaYek9kQWe0PPEpZ8LPFBPVNCLc4gLZ3n9k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349388; c=relaxed/simple;
	bh=Q8NvrpokNA6XgIOrlb8DDh5dALyyoPzXPVLiKjvTh9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swE7syMn/RvX8cD9mv0Hju53TYCHyw6V6kEFcRD1b7lJuC4q1/w/WOtW0SjlFtCcAask05eSwD5Y8YF/Ag5RoRRRjKRNt6tFBJWen2CoCtmyphYT4bQ6x8QclQq22AYsSPVFBys78x7+wxaZWZ56LzmdUQR3FCzgpKcgiXSx5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khP8bs6Z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khP8bs6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786349387; x=1817885387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q8NvrpokNA6XgIOrlb8DDh5dALyyoPzXPVLiKjvTh9Y=;
  b=khP8bs6Zhv17HPx5NwxqoCuOfZb/co3/MXwfg9XfUkU5g8tckPrk/4gh
   3Qh8/KiKnvjDfT9YG16p31qmgZo5X8WECyzERQwC7Ly0RyiY6IMeUm/wk
   s0Km5oUW+/tev+Tsv+maVTe2aSkyIBzEVQCh5vzABkhijOk/Mx0g+ft6t
   XgKCzNNBNreHveEc+JSAdkHt8F2Xn+BYCkmVkoJbpRXDBGgYDuXYpe0Gb
   7KpOSj7Pdo0vZVgkPNezBlSp9sjgomI5hdAIQsL/sPmxOa9h2sTzW2oyu
   aVOlqM5Kn2qik3Be5V+BgTp9MKvcUY8k66EbHP/QdlyRHWwJf9NVtWUO2
   w==;
X-CSE-ConnectionGUID: GpiKEASjQAa2zTbBH26DDA==
X-CSE-MsgGUID: N1jV5L0WTVODFor0XaytEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86734669"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="86734669"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:09:46 -0700
X-CSE-ConnectionGUID: Q9/8zGjWS3Snb2klj7JbUA==
X-CSE-MsgGUID: pVz5vU28ROG0w+hBCicRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="261239082"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:09:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A171B121197;
	Mon, 10 Aug 2026 11:09:42 +0300 (EEST)
Date: Mon, 10 Aug 2026 11:09:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sahan Nissanka <adee.sahan@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	dan.scally@ideasonboard.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ov5675: Add OVTI5678 ACPI id
Message-ID: <anmHRjxruBaYQRaC@kekkonen.localdomain>
References: <20260809042540.15849-1-adee.sahan@gmail.com>
 <20260809042540.15849-3-adee.sahan@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809042540.15849-3-adee.sahan@gmail.com>

Hi Sahan,

Thank you for the patchset.

On Sun, Aug 09, 2026 at 02:25:18PM +1000, Sahan Nissanka wrote:
> The front camera of the Dell Latitude 7320 Detachable is described in
> ACPI as OVTI5678, and no driver has ever claimed that id. It reports
> chip id 0x005675 at register 0x300a, which is what
> ov5675_identify_module() expects, and it streams with this driver
> unmodified:
> 
>   ov5675 i2c-OVTI5678:00: chip id at 0x300a reads 0x005675
>     reg 0x300a = 0x00  reg 0x300b = 0x56  reg 0x300c = 0x75
> 
> The two other values this driver is sensitive to were read from the
> machine's ACPI SSDB before the sensor was ever powered, and both agree:
> L0NL = 2 data lanes (OV5675_DATA_LANES) and L0CK = 19200000 Hz
> (OV5675_XVCLK_19_2). Native resolution matches at 2592x1944.
> 
> With this id added the sensor binds and streams: libcamera lists it and
> capture runs at 2584x1944, 29.95 fps.
> 
> This part is not a plain Bayer sensor, however, and the format this
> driver declares for it is inaccurate. It carries a 4x4 RGB-IR colour
> filter array, one pixel in four being infrared:
> 
>     G I G I
>     R G B G
>     G I G I
>     B G R G

Most non-Bayer colour raw sensors can be programmed to produce Bayer
output. It'd be interesting to know what are the differences in register
writes compared to the Windows driver -- it might use that feature.

> 
> Confirmed three ways. Intel's Windows IPU6 configuration for this exact
> module - matched by ACPI _DDN, so not a near relative - declares
> bayer_order="GIGI_RGBG_GIGI_BGRG" and sensor_type="RGB_IR". Measured on
> the sensor at full resolution, positions a 2x2 model treats as a single
> channel differ by 18% while the four infrared positions agree to 0.4%.
> And the module's Intel tuning data carries a 4x4 channel index map that
> agrees with both.
> 
> Read as the SGRBG10 declared here, the "blue" channel is pure infrared
> and the "red" channel interleaves real red with real blue, so colour is
> wrong in a way no white balance can correct.
> 
> This cannot be fixed in this driver: there is no RGB-IR media bus code
> in the V4L2 ABI. Nor is it unique to this part - ox05b1s declares
> SGRBG10 for an RGB-IR sensor of the same class and resolution. I intend
> to propose RGB-IR media bus codes separately. Until such support
> exists, this patch makes otherwise unusable hardware work, carrying the
> same known inaccuracy as the existing RGB-IR sensor support.
> 
> One further note for anyone building on this: the sensor's binned
> 1296x972 mode averages infrared pixels together with colour ones, which
> destroys the mosaic. Only the full resolution mode is meaningful for an
> RGB-IR aware pipeline.

The metadata series I've been preparing adds common raw formats and moves
the CFA pattern to a control. Then we can add the non-Bayer patters to the
UAPI as well. This isn't in upstream yet though. See
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

Most of the commit message would seem to be better located in the cover
letter.

> 
> Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
> ---
>  drivers/media/i2c/ov5675.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index ea26df3..99dbf53 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1355,6 +1355,17 @@ static const struct dev_pm_ops ov5675_pm_ops = {
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id ov5675_acpi_ids[] = {
>  	{"OVTI5675"},
> +	/*
> +	 * The front sensor of the Dell Latitude 7320 Detachable is described
> +	 * as OVTI5678 in ACPI, but the part reports chip id 0x005675 and its
> +	 * SSDB agrees with this driver on both other values that matter:
> +	 * 2 CSI-2 data lanes and a 19.2 MHz external clock.
> +	 *
> +	 * Note this variant carries a 4x4 RGB-IR colour filter array, not the
> +	 * 2x2 Bayer declared here, so colour is incorrect. There is currently
> +	 * no RGB-IR media bus code to declare instead.
> +	 */

Given the similarities, adding ov5678 support to this driver would probably
make sense, but the output really should be Bayer or we need to wait for
the metadata series to be merged.

> +	{"OVTI5678"},
>  	{}
>  };
>  

-- 
Kind regards,

Sakari Ailus
