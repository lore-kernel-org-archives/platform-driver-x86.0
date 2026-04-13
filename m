Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F940DFD5;
	Mon, 13 Apr 2026 06:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061223; cv=none; b=m8BBpAMB0CaSg2HU17gUi1UpZ69SUc5H2pqsL4J4sa3LrFEx8/OdwMIvZxUPPG8nzhxB7CNIvtnEV80vHs7jE9gMx0k92nIPu9HMjOKQ/TQPB0xkYfmdCo2/FkPPTqHFSnPiumWuyq5sOzi8RSOq6gqIoTNqPdgezyN6XVBASy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061223; c=relaxed/simple;
	bh=lSE8Nzi0ExcY/bEwekwaUdukeoCDUM7vESUSNqnVHng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5wfTmQl3JE8W6XwJO/Hpg+Ov7pKwGX+wpzmkoBgC7qvKM9V2p1QGbot0pAcg26AuqCHXMhJeE5AiZkjhW4UNkbiOWnBjVDdeQ0CqpaMxTJwLzCiNvKjy5+roNtDmlSXc0pajzM17eSM4ixAGKkXyMSO5bfpozhcAsovh/tYSJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BstfgBRA; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BstfgBRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776061211; x=1776666011; i=w_armin@gmx.de;
	bh=wuu/8udnF5LTApIcDLm7Ba0MaRoIJ8xobf2d70G36pY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BstfgBRAEsMto1D9kCy7cSBV5Yhg9GZUw58c8uSPDXAki0cgRfbDyMIXy62e9zsn
	 nrFwp5QjtX+1Hx0tmGepszDhw1HhRF5LenjPrulIgNO8/xuMb6KLUobXBKertFNXF
	 nSwG1fkIT3B56govpt8Y9MW7n6gNuY0kQ8ZZAvnAvXgcFpKlq2rXgXyeUmQFsC2yX
	 OsKJT3+JoCITLEBcSkSI1KiHW/wMKvQ3J1FcmDXpcJ3m3YJ0NpUHPx8Fxsewy4Mbo
	 sCdP+RYdsdhtSxaCk5wvkljNdDM2NHr+ZhoyjdeqBrQvB0jiv+UZ3kbuDKsXYCf5n
	 dmr8pAX/u2U/DlFlvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9kM-1wDJmZ0n64-00F23T; Mon, 13
 Apr 2026 08:20:11 +0200
