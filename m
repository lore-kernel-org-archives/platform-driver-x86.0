Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A05B33343B;
	Thu,  9 Jul 2026 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606003; cv=none; b=XqOlbBciDlmxg0Dh2zgvSTNWnTqbVZpJsvHIitb/V5JCekxdVWqKZ3IyV6z7dzDzx1rZgwleRR84weKj+Et/5r081A5y4TCWKVtBVoLsBrmyWjeyMtiTHOTdIW8vgaeyJ1mdCyFVQErgBFygMiYMOVi0CdLELQqdfPypJYw2H1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606003; c=relaxed/simple;
	bh=DXmabW2L0/aV7QKEFzX14XjAQz1RqTlgTWal3TGTe2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQy1g1NcxrxVhDvs8cD7ugGAy0qJuEYC8X5S3/PJU2kPqd+yKef8YK3C4EWK/vgPMrYeog65p5QJBafkDhmNDTOdFSVsXmryMdf1SzbS2A7gqljUIi+You+fss7P7YV3b/hAL3leQ/cSFtEf28uUNfVv/+10cKw50tg/R1yiwlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=PNpQATKk; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="PNpQATKk"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AC0572FC005F;
	Thu,  9 Jul 2026 16:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1783605998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXmabW2L0/aV7QKEFzX14XjAQz1RqTlgTWal3TGTe2M=;
	b=PNpQATKklqfPkYO5ABrcBezzNbITN9Fu1C7KgAPb3m9rsDwUb6/YMbsT4PCRCyR4Hk/1bK
	aWqkjCBCYa9q5rfju95p/M7KyQGGnxCAqgmR512fyTj8vg5MgfxH45s7LLQVvdbR2wTNrM
	k/FRTlp+eh/L1r3kzvj6MphX/hDhYR4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e34091bd-d494-43f5-a2f3-6dd21306d408@tuxedocomputers.com>
Date: Thu, 9 Jul 2026 16:06:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] platform/x86: uniwill-laptop: Add lightbar support
 for LAPQC71A/B
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260530170813.10166-1-W_Armin@gmx.de>
 <20260530170813.10166-8-W_Armin@gmx.de>
 <df32200d-d966-40fd-b8d4-60c5b7e18822@tuxedocomputers.com>
 <d06fffe8-0cf6-3ee4-8ab6-c6a87ea4e7b9@linux.intel.com>
 <508f969d-9ba4-48d0-8e2e-ec7249392db3@tuxedocomputers.com>
 <528af158-819f-fe4f-d1ca-2617f2ad2471@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <528af158-819f-fe4f-d1ca-2617f2ad2471@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 09.07.26 um 15:45 schrieb Ilpo Järvinen:
> On Thu, 9 Jul 2026, Werner Sembach wrote:
>> Am 09.07.26 um 10:57 schrieb Ilpo Järvinen:
>>> On Wed, 8 Jul 2026, Werner Sembach wrote:
>>>
>>>> Hi Ilpo,
>>>>
>>>> Am 30.05.26 um 19:08 schrieb Armin Wolf:
>>>>> The LAPQC71A and LAPQC71B both feature a RGB lightbar with 36
>>>>> brightness levels per color component. Extend the device descriptor
>>>>> to supply the maximum brightness of the lightbar and whitelist
>>>>> both models for UNIWILL_FEATURE_LIGHTBAR.
>>>>>
>>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> This patch lost its original attribution by accident (it originally came
>>>> from
>>>> this RFC from me
>>>> https://lore.kernel.org/all/20260421201103.142403-3-wse@tuxedocomputers.com/)
>>>>
>>>> Since the patch currently is only in for-next can this still be fixed?
>>>>
>>>> Obligatory:
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Hi Werner,
>>>
>>> Your Signed-off-by has now been added into the commit.
>> can you also fix the author?
> Also the author field is now changed in the review-ilpo-next branch (it
> will eventually propagate from there to for-next).
thx
>
