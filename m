Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7F6AB8
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723514937; cv=none; b=NLKNbyhxma9OAzNinleNMPnvuSTgTRVZUFPOzk+UWh68pHEFTffSuDwVvAHnLrsmCYMnYXVe4x/LvlkfOYezAScCofb+QrPTmgwOAJp3qimwjuDLxmSTqz0mCHpsQ0RRnJHryjNbVv9lK8QgKNqNENaHxqPtJpTgJsnWdz2LMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723514937; c=relaxed/simple;
	bh=pk+nex6gd7z1IEExF9LwUq7qgH6uWHE0O/s+/x8dBfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CbEzxGAlGXl/XF58vDCSZNzPp7OBi8ZghxNJe4CD0vypoUjKOFEsc/P5LFGS5gwQcYhNmt0WIXf1FhtJZcnoLmN+AG8mhIGtBZGEWVtmaj9ZDsPaf/7etaGkSPMh76M3eWrGLzyBZz2hRdx8AcK6xf9YIOxCXBu6FFuqDDtCj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bqEEWaBJ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bqEEWaBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1723514931; x=1724119731; i=w_armin@gmx.de;
	bh=pk+nex6gd7z1IEExF9LwUq7qgH6uWHE0O/s+/x8dBfU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bqEEWaBJ6MGsEp+Foeiq2zsRTuUHJZNEzHM78TYRrD8hh3TEz0VUmO+Xh7n7kxW2
	 UHy2XCZI8Dsy5Xr18VYLtiweHBLmlX1FtnYFOMX+7Zh0gzX2EnZJQh8t+aKSqscXP
	 fu6drQt5+3K7o6pEZb9GeWEjqhWSYB53jy2XhdupQCag8CE46v4ut2W5dsXF9kDhS
	 zzPP3Wmx4YvJSa+I+z+gaL5/YJoFrn/9W5UUy1EOrasjpsAiXYNykXIs3Y34dODZU
	 i/D+vx98K+QrmVWnJPk3KESQ0tVXDrAnbwz9raqnjJZgQZkEwhNXIRbGo+JbeIKdP
	 kc6KwncO+shKx/JLcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNt0C-1soeGx2ylM-00PRJa; Tue, 13
 Aug 2024 04:08:51 +0200
Message-ID: <749421fc-73d9-4657-86f4-40cc048265f4@gmx.de>
Date: Tue, 13 Aug 2024 04:08:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Rayan Margham <rayanmargham4@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CACzB==6tUsCnr5musVMz-EymjTUCJfNtKzhMFYqMRU_h=kydXA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACzB==6tUsCnr5musVMz-EymjTUCJfNtKzhMFYqMRU_h=kydXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Et9OD8hMKYpde4otFZf2EFzHMiw9bGOUlS5L72yhXEVQIeWx2Bl
 M+aLUBlfGmCPHd/mUWFXHU680wFqdVqPf8fAxW1u/Dvo1rafHeX2mXaYHR4b9VvCWI/JUtw
 cAQ2ISKKFJFqLdqZRGz8k80PNZTTeQkmXTx46YgzVe3U3M5FIcA7nCjP4eK6ZduAlpnLtxj
 cmPE3Ubn8TPuOUpKPkIkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QWfnKGZD0s8=;XDuuas3l+Yjq32nVovH+MdXzeCh
 GTaJLeRJWAxTPaVkOCFPAE/ElssLmToahiaH9PUt7OvPc79JiL+4mk4zMnD9uQ24DEaL6J0QD
 YNvswf59lMDVcrtdzRdEXU9uLX+Nla7FhqG45JLOxC3giIbDiQOye8ALI+p7swL1zg315ViS4
 L0Hr9IP+6NXGbg56yo/pBk8UWTCT+1TXvQ9v7xlmilgIg0OjA5y5IcuBs3g6nD7uyTNCGyqXY
 w4LkhMq1CqSgrBzT9J0gp7iVuInFAlEAOK6ot8joPlZlgP/FfecySaVT1XSreu2Dq4CWPU6L3
 gqzZ+3Wu9+4pMmANt+0SD5fceoAX3oX5JQ1dPGbuHWKkcgHsxy6zEnqJZTainRgTotjYAUqIH
 zdgoWIC4C3/KdWoJQPV1JWZVLSt9Pao6iTAg8vHFzGnIXBCdOnLb5Q2zI91HgXhuvxN4rRY2L
 rqDlPzgTTbWTkR4/V/98pkDKSYIYqJc3aYChqDWM4v0WDeLLSbxzrxpQDhrvZnJKPGsmeY/oH
 kAA6WKmt4jasXc9AABVLEmOaEk1lzFcVM7qQk6Fi0JUChNajoqLvtnqTK6Goa3vhHFiw3ZDTV
 rJd5vc36+eR5llxe89kwwKEdVyxz/dnyFeVUY+tqHAiXI8neshd6ueO3gz75qFwa7WkopG+6b
 jzreCzp3b7cHOB7OrK1YvAebLE6GKl4Ir9+n+iExvFNaxZN4JH+qLNj/5uf53xyAyIM/vfOcC
 JomhNxTMfEah5LjvPlXRx3tVTbr4KmaiT82NAaJOlicqw8m9W/rugxHBthkXG+Dlrkva/Asn3
 gRCY3WTfO8oh0/+0YY12XEDg==

Am 13.08.24 um 02:29 schrieb Rayan Margham:

> Hi,
>
> Currently the PT14-51 does not have support in the latest linux
> kernel, therefore its fan control behavior cannot be controlled.
> Causing stuttering when gaming and such.
>
> I am happy to help with finding the WMI GUIDs if required and testing
> code on the PT14-51 as it is my main daily driver.
>
> Thank you
> Rayan Margham
>
Hi,

can you share the output of "acpidump"?

Thanks,
Armin Wolf

