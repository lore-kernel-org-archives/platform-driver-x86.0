Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A9A80C02
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jan 2025 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735735040; cv=none; b=DP97WzzaClXbKgJiVQNhEfnWlV5sG/LCbo0ugMEGo+4lKe8Bf8Uchbujg0YKNFAUZK12x1PFK778Xe2+Qm/QftmEFZT4nhUjPET3wAYZWhboU8pNmmhBsdFXpZy7hToVTZiK9TkqtupB88Uuvrvg5KiMh/+rV/hlS6IvihwV5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735735040; c=relaxed/simple;
	bh=qKspGnX7RWjLMyBiwFSNyA1W/v4XU2TuC3ENUmooWAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDTwhVgNE4N/dTQIrhl0swJwTDYyDbX6TktrTTVrpvS5QL85HiSvxsmDrqbQGF2gk8bbjd0O9/neCu1k0tdO+7liPDUczD7257v+vVm3MuJP7qcOVZzWsbluV8pVo2AF1jaePWVjZAIerbjdAIubSKMsJFz/XWJQX2ZFcrUJZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lmJF+6B6; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lmJF+6B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735735035; x=1736339835; i=w_armin@gmx.de;
	bh=ENGQxezKefNTplcrYgtgUY524T37iK0NAnSOgIn6qJU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lmJF+6B6+/5aGpmiv5rDirx67f2OTSpqzlaJuPGD177ndmRq/8Rvm3QbY24bXaqT
	 24Idre+oyIJywRWNS8G3L2fzaOYzZzRqhfKdHTG4/M+BbcEN8O77STYYDqXnVEXuT
	 iQbB5I1iUpTHPQ2JmfIk5SeH/zCC8v3tigeE9zkqE7p9rnq3CeWJsDQpbqSwd3CId
	 fEpp20zpdMNo4rumxoLugyAEeDkCpzqnSh3LJMWjYb3WPlX7ojBwtd6zIpCfLMKC5
	 T2exiCnc1z2lJdgvcGDPjz9/DAmBCY/QoMDwOA/lmQy4c6hAMQlOQfMNJVCzjnzAI
	 KHBfsqAQZ3ud+9JxYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72oB-1tPvYy2mtT-007Bpu; Wed, 01
 Jan 2025 13:37:15 +0100
Message-ID: <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
Date: Wed, 1 Jan 2025 13:37:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ywg8LtLLyWVJciEAk6Zf9TVqont8apmYZGQG/oeM65/UnIW9m7g
 oZx1O57uBCp6QCI7v9lmOTia9yI/DdPMXrpI7s4BCOvjcS2t4/Ix0U7PS1e2KucOb6AIgZw
 NiBSHQni6mkQ122wf4HUB9L1zTjW1dEiE3lvG42jQIyfMwQ1Seo6P8f4YdT813A02XoeYW5
 AJjjka9mWdrkYSbm0HCrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GfjGzRvqJio=;VQxk4tLlF2FL6xXdl2WAsjHSe4/
 sLVrpaOljkMntlWcavv2c6RHzOJNctFnwddypRqGycrSmirYtzNM8HE565wttBzC9lo6LPxGw
 URDB3JhAhxq5stZAuS8dOm52xd+esnr3YHdrjAQvN/qzFwoFpTKE6CA2/YTOs2Bpw4jLl+XMg
 zMKtFRH1xMbsEI56Y8N0wzMPV5xkjJKv0+GuyYCLbYlYPbGES4GWwzk9/CExQUlMGYrH6pgwI
 3Y4blAPUWJtDKB0y38vKkhtCdTxppnCdZ1Wq6Fd6KX/du7Ewn4ugS5O48WK3PId3PZnNV3fG/
 Lkodzc20/UXS9ABhPNpDjbdnepOI0J29Bm3AwrQtKtrDJUNPrdLvfMtdZ/fh7YpjQJmH8qURa
 z3q9ZB1StYhwtiqi5aTQh6DIiMqAfRFYPLsdzx+P8pRzts5qFUkxgx7i6efwJf4CWZdO3Zkhv
 008kxF7yu2uVE+mBl72eYwC6ehJRwPcQxhES4epf+4wO+ZvFD4OfXGPtLY0hVd0ftmpmg6Fxj
 EBTPjAOMK51qOVOBvbtAtPLA+8vX02WpH+RjH7pAIfTaazl594cbLbRLK21I4PIZSNGN0mVpM
 2QOS/h6Q694R9+vklyjycYtNGDAdvIywgVeNlwK6YpqvNaeUmzFZmLSJ8qXZ7HBekklmdt03s
 jbXWwZTTf9KRhuCZqEy2sfEmmkOyHEkhTeM0BWlaNfgDF7eRZBs4mWJhSeLSFCwruSVeQBth/
 +BpXypooI4a4ylQwQRWwDbBv9cVPXrWXVxn7PyO/UqFdvS73Nk+N6jjJKqwOu7r6Zv2N4O2BS
 My/l5sG5cFyCn5yDLHTLkmFS7ZqhSJxQg8fy64SfmQyTMgHdEZ+XUMgImANoHopm9CIRc0j+3
 hAi0TlctCWw0FropphE1sDdUQa6NQgOW+xydC0Y8nW4pU6jSCHegLCsUORD4y+W9lNnPl9TF/
 I6Nny6olvd7qL+fLkbGucpJjR0ok5/PFfoUbt/oop2ltVb5bf9XnoyFCnOYXhKr+OX/xL0b8D
 n/j+6dyiIbo0J7Nn0llMi8Wh/qYVTbpC0y7daXiBVsKgw6UhPnzD88T7YZqrkvrNNSU9rEFvj
 lhBUpVsdHigut30W2mN0wUiRGZdZxu

Am 01.01.25 um 11:48 schrieb Hridesh MG:

> On Wed, Dec 18, 2024 at 1:42=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>
>> Actually i think you need to look into the Windows application and chec=
k if they call a
>> WMI method during initialization to enable this event. On the Linux sid=
e this event should
>> be supported if received.
> I looked into this and the only two WMI calls made by the predator
> sense service during initialization are SetGamingMiscSetting and
> GetGamingSysInfo. Neither of those seem to contain the logic for
> enabling the turbo button though. Could you tell me where you found
> the ACPI code for submitting the turbo mode WMI event?
>
The ACPI method handling the Acer gaming WMI interface is called "WMBH" an=
d is found inside
the "SSDT6" ACPI table.

This ACPI method should trigger the turbo mode button (found inside the DS=
DT table):

	Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
         {
		Debug =3D "=3D=3D=3D=3D=3DPROJECT_QUERY_58=3D=3D=3D=3D=3D"
                 ^^^WMID.FEBC [Zero] =3D 0x07
                 ^^^WMID.FEBC [One] =3D 0x04
                 ^^^WMID.FEBC [0x02] =3D One
                 Notify (WMID, 0xBC) // Device-Specific
	}

This method should be called by the embedded controller driver when he rec=
eives a special query
notification from the embedded controller.

Did you make sure that the turbo functionality is whitelisted for your mod=
el?

Alternatively here seems to be several other settings available through "S=
etGamingMiscSetting",
on of which (0x0F) seems to write to a field called "FMKY".
Maybe this stand for "Function modifier key"? Is there a way for you to fi=
nd out which misc settings
exactly are being changed during initialization of the OEM application?

Thanks,
Armin Wolf