Message-ID: <1d1be7cf-5e79-41cb-80e7-3b35379524ea@gmx.de>
Date: Mon, 13 Apr 2026 08:20:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/wmi: Use WMI driver core for size checks
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406203237.2970-1-W_Armin@gmx.de>
 <177583853473.14800.16471793286589917557.b4-ty@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <177583853473.14800.16471793286589917557.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OQ6y7yYAOSxg04wYZyb8T1T/wWQL6d8vM1DgHtt9lMw2fDdGgNv
 tsGBlpi03P4ZikF1IYuzzUm0hFNOxPS6qzgH8pjr0g/1kjcWp97orC7czBIJUCgmRswhdPo
 SC4Nb/ovgd7tWLf/Cwrsfmz4xaqljvsJxw2z73RKiDre2EmZb4E6hw2QiGOSsMuzgZtvgTV
 mvuptUupf6yAMVcowTKJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:21qgVMNlHsQ=;fdkU4i9FJLmJ8Q0985uagxlMYs6
 vgLWvi4EOx+ngjZ+bon928opje/Wuq6+w95vVTiMiHO6xXapxNiSt9Gvf4cryxArXqiqHLsY0
 4Yir24AQ4TIWl9JK4yENMCsbafvLmavDX+LgxaZkXzFQBC4lkphIYLyhVH+gmm9mWo+JW8V7v
 JcXQuCDIU+21VWrCyjRPWwcsAHkevNXqhDWtPbNZf6XtO6nWanswqaqInrXF/xJogG6xpQdEN
 jbcdwtKZtdCuyq4DhHbWkiHn5wucPm7ThEnCmP22jJSRFCGSB6Rk1RF+P3GEZ8drHirDXx1UT
 4kl75IMOZJKgfuIOk34dIaqVTLBApEcFspU2BEwFAgDCLbeYyPcO/LSw9FVzob3YOvmKyn9UX
 Lt5VtwcJq31UWMfYeQy+8W+nKjjVVne42P3EzefkUzxPfphbkL6MW1NhXaxOoi49jWLlJ3oNZ
 +2Adcrc+JaC36aOJl++h89gDyEAQBcAgWfdBrHVgU9HOM9QyHPv871Ctnx/P0ye4veKzkN8yd
 Ey1kN3VvVrmmMMO3F62nRBxpHyC0V0oE6HWCRLe851XmyMuAdumEKlNCJpVslnrcnAWAMN5Kk
 Ua+H79mytthoG7zW1vOBXxU9ZTsRiJQh5/AOMCZ3xnc4ABM3f4lfDWqgA5k3VeGdDJZKw02Np
 GmDiyo47Jgl6oqRIyGrzAG6U6NMi88BRklRt3pMH2Py7Syo4Qxd6nQt6hxpKP571y4swbyQPa
 JMgzWvLtiZzSDN4HU89kOA1uy8cyNN54oa+rpQmkVhTfj1x0siUupLB0VxL6ncJw/t2cLBcti
 Er641pUma8CaLpClwYD/RvQJtez34pQ8W+sFM/mEmJwJCxUYNIlDV0Je3n0Y71CyBQMsSGv0Y
 ped3sooQLuVjUqPOqVxi2gKE9DhfYIVohz6Q9UxBQ/BUUFHAPjFgoG8oBBrEX5koCjIyXj7OJ
 oKqwf+ZeW9Rhc4SNimVGYirBqQZ2Odk3LCki3bNj7NmIkhg6K9jV513R1FvLvcfX/MhyJx9Q+
 VvdV9WZ2waK/BXpCLF1zpqea0HNpEx0px2jjlnQSIuqKesuoVnyFjQRs8K8Cegk2JD4kVgwG/
 OSSABu1CEiO000FB3Gh9K1RwsywQnO0PxITV6q69JcJnPh2eMEtNWAO1ek36MqAx7zAkg3SDZ
 uhSAAmdYJVg8PwfCNc0lX4qgRxc6pqMAXE3syUQ2pIMMpjfni1OiNqYVqg1cC1HhrInQnvbfO
 0/23fE4tkOvzfl3Ijl6sTmuqF1xWCaPEgT5DjtAcjvoZPfeRoo3uX4zIt7lDT1W7SJvW0SFgD
 ctRznkoWukYF5jI9r/d6+4G5j273Zd+FMlzgxj6s2X7e6ajoeRYtMuhtsQDKa1UD1Mgxk56pv
 VPGYcQ6SKBs59WZn/UyF+WD7UQ/4lgSArdhaYGfbn2wj6xYDtWSH2MzWx2RJ64awJ3yK1zbAs
 ktlsveS5jexb5Pk74QyqPWKSxq/rfTGIciU5yjnCYs4+97WXmGbQdz0ZY/FpnJCRhKEBUAj0z
 fD/1DXUab3BEU9b8HU3gz6Wx/byKWBjezW7wJaFn1O9kc+3CC1yAJntiMMIrLlk470Y8btxin
 /eqqPSG0aFaMjsm3GT144qEJIqrukPv1dVfoDfDr3PLgQJ0WHCzQwRK0crA0/H1KNTGKCposF
 UG0lp3TrCrWbKlTqdDXj2KqXSHwPZXNZGZuoygAoQ327PATF0L4HZobhTHvJfbLbFk9PsvUWK
 ADOZZ2y7XpUykq0QIgqNXez43ExnDMKGz9vp8pghFkzgwxWzvibqJcfeuYdrb6V3kzqiuhRHm
 EpPUOcNaS8chyA8vfQVNfG3YsGqdeM/nZZQveoL0c2VSCy44tY1v2XNifAuNpP5XYttZ/WoxD
 Rop+M7W1MepCPiVQfkSiuTfOnFeqQbAJWOxMl94Zet1oyk5JYUhlsTDjVdQngffh7SNbiC4tT
 W07x4E+Qx9VTlkGDFPQzpYtt0dAdSCH+WrrNz5g0TOMw3eOC2S08TUAgArq/jq7bxZPT7sv18
 qfpln0FJg8E53xh8kSwkIC4r8UJjCThQbMlBo7GrgdOvTfkuqHpXHpLFS+QngBT8cY1yssN1p
 BpBjdwxXfPMWIxaSNSR3jQ7nyGEshE+VHr4hj/bGPAea6rFKoRokCZv8EJJS3tzZeVc+gIu+C
 uz99ybyNIzcbrPJvAfpJFmA9cf/wk/F18mLUA5Sud7beNWoNe6+GREV0YGC+7VgIWzYvOQm2O
 I6+SG6pVRtPg5dBSEKvLl+VJxARADSu+J4UgcsabFHp/H1koeCNobRsfVaxv7tI2Wp6bMVJXa
 AJj2Q1Ayq5JxPQaxapYHPkAf2EVTShRtnwJ06ApyKfUeykM4W68F8yXhQ7PjY9satFEzF7+A0
 6Hzs0udd2O8v9P9mb36OB0saf6pa4sf1q56Czm718D3vVSj3Ky2JcYOGTEQC9A3lTZ1s1UiRp
 M71Zgac/Q+S2pSuC4dehTwhuBorSwdUpxE4A7QaCf2t9L2FvZCoIH1skpnwlj//EYR1pPMt6q
 dhpiXXkqiwZd9kQWHPbn69bqlTxBoOw53TmDz4PiTfk62BPwE67dc5LaWMIvLp+wgrFjQoSIy
 JKXC9y5Lpo17AvvMu+rbUymLHIBj5otxKrE3X81kNrSYqMb8M9HwaHz3BUUaXW3h8N6MCABEp
 nRsx0eppfTiOhb8f6YixB58jBno9R4A2Hw+gvrzBPpSiWTt9DjiVWOp5EwQhBERqnPmZBZZe/
 MBI8a977joyICmrst28oQYJBBeIUNZ0cUSFmjR4P+UILEFoUCjbfm8IKJ3MZg/1Qa3R5j1Lky
 bQ5E5oSsqQ9IX2rRBvbLA5JCAKna0lcVEiVTd62eHilBW/4tRj1y+LDuL9zn+Tu34TIbsGKd6
 GQ5PDfTVfBc7A/Hofy9k+Z8o4asQmrpCjD5DzNYDf24gwdxtAhUzlULEDOCdxooqK37va5Bca
 gAEFNDy0Mc042F3oqJ16yKSo3u3VjurtxCXylDRN2yfIGgtdkRApoHXNOtKFW12POZnBDr7f6
 /kRqcuH7xl1IYDccJJe6YXx1DeU0VK9XUfYfpV3JyHB/6R0medgWM7etZ9HRcKw6g+ab3G1XF
 EsPOYz+J1V6wMRH9yZdAiC3BxZR1X/+JcdxbNfmwnQErHRRzM7CIkrgSipF9vE43QtrmYhzxT
 W8ZNxbdiFgV6X2chE8Zti5uCikWdvjuu5DMvUMiMijW6Txlc7orqbejHZN15GpmhTQQBDZnIm
 namGw5yhf9rt0mRAqgndnONL4+OJ1Tu/1Np3b4RcZCXuTF/nHlfcVLlMjWbZDyUJTr46YcsoI
 pJzXw5UpoT8luvAot0HyX6tnFFD0zTc7qinY3+7kR9JUxIpVzFO4UvmneQ+R3IxtdaI8u8cFD
 tlmya0QVTRtJLAyWQuKHR9UEOwGynwFe+1w9jgb8baeOnglHnXtTP/hSVFnAtr7NRG2I6zEBm
 S9pS0SbPj7HI5QR4ASOZx9QBwncDV+8hvMnPc9eA44flREPD33JdBxwOCI76OnEXV96M09wA/
 xTkkpb9coeIFIIvN+eSiOwkr0OEpw3JEZ5PwqtGLxpUyyY9pGLDK2o6CG8znHn1VxtEcTkzOK
 6Bn8zxXE/pBwJVw0IoSBpeoo5oS4hrSYg+0Po+9AqhujmnENDDbB9VgDOXjdXU0+EfHd+h3Js
 hhA3NsGpiU2aD/V8vM0ZXIn9ZixTE8Vq2myDiiQNtK94O1M/p1DhS7q7zDx3Ch+GLDMN2jbhQ
 rWiEBN49/x1lVygGwdJfLimwTS8nCmY9GCfplgqUmZbKCjF/ao8vzatn8m97mbLBdXAR5rClD
 5o8f26ScVV9TRi5eBfMQCqvGYL9augMUuB7B1de7cZIkn7CJfq60I1etPlXyQGcQyg4/BBVSG
 HWQG1Y+wHCO0mA0oSpEPLBRuobDECXFIuCU5OzK3glGsRUP+N1ADTLhlWrDsozvj+rHTJq1Va
 9FBRHT+KLkIEx2WLT+p6ddPOojQ8GmQk0Wnunx4GOVtXoomYMg+lDoV5T7CFqhvz3l3ekJNDK
 Ml4o4IHaou2TW11u3pWHqGX5DM4ZIiLZuBHSEHM8FN9xvrot69egpAgZPxGjudZZGHa0ehCg1
 uCvbmCMKRX78tN8yEoEXc47wGrOsOQJWFeVVLfQltk+C9LV6/yPbqevBrFl1M+H01juI9X7A8
 8Aji7WMBiFgB6CxzY187UBBSGeKcv1jb3P9HmLBIMRUv77Xt40cMzgcVEWIZAtcMgivDX5vk/
 QlaNIV05cFOA5ZG1FSrdxumaR/OggjoSSnVVeX5OkKyVlXM2ziS9zB2kv0IuJsnLP9nmzjewJ
 88cjiGobufB0kwbN5/v50xI6fRvLfTPqr33dB6YrjjeNVdClJrDjNiV2abCWr7un5YNwKUUU3
 hR11MxWVlJuUBvpqzzUaHc7OJlbhtkEo0xOOZSGsSDY2Q+hraNnFV4vX/nO/5YY8zt7n73/j9
 9ougv7kh/YzSLBPLki4j2hpHmmlsDSPk9HdwLRqaajIeJzOk0nbowAY5NYj7LUDmmgaSMlHX4
 RVsI8NfpuS0C104QJws7kYc3itwCOExIWamDr2S2FNXzClQuNj8kY8ZHUFXxbJgeuXRhqkxC6
 TqFvfUWhl6ycn0RPfmIS9szEK4g2LptEZEM3y3Gm7jSKKR4Pqv9bustBh/as44U7ik1URE+Z9
 UgGxkt5vNbYrPmW6WHsM3RLC+aMTKf7jB9TyD7VRuCgJ+QdoRYo6/NiOx1xHcQ0VVkqeYmb/V
 jNEJ3eWB4qLHTXdc/wGlB+HeAa+qZgTg5Fm/d/LaJwxgyGGq1GVA4LpmKprm5WJfgaU8yNaQu
 CRUmIG5czEt3fDkKhUxMk+sNBwOstMFNPPXAsX919skk6VXC3HSh17OwgkVMv2q7v45owE6Sc
 3wQHGl+STe8wKD+w7yG6GYkm2bO5ecNBX2ccGycUR5Ed0Nxcg5QmV6lkkm54wCSdUTWc3zvUb
 Keci6gn/BTVN9LJR0NohQm8/WH9whL9eYjWPQQOpHx4VL3Il6yEC2rqmjdptJLg3v2cdmAptg
 08xjxbu6d0hmFSqDbZ4O/kmxESxmJKOY6U/UUAaB//J8O64QXi+fxSo5eebvhq4wXy9PPCKzP
 leGNO0IBwqRFV1BPEBDPOl0H0TyGWEhYO2XldRCyfwtnmROvpV48eno8Qc6+hFaawuozcQxuz
 2o8TfS4sa4e7GpzsXc1gHl+lRwzZ2jxOThCwUm/FiDoJVnoPNodkJEd4/qayBxu12vznHE0YR
 3PAhYmYf3xQ0b2dhBVLREuyucQ7aFl1HMOogJJcIDk/E+hLxYg5OnS7mmu7f038YmOKUHsr85
 k2XEyMVSR+dKeUqkdwaXttKDloYzKGJqq5Jy435ebbjzupYxN+LuxoXfIWvT0QnobdUoOV9Mh
 1IqpA6ytXC+8JqY0tL3PNS2+lh7KRSBlBtl9cTmwkhHIPP3JrGLJZktmC94X3ioN2T

