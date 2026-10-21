Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584585;
	b=fyOrqjVVPg2b27c8l/kW9+UCL4K3yAIDDLS8oT0MN0aY4D2GloYvv44CdvNYsRGssf8D
	 FEZciZXrYL1DfVh9bm12YH2ktxj7HSTEh8QhCp0QTd1bDCMtaWVEmURVUQM4hJTA4obw9
	 Iy1W4PXxyC3B6J+itY0H4tnB1359h0QMVeluLgfjhdYChgBviKiOUslqG5a3odOn91HmK
	 rnATVuCOjEid8wrdWi2FO3C+6eHd6SFokD6Js7C/pdo4GCFNdNf3AT4irPiZ3pv/0lGv4
	 6Ipu/8usMKRXkrtGLspkrkkNnlp2MTbHxyHGAfFsnVRCbWrDnIkpTy3W4NyIhhaELEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584585;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=Kc+TMzgVZmLXIMIX+na30heekvAW4oPWbghsCVfjRek=;
	b=bGzO7MH02IDM1bOljZaZtnknxmWwCzJyp0S8dzjj8Hhc+d+Sby15N1TtAS4SfntzdRDN
	 2I6dBdtpStDwMQo+XZPyU/T3v1ajkDP445sgPKOJqKDFVIQabp8iCam0tp9DYh9TqMFuq
	 kB9a9JPGSD7WievfjtR1Tf08j4p7bPJ/wIKCkhTw66xc7ECVqS4ijIxYmMa+pPIsFaCJD
	 roMJPBexuMJhhwh+jm2QVD3B2qjf5VHdN2CxYIdpKYfToYadCs//Gq/slAV2f9uEx2PRX
	 wMYde5+mUZDGPbhpZjvqS+LBsiRrCY3MBi7gsNTyMg9ec3ppuMz9v6IZPrus8If1nCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2gUbNFW;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152FB606A32E
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 152FB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2gUbNFW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792584585; x=1824120585;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=j1V0SI9hJZvk2W4ekhIVDIC+WcTgcLrLlg4OYdafizI=;
  b=n2gUbNFWCcaf1C05sfJEf5EagGPz53WC71Jwg1OsFU1mtr18RCY1Aw0n
   wZkTrlICXSd87R6uIywwHOjjtxTsrNkIWmMjA7msX6/2e3eRVHYe3+lGM
   uH+jpdHHbbVwQnM68Nja7d9pDpp0Gu5Cxc953mhNdXhHerxGFa7cxGBqB
   ryYrDlY5rJ8QnVpkMoSyo/HhkogI2HBHjETvsPoz3iStYImEH62f1ouOT
   CdbnXk4XAaVRht+ut+CQAflArom+JCOl0RzaIjWm6sc9oHk4VRxplbeOM
   BeVTM7i8zuYumGDMSyOulGeFbG0aBoR+WHaTMe/VS8FwwmxLkvTKr4vB3
   g==;
X-CSE-ConnectionGUID: 7Ewu4aWZSHKkaXdOi+Kh6A==
X-CSE-MsgGUID: yPRjsuN8RL+5kw0koSMt8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1318682"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1318682"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:09:44 -0700
X-CSE-ConnectionGUID: S+juht5qRmmrM9i1NgbVlw==
X-CSE-MsgGUID: CxO/O9UJQwOAVBPoUoiUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4907670"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:09:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 15:09:35 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH 5/8] platform/x86/amd/pmf: Add Smart PC builder support
 for 1AH_M80H
In-Reply-To: <20261011100554.1841309-6-Shyam-sundar.S-k@amd.com>
Message-ID: <d6a0b15a-e814-3dc0-0d71-95d36ecabf2b@linux.intel.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com> <20261011100554.1841309-6-Shyam-sundar.S-k@amd.com>
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

On Sun, 11 Oct 2026, Shyam Sundar S K wrote:

