Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F6315793;
	Fri, 26 Dec 2025 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766751615; cv=none; b=NFO93EU7a4u+WOfIK7vg497brmm8GUvkyNf9fyQxWu8TkqC9lfL2yjs7eTtMN8DXlpYgvZ765hy82a7GVaYQq5A71ecPjy5J0W1MwVPMkY3IKIn0iG8AIMts9sVrkCQP4KL1AD72LgHbsyW34OaKOtVh2Te+4DiCJ39KYls3mHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766751615; c=relaxed/simple;
	bh=NYi18U5/AdfXUxPPSrITX6ZXDFCwhtA7lGKv4GH8nQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNm7kyHyN2KNFsLqccR73scyBb53HYizhvOT3eCY5GFBvd8pTScV2mnW/WJlIMc9hu5UHvSo3TlLxaXYHnRPveoe/SwtdiWvUv5+AqRkeHsPo9h0q/N+Vj0Wzlp358kmhVdjBAaj+PHAhPe2AIwg7nD1EpdYQLiXouFbFK6bXoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqB6FsZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqB6FsZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F485C4CEF7;
	Fri, 26 Dec 2025 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766751615;
	bh=NYi18U5/AdfXUxPPSrITX6ZXDFCwhtA7lGKv4GH8nQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iqB6FsZXsg4bDGw5jDO/njDm1jHsox63FUtt7RiP6yPVLFw2nv+YJaMjdgJEXTniv
	 zy4u+5/K8Qx21p9drprj9qWY4S3q/4GbxYYb2AXuld5MWegNy1xaiJNtPGT6S960K3
	 aRBxUN/Yciiu6f3DcehFqS4WY9M+a0URwMUwk/R4GJvcwhACHEz6vgFZxlMVlua+KX
	 X2xh88rBpBUGxSdH5twpIJP1z++GuE2LkXNeBIgWs7IqwmpRL++OkfWjjcdGO1DKNQ
	 8VUyQGRrbktVq9preTxb61K4HE3NnOOgjE9bI06NlPDMLLAky+36xsdOnEGXMPAc26
	 GQEK7DTd8g5Cg==
Message-ID: <158ff4a5-027e-4b0f-8dff-f3227cfddc2e@kernel.org>
Date: Fri, 26 Dec 2025 13:20:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: asus-armoury: add keyboard control
 firmware attributes
To: Denis Benato <benato.denis96@gmail.com>,
 Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>
References: <20251225143007.2684239-1-denis.benato@linux.dev>
 <20251225143007.2684239-4-denis.benato@linux.dev>
 <3b2d6500-0f54-42bc-bc9d-3bbe0fbef5c8@kernel.org>
 <1aada2dd-c689-4e29-a47e-ab5c82f21b89@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1aada2dd-c689-4e29-a47e-ab5c82f21b89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/12/2025 12:46, Denis Benato wrote:
> 
> On 12/26/25 12:06, Krzysztof Kozlowski wrote:
>> On 25/12/2025 15:30, Denis Benato wrote:
>>> +ASUS_ATTR_GROUP_BOOL(kbd_leds_shutdown, "kbd_leds_shutdown",
>>> +		     "Keyboard backlight while system is shutdown");
>>> +
>>>  static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>>>  						struct kobj_attribute *attr,
>>>  						const char *buf, size_t count)
>>> @@ -867,6 +1043,35 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
>>>  	return limit_value > 0;
>>>  }
>>>  
>>> +static struct asus_armoury_kbd_status *asus_init_kbd_state(void)
>>> +{
>>> +	int err;
>>> +	u32 kbd_status;
>>> +	struct asus_armoury_kbd_status *kbd_state __free(kfree) = NULL;
>> This is an undesired syntax explicitly documented as one to avoid. You
>> need here proper assignment, not NULL. Please don't use cleanup.h if you
>> do not intend to follow it because it does not make the code simpler.
> Hello and thank you for your feedback!
> 
> I have used __free here to match a previous comment from Ilpo:
> https://lore.kernel.org/all/25bd0c90-2de0-ef66-c18d-661180b71fd4@linux.intel.com/
> and I figured that since this is the same exact pattern as that it would have made
> sense to use it.
> 
> May I ask you to elaborate further please? If there is a more effective way to take
> advantage of cleanup.h I will very much consider it.

Just read the doc before using it. It is very, very clear what is the
recommended syntax,


Best regards,
Krzysztof