Am 10.04.26 um 18:28 schrieb Ilpo J=C3=A4rvinen:
> On Mon, 06 Apr 2026 22:32:31 +0200, Armin Wolf wrote:
>=20
>> As suggested by Ilpo, the buffer-based WMI API should assist drivers
>> in verifying the size of buffers received from WMI methods or blocks.
>> This patch series implements this suggestion by allowing drivers to
>> use the WMI driver core to automatically reject undersized buffers.
>>
>> This avoids a memory allocation for undersized data and simplifies
>> the size checking code in most WMI drivers. All patches except the
>> last one have been tested using synthetic ACPI tables and appear to
>> work just fine.
>>
>> [...]
>=20
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.

Thank you :)

>=20
> The list of commits applied:
> [1/6] platform/wmi: Add wmidev_invoke_procedure()
>        commit: a6354b385fd18fcd7414052f8f6d13fd27521720
> [2/6] platform/wmi: Convert drivers to use wmidev_invoke_procedure()
>        commit: dd2dd86f44800911e71127d3f418ee3685197c41
> [3/6] platform/wmi: Prepare to reject undersized unmarshalling results
>        commit: 668aa6086f04d1bd63f27753d6c2d318c44ae306
> [4/6] platform/wmi: Extend wmidev_invoke_method() to reject undersized d=
ata
>        commit: c6f69ffec0aec2ac783f900b5c17ebff13c58f82
> [5/6] platform/wmi: Extend wmidev_query_block() to reject undersized dat=
a
>        commit: ceed8c1bcffab475facb6d4ee071464d01dd1865
> [6/6] platform/wmi: Replace .no_notify_data with .min_event_size
>        commit: a99543f1d8f92e11ff3cb2760964490b04864e33
>=20
> --
>   i.
>=20
>=20