> 1AH_M80H uses a new PMF Trusted Application (TA) with its own UUID, a
> larger shared memory layout and an extended set of policy conditions.
> 
> Add the v2 TA structures and the init/enact callbacks for this TA, and
> select them through ta_ops on 1AH_M80H.
> 
> Battery, slider and sensor inputs reuse the existing helpers. SMU inputs
> (socket power, skin temperature, GFX busy and C0 residency) are taken
> from the accumulator based metrics table. Smart PC keeps its own
> previous sample, so that it does not disturb the delta calculation of
> the NPU metrics interface which reads the same table.
> 
> Key changes include:
>  - Add the v2 TA shared memory, condition and result structures
>  - Add amd_pmf_invoke_cmd_init_v2() and amd_pmf_invoke_cmd_enact_v2()
>  - Add amd_pmf_get_smu_info_v2() to read the accumulator metrics
>  - Apply the TA actions with the 1AH_M80H SMU message IDs
>  - Make the Q10 accumulator helpers and
>    amd_pmf_get_metrics_table_log_sample() available to spc.c
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/metrics.c |   9 +-
>  drivers/platform/x86/amd/pmf/pmf.h     | 157 +++++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c     | 145 ++++++++++++++++++
>  drivers/platform/x86/amd/pmf/tee-if.c  | 200 ++++++++++++++++++++++++-
>  4 files changed, 505 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
> index 5510dba95ce5..8c257ed1b455 100644
> --- a/drivers/platform/x86/amd/pmf/metrics.c
> +++ b/drivers/platform/x86/amd/pmf/metrics.c
> @@ -28,22 +28,21 @@
>  
>  static struct device *pmf_device;
>  
> -static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
> +u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
>  {
>  	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024) * MILLIWATT_PER_WATT;
>  
>  	return min_t(u16, val, U16_MAX);
>  }
>  
> -static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
> +u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
>  {
>  	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024);
>  
>  	return min_t(u16, val, U16_MAX);
>  }
>  
> -static u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter,
> -				  u64 curr_value, u64 prev_value)
> +u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter, u64 curr_value, u64 prev_value)
>  {
>  	u32 counter_diff;
>  	u64 val_diff;
> @@ -92,7 +91,7 @@ int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> -static int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev)
> +int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev)
>  {
>  	int ret;
>  
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 86999802602c..fff6fb3bf4e6 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -147,6 +147,15 @@ struct cookie_header {
>  #define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
>  #define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
>  
> +/* TA version-2 array sizes */
> +#define TA_PMF_NUM_ACPI_SENSOR_DATA	3
> +#define TA_PMF_ACPI_SENSOR_MAX		4
> +#define TA_PMF_ACTION_MAX_V2		100
> +#define TA_PMF_UNDO_MAX_V2		100
> +#define TA_PMF_NAME_TRACKING_MAX	100
> +#define TA_PMF_NAME_LENGTH_MAX		256
> +#define SIDELOAD_POLICY_MAX		400
> +
>  #define PMF_IF_V1		1
>  #define PMF_IF_V2		2
>  
> @@ -177,6 +186,11 @@ static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0
>  							   0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43),
>  					       };
>  
> +static const uuid_t amd_pmf_ta_uuid_v2[] __used = { UUID_INIT(0xf51cad64, 0xea14, 0x4789, 0xb6,
> +							      0xae, 0x89, 0xec, 0x7a, 0x1b, 0x8b,
> +							      0x94),
> +						  };
> +
>  /* APTS PMF BIOS Interface */
>  struct amd_pmf_apts_output {
>  	u16 table_version;
> @@ -728,6 +742,8 @@ struct amd_pmf_dev {
>  	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
>  	bool npu_metrics_have_prev;
>  	const struct amd_pmf_ta_ops *ta_ops;
> +	struct amd_pmf_metrics_v3 smartpc_prev_metrics;	/* Smart PC delta baseline */
> +	bool smartpc_metrics_have_prev;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -1122,6 +1138,138 @@ struct ta_pmf_shared_memory {
>  	union ta_pmf_input pmf_input;
>  };
>  
> +struct ta_pmf_name_eval_info {
> +	u32 value1;
> +	u32 value2;
> +	u32 value3;
> +};
> +
> +struct ta_pmf_name_eval_table {
> +	s32 result_count;
> +	struct ta_pmf_name_eval_info eval_results[TA_PMF_NAME_TRACKING_MAX];
> +};
> +
> +struct ta_pmf_condition_info_v2 {
> +	u32 power_source;
> +	u32 bat_percentage;
> +	u32 power_slider;
> +	u32 lid_state;
> +	u32 user_present;
> +	u32 bios_input_1[2];
> +	u32 monitor_count;
> +	u32 mouse_count;
> +	u32 keyboard_count;
> +	u32 bat_design;
> +	u32 full_charge_capacity;
> +	s32 drain_rate;
> +	u32 user_engaged;
> +	u32 device_state;
> +	u32 socket_power;
> +	u32 skin_temperature;
> +	u32 day_of_week;
> +	u32 sys_time_minutes;
> +	u32 platform_type;
> +	u32 app_input1;
> +	u32 app_input2;
> +	u32 ambient_light;
> +	u32 proc_queue_len;
> +	u32 avg_c0residency;
> +	u32 max_c0residency;
> +	u32 s0i3_entry;
> +	u32 gfx_busy;
> +	u32 proc_time_avg;
> +	u32 proc_time_max;
> +	u32 irq_per_sec_avg;
> +	u32 irq_per_sec_max;
> +	u32 gpu_engine_time;
> +	u32 gpu_engine_util;
> +	u32 user_input_delay;
> +	u32 camera_state;
> +	u32 workload_type;
> +	u32 display_type;
> +	u32 display_state;
> +	u32 asm_state;
> +	u32 sensor_data[TA_PMF_ACPI_SENSOR_MAX * TA_PMF_NUM_ACPI_SENSOR_DATA];
> +	u32 sensor_status[TA_PMF_ACPI_SENSOR_MAX];
> +	u32 combined_socket_pwr;
> +	u32 bios_input_2[8];
> +	u32 hetero_state;
> +	u32 game_mode;
> +	u32 activity_balance;
> +	u32 pepl_level;
> +	u32 transport_mode;
> +	u32 asm_supported;
> +	u32 workload_class;
> +	u32 video_enc_sessions;
> +	u32 video_dec_sessions;
> +	u32 rsvd[10];
> +};
> +
> +struct ta_pmf_enact_table_v2 {
> +	struct ta_pmf_condition_info_v2	ev_info;
> +	struct ta_pmf_name_eval_table name_ev_info;
> +};
> +
> +union ta_pmf_input_v2 {
> +	struct ta_pmf_enact_table_v2 enact_table;
> +	struct ta_pmf_init_table init_table;
> +};
> +
> +struct ta_pmf_sideload_policy_info {
> +	u16 num_policies;
> +	u32 priorities[SIDELOAD_POLICY_MAX];
> +	bool expression_result[SIDELOAD_POLICY_MAX];
> +	bool policy_applied[SIDELOAD_POLICY_MAX];
> +};
> +
> +struct ta_pmf_agm_log_table {
> +	s32 policies_applied_count;
> +	u32 policy_priority_list[TA_PMF_ACTION_MAX_V2];
> +};
> +
> +struct ta_pmf_enact_result_v2 {
> +	u32 actions_count;
> +	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX_V2];
> +	u32 undo_count;
> +	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX_V2];
> +	struct ta_pmf_agm_log_table agm_log_table;
> +	struct ta_pmf_sideload_policy_info sideload_policy_info;
> +};
> +
> +struct ta_pmf_name_info {
> +	u32 type;
> +	u16 name[TA_PMF_NAME_LENGTH_MAX];
> +};
> +
> +struct ta_pmf_oem_debug_table {
> +	u16 oem_major_version;
> +	u16 oem_minor_version;
> +};
> +
> +struct ta_pmf_load_policy_result {
> +	bool add_policy_success;
> +	bool sideload_enabled;
> +	struct ta_pmf_oem_debug_table oem_table;
> +	u64 conditions_to_track[8];
> +	u32 max_policy_sppt_limit;
> +	s32 name_count;
> +	struct ta_pmf_name_info name_table;
> +};
> +
> +union ta_pmf_output_v2 {
> +	struct ta_pmf_load_policy_result load_policy_result;
> +	struct ta_pmf_enact_result_v2 policy_apply_table;
> +};
> +
> +struct ta_pmf_shared_memory_v2 {
> +	int command_id;
> +	int resp_id;
> +	u32 pmf_result;
> +	u32 if_version;
> +	union ta_pmf_output_v2 pmf_output;
> +	union ta_pmf_input_v2 pmf_input;
> +};
> +
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> @@ -1185,6 +1333,10 @@ static inline u32 fixp_q88_fromint(u32 val)
>  
>  /* Metrics layer */
>  int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev);
> +int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev);
> +u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter, u64 curr_value, u64 prev_value);
> +u16 amd_pmf_q10_acc_to_mW(u64 avg_acc);
> +u16 amd_pmf_q10_acc_to_int(u64 avg_acc);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> @@ -1304,6 +1456,8 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>  int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
> +void amd_pmf_populate_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in);
> +int amd_pmf_invoke_cmd_enact_v2(struct amd_pmf_dev *dev);
>  
>  static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>  {
> @@ -1319,8 +1473,11 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *i
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in);
>  #else
>  static inline void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
> +static inline void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev,
> +					     struct ta_pmf_enact_table_v2 *in) {}
>  #endif
>  
>  int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index a12b4ee965a2..e1f2ea268d4e 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -13,11 +13,45 @@
>  #include <linux/amd-pmf.h>
>  #include <linux/amd-pmf-io.h>
>  #include <linux/cleanup.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
>  #include <linux/power_supply.h>
>  #include <linux/units.h>
>  #include "pmf.h"
>  
> +/*
> + * The metrics table reports C0 residency per CCX, while the enabled cores
> + * are reported per core type. Core types 0-2 belong to CCX0 and type 3
> + * to CCX1.
> + */
> +static const u8 core_type_to_ccx[AMD_PMF_METRIC_CORE_TYPE_MAX] = { 0, 0, 0, 1 };
> +
>  #ifdef CONFIG_AMD_PMF_DEBUG
> +void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
> +{
> +	dev_dbg(dev->dev, "==== TA v2 inputs START ====\n");
> +	dev_dbg(dev->dev, "Slider State: %s\n",
> +		amd_pmf_get_slider_position(in->ev_info.power_slider));
> +	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
> +	dev_dbg(dev->dev, "Battery Percentage: %u\n", in->ev_info.bat_percentage);
> +	dev_dbg(dev->dev, "Designed Battery Capacity: %u\n", in->ev_info.bat_design);
> +	dev_dbg(dev->dev, "Fully Charged Capacity: %u\n", in->ev_info.full_charge_capacity);
> +	dev_dbg(dev->dev, "Drain Rate: %d\n", in->ev_info.drain_rate);
> +	dev_dbg(dev->dev, "Socket Power: %u\n", in->ev_info.socket_power);
> +	dev_dbg(dev->dev, "Skin Temperature: %u\n", in->ev_info.skin_temperature);
> +	dev_dbg(dev->dev, "Avg C0 Residency: %u\n", in->ev_info.avg_c0residency);
> +	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
> +	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
> +	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
> +	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
> +	dev_dbg(dev->dev, "Ambient Light: %u\n", in->ev_info.ambient_light);
> +	dev_dbg(dev->dev, "Platform type: %s\n",
> +		amd_pmf_get_platform_type(in->ev_info.platform_type));
> +	dev_dbg(dev->dev, "Laptop placement: %s\n",
> +		amd_pmf_get_laptop_placement(in->ev_info.device_state));
> +	dev_dbg(dev->dev, "==== TA v2 inputs END ====\n");
> +}
> +
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	int i;
> @@ -121,6 +155,49 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>  }
>  
> +static void amd_pmf_get_c0_residency_v2(struct amd_pmf_metrics_v3 *curr,
> +					struct amd_pmf_metrics_v3 *prev,
> +					struct ta_pmf_enact_table_v2 *in)
> +{
> +	u32 curr_counter = curr->iod.counter_acc;
> +	u32 prev_counter = prev->iod.counter_acc;
> +	int active_cores = 0, core, type;
> +	u64 sum_of_avgs = 0;
> +	u32 local_max = 0;
> +
> +	if (!curr_counter) {
> +		in->ev_info.avg_c0residency = 0;
> +		in->ev_info.max_c0residency = 0;
> +		return;
> +	}
> +
> +	for (type = 0; type < ARRAY_SIZE(core_type_to_ccx); type++) {
> +		u8 ccx = core_type_to_ccx[type];
> +
> +		for (core = 0; core < AMD_PMF_NUM_MAX_CORES; core++) {
> +			u32 core_avg;
> +			u64 avg_acc;
> +
> +			/* Skip cores which are not enabled */
> +			if (!curr->iod.cclk_core_enabled[type][core])
> +				continue;
> +
> +			avg_acc = amd_pmf_avg_acc_metric(curr_counter, prev_counter,
> +							 curr->ccx[ccx].core_c0[core],
> +							 prev->ccx[ccx].core_c0[core]);
> +			core_avg = amd_pmf_q10_acc_to_int(avg_acc);
> +			sum_of_avgs += core_avg;
> +			active_cores++;
> +
> +			if (core_avg > local_max)
> +				local_max = core_avg;

I'd use max() for this but up to you.

> +		}
> +	}
> +
> +	in->ev_info.avg_c0residency = active_cores ? div_u64(sum_of_avgs, active_cores) : 0;
> +	in->ev_info.max_c0residency = local_max;
> +}
> +
>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
>  {
>  	u16 max, avg = 0;
> @@ -138,6 +215,50 @@ static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_e
>  	in->ev_info.max_c0residency = max;
>  }
>  
> +static void amd_pmf_get_smu_info_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
> +{
> +	struct amd_pmf_metrics_iod *curr, *prev;
> +	u64 val;
> +	int ret;
> +
> +	guard(mutex)(&dev->metrics_mutex);
> +
> +	ret = amd_pmf_get_metrics_table_log_sample(dev);
> +	if (ret)
> +		return;
> +
> +	memcpy_fromio(&dev->mtable_v3, dev->metrics_table_virt, sizeof(dev->mtable_v3));
> +
> +	if (!dev->smartpc_metrics_have_prev) {
> +		memcpy(&dev->smartpc_prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));

It would be better to use destination's sizeof() unless there's a good 
reason not to (I've not read the follow-up patches yet).

Maybe this should just goto to the memcpy() at the end?

> +		dev->smartpc_metrics_have_prev = true;
> +		return;
> +	}
> +
> +	curr = &dev->mtable_v3.iod;
> +	prev = &dev->smartpc_prev_metrics.iod;
> +
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->apu_power_acc, prev->apu_power_acc);
> +	in->ev_info.socket_power = amd_pmf_q10_acc_to_mW(val);
> +
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->dgpu_power_acc, prev->dgpu_power_acc);
> +	in->ev_info.socket_power += amd_pmf_q10_acc_to_mW(val);
> +
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->stt_apu_skin_temp_acc, prev->stt_apu_skin_temp_acc);
> +	in->ev_info.skin_temperature = amd_pmf_q10_acc_to_int(val);
> +
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->gfx_busy_acc, prev->gfx_busy_acc);
> +	in->ev_info.gfx_busy = amd_pmf_q10_acc_to_int(val);
> +
> +	amd_pmf_get_c0_residency_v2(&dev->mtable_v3, &dev->smartpc_prev_metrics, in);
> +
> +	memcpy(&dev->smartpc_prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));
> +}
> +
>  static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	/* Get the updated metrics table data */
> @@ -268,6 +389,30 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
>  	}
>  }
>  
> +void amd_pmf_populate_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
> +{
> +	struct ta_pmf_enact_table tmp = { };
> +
> +	in->ev_info.lid_state = !acpi_lid_open();
> +	in->ev_info.power_source = amd_pmf_get_power_source();
> +
> +	amd_pmf_get_battery_info(dev, &tmp);
> +	amd_pmf_get_slider_info(dev, &tmp);
> +	amd_pmf_get_sensor_info(dev, &tmp);
> +
> +	in->ev_info.bat_percentage = tmp.ev_info.bat_percentage;
> +	in->ev_info.bat_design = tmp.ev_info.bat_design;
> +	in->ev_info.full_charge_capacity = tmp.ev_info.full_charge_capacity;
> +	in->ev_info.drain_rate = tmp.ev_info.drain_rate;
> +	in->ev_info.power_slider = tmp.ev_info.power_slider;
> +	in->ev_info.user_present = tmp.ev_info.user_present;
> +	in->ev_info.ambient_light = tmp.ev_info.ambient_light;
> +	in->ev_info.platform_type = tmp.ev_info.platform_type;
> +	in->ev_info.device_state = tmp.ev_info.device_state;
> +
> +	amd_pmf_get_smu_info_v2(dev, in);
> +}
> +
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	/* TA side lid open is 1 and close is 0, hence the ! here */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 9b328be1e8f4..2ed9014cb7c4 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -115,6 +115,110 @@ static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_a
>  		pdev->bios_output[bios_idx] = action->value;
>  }
>  
> +static void amd_pmf_apply_policies_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_result_v2 *out)
> +{
> +	struct ta_pmf_action *action;
> +	u32 val;
> +	int idx;
> +
> +	if (out->actions_count > TA_PMF_ACTION_MAX_V2) {
> +		dev_err(dev->dev, "TA actions count %u exceeds max %u\n",
> +			out->actions_count, TA_PMF_ACTION_MAX_V2);
> +		return;
> +	}
> +
> +	for (idx = 0; idx < out->actions_count; idx++) {
> +		action = &out->actions_list[idx];
> +		val = action->value;
> +		switch (action->action_index) {
> +		case PMF_POLICY_SPPT:
> +			if (dev->prev_data->sppt != val) {
> +				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM,
> +						 SET_CMD, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT: %u\n", val);
> +				dev->prev_data->sppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_FPPT:
> +			if (dev->prev_data->fppt != val) {
> +				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM,
> +						 SET_CMD, val, NULL);
> +				dev_dbg(dev->dev, "update FPPT: %u\n", val);
> +				dev->prev_data->fppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT_APU_ONLY:
> +			if (dev->prev_data->sppt_apuonly != val) {
> +				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY,
> +						 SET_CMD, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
> +				dev->prev_data->sppt_apuonly = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_MIN:
> +			if (dev->prev_data->stt_minlimit != val) {
> +				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT,
> +						 SET_CMD, val, NULL);
> +				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
> +				dev->prev_data->stt_minlimit = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_APU:
> +			if (dev->prev_data->stt_skintemp_apu != val) {
> +				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
> +						 fixp_q88_fromint(val), NULL);
> +				dev_dbg(dev->dev, "update STT_LIMIT_APU: %u\n", val);
> +				dev->prev_data->stt_skintemp_apu = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_HS2:
> +			if (dev->prev_data->stt_skintemp_hs2 != val) {
> +				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
> +						 fixp_q88_fromint(val), NULL);
> +				dev_dbg(dev->dev, "update STT_LIMIT_HS2: %u\n", val);
> +				dev->prev_data->stt_skintemp_hs2 = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SYSTEM_STATE:
> +			switch (val) {
> +			case 0:
> +				amd_pmf_update_uevents(dev, KEY_SLEEP);
> +				break;
> +			case 1:
> +				amd_pmf_update_uevents(dev, KEY_SUSPEND);
> +				break;
> +			case 2:

You seem to know what these literals mean so they should be named with 
defines.

--
 i.

> +				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
> +				break;
> +			default:
> +				dev_err(dev->dev, "Invalid PMF policy system state: %u\n", val);
> +			}
> +
> +			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n", amd_pmf_uevent_as_str(val));
> +			break;
> +
> +		case PMF_POLICY_BIOS_OUTPUT_1:
> +		case PMF_POLICY_BIOS_OUTPUT_2:
> +		case PMF_POLICY_BIOS_OUTPUT_3:
> +		case PMF_POLICY_BIOS_OUTPUT_4:
> +		case PMF_POLICY_BIOS_OUTPUT_5:
> +		case PMF_POLICY_BIOS_OUTPUT_6:
> +		case PMF_POLICY_BIOS_OUTPUT_7:
> +		case PMF_POLICY_BIOS_OUTPUT_8:
> +		case PMF_POLICY_BIOS_OUTPUT_9:
> +		case PMF_POLICY_BIOS_OUTPUT_10:
> +			amd_pmf_update_bios_output(dev, action);
> +			break;
> +		}
> +	}
> +}
> +
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>  {
>  	struct ta_pmf_action *action;
> @@ -242,6 +346,46 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	}
>  }
>  
> +int amd_pmf_invoke_cmd_enact_v2(struct amd_pmf_dev *dev)
> +{
> +	struct ta_pmf_shared_memory_v2 *ta_sm = NULL;
> +	struct ta_pmf_enact_result_v2 *out = NULL;
> +	struct ta_pmf_enact_table_v2 *in = NULL;
> +	struct tee_param param[MAX_TEE_PARAM];
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret = 0;
> +
> +	if (!dev->tee_ctx)
> +		return -ENODEV;
> +
> +	memset(dev->shbuf, 0, dev->policy_sz);
> +	ta_sm = dev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;
> +	out = &ta_sm->pmf_output.policy_apply_table;
> +
> +	memset(ta_sm, 0, sizeof(*ta_sm));
> +	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
> +	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
> +
> +	amd_pmf_populate_ta_inputs_v2(dev, in);
> +	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
> +
> +	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(dev->dev, "TEE enact cmd failed. err: %x, ret:%d\n", arg.ret, ret);
> +		return ret;
> +	}
> +
> +	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
> +		amd_pmf_dump_ta_inputs_v2(dev, in);
> +		dev_dbg(dev->dev, "TA v2 action count:%u result:%x\n", out->actions_count,
> +			ta_sm->pmf_result);
> +		amd_pmf_apply_policies_v2(dev, out);
> +	}
> +
> +	return 0;
> +}
> +
>  int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
> @@ -282,6 +426,45 @@ int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +static int amd_pmf_invoke_cmd_init_v2(struct amd_pmf_dev *dev)
> +{
> +	struct ta_pmf_shared_memory_v2 *ta_sm = NULL;
> +	struct tee_param param[MAX_TEE_PARAM];
> +	struct ta_pmf_init_table *in = NULL;
> +	struct tee_ioctl_invoke_arg arg;
> +	int ret = 0;
> +
> +	if (!dev->tee_ctx) {
> +		dev_err(dev->dev, "Failed to get TEE context\n");
> +		return -ENODEV;
> +	}
> +
> +	dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n", (unsigned long long)dev->policy_sz);
> +	memset(dev->shbuf, 0, dev->policy_sz);
> +	ta_sm = dev->shbuf;
> +
> +	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
> +	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
> +	in = &ta_sm->pmf_input.init_table;
> +
> +	in->metadata_macrocheck = false;
> +	in->sku_check = false;
> +	in->validate = true;
> +	in->frequency = pb_actions_ms;
> +	in->policies_table.table_size = dev->policy_sz;
> +
> +	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
> +	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
> +
> +	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> +	if (ret < 0 || arg.ret != 0) {
> +		dev_err(dev->dev, "Failed to invoke TEE init cmd. err: %x, ret:%d\n", arg.ret, ret);
> +		return ret;
> +	}
> +
> +	return ta_sm->pmf_result;
> +}
> +
>  static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
> @@ -579,9 +762,24 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_default_ops = {
>  	.invoke_enact = amd_pmf_invoke_cmd_enact,
>  };
>  
> +static const struct amd_pmf_ta_ops amd_pmf_ta_ops_v2 = {
> +	.uuids = amd_pmf_ta_uuid_v2,
> +	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid_v2),
> +	.shm_size = sizeof(struct ta_pmf_shared_memory_v2),
> +	.invoke_enact = amd_pmf_invoke_cmd_enact_v2,
> +	.invoke_init = amd_pmf_invoke_cmd_init_v2,
> +};
> +
>  static void amd_pmf_select_ta_ops(struct amd_pmf_dev *dev)
>  {
> -	dev->ta_ops = &amd_pmf_ta_default_ops;
> +	switch (dev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
> +		dev->ta_ops = &amd_pmf_ta_ops_v2;
> +		break;
> +	default:
> +		dev->ta_ops = &amd_pmf_ta_default_ops;
> +		break;
> +	}
>  }
>  
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
> 
