Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3931985C;
	Wed,  1 Jul 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928456; cv=none; b=kHu1e/m6+5Ka3P5c8YntHNCvLOrFLXWylnCluGAQ1+4vFLq/uAvNDRk5iUPbrHur+LEjYx9RRKnwUcpFyOrA15Ri/APWcbWikzNllXXo/wGGpe6YX/TCPss5NuV/0m+S1iUsXnLB2SxdpjK3ZKw3uKYXAd5/hPQjPguQlAl5TNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928456; c=relaxed/simple;
	bh=xKe1w7OWTnq1XecxgyBRgXAmvtwfkiVvlwBx8fNJdNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iyui9ZeEXEVsF095k//M7ZVW8m7Sm+5+XsEC/+3I0Jx5P/muJkQvfliCxW/5vn9vpS0sRxTbGE+e/DS51T8MBRQ41ENjuNTa37LLqhzlzHZORWenswnv9L04QryMbNzWPfs1z55fLzwr6UXpOP0KEYBMNAqCCUfoB4ECJVIx2Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=plx8o73t; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="plx8o73t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782928437; x=1783533237; i=markus.elfring@web.de;
	bh=HBU3DCQGHr9qUv5TGJ5Az2TYAlwduBZOTEEWInaEjRc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=plx8o73tEvdHYGolW1PNs+fo9/PW36IXDHqxlI1+H4p3E4zjaLfieRc7VQjytH2g
	 bRqxarrEPfX7tx42unSSlouBRKcDXki3iUpFInI3OO0I1167F27U2GuosaBlVAfoB
	 HeJxLxT7NFvEwu/ej0b0/DRJUnBunmcOQehTj43wRVq5GUVXh5USCE8Yo+9rL9DA0
	 qHFrS8gGOKyMgLYDKK39pRYP3Wtd/yoQ272dWrN0O3svbZvlxochkavBBbuULaLj9
	 Ris18X8SiVK5tyqalBaztMMw2TR8bL1PwINiLSc9ElbcSfpdi+I/GKz+sfcTOYGSq
	 XGmPIAcwsmora5kTOA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhFhe-1xJFtW3SHS-00nrMv; Wed, 01
 Jul 2026 19:53:56 +0200
Message-ID: <b81acc89-c91f-46d9-b6de-5367b6cf94f4@web.de>
Date: Wed, 1 Jul 2026 19:53:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Use more common code in
 hp_init_bios_package_attribute()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Jorge Lopez <jorge.lopez2@hp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <0b2257be-a509-4c86-94ec-3f23847c9626@web.de>
 <1b9c1471-bfc1-4b0c-c303-ed08c5fba4b3@linux.intel.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <1b9c1471-bfc1-4b0c-c303-ed08c5fba4b3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Da0PImU+kqKKl043/YZMSZKQOJyTnLiU6C7wmYA52pUKcjo2AEO
 blZysMtLb6hZjbm8TtmjMY6rSbfvJZuW7iBOs/4xh01UxZBAa08g1MhGYZYGGZrj94sNYzL
 97ZP3zisk0vLfIvPHV8Qraf/8+/5DyOvHb0Jluber6k7msv3ytruj338gFAqVh9TN4YYCML
 C+xEwiKTcmeYvxpXMlo4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cWONajHLNto=;E4SidsS5cEw0WOsxC1e6ELTfIJo
 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

>> Use an existing label once more so that a bit of common code can be bet=
ter
>> reused at the end of this function implementation.
>>
>> This issue was detected by using the Coccinelle software.
>=20
> This patch leaves me quite unimpressed of Coccinelle's abilities.

The intention of this development tool is not to impress you with a possib=
le
source code transformation.


=E2=80=A6
>> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>> @@ -692,8 +692,7 @@ static int hp_init_bios_package_attribute(enum hp_w=
mi_data_type attr_type,
>>  	if (ret) {
>>  		pr_debug("Failed to populate integer package data. Error [0%0x]\n",
>>  			 ret);
>> -		kfree(str_value);
>> -		return ret;
>> +		goto pack_attr_exit;

Another source code search approach pointed implementation details out
for further development considerations.


> If a call fails, it's expected to handle cleanup itself --- which is=20
> exactly what hp_convert_hexstr_to_str() appears to be doing (by not=20
> writing into *str until it's committed to returning 0). So why is=20
> this kfree() necessary in the first place?!?
Would any contributors like to adjust background information accordingly?

Regards,
Markus
