Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD3223ABA1
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758046608; cv=none; b=b8ZzokeMyq7XCJpbROE5ejimL5TXmwLko5Yt0yIJYZXyBVVXb3wcJbVCAHFDPn8IskxFun21tghJ77FYnpxpiZs0oyqYnrHVcLulyfXyfovGgKGlpf0B6evqQDxhCk+ccad4WtnizR17XR1oUeiHyVONRPL4FARd2AlwxZW8cbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758046608; c=relaxed/simple;
	bh=KgDXxyN4h8+xT7k6U8+wBHVRrBybTUzvB4TmmhMu6Qk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FQIVOhE8BJjGbuPOM+FiHjXZtw+r+AAI6S0+i7qbZBJe/oh+D28+GbSgkCuXI390W+J9ZYlaF5bSDoqrNI6KMuEA61N2B4Qag2VFUZrmrGvK9u5LvCr6ZPkHJey5ZMjSdXKeRkV95sO/yy/dmIOBCdSB9M/NLDr2idOXHHMBD8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca; spf=pass smtp.mailfrom=lyndeno.ca; dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b=j+jr7g+f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KEmSvmc6; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lyndeno.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b="j+jr7g+f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KEmSvmc6"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 400547A02E4;
	Tue, 16 Sep 2025 14:16:44 -0400 (EDT)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-06.internal (MEProxy); Tue, 16 Sep 2025 14:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lyndeno.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758046604;
	 x=1758133004; bh=omFMLs1ejXBF9QYuFtsOAYIhRH95dqCxoJApSLtLKLw=; b=
	j+jr7g+fB4D4Y1Om7NI4P05vqEHDB7KQP/Au5ACyXX3PEf7oQC/dfMLc3CfwOgtH
	UjVb44Pk/bxrWcC9dg4KHA23ZDET8ALl3prDU2Uw+u0xGkKhCEQGmBKCZcgFKF9t
	yJqHZIVim9/AytRg/b6dSf5Ky2ZEEfAnT2CB/4zkFqAih+x8O41TqIve6aXQxlHm
	NBeDKsEXwzf5nlnyRJf+1osMVAiPUddmuAOUtxZfETkjq0hXegUeyN8Gqe3GMUFh
	CbOmWfgSZYK0WTu+wHZd8Ya/rr4ZUCqsTVcIeSzoe5dEgGxiJ8yExNXqXa91mp8J
	Y3luLrOW02VREgn0wTQUGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758046604; x=
	1758133004; bh=omFMLs1ejXBF9QYuFtsOAYIhRH95dqCxoJApSLtLKLw=; b=K
	EmSvmc6xbtDuhnPJbcM13xLmp4KqPZCf1lB8UYlSMTVNGeMv+57DeKD6PSrrYP64
	l3bhkp/T23ykb842ZA2QGBjmhnqXu21C8Jip6TdXNTOadAZAJcXxkg8CJK3hduok
	BjZ4ZvXZ3qXenW6ll8VdirZ6EnEKQWPRXmjF8LaT6gZuig0h2quqBsDI3IewfzbR
	oxmZhi1k/tZ269wxSxXvSMfd/J4sXvG8FypfY7Q4d+ozvsrV2oJMekdImoB0OVtK
	fDXmBv5BZtrMoa3q2UVAMpttd4drZZpFEQTVh/13KfLWuaEIT/VnWyCt1JQFdlW6
	aHGqSyWgZZLc1uWeYATEg==
