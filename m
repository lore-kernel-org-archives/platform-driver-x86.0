Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2A2D5C68
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540374; cv=none; b=Kvv4l8uarkdXBdxz8faSwEWSKrDZngH2hoJ878eHmhg1M1MdhzH9Er7LE1W5TAN0btp8Nw2VEZLU174zRZICalHVnOkJ1RPUe5L1wwUbT5SZd2cquRtbGYESBEyqdWrTP4gCyFe9FGL4DzwN51w7uSc5oNpcffKkMjOjGGIaOHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540374; c=relaxed/simple;
	bh=JntxfGF5cNf0Kvluk+UCJZH6UgAP+xgU+Xa4czUhtuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CU29amj4Aec9O4osrGjAH5dM+gNpqbQCNeX8e0XhlWSFsaYbcOLULRth6pQJpNWqFAD3YzHfqRCwWSV7ub4MZj5whlf8Td3AIRP6ThP8myoZ0rX942vvHpSOwm/RcYhT/Z+Ol7JHksTavFH3Ps+CgxLjPhaZRTg8gS8LzXQNBdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Znin08Me; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Znin08Me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6EFC4CEF8;
	Wed, 15 Oct 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540374;
	bh=JntxfGF5cNf0Kvluk+UCJZH6UgAP+xgU+Xa4czUhtuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Znin08MeIAQd7pS0NGdjIjgxfBB1BqBP7163/kMyNsQz0KXY98SFGTm4e98ezNHJm
	 MVBAZOtgxwJpb4FIgW+HG0NyydIEFgYcfsfPXqa5Wix1G4RTZISXdu+/FgawTsiZ87
	 Xk7lOSsUGlXk/mE11rNFYqxqg5zVhSyYe86/Ur0xPYBypHl0gqEQmwq0RQQ3+vWt5G
	 9Sbj4yUforogRSeb3ls27/wuKRifrY7HAHdCUMTh+PqRn4FEz/lwwMjiZpARrJFwFA
	 oxLBV9fdquP7iQtRA5yesHpP2bPuQTHxlWthJo5HvzLGwfotkcpkcP8ynTRVGOASTk
	 YvvEDReCILTig==
Message-ID: <1f69a884-fee5-434e-8d65-89bbc721276b@kernel.org>
Date: Wed, 15 Oct 2025 09:59:33 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro to
 replace hardcoded array size
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@Dell.com
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 9:54 AM, Shyam Sundar S K wrote:
> Define a new macro BIOS_INPUTS_MAX, to represent the maximum number of
> BIOS input values. Replace hardcoded array sizes in relevant structures
> with this macro to improve readability and maintainability.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
> v2:
>   - New patch spinned from v1
>   - Add new BIOS_INPUTS_MAX macro and replace hardcoded values
> 
>   drivers/platform/x86/amd/pmf/pmf.h | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index bd19f2a6bc78..2145df4128cd 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -119,6 +119,7 @@ struct cookie_header {
>   
>   #define APTS_MAX_STATES		16
>   #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
> +#define BIOS_INPUTS_MAX		10
>   
>   typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>   
> @@ -204,7 +205,7 @@ struct apmf_sbios_req_v1 {
>   	u8 skin_temp_apu;
>   	u8 skin_temp_hs2;
>   	u8 enable_cnqf;
> -	u32 custom_policy[10];
> +	u32 custom_policy[BIOS_INPUTS_MAX];
>   } __packed;
>   
>   struct apmf_sbios_req_v2 {
> @@ -216,7 +217,7 @@ struct apmf_sbios_req_v2 {
>   	u32 stt_min_limit;
>   	u8 skin_temp_apu;
>   	u8 skin_temp_hs2;
> -	u32 custom_policy[10];
> +	u32 custom_policy[BIOS_INPUTS_MAX];
>   } __packed;
>   
>   struct apmf_fan_idx {
> @@ -355,7 +356,7 @@ enum power_modes_v2 {
>   };
>   
>   struct pmf_bios_inputs_prev {
> -	u32 custom_bios_inputs[10];
> +	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>   };
>   
>   struct amd_pmf_dev {
> @@ -451,7 +452,7 @@ struct os_power_slider {
>   struct amd_pmf_notify_smart_pc_update {
>   	u16 size;
>   	u32 pending_req;
> -	u32 custom_bios[10];
> +	u32 custom_bios[BIOS_INPUTS_MAX];
>   } __packed;
>   
>   struct fan_table_control {

