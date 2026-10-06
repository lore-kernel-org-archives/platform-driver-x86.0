Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C24122425B;
	Tue,  6 Oct 2026 07:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272508; cv=none; b=K7F+9FQSdT+ta/cgHSkgJfSiYo4XQAtSJ2ExcfYsbFMx8ELsoX0iivXkuZTfAcgo5D297eU2IwGFXURCpvIaTDIerK/rNfjh0e2rVIMJ0aE/Kvog7FdOznF3kPyH6fdbRashvQ4j6Vk7lvDLUkpbJxznAqETrLF+wPixNr5x8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272508; c=relaxed/simple;
	bh=YEdXLMNewdPNguOayzhbEP4Bdrk41CYn4l4TF727ReU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QW3C/FyZ1fuvatguBqLE1BqkVkRaSLQd6LRZ9UmNSp9hz1FhT1+D+JMNhw+WhReuu9RusmRgVWRVVmA37rsvoSz1fYkvbi9pvmMpow00CZNCI5Cps5ZGxhFvtD3gbuhlqifFN0oh1WPNczItNzmgwqzfc/uQEOZc04T9HLujnxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=lG3jQkb7; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="lG3jQkb7"
Received: from [10.224.208.2] (dynamic-176-002-031-164.176.2.pool.telefonica.de [176.2.31.164])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 403152FC004D;
	Tue,  6 Oct 2026 09:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1791272496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDg68+TWSnbGkiXkjkvG+shcZWHw/a0FgpsyB3SZqV4=;
	b=lG3jQkb7unCGmbQmiJnEXI1eMrE2P8X4+gppItpKfUHWqbNF3VauSB47n50vrGq37kErVC
	ZI6CgD738vtL03/aPmEQbuWodPUiXy1EW9f4lUi024r9dgOp/6mjrbGS8rrgyzMMMsGsB8
	CIi28FwQcP2W40oQ0AOzZXJgFDUqW6o=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
Message-ID: <c76f4274-bcf6-4a56-908d-10e08405f5ea@tuxedocomputers.com>
Date: Tue, 6 Oct 2026 09:41:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] platform/x86/tuxedo: Fix keyboard LED map ordering
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260928085448.9024-1-aer@tuxedocomputers.com>
 <20260928085448.9024-5-aer@tuxedocomputers.com>
 <c6592aba-a3af-f012-361f-52e29b070459@linux.intel.com>
Content-Language: en-US
From: Aaron Erhardt <aer@tuxedocomputers.com>
In-Reply-To: <c6592aba-a3af-f012-361f-52e29b070459@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 05.10.26 um 16:06 schrieb Ilpo Järvinen:
> On Mon, 28 Sep 2026, Aaron Erhardt wrote:
> 
>> The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
>> flipped line that caused LEDs to turn on in the wrong order when
>> counting up the Lamp ID.
>>
>> Fixes: cfd84b3f419b
> 
> Please see Documentation/process/submitting-patches.rst how to format 
> the Fixes tag properly.
> 
> You seem to also have not carried over Werner's Reviewed-by tags to a new 
> version. Whenever you're submitting a new version of the series, collect 
> the tags given to the previous version. (Only if you've done very major
> changes to the patches, it may be warranted to not include tags given 
> earlier.)
> 
> Generally, maintainer tools will only pick tags for the current version of 
> the series (err'ing to the side of caution) which is why submitters are 
> expected to do that when a new version gets posted.
> 

I read that exact document, but only the lower section about when and not how.
Sorry for that. I'll fix both problems in the next series.

>> Cc: stable@vger.kernel.org
>> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
>> ---
>>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>> index 8f1ffca0430d..2b985b030197 100644
>> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>> @@ -232,8 +232,8 @@ static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] = {
>>  	{ 0x2e, { 246000,  67500, 5250 } },
>>  	{ 0x2a, { 269500,  67500, 5250 } },
>>  	{ 0x53, { 294500,  67500, 5250 } },
>> -	{ 0x55, { 311200,  67500, 5250 } },
>> -	{ 0x54, { 327900,  67500, 5250 } },
>> +	{ 0x54, { 311200,  67500, 5250 } },
>> +	{ 0x55, { 327900,  67500, 5250 } },
>>  	{ 0x56, { 344600,  67500, 5250 } },
>>  	{ 0x2b, {  31000,  85500, 5500 } },
>>  	{ 0x14, {  51500,  85500, 5500 } },
>> @@ -337,8 +337,8 @@ static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] = {
>>  	{ 0x2e, { 246000,  67500, 5250 } },
>>  	{ 0x2a, { 269500,  67500, 5250 } },
>>  	{ 0x53, { 294500,  67500, 5250 } },
>> -	{ 0x55, { 311200,  67500, 5250 } },
>> -	{ 0x54, { 327900,  67500, 5250 } },
>> +	{ 0x54, { 311200,  67500, 5250 } },
>> +	{ 0x55, { 327900,  67500, 5250 } },
>>  	{ 0x56, { 344600,  67500, 5250 } },
>>  	{ 0x2b, {  31000,  85500, 5500 } },
>>  	{ 0x14, {  51500,  85500, 5500 } },
>>
> 

