Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19293A2551
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506200; cv=none; b=TeV6RyK5m4IPj0e1iqejj72HwSDQj8KjrcHIs1P2Uxpl5Lmer+jEynuwv5t1+Nmuhk7tTi1hHrl8/VE/8rnQ5QPainGTeM29TxIAAkwbeBclNKRKhLsUiyG/AgsKwKxlEXS6On+FpZWVKkgsaElk8VwPqtLQwNsWOEjL61NzZok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506200; c=relaxed/simple;
	bh=Vy6I5cBNKJ50HSTKgnQcAK5rhc7OnSMlif/I9EMSlhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pg8TQ6Laf9lxTEy1PHji8Gi6BvkoETRz7UIJe/ySB6kyubW6QVHR60drv9PaI6ytqbINYdUkOpKUUuetqsLikAHzqMtMGPxHNOqfZEG5U2dkjgzuo1h0Jnk9FtaljrlG1F6zyKhF7BI0ZRmSrM7G0zDIHdx4PlPAZSxb+9TO598=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GrAa0yw+; arc=none smtp.client-ip=91.218.175.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GrAa0yw+"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Vy6I5cBNKJ50HSTKgnQcAK5rhc7OnSMlif/I9EMSlhg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789506194; v=1; x=1790110994;
 b=GrAa0yw+TTxr2DuSxcZ8l4JrrE9g0ioFc+Do8TibLJxgIegDBsAHiQuoRKZCWDwSR/yXbMF+
 ebB4anY2Yl7FZvFRInhx2mV/AcQFCRvFf5SFSLKQ9pQefScBN5vZCZsBrrXMIuV6xneC+EQAtPZ
 gw18d/BI1rQpojFH9sTNM1tQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1d45e5f2678cd130;
	Tue, 15 Sep 2026 21:03:13 +0000
X-Mizu-Trace-ID: 1d45e5f2678cd130
X-Migadu-Flow: FLOW_OUT
Message-ID: <246a7bf2-a51b-442f-97aa-c767f8c02f8c@linux.dev>
Date: Tue, 15 Sep 2026 23:03:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: add dGPU disable fallback
 DEVID for ProArt H7606 series
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: busybox11 <busybox11th@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com>
 <40f1840a-e3e4-29d3-66b5-a13737224f99@linux.intel.com>
 <b647e0a5-4122-4772-b317-d2d7a8cb4d31@linux.dev>
 <c2d620e4-25ba-c31b-0143-4a53ff3edd8b@linux.intel.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <c2d620e4-25ba-c31b-0143-4a53ff3edd8b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/15/26 22:56, Ilpo Järvinen wrote:
