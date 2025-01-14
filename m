Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53467232428
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jan 2025 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887579; cv=none; b=hS6kzDeelKvWMXre58mPwYBpyFQIb615xEdUO2yq8zJqqQDnl025zme5ZWvSTt7I8R3NDxSkUk2JqPzIWCHhwhIORvoxVJi3yMh1C2HhpC8Jp03lAnjyiV2IawjKoNXVTX/SHp8HeeM+/GOk1QtNmQOzJX3tNVWJMXDawth+WVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887579; c=relaxed/simple;
	bh=+yOsSTv/DcIdCbpMRAzf8agSE4E6yeDqZzxwOohlLlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVDFpX0Aje56iGeW1OiRt+bYMp1hbLXhMDNw3b3lPz814YWo0HLH4A9/dB4Swy4bvjY/ydFlw9uFZThjdmaWcdqVhAITrIKl2gOys7f+G0Slq8GK2jvTRKvoY94J0uJBD/LlZHqj52hV1Slvsxx/OioPSvnjTQv/s9ZVtqLiYhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=q5Dyh7e5; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="q5Dyh7e5"
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id DF33B428350
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jan 2025 21:40:29 +0100 (CET)
Received: from [IPV6:2a02:842a:81f2:7900::fdc] (unknown [IPv6:2a02:842a:81f2:7900::fdc])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2409519F833;
	Tue, 14 Jan 2025 21:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1736887222;
	bh=+yOsSTv/DcIdCbpMRAzf8agSE4E6yeDqZzxwOohlLlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q5Dyh7e5KMXw444icum1oizehboqj3lUqzRnv3xLhsHI5UeGCk4TvaNMjHa4lvA2I
	 oK152XW0VZkG2EKKNmWkO3q7pKqWmb/tmmuhGWKhpgK+395Um0P1F8w6ux1cCx79mC
	 /4XW7oH9DvRkluVrvbo6B4WlW81rPTluLO3Uf3Uyu/HIgSla/1Ot3vqZFCV/ur9sF/
	 HrXwp65GHfpP2KtGGfzkDZ4CB+4n4Hratl9kwhfza7w1ob7vQjzn5WP5kjsfGN5V0q
	 oM0rBUDjIP7l/Xt03ai8u6dPWnDz4/Uz6WzK6EcelxcVLjlfZVikgAMULbl/UURxgd
	 HtJBrV7V/ORXg==
Message-ID: <56832678-58a6-45f2-a462-a6275b5d8dc1@free.fr>
Date: Tue, 14 Jan 2025 21:40:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <24b54c4c-6c4d-47a6-bc6f-1be8922bbf69@free.fr>
 <5dd4d3f4-a643-49fb-cf03-c68fb1bdd8e9@linux.intel.com>
Content-Language: fr, en-US
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <5dd4d3f4-a643-49fb-cf03-c68fb1bdd8e9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the fast answer,

On 1/14/25 5:20 PM, Ilpo Järvinen wrote:
>> Changes since v1:
>> - More clear description of 0xFF special effect when setting power limits
>> - Added structs for clearer naming of power limits and GPU power modes settings
>> - Retrieve and keep current GPU slowdown temp threshold (instead of hard coded)
>> - Removed platform_profile_victus_s_get(), re-using platform_profile_omen_get()
>> - Changed char variable types to u8 where it was more relevant
>> - Moved some comments
>> - Minor typo / alignment corrections
> 
> I wrote a few comments to the v1 thread as the relevant discussion was 
> there but they'll be relevant to a few places in this v2.

>> +static int hp_wmi_get_fan_count_userdefine_trigger(void)
>> +{
>> +	u8 fan_data[4] = { 0 };
> 
> {} is enough to initialize the entire array.

>> +static int hp_wmi_get_fan_speed_victus_s(int fan)
>> +{
>> +	u8 fan_data[128] = { 0 };
> 
> Ditto.

Understood, I just applied that.

While discussing these array initialisations to zero: I'm addressing what we finished discussing in the v1 thread by defining and using the following self explanatory named literals (instead of comments):

#define HP_FAN_SPEED_AUTOMATIC	 0x00
#define HP_POWER_LIMIT_DEFAULT	 0x00
#define HP_POWER_LIMIT_NO_CHANGE 0xFF

In this particular case, while technically the {} would work, I suppose it would still be preferable to change from:
u8 fan_speed[2] = { 0 }; /* Restores automatic speed */
to:
u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC }

>> +static int hp_wmi_fan_speed_max_reset(void)
>> +{
>> +	int ret = hp_wmi_fan_speed_max_set(0);
>> +
>> +	if (ret)
> 
> To keep the call and its error handling together, please use this form:
> 
> 	int ret;
> 
> 	ret = hp_wmi_fan_speed_max_set(0);
> 	if (ret)

Understood, and applied.

Before sending the resulting v3, would you like me to apply this form change, alongside with { 0 } becoming {}, to some others already existing functions around? I prefer asking before doing so, because by default I'm not sure changing unrelated already existing lines is expected when sending a patch.
If not, I suppose this may be the matter of another future and unrelated patch submission.

Thanks again for the review work.

Best regards,
Julien ROBIN
