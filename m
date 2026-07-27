Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD623BED11;
	Mon, 27 Jul 2026 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177992; cv=none; b=uURjz32l8iTkf4dnwR9NkRSHIaua0gDiDL+PPeIQTt35yBaShXolslgp9aEjgKcQ+qVGC+/41THIAx1hZZKsoyiPAG45X30Bo51IKqjTFxYZb690Zg3i55OQtzQpsWxVLcTWiKRaC6zzy44ldqyqxrzCLm3B3LYN1c8HI+TXejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177992; c=relaxed/simple;
	bh=6mjwMBVdhQbYg+Juzx46tU6f4G6e8KKJ9qDva8kq9Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYgwbjWG7JmXiLWnHjooWZbn5jJi7uSRHj68nuKJAv0/JCQI6oJVzGWTmfWVTrPlTV3WPmPQAP1jN4IpF2gPfkEw/DGlxaq0Ey3Cx1JKj5xXRqACpHXHgfnjHfelOvQR3jpjSMq+NaJmUe4oNDyrSiRKQQul9vOWDj3nbWB6h00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=L0f91nk7; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="L0f91nk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785177983; x=1785782783; i=w_armin@gmx.de;
	bh=lRxAy/lKJKXChwiyd/RfoRFCD6X62GaKZeog+oxQ/sU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L0f91nk75IWAgOTCdljupypCKp3A9xn8xzOlUI1yTg5sCaQ6OZMU2cBnKKqQNsZp
	 Idqe4XVrrGsOW1CYgsb2v9Pn6oU2ALJVL1QefVXtGldwfiLHXp2Cfweecj2iyF1hs
	 jcU0fw6I20SLbb1HF1ZXfLdL37BL2Q4UANz1ehfH2sy05KdDiWxBoQg6I7KVD7sFf
	 An8VedzpjXnySkHnepi8RtdLRtCFl7uT9kivNgwqCSB17jHryxB8Ma22H5i6j0vBL
	 cP3ERf+gP8vXMpsQGTOAZotpCHxZtTuzUIQ+rzm97kauRi2RmF/4Ls0voHVtXYXHK
	 pTXpBYG1NzRGrI4LSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1wgPys0UmL-00956y; Mon, 27
 Jul 2026 20:46:23 +0200
Message-ID: <7cdc0ae9-ca56-4f46-a30b-3188c8f294bb@gmx.de>
Date: Mon, 27 Jul 2026 20:46:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] platform/x86: dell-smbios-wmi: Fixes and cleanups
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com, shuangpeng.kernel@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, arnd@arndb.de
References: <20260720131921.368000-1-W_Armin@gmx.de>
 <178515395903.10740.5236572602807746273.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178515395903.10740.5236572602807746273.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JAXooNRpKTrT4euGu3HEt6UmwDVd9CaZI3ZHhWBC4bOxZgnvDI5
 EmJ0jYH9U+D4zrXjrfjYvqg1AcVthjlic1VxzQ8KRUd3xsPRzo2ccjpErwB6tkaN9LZoWV3
 zQDCnsJ1Bm0ZjhEj2RmHjo28I7vvkE5tFwXe3nej1e6q4ZDiLgrHGnyi0fQO5qnMJwZDY9X
 PWO7W/yLxvGpOlBuv0XdA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tr3y9WNGnPc=;I7UBmBmYzlF24fOu1tSq/vByg+A
 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
 cuxqUTXm/PWLvW3lZZyeWYH/Pyc7mY

Am 27.07.26 um 14:05 schrieb Ilpo J=C3=A4rvinen:
> On Mon, 20 Jul 2026 15:19:18 +0200, Armin Wolf wrote:
>=20
>> This patch series primarily deals with a potential UAF inside
>> the dell-smbios-wmi driver reported by a user. The first patch
>> fixes this issue, with the remaining two patches further
>> cleaning up the resource management.
>>
>> All patches have been tested on a Dell Inspiron 3505 and appear
>> to work. I also verified that the UAF issue does not occur anymore
>> after applying the first patch.
>>
>> [...]
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>=20
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.

Thank you :)

> The list of commits applied:
> [1/3] platform/x86: dell-smbios-wmi: Fix chardev resource management
>        commit: 41427211f663c6eb36986ca2ea68d7e87aac52e9
> [2/3] platform/x86: dell-smbios: Pass device to callbacks
>        commit: 08d31d42b054eae62ff57bfd88b639f111b2b8fa
> [3/3] platform/x86: dell-smbios-wmi: Replace global list with single ite=
m
>        commit: b844001890c5bc15adf3b16c44d99edd2005d393
>=20
> --
>   i.
>=20
>=20

