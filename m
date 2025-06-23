Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF64276021
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jun 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704734; cv=none; b=nFOG7G2muplrAgvsEGSlEtJQ24aMfxc8GtcmiPOpSjVQsRUP3MQsXKJLwdrlxf/UNlgKz/xpVIa9oIrJuqY9Zz1YlIvpuvtgmjrS8c3ObLiJ6M8i76EwOsBCjKjxfAhQ8+5WShBtJtkuXAgomdrGoAR0M69aLM5xVkFpOtilp7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704734; c=relaxed/simple;
	bh=UkJFyci0nGIljseu2NCGn6pjjrlVrGRdDBoryYryl+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Hj+jb6gwYiSjO7Qrmpa/QXrHXivZ1siitz6YbPg2LBwwhbPwBhDnjWreD2hts43KM8th7LMdJ0kMULT5nD856Vox1KsWYo6tHBcvkERytmnQJ2TR2MpcUfJMseEKRGSwF1kPFEq2r3POmmAPacIgHfvKG1y/Yrn7A2zh96OR5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=igVqFo4o; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="igVqFo4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750704726; x=1751309526; i=w_armin@gmx.de;
	bh=UkJFyci0nGIljseu2NCGn6pjjrlVrGRdDBoryYryl+Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=igVqFo4oPU8VVIAtKwXJ3tNBPIpD92TlFpUvmPJWEJAjO9dR/jupe01/cxYJs3zB
	 EEHLPA5WA9cvq3ld6rhvR+gkVk1gOMJYNOO+YkZ6n9j4vBzkYj/pyYIWw1nBgD0PA
	 rFpxZdFZJELfXrkbBvq09XYBAbF6IXwDVVtUb/RPuBoybKuitGPxpgqFPKVsGYq6H
	 9pasFxgOtuepnRztqk83hmOIjnbO2y1/v6Q1HYw7cTis1QKDd+tsQObmjRC+rkRha
	 mYmF7Wj4SR78J8Es18kqR2QfMIK10PLFc/GVZhsw8H8SzULUO1dSp1Up3vgNA8Q5A
	 yZDwDEIYs40EbqqbDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9Mta-1uqnL80Rpk-017yOb; Mon, 23
 Jun 2025 20:52:06 +0200