X-ME-Sender: <xms:i6nJaNbtp55ndV6PB8FxBMQHUR23c1VZyaddXqqMoiTRYTSjifDnzA>
    <xme:i6nJaEakbIpDlVDdG2menAdAXucK2v66agVJ34lLFNAUaG9JgUReCGGJdVnpQ5y1u
    kkK3b1Cgf79o5DtmSk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnhihnugho
    nhcuufgrnhgthhgvfdcuoehlshgrnhgthhgvsehlhihnuggvnhhordgtrgeqnecuggftrf
    grthhtvghrnhepudeftdeuffefkedujeehheduvdevvdfhteeuueffvddtvedtleellefh
    vdekjedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eplhhsrghntghhvgeslhihnhguvghnohdrtggrpdhnsggprhgtphhtthhopeejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehprghtihhlrdhrvgguugihsegrmhgurdgtoh
    hmpdhrtghpthhtohepshhhhigrmhdqshhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhr
    tghpthhtohephihijhhunhdrshhhvghnseguvghllhdrtghomhdprhgtphhtthhopehsuh
    hpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhn
    vghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvse
    hrvgguhhgrthdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdig
    keeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:i6nJaNzMMz0uK8aKOXAlCqO5K2BBqJWEMGPwhTk-T91d-Xf4VvyOZQ>
    <xmx:i6nJaE49xq-64rOQivxRnXxzgie5KY5CaD5PnkD3C8YM-zJqUqzS0g>
    <xmx:i6nJaE8pzah61Y_68a7WpzFxZf6BpeB6fXvqY1Ch1H7RXuvib6gK4g>
    <xmx:i6nJaJpO2Fx-6rc8euWgptlZHyYyXauT3fv33YwUvig3DZ2l9l5viA>
    <xmx:jKnJaMwqGlxzRk4F96-bRdPe1anBSOjbklyuCdDFYkvHgS-E20ALM-g4>
Feedback-ID: i1719461a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 549383020073; Tue, 16 Sep 2025 14:16:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AnC-NQ9vsPjN
Date: Tue, 16 Sep 2025 12:15:53 -0600
From: "Lyndon Sanche" <lsanche@lyndeno.ca>
To: "Mario Limonciello" <superm1@kernel.org>,
 "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 "Yijun Shen" <Yijun.Shen@dell.com>
Message-Id: <caf582a4-ae29-475e-b321-fa255b6f9379@app.fastmail.com>
In-Reply-To: <907c1952-5aea-42f3-9a13-71e2044d406e@kernel.org>
References: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
 <907c1952-5aea-42f3-9a13-71e2044d406e@kernel.org>
Subject: Re: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS after reboot
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 16, 2025, at 7:15 AM, Mario Limonciello wrote:
> On 9/16/25 6:51 AM, Shyam Sundar S K wrote:
>> After a reboot, if the user changes the thermal setting in the BIOS, the
>> BIOS applies this change. However, the current `dell-pc` driver does not
>> recognize the updated USTT value, resulting in inconsistent thermal
>> profiles between Windows and Linux.
>> 
>> To ensure alignment with Windows behavior, read the current USTT settings
>> during driver initialization and update the dell-pc USTT profile
>> accordingly whenever a change is detected.
>> 
>> Cc: Yijun Shen <Yijun.Shen@Dell.com>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>>   drivers/platform/x86/dell/dell-pc.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
>> index 48cc7511905a..becdd9aaef29 100644
>> --- a/drivers/platform/x86/dell/dell-pc.c
>> +++ b/drivers/platform/x86/dell/dell-pc.c
>> @@ -228,6 +228,8 @@ static int thermal_platform_profile_get(struct device *dev,
>>   
>>   static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
>>   {
>> +	int current_mode;
>> +
>>   	if (supported_modes & DELL_QUIET)
>>   		__set_bit(PLATFORM_PROFILE_QUIET, choices);
>>   	if (supported_modes & DELL_COOL_BOTTOM)
>> @@ -237,6 +239,13 @@ static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
>>   	if (supported_modes & DELL_PERFORMANCE)
>>   		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>>   
>> +	/* Make sure that ACPI is in sync with the profile set by USTT */
>> +	current_mode = thermal_get_mode();
>> +	if (current_mode < 0)
>> +		return current_mode;
>> +
>> +	thermal_set_mode(current_mode);
>> +
>>   	return 0;
>>   }
>>

Thank you for this patch.

Reviewed-by: Lyndon Sanche <lsanche@lyndeno.ca>
