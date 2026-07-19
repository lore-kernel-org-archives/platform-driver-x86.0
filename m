Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253711CBA;
	Sun, 19 Jul 2026 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784479570; cv=none; b=p7EU0bnSmgNFpqQSeaxir6KIzhNAuXLmkE6yVWZVz1DGvyQw2mSXRR22xep0CZ34Dv80HpG4x13n3qFaGdT/DML0UMdeOkNpn+6w0li3bLW2LeGWacaJ47pimQVgMWDhKGyrlz1yaH/aPG5ohLNAdIUvuRyXLwim67P4crjqxFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784479570; c=relaxed/simple;
	bh=0GrleKdYkLCOtZlvJdViPijgv9WfYFrhmgtw8u/42Nc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SftlR6tvOT1xzel/JzoU/WhFviGUJk+pWkabY8E7qNCmNueoDJHMoexqCYPxryvpE2E9aIPmV/7S7qJChwf9vgyTgiMcN5aNTeSYKcrHzdwQE7NSjYvIxZP02FC7ghJT+2roo+vPkfKZsPeglcT4wj/kQRufpWVcAML7FPVVF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=r82y9hIe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="r82y9hIe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 968A140430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784479567; bh=6UrEboEtHbQuciKeEEnaNVeWtSLgxWDqlD/f/4AmGRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r82y9hIeIZ+khgTP7H3fSmrKjHc8MGhjSnE6CAbm/8inY24jseX1/hqgyMPliFL6P
	 Ne/Zwtrpr8huUmVEt9zlPdhOEQJHiFhykBsp4QTXw8A3VHZW9bFXIINANnzzL3j2hu
	 1wdpCVzy6mE9Lv/79YkOXtzpAzXHi6laYkfZNJkE70KYMjHiVNtPsAE4ijYOpEDXpI
	 6eeJVdqAjogkLcrNDGMg3TIzcRfkBf02ZqS5MqFtOSZ3P04N8FrpGD7uo6h67Y2P/J
	 hc0X0nkNn8voXQ0MuOzf7PCCJuc3u5uyd6e7WJ4/GtlKn3VyPRXSlGRR+DobSC/Snr
	 cypwU9EiHM4Ig==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 968A140430;
	Sun, 19 Jul 2026 16:46:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Yahya Toubali
 <yahya@yahyatoubali.me>, Shuah Khan <skhan@linuxfoundation.org>, "Derek J
 . Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
Cc: Weijie Yuan <wy@wyuan.org>
Subject: Re: [PATCH v3] Documentation: fix spelling typos
In-Reply-To: <b078b8d4-a15d-410b-ae74-39d09d39762d@app.fastmail.com>
References: <alukuB0r73qfc1PG@wyuan.org>
 <20260718165616.1923610-1-yahya@yahyatoubali.me>
 <b078b8d4-a15d-410b-ae74-39d09d39762d@app.fastmail.com>
Date: Sun, 19 Jul 2026 10:46:06 -0600
Message-ID: <87v7ab3p2p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mark Pearson" <mpearson-lenovo@squebb.ca> writes:

> On Sat, Jul 18, 2026, at 12:56 PM, Yahya Toubali wrote:
>> Fix 'Minumum' -> 'Minimum' in lenovo-wmi-other.rst and
>> 'maintainance' -> 'maintenance' in housekeeping.rst.
>> These were flagged by checkpatch.
>>
>> Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
>> ---
>>  Documentation/core-api/housekeeping.rst        | 2 +-
>>  Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/core-api/housekeeping.rst 
>> b/Documentation/core-api/housekeeping.rst
>> index ccb0a88b9cb3..71ba5d86f249 100644
>> --- a/Documentation/core-api/housekeeping.rst
>> +++ b/Documentation/core-api/housekeeping.rst
>> @@ -9,7 +9,7 @@ extreme workloads can't stand, such as in some DPDK 
>> usecases.
>> 
>>  The kernel work moved away by CPU isolation is commonly described as
>>  "housekeeping" because it includes ground work that performs cleanups,
>> -statistics maintainance and actions relying on them, memory release,
>> +statistics maintenance and actions relying on them, memory release,
>>  various deferrals etc...
>> 
>>  Sometimes housekeeping is just some unbound work (unbound workqueues,
>> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst 
>> b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> index 011054d64eac..65cb78ef285a 100644
>> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
>> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> @@ -163,5 +163,5 @@ data using the `bmfdec 
>> <https://github.com/pali/bmfdec>`_ utility:
>>      [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
>>      [WmiDataId(2), read, Description("Fan ID."), 
>> WmiSizeIs("NumOfFans")] uint32 FanId[];
>>      [WmiDataId(3), read, Description("Maximum Fan Speed."), 
>> WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
>> -    [WmiDataId(4), read, Description("Minumum Fan Speed."), 
>> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>> +    [WmiDataId(4), read, Description("Minimum Fan Speed."), 
>> WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
>>    };
>
> The minumum fix has been proposed a few times already. It's a miss-spell that comes from the BIOS, so is deliberately wrong.
>
> That being said - I vote we correct it so that we stop getting patches that want to fix it.
> In the interests of not seeing it again:

Instead, why not add a line to the file saying that the BIOS actually
behaves that way?

Thanks,

jon
