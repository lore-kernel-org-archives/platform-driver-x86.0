Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B9B3090D6;
	Tue, 18 Nov 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471111; cv=none; b=ihMMwAO17hYt9343vY2esK56U+dA6V9DsVMfx+ut84FOMhYtixO4Uk3J/gqEYQt4bQpt/12026+NMhNYzbAW4ydeemOkcIdFCy1+sUSVIpXNunm7yKzK8oN5qGs1jRp1/ehPecdXp6cdiny4VeIq0b+iQ+07BmzzdvEuSgO4DCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471111; c=relaxed/simple;
	bh=YARkun/vH4Icz1RGhkqbHXDrG36XnQQmoBDBPjD8Ogo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKtJww0adWsxt6bRctEt8kl4qvprKGBr99JMVYHIzuZiIOet3OJsyMim2rzbC6cH/lpSOoxNHxqAZOAUfZyz3BZUWDMdUCqRPVZIk8Mb50ZkDQvoV7X7p6g4bGwtV2x3TMKSHHTJEhW+QTSBzGDaN1ft1So+fgx74UO5Fu1t9gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Nk/A5SXC; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Nk/A5SXC"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 475102FC0057;
	Tue, 18 Nov 2025 14:05:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763471105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4OvytNrMDvSYfqQn9f/xEFrMQ/ZFNmQ8njfA11J16w=;
	b=Nk/A5SXCpDNdcqqXOIi1EHl0F7lvjiVxL2+gNSX4nwvapBvKwyNLKvdzbsYgU2UG0g8KpF
	pQ9QZAYaQAP8Zjxl/F40MYhQnf1QLD1ZA0G+4uMsY7/MA3hv+DsKc6ocSlPAJqCKt+5zrR
	hpq6d/92Oo6RMS2f3j6LHL3AoPfWVKI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <fb41c565-9ff6-468c-9004-82391c33f24d@tuxedocomputers.com>
Date: Tue, 18 Nov 2025 14:05:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] platform/x86/uniwill: Set cTGP support based on EC
 for TUXEDO IBP Gen7 MK1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-7-wse@tuxedocomputers.com>
 <2872e563-8973-d501-764c-920c18afd58d@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <2872e563-8973-d501-764c-920c18afd58d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 18.11.25 um 11:43 schrieb Ilpo Järvinen:
> On Mon, 17 Nov 2025, Werner Sembach wrote:
>
>> The TUXEDO InfinityBook 14 Gen7 shares a boardname between the variant with
>> and without an NVIDIA GPU.
>>
>> Dynamically read which variant is present from EC to determine cTGP
>> support.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 22 ++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 15a94c256f728..f6b24d2c28b89 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -88,6 +88,9 @@
>>   
>>   #define EC_ADDR_GPU_TEMP		0x044F
>>   
>> +#define EC_ADDR_SYSTEM_ID		0x0456
>> +#define HAS_GPU				BIT(7)
>> +
>>   #define EC_ADDR_MAIN_FAN_RPM_1		0x0464
>>   
>>   #define EC_ADDR_MAIN_FAN_RPM_2		0x0465
>> @@ -1406,6 +1409,23 @@ static int uniwill_ec_init(struct uniwill_data *data)
>>   	return devm_add_action_or_reset(data->dev, uniwill_disable_manual_control, data);
>>   }
>>   
>> +static int quirk_ibp_gen7_ctgp_supported(const struct dmi_system_id *d)
>> +{
>> +	struct uniwill_data *data = container_of(d, struct uniwill_data, id);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret = regmap_read(data->regmap, EC_ADDR_SYSTEM_ID, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +	if (value & HAS_GPU) {
>> +		data->id.driver_data =
>> +			(void *)((unsigned long)data->id.driver_data |
>> +				 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL);
> Hi,
>
> Mutating .driver_data like this is a no go. Please store information that
> isn't bound to the match properly, not with hacks like this.
>
> There seems to be already struct uniwill_data where you can add things
> properly. If you want to use .driver_data as mutatable feature flags, you
> need to make a copy of it into a properly named variable (e.g.
> data->features). Then you can do
> 	data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
> here.
ok
>
>> +	}
>> +	return 0;
>> +}
>> +
>>   static const struct dmi_system_id uniwill_dmi_table[] = {
>>   	{
>>   		.ident = "XMG FUSION 15",
>> @@ -1462,12 +1482,12 @@ static const struct dmi_system_id uniwill_dmi_table[] = {
>>   		.driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>>   	},
>>   	{
>> +		.callback = quirk_ibp_gen7_ctgp_supported,
>>   		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
>>   		.matches = {
>>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>>   		},
>> -		.driver_data = (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
> Please always order your series so you don't need to correct things you've
> just added.
ack
