Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC62D4EDCD0;
	Mon, 28 Sep 2026 16:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614485; cv=none; b=j5I+GWHg6g6+wQcB6eIvThhTjpkIeBdLayt+/gpti/j+h8wA42sp+ZvvqqQJAcXJ1JQ/7pZMRnm7UX4mBlBh1NA92DpSmwiYJe9CM1vsJicqAWGQGwt1F06da4LPTsFJGqDzVMGNhQhpbss4FFB0KroeVE2cWc0T52v8gpsRAoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614485; c=relaxed/simple;
	bh=kwE5BTqbQfUC1aI4j+6GG3WjvrqSOeYGdk9+rYfo89I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhwfgnUP5Xp6AAJxwxluwUvfKlX38B/y6tMvkihHSQruHnLA7wXV36Mzr7Bj/6JnGaHj6cDWlqyT/NkqhcW6jbEsct4bA7Hqv0cET827jS85RptZkb7WDz2WkpsQAzqRpIPUtbYXNK5j/Lu8RmaMr4BJyctLraUUG85TogSBd3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEMr713E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEMr713E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E191F00893;
	Mon, 28 Sep 2026 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790614484;
	bh=meW0LskSNOsMEVlNBOvIblTgypM9uezYHjIkR0ZT0bY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GEMr713EIQ1m7UgHdFlrlZ3P27xkYP+oBUjnnpxIp/10yByH8zi0vtFHT/y+Wpslw
	 +1O5TZxunlRtMqmyE4BFMmMEixjDfYYrZDs7meQyW6Anzp92vCZhWhHbLiAqg+DDNR
	 9Ud+Ay4/mnUobbKiI2R47mO92gYR3uqQ1FH9k1B/h83mY24iXNUdN3C9+pqse42P7S
	 +xlb+TDt49DkiTmEh2gJgy8D7kYOMST/+SXPB4qerjxSUvm/r4mHLuxI2KtTFIYRhX
	 AXzGjYpy/U9GtGuDlZmQQp7+LniHyI66sEyaE0aZQu7Wh9c6kpXkON0DrbZLRWY18z
	 XP08ip9SJBsOg==
Message-ID: <0c8bb28c-0814-4446-b8fb-2f07e9174cc2@kernel.org>
Date: Mon, 28 Sep 2026 11:54:41 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to
 quirk_s2idle_bug
Content-Language: en-US
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Bruno BOI <bruno.boi@bobtopus.eu>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
 <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
 <c22fe14e-41c3-425e-9f8e-39b900ab6e3b@app.fastmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <c22fe14e-41c3-425e-9f8e-39b900ab6e3b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/28/26 11:53, Mark Pearson wrote:
> On Mon, Sep 28, 2026, at 12:09 PM, Mario Limonciello wrote:
>> On 9/28/26 11:06, Bruno BOI wrote:
>>> The Thinkpad L14 Gen3 with DMI product name 21C5 is affected by the same
>>> s2idle resume stall as the already listed 21C6 variant: resuming from
>>> s2idle blocks for several seconds before the kernel resumes.
>>>
>>> DMI_MATCH() performs substring matching, so a "21C5" entry also covers
>>> SKUs such as 21C5S05800. Add the 21C5 model to the existing
>>> quirk_s2idle_bug table.
>>>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222070
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221273
>>> Signed-off-by: Bruno BOI <bruno.boi@bobtopus.eu>
>>> ---
>>> Changes in v2: resent with the correct sender address; the patch
>>> content is unchanged from v1.
>>>    drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>
>> Mark,
>>
>> Since it uses prefixes rather than a new entry how would you feel about:
>>
>> DMI_MATCH(DMI_PRODUCT_NAME, "21C"),
>>
>> On the 21C6 existing entry.
> 
> The last char covers a lot of platforms unfortunately
> 
> Ignoring the Intel platforms (I assume this driver wouldn't try and load on those - there are a bunch including a Chromebook if that makes any difference)
> 
> T14s Gen 3 AMD, X13 Gen 3 AMD, L14 Gen 3 AMD, L15 Gen 3 AMD, T14 Gen 3 AMD, T16 G1 AMD, P16s Gen 1 AMD, K14 AMD would all be impacted.
> 
> I probably have a bunch of these to be able to test - but not all (and definitely not the K14).
> 
> Adding 21C5 and 21C6 should cover all L14 G3 AMD models.
> 
> Mark

Got it; thanks for confirming.  No concerns by me with the new quirk 
then either.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