> On Tue, 15 Sep 2026, Denis Benato wrote:
>
>> On 9/15/26 22:38, Ilpo Järvinen wrote:
>>> On Mon, 10 Aug 2026, busybox11 via B4 Relay wrote:
>>>
>>>> From: busybox11 <busybox11th@gmail.com>
>>>>
>>>> Newer ASUS ProArt laptops (e.g. H7606 series) implement dGPU power
>>>> control on WMI DEVID 0x00090120 instead of the usual 0x00090020.
>>>> The default DEVID returns 0xFFFFFFFE on these models, so the
>>>> dgpu_disable firmware attribute is never created and the dGPU cannot
>>>> be re-enabled from Linux at all.
>>>>
>>>> Add a fallback probe for device ID 0x00090120 following the same
>>>> approach as the gpu_mux_dev_id probe.
>>>>
>>>> Details for 0x00090120 (confirmed on H7606W using direct WMNB calls
>>>> and inspecting the DSDT DEVS handler):
>>>>   - Reading DSTS returns 0x00010001 when the dGPU is off (CUMA=1),
>>>> 	or 0x00010000 when it's on.
>>>>   - Writing DEVS: 0 enables the dGPU (calls PG00._ON() + Notifies
>>>> 	PEGP, Device Check), and 1 disables or ejects it.
>>>>
>>>> This behavior matches the dgpu_disable attribute (1 = disabled).
>>>>
>>>> Signed-off-by: busybox11 <busybox11th@gmail.com>
>>> Unfortunately, we cannot accept anonymous or pseudonym signed 
>>> contributions so please sign off with your real name. For more 
>>> information about signing of patches, please see:
>>>
>>> Documentation/process/submitting-patches.rst
>>>
>>>> ---
>>>>  drivers/platform/x86/asus-armoury.c        | 32 +++++++++++++++++++++++++-----
>>>>  include/linux/platform_data/x86/asus-wmi.h |  3 +++
>>>>  2 files changed, 30 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>>> index 495dc1e31..f39b52451 100644
>>>> --- a/drivers/platform/x86/asus-armoury.c
>>>> +++ b/drivers/platform/x86/asus-armoury.c
>>>> @@ -93,6 +93,7 @@ struct asus_armoury_priv {
>>>>  
>>>>  	u32 mini_led_dev_id;
>>>>  	u32 gpu_mux_dev_id;
>>>> +	u32 dgpu_disable_dev_id;
>>>>  };
>>>>  
>>>>  static struct asus_armoury_priv asus_armoury = {
>>>> @@ -452,8 +453,8 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>>>>  	if (err)
>>>>  		return err;
>>>>  
>>>> -	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU)) {
>>>> -		err = armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU);
>>>> +	if (asus_armoury.dgpu_disable_dev_id) {
>>>> +		err = armoury_get_devstate(NULL, &result, asus_armoury.dgpu_disable_dev_id);
>>>>  		if (err)
>>>>  			return err;
>>>>  		if (result && !optimus) {
>>>> @@ -507,7 +508,8 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>>>>  	}
>>>>  
>>>>  	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
>>>> -		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
>>>> +		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL,
>>>> +					   asus_armoury.dgpu_disable_dev_id);
>>>>  		if (err)
>>>>  			return err;
>>>>  	}
>>>> @@ -516,7 +518,7 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>>>>  
>>>>  	return count;
>>>>  }
>>>> -ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
>>>> +ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disable_dev_id);
>>>>  ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
>>>>  
>>>>  /* Values map for eGPU activation requests. */
>>>> @@ -790,7 +792,6 @@ ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_
>>>>  static const struct asus_attr_group armoury_attr_groups[] = {
>>>>  	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
>>>>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>>> -	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>>>>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>>>  
>>>>  	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>>>> @@ -934,6 +935,21 @@ static int asus_fw_attr_add(void)
>>>>  		}
>>>>  	}
>>>>  
>>>> +	asus_armoury.dgpu_disable_dev_id = 0;
>>>> +	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
>>>> +		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
>>>> +	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MODE))
>>>> +		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_GPU_MODE;
>>>> +
>>>> +	if (asus_armoury.dgpu_disable_dev_id) {
>>> Now I started to wonder why are we doing it like this and not using 
>>> .is_visible?
>>>
>>> This question applies to the similar, existing cases as well.
>>>
>>> Denis?
>>>
>>>
>> I don't understand the question. There are a bunch of .is_visible in the kernel and
>> I'm not sure if I am looking the right one and therefore if I understood the question correctly.
>>
>> It is written as this to memorize what the correct id is and therefore what
>> to do.... but I doubt this answers you.
> No, it doesn't.
>
> With sysfs, .is_visible callbacks are normally used to hide attributes 
> when feature is not supported or for other reasons, which simplifies the
> setup code. This one checks manually asus_armoury.dgpu_disable_dev_id != 0 
> in the setup code.
>
> (In addition, sysfs could even be asked to change the visibility 
> on-the-fly so it would re-execute the .is_visible callbacks to determine 
> which of the attributes to show.)
>
>
This is a very good idea. I am not aware of any particular reason not to use
it as long as fwupd likes it I'm fine with it and I am also available to change
these to use in_visible.
