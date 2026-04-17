Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0830E84D;
	Fri, 17 Apr 2026 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776452202; cv=none; b=hK+oYuSTjPbjw8iURQT3M52c0EBYIEdlXxrtaCoSid0DXFGWmjcyS8n/3GLR/BWwm2Hjot01ucWDzDTc1Xp2mPwqiFDlvQlyPTCP6mTn7RhQA9HeC92xbmezrKrK8bq+RuZ++BSIk7DXRrSWCp5nXntSO3mN76XDBAktmODcers=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776452202; c=relaxed/simple;
	bh=EjpT0hUxjSVyqWbkYfUrUyfVR87QmEFBnOWXnMtgXvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXIwam81xmtc2zU5UCZoJhY8nM1d9LwMULfv+Eo5UPFURtK7WjNOtjsJ72Wq+5SIi1sXkNTAmP0eNI2GJx+i1Pdo37fP19U5WxlwUyPojErkg2lqnJxVjddc9I2lq5BxMZUCZ3YUPME2+tKJs7MD+Mi9aE+c5OzeVYjv9KzhCq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+gspRBW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+gspRBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6F6C19425;
	Fri, 17 Apr 2026 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776452202;
	bh=EjpT0hUxjSVyqWbkYfUrUyfVR87QmEFBnOWXnMtgXvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s+gspRBWYDIsaBnCk/aCJS/0SC/jdW1U7i+ZE4tszUKcr0g5VkVr/ISEDmByvq/ff
	 WPxPAZI4SLtH1hMXT3bF3uRPFJDP4VcJ81xT1s/LBvl+8kJHTFzsjnJI3mf2Z5wo38
	 v4K4qPY//gsV0obbg3CJfXdrnwpSIoAgYl3SdXhV62yh87Yn8OevCt7YWJt1BefEEA
	 L9wApWV1UfhKPaLxu6K2d1iI15yfE5kyOl4cNP1trh/4U7Ir7CqkVNnfXWpuNdziM7
	 hTyDjBlJE9Ete31AEbOb4QbhhilB7elhX8bof2k1AEw1ja3mz/dGjoGZsBlSJbwXIT
	 1EO4v+v0dTHcg==
Message-ID: <edca0edc-d814-4e5c-85a6-7306b7f92dcc@kernel.org>
Date: Fri, 17 Apr 2026 20:56:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: ipu-bridge: add sensor configuration for
 OV8858 (INT3477)
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: lee@kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, djrscally@gmail.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
 nicholas@rothemail.net
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-5-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417163252.15603-5-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Apr-26 18:32, Thierry Chatard wrote:
> The Omnivision OV8858 is used as the rear camera in several Intel
> IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
> INT3477. Add a sensor configuration entry with a link frequency of
> 360 MHz to allow ipu_bridge to create the firmware node for this sensor.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index fc6608e33..f51749d0f 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
>  	/* Omnivision OV2740 */
>  	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
> +	/* Omnivision OV8858 */
> +	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
>  	/* Omnivision OV5670 */
>  	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
>  	/* Omnivision OV8865 */

