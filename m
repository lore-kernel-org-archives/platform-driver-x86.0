Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF53A9D8F;
	Thu, 12 Mar 2026 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343096; cv=none; b=JljTBZr58L6/dbIkuFPClbxxfgQ+/I8NdfBop6Mxjy2N4rhillbO0PYxMqRYljbHUDA8r//w6gsX2MfYAwH7V3vPinA3WQ2ekG3lYEcUJ/XXcpTDm+24Uz3alqlE+alTjPiE3CLKDjnTF38t9aK47H6QkDmQYFdOL45NAojh944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343096; c=relaxed/simple;
	bh=4xoksxvNwzcqsd7pTKjnOVXyjQLNKigZ8L1boOx+ROE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ew5F45Jk6G+lrpRigOKPx/OYtBk1S79dqLG59/FHJV9Aav6blIsHLlsMrveZHhdgmNbY8AiM9V59aX5XABAnFBQIzmEnp3o8S3+Mm+tspL3W73Bz3nuOYQ/hry08ikOVT60IU32EisjAfOsgQSSSy3Osh7euZdKaLoNZntEP/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=uqWBTKcV; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="uqWBTKcV"
Received: from [192.168.178.24] (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 70E852FC004D;
	Thu, 12 Mar 2026 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773343090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmUeKXLZVIJERJ+3m5aFZr4fnjIqILcMoitvWxz+1NU=;
	b=uqWBTKcVhgNGAIFlkAU/E4u+jZnJ8pVj76KNtlG8uTe0QVZlM3KSx/WBYPl6/cUUZHLXX+
	IJDIlud+zFHJUg6Ii5Tur4zYug4TQXfs/uK3sNJQAsZrCwoSv7S3sntStzbAq/PLyjDHNb
	6/CSidFcC/QSMUSc6dbTIDzPS+yGNx8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <8ec1978f-986d-4a13-9af4-71afdb4b9a29@tuxedocomputers.com>
Date: Thu, 12 Mar 2026 20:18:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 W_Armin@gmx.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-6-wse@tuxedocomputers.com>
 <363b80db-9bf3-44d5-a756-e64d29bd36ec@infradead.org>
 <5bb7a2ae-9754-4375-a1f5-ef23916e26dc@tuxedocomputers.com>
 <878qbxozd4.fsf@trenco.lwn.net>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <878qbxozd4.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 12.03.26 um 16:12 schrieb Jonathan Corbet:
> Werner Sembach <wse@tuxedocomputers.com> writes:
>
>> Hi Randy,
>>
>> Am 11.03.26 um 05:57 schrieb Randy Dunlap:
>>> Hi Werner,
>>>
>>> On 3/10/26 4:34 PM, Werner Sembach wrote:
>>>> Adds short description for two new sysfs entries, ctgp_offset and
>>>> usb_c_power_priority, to the documentation of uniwill laptops.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>>> ---
>>>>    .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>>>>    .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>>>>    2 files changed, 37 insertions(+)
>>>>
>>> Can you give me a lore.kernel.org URL or a message-ID in which
>>> I replied with a "Reviewed-by:" tag for this patch, please?
>>> I don't recall doing so, but I could have.
>> Thought you did go through it because you gave the spelling corrections,
>>
>> Sorry I can ofc remove it again.
> As described in Documentation/process/submitting-patches.rst, a tag like
> Reviewed-by must be explicitly offered by the named person; you can't
> make them up yourself.  That's something you need to be careful about.
Sorry, will remove it again
>
> Thanks,
>
> jon
