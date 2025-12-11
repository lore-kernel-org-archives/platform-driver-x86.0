Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50091F03EF;
	Thu, 11 Dec 2025 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765477252; cv=none; b=tp1q/vILocS0lblweRGcQUTV3JmlI96+pshxDj28m7euusje+yz4BbCoc+AJp2yAD9t+/J3ic+yo55haP1WAQtLg3P2VeL+hGFn77J86/6HTZWskjhPsUyv4xB0te3XBl98HTRvvUs4eigBCJW87OFNuk6YpyyBUUtkJIkO9CGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765477252; c=relaxed/simple;
	bh=J27S1njIARybXJrBkqC8MrdkIcHxihGAmKqwCxy6XqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAtgNeI4sBeJQqbNXCkuC32q03jNlAQZRejsYVFV27yAwW86HS4hSlg8wneC+kbmeGSCQ9D6a611qPt3Pz0z58fbVj9wEHr9i2C05dg4VWRk3B+uqeq1cgTCsQGxTIiqrNEMozoIYagCz8l3nXhkqffS0g8Xn78QVztFRO4T0To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/YtIVig; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/YtIVig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FEAC4CEF7;
	Thu, 11 Dec 2025 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765477252;
	bh=J27S1njIARybXJrBkqC8MrdkIcHxihGAmKqwCxy6XqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D/YtIVigSAwQkeqyPHDHib/4BMMab1gVgZqYhebWVmbFqJ80gUXtHhLLyLTdT8bFF
	 Kc/Z3vGHvdoDHO6bpnyRQiz8rww3Gs+GjHrT+XxrnDupJrdHwFAJ/0tDp0Pcc1Xdz9
	 /8lVTifs39lrKvXOU7u4OQxFsSlJ7QRdH4LB1pwBZT6T54NoEavP8Iuyv9bpoUAyJJ
	 5fcVWg6jfHnuf1PCXV8UeuiWNMetr15AFeZ5Hee6Lqd8EQAGLfuOasNTxu5mJzO/D7
	 PExWDe4/MHbj6kwuKwKLelhU8/5RS3aWZNm4tZcz3adM9mTGiDZWWizL2HIHAquFpc
	 AfLQYjqsUysJA==
Message-ID: <4d1fceb1-d062-493d-a5dd-e7a0157caded@kernel.org>
Date: Thu, 11 Dec 2025 12:20:50 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] accel/amdxdna: Add IOCTL to retrieve realtime NPU
 power estimate
To: Lizhi Hou <lizhi.hou@amd.com>, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org, ogabbay@kernel.org, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shyam-sundar.S-k@amd.com, VinitKumar.Shukla@amd.com
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
 <20251211175802.1760860-3-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251211175802.1760860-3-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 11:58 AM, Lizhi Hou wrote:
> The AMD PMF driver provides an interface to obtain realtime power
> estimates for the NPU. Expose this information to userspace through a
> new DRM_IOCTL_AMDXDNA_GET_INFO parameter, allowing applications to query
> the current NPU power level.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h        | 18 +++++++++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
>   3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 81a8e4137bfd..4a2c7addcd79 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   #include <drm/gpu_scheduler.h>
> +#include <linux/amd-pmf-io.h>
>   #include <linux/cleanup.h>
>   #include <linux/errno.h>
>   #include <linux/firmware.h>
> @@ -777,6 +778,31 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   	return ret;
>   }
>   
> +static int aie2_get_sensors(struct amdxdna_client *client,
> +			    struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_query_sensor sensor = { 0 };
> +	int ret;
> +
> +	if (args->buffer_size < sizeof(sensor))
> +		return -EINVAL;
> +
> +	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
> +	if (ret)
> +		return ret;
> +	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
> +	sensor.unitm = -3;
> +	snprintf(sensor.label, sizeof(sensor.label), "Total Power");
> +	snprintf(sensor.units, sizeof(sensor.units), "mW");
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
> +		return -EFAULT;
> +
> +	args->buffer_size = sizeof(sensor);
> +
> +	return 0;
> +}
> +
>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   {
>   	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
> @@ -980,6 +1006,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
>   		ret = aie2_get_clock_metadata(client, args);
>   		break;
> +	case DRM_AMDXDNA_QUERY_SENSORS:
> +		ret = aie2_get_sensors(client, args);
> +		break;
>   	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
>   		ret = aie2_get_hwctx_status(client, args);
>   		break;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index c6b5cf4ae5c4..edf6f2e00dea 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -46,6 +46,24 @@
>   	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
>   })
>   
> +#if IS_ENABLED(CONFIG_AMD_PMF)
> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
> +({ \
> +	struct amd_pmf_npu_metrics _npu_metrics; \
> +	int _ret; \
> +	_ret = amd_pmf_get_npu_data(&_npu_metrics); \
> +	val = _ret ? U32_MAX : _npu_metrics.field; \
> +	(_ret); \
> +})
> +#else
> +#define SENSOR_DEFAULT_npu_power	U32_MAX
> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
> +({ \
> +	val = SENSOR_DEFAULT_##field; \
> +	(-EOPNOTSUPP); \
> +})
> +#endif
> +
>   enum aie2_smu_reg_idx {
>   	SMU_CMD_REG = 0,
>   	SMU_ARG_REG,
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 1973ab67721b..643ebd387074 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -32,9 +32,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>    * 0.4: Support getting resource information
>    * 0.5: Support getting telemetry data
>    * 0.6: Support preemption
> + * 0.7: Support getting power data
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		6
> +#define AMDXDNA_DRIVER_MINOR		7
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the

