Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1053CB8E3;
	Tue, 15 Sep 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480546; cv=none; b=OQvWeokNoYLcBCRAibPg3Ql1/d9588jUNE6n05EzNoO1iGHz8ssyc/j08Ze9Qb5h1z6rCV2fFtNWQbTv5jTKhuLsbuNgKu4hhtIEG21eDTKqMB9oJM4w8mwFvoh3t1EAFbCStI1Tyr7fJS030b41X/y99s2iQcwsJbm79rAYLKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480546; c=relaxed/simple;
	bh=WNjViM+h4Yjb05co8BN51KkhuEXKCf0VDZ5cgR2KTLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McYa39zM4XJAt70vWtpISumHzttsV2kb92xlPmUrnNUlVTeHjt+e04mMQch0PD2H9ZxBbYKXXNsgGtG1//bFgsqAbJlQQSHLSojXoP3z94CGjDlgnLa0G2OIUvPMrguesdU+Wzvfi3BWb0n8JtIbxKWDeekmq+jhH11fG0HkFHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ckdDVE2U; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ckdDVE2U"
Received: from [10.235.78.2] (dynamic-176-002-017-114.176.2.pool.telefonica.de [176.2.17.114])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 2462F2FC0059;
	Tue, 15 Sep 2026 15:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1789480534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BxgHciIHTWF6tDsjrRmTmhq33hv3anNepGSe7Xyg94M=;
	b=ckdDVE2Ut/DlX/Y3DgRoGkmrxOXXUmaE/1JUk0rInJiyPOLWs3QYLWk2AyOX8DtvWPuEli
	1Zfz3tXTH1AhOhqJJpQo2GSTJ3Z8vDn+uZh8Tfj7CamxS6tiwWISmyRWZZjBFjcQczuv0N
	CV5aL921TmQc8qW6HFVSgdNIfT5olM0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
Message-ID: <dfa01359-e2b3-4e02-85d2-220e48b85594@tuxedocomputers.com>
Date: Tue, 15 Sep 2026 15:55:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] platform/x86/tuxedo: Fix keyboard LED map ordering
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: wse@tuxedocomputers.com, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
 <20260826081149.235487-5-aer@tuxedocomputers.com>
 <35453b67-df97-a5a6-99a1-9746500796e9@linux.intel.com>
Content-Language: en-US
From: Aaron Erhardt <aer@tuxedocomputers.com>
In-Reply-To: <35453b67-df97-a5a6-99a1-9746500796e9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 15.09.26 um 15:00 schrieb Ilpo Järvinen:
> On Wed, 26 Aug 2026, Aaron Erhardt wrote:
> 
>> The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
>> flipped line that caused LEDs to turn on in the wrong order when
>> counting up the Lamp ID.
>>
>> Cc: stable@vger.kernel.org
> 
> And the Fixes tag?

I assume this is mainly for the stable maintainers to be able to track down
when the bug was introduced, right? I thought "Fixes:" would only be used for
regression bugs.

The only commit relevant to this is the one that introduced the driver itself:
cfd84b3f419bf0aec60ecddc92c61b539c339ec9

I correct this in the next series.

> 
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