Message-ID: <1037e223-a6ad-4d12-9619-f69a29cecba1@gmx.de>
Date: Mon, 23 Jun 2025 20:52:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: HP Omnibook Ultra Flip 14 - power profiles
To: =?UTF-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TXVStovHy736B3+GrbJvU/5LyAMGh7iIQU+LHejc2eNuTJnYTf6
 fCggaR6gnqMLS5lWw5OJTzK0zBFsDqkTbkBdqPiN0UWnYzCEj4HMPipY0Y/t8SWJbvlXBcl
 vObi72cqYkd7On6z+tqLLavRjdcWoI9VA2B8Lh3V1GJfQagaBeTmWkBArQfyyfzggPKzsNP
 pw4MbBoknlsqLuWlaBirQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oAkCfzCRJOs=;faCNXfju+dEg0cu+ggPrt2IJDHe
 PqPzIlLJMyVy0nmArKqIcnZ4dOcohZ8A2ZROvPBjTnJ91IhDutCpWc6Gp3d6QZ/OYMjPmZOQm
 fSuj4lrOSSjMQBLWejXxlCJLFNl1fweEdoeyNVPkhhQZNrPgj4adfHv8nqJqaTNnoVXWaRTQf
 iX6/U+rfHHw94vXvmAaGHR17+8opafWnA70seU1J1z/S8HTBaFC/zSzImkHO3mldxKQaE+YWd
 804JQ9bxvjNl8YCNO/rcWOlSvTk/5DvidCm426YBtfZGZ+MkFFGKSIbyiYFJNgDHcg+SJAUgu
 N7CvpBfwgahwECcaFIwFWV8j2c6Iz9xDIt4+plU7XLFYEIJ0B94fcgaYyULXFZJ4zM5g0zVaS
 5gB2K0uYJsdkQvFIQZJ6mhi4ysVYJeUutntPPMSuFRxCEfeSMYWajAAqQ9dDjLqicVporHMOW
 JLkEY5UkJrOhTblJ51gCI68C9wJN4RhiWzqSyADMs3kArrCVstE9cjzTaJzktn8axfwTrB/Ei
 fZ4R81kcEePqrOo1+slg8Fha/oWIgsnIw705ECTlds1uI7+JJ1gRRs/FgBwCT5QCa91qQm16S
 rSlxier1cnY5f1i+2tYQi2csGgVY9xsk09D/HTRAX0sTbXnfvrPQibdhVQWFiGDd7eUwg1ssq
 q36sRTaSjf5ldq5p1XTLccFCKSGn8bfYfpKs5PiiZhCH6e3O0FcBz3BWFYp8KjuGxtakCEgeb
 u20ahLzqJjmgps71+jQvKsYJZaTEBy4EY0Ao59bl5uV8zElFP6aNN36Y4Q3t9XNuY8FrlhfOn
 kylcHz21CwzdOLV/1DuHxvDbhmYL/sktW2ux+ceaFigWl5ridG+PPAad937VhzexxWfjPRZOQ
 DhKN9J1dwIl3+QAy3vl5oqP0vKexrF5rexH3sVLgmGh6fYW5h7/7wHjypWXsvqB1F0oNBZRan
 lf0sOUwEFPUzXqJJTcGHDpTf933kafkGmqsJ7giz8p/fSm0Narha15NtEjnUhCGtVUnXQ2X/x
 2teVOeJjQ2wArFXj8oyecfAqJgm1xcI2k8rVkUdzrIzs98ucxUAhI/vX/I1nI/4iyuMF0nPFV
 alUZNNLMvUNRQxCN1z7zU7PmvN23Ya+5js9mSEeJbcjaHFjefSp/w4AOc0dbBoqExKeKlwX3i
 PdmUYbfaDI9VlJ5EdwTDvWdlpYMGT/pxGk4Ka0jKVdtC+Q5AWYC+4BGfjT38cVJ0luvl916Ac
 NgohbqYGPbSKJ6o2qWsvbjmu8tJpC6kCPekjqt+L8W1rm8UXtfM6JuXmSbX7+wXEEVAWrYY2B
 XVQVdNkkLekOvEclQ6q5T43nPAUP/MRE7WEGbaup9cfGX2jUs1WH3QNLEmmbD185+TvdQxTBW
 Dz4yKrpyWBoYV+j82bfWyB/P3K8xTSwGM+i0FiE7qa/ixfNtzdavO4hFLOsHXKm/RuLxZGPWx
 yspvXwRn8748hgXFH3iKg3VdYu+lHCaFZejRnL3T2gVgG7PKdZs42Gp9a7FcG0olF7h4YgkRY
 LMMxhCQdlTkVvyGjjbaZZRPEwHqzLEfjx8utzwtR4jxGlSsxreKFGITB/luwDos0B10fohajJ
 J/YKFQX6HYugsryS2qWoSzp/rJHAJ5rpCnkLlUDitN1q33TlugCZ3+UxB+mLlUfN24T4cfunL
 s+Z1DJAGMOU4PX3Z4PHlAuZpqcxZrW/OaxRFKyJLv1j3RQAeJ6Y6nCbSyJHvUdFGbnBrtX91o
 9qdzsJiUCPNSz9CXfqtMCvQjnAI/8428EpvkJyhvin7IEVj13ZWIGzwowLG6G2CQiGLq8sn+z
 U8HO40yKY6m2LXPvdKuCj5iMtep4kucr9ulBEH0WiS83FCL0KJWnv5E+PynZjI8uedrP4ffWO
 J47VTZH5pZ/oFX4dhoDbiDP8LCFJoD9urNmC6WZiAGPdouZyiFx0Pb91FPG1J4V3zT5yMVtst
 119laUm45gSc11xAVSHT/s+Jb/MGf/ftgKbamnVP3Kdf8DK7qvnhLvibI5mvLmbJori36Sixh
 vOdDl1w+A0TQt1OgvqYZHAk8KfxkRGf/ugE1H+chTpbICQANS52M3xhl1KwLSzHUqy6ZtpP3+
 bNtUtP6FOT78NBFp3F6S3pH4GYYqN4z2nzEyVdS88BJRtBACXUPpAoKbepPJmc3AOwUbJBFW6
 T14TiY5Dq+wm4JoczA42Z+LB/s/aYV4Z+0U1P/VJ4T8hlnxQBXkP7AaCe2KlJetc4E8ChPByh
 huPPyhcM6SsGUjkTR2/40c9yKtYkzR12yBpsYxznXGTGlB4sy6UYNqqCA3Jlvj9ckcmCqbNgH
 7XIrptgmUiZckFilXQdF773P88nl/gLazdL/2AH0ufmM3et2o8rwrHdNvn4+8mDcrIzSlHFD5
 vb8Pavyvozks+EBpaP7VK3f9Cqs9kKy7QSgnvGYXJKwU6ovEA+c8CnPG0FVtnnk0ptDQQanVN
 KCLCzlpMhbICEj9ZO/l7X/1KaYx1gdxzMGrM7toU9dQXqaJBoFqcX/578ht/xnTiCBJomyKZI
 pKpCoNZLlQErwJsDNvgNYrACsf+qZfQxbS+hTNEFN0i15bVNRrogglUTbKBGmUn77MKg2JtbN
 GIx9o4IhSWFceEQVzJlBaX0L4/G6BeDKt+7KPYu9qS7fKgxAufSz1d9Lf7bxRpLHiC+ugKEdY
 ceZcAZM6E5EI3USQodOCZR4D9dw27UihZazXRJTI2IoepyAG/CtHJcK2JclNghQYFqfO9Jmin
 PXlf3Z7isFmB+wRef1BOk9cAEhTmdSg5TQhRTWFAJcyT3NTUfI3+KlNWRNcIIGGdN5d/4p0iv
 EaIomtXnq6Li+y2GwmNSOVR0cWRYn4g8m0qHBYKUNP6BB3GXJjYpR6MO5KDoUxc67wiZtMhQB
 /a82vWIeKb5wHxDxx1Xn/aAfIi51gtGMSNoBQpndxA87Eff7YzmHQjceayRNNJPRtYZc0o6hC
 DzpJJ5hK6/5UrqCTm+lN+RZqVPwkamDcxcmEtUezFEzo8iPSeBq3/otOFSnmGEHM2WjVo2ndN
 LAaOJ2WZLvTrP84VioFjkNA3z71bEWPu2Rao8U75pPI53LY/SWpOPghgUkvNFQcRFYm064Z2J
 OL9t85gn5T2bVcLdssFHhaHwdSFz0nrSFN0Mt5MReQRkUvCENN2ClXcw==

Am 23.06.25 um 15:52 schrieb Benjamin Hasselgren-Hall=C3=A9n:

> Hi dear Linux friends,
>
> This is very much a long shot and I understand if no one got any time or=
 motivation for this.However, I am trying to understand how HP Omnibook Ul=
tra Flip (a laptop with Lunar Lake platform) working with power profiles. =
The reason is that it seems to be very limited while running Linux (to 30 =
watts to be exact, no matter the power profile, this is for the whole lapt=
op, to compare with something the Omnibook Ultra 14 with AMD Strix draws u=
p to over 70 watts, sure more power hungry platform but still). Also the g=
pu performance is not as it should be.
> So if anyone got the time or so - let me know where to start digging!
>
>
> Best regards,
> Benjamin Hasselgren-Hall=C3=A9n
>
Can you share the output of "acpidump"?

Thanks,
Armin Wolf

