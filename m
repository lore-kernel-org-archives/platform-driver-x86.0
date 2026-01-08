Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116C44DB72
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880359; cv=none; b=U0p2+dZxhEEKnn1vLBv3y9dxHSDOkbpKPDVKTYtFAuplJ6yh8LlXdpCx9O/6Myo0mDriUFg85ZoKM9snqTe7AYgexTxrFwluBpHDXW6xSR35VdM/MFzroJwS5kfusxuOJRIFVoAWUKQzllLuASXmXC1+6IL1lR68ob7Wuf+sS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880359; c=relaxed/simple;
	bh=2FVumPwgES+sNwUni9+7FWoMlFwIhOe3SnLTHLPRjdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvE/NzGTiq3WJqswbpfHLKenDvYBMnROqaspX70nSoRF8XBNC2t4cb5/fAfFEdFxrKnXM5NItFO11u72WgW2I2lVAKw4vGCrLfCRIyZPmE/yOaQYCgYkXHey+9LoFaW0BV4yk0zheNqJ5DJAnU66QYB940h1ZnJL/0K2WZR8b1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DZg/3/sO; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DZg/3/sO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767880354; x=1768485154; i=w_armin@gmx.de;
	bh=eRCmE2NYOyxTTC6NaYQTb4lfttCXiRkG06M16zP1GWA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DZg/3/sOvTYmz1skZp5akzFqfH2OuVIGyjIAb/P0BCawVX710XXK9++/PAiLVnBx
	 YVQQnlnN//SjhOdqSQgHdb+Dg9Md7mjfRA33NE1S9v6x+JKYnPVfC5DHeVIC4cuKZ
	 7IPa7ZuTdpIGnh6FyDfUM107mF5LjvewdVqe+2GVXRFXgaqGSdtHKnTO1sWooY/0u
	 fi4gCxs61CiECV7eBgii6j1oTCjkzWTcuXWJdNP0l1xyPNGqZ1u9vxKGWzcao6oPw
	 eGKIaKCCJvC7mvxCVjdsMgexCbwvRu3t2EKzqIPUm0XZA6dpKxlHot9DPfxj73Xuc
	 1Gz5NGPmYcu/DLEPNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.90.225] ([141.76.8.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V0B-1w01BW1unv-016Kyn; Thu, 08
 Jan 2026 14:52:33 +0100
Message-ID: <90ba47db-fe4b-4f1e-aadf-160d44c6930c@gmx.de>
Date: Thu, 8 Jan 2026 14:52:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260105171024.227758-1-jelle@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260105171024.227758-1-jelle@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/H1I00crx7MZyIy52PfaOWM3+Ot1x51qatSf/6WivjplP3XYEps
 F56Mibu5CUradxy2xeZeglrS4/sP3vazDvY7SExLVZbdKfotBdwQ/94nCMPVuwpy3d1QffU
 0v2uloOem1NjuftnyJbesFy2X2IAELzdJ+uKAgrfC9dzbQa7eryoo+GlKzVCWioMGzYpfca
 aWaOqUafCyKLOhG6mUYbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bB5YOqZLtpI=;Nbw/WfRDQI8jYoYDOebrhXrrLX9
 6Cx6CK5Nm5fFzus84DsM3zys0k+Dvzfa2lXcTM04cKvb1c2+C3POsaia7yWEDvGMxHn0qIoW8
 5gA+LH9FPjrLAgRLYEwVEXrjvuL/2WttnDx1TcpPYk7QGsJE1DGrDbblTMhOV+HTO+mVPLDGw
 Sd43cIeu57otiTShQokhQZmCLJMFFGjCMmWYppnbODrjA6+yHygZPTe0fyuOwFFpjKUP4E66S
 lFser3VYPEIkKUONsGFWkVLFLr7jUts+PyXkgUnCiRdpYc8MDnhTsc2+Nb6t/Wc7E6rJVK8Kj
 xovcwFzmFLUqgmYwFI0S3TwYMt9CWfuqK6+LP2VK6jXNIceGBCGHt+ftMVrS1nlu7BX6SDp3L
 y2GDB9kcfZUcPV+Lw3oG0anUGFXrZwtpr/Po5A2yKSlzCVj548l33NT2bNiDxhzXa6hBlqZft
 4FtfTZnE2rGmbG0yKPWKmLoS7qqO3ZY7vYS2lmpZotJ9ZrdXeh93PTS+VEL1a9TSJHlAaVo+t
 /WzqWnwyodibLAZ1VXAnIZzTBexXAJA8sL/LgK/NKS0FvozPwvQFpRvun/tFesJgsoBv+xNOv
 EetCTNJRFI5wAZxKP7tKpMpQnunhkoRBE6ALE6C/9WoqUSQ5ojrhQ6CNZegQKZmyz8SCR79eq
 u0E4PTfhjRtgdXERDNPFy8Y4iOOVVAqcFtMS5z/gnOH/QGH7EkG678Ut2pGyxrRtbrqOhhbWZ
 +CeaNQ4YgSjD5ZMAZJjOW8x9aczLkq0A189gai/HtoGC1P4CUAGMd/82MIxmY34oB8TQZMtGI
 /ODlAXnFnFdP2MTu+pSxC/hn0LnYTwP3nglZn8XVGLqe2sA+7v7v4IehbmXgXM9bgyfvCda0H
 iot4JVQXsmqS5zmkcDrG4AaFd/926c4NGiCN1rDKiZaI5b5klEiXUmESP6mVTJQpjBrNtNjLA
 75DuD18Osx7v/FNX+AS/bUED573PxMspF5yPyfC0ipEcUzqiO2kIcJDgIoTIDxezAWQif/liX
 3Pcta/2OorF2QyOdj6M68fjBeNev+0KamBNNfq6D6ApbCBLz01MUpN4ZXWWDGr20FHrUgSAG7
 2yde+mV2Uhc6Qn5L1a3wiQ8ux8iNBWQKvEtpg0hYJGT7weOou540+8dR1ViDu1dYcxt4Zz9pa
 Psk1Kor75oRm9AsJRhf8jwlAcpDhO+8lzSMJIIbPZ5BaVrXUPv37xSAbrcGUwvxu4KyPiFgMM
 zSZIyICOyMzntsiQS1N4knh5fd/nrpxaleug0l+LpEAInfcrEJsMIAHFlgaoafjJ5i6OGd808
 aOyvkLwdsXDo1ViOCzGBAmQ/vBtE/sA59z7n6LwSFuDEzW/bY1tbwR7zoP4D/yN/mb6XG34+c
 4CUVN/gA2G/AwFpBYmOQFvxVw3kZr/EDfB22cxCAJxdDD4BipKzc4n0spSWvyN+FKpn2Azb7g
 obrZyX+5sVLda9TWyXFf/8hjX7WeTBtRi8uKirWg1NIBcH+SNO3jynOLy1MCy+AWsuiFZAmNc
 RHD9yO7sUn/91k2d2VTBjUxqTDaP2JfSATcttKOBe1tUZnn1LiUK6tI6gnJrlRna+A4jFYY9B
 hgKohgw5e/k/dhQTyDK+LXpmhUen3JKcdEAbpO/i7HVhpUsm0yJ9q41S9ZwpHRvS0AkVKc0v1
 tb5BcQanFrHwtlaDrZ6H4jSKDG26MMwNRY/XfH60GdWQD/BdUJR/nxKQ9aGqlFO/VilyLnHDZ
 OeBstde2sra3TxzOGzTDGlE16nWkHehOgRxtpiMV1m2nPsgMBbSaGCjhzgEI77nTRCzhgKYJx
 zHP1iPv7oSEOvFI+66704m8n8i8jnkLESjDiH+mdZVNmgWz9PrAnhYaQik0S/o6b8GtwLwXck
 G+kMS4qGiZ4i9t+LfnNIUekBWgWE0JvMEMFRe1arKHaavx5qQqiMLN5E4lrsTbo8c7371NqhG
 xa8MxHaNbMuYyv0F/uhbzVtDGr6lyxg8rkafJp/UEOjhW+/9GpN7OnRBxVjPAUSTJYS1TuJz3
 /EdgZXXWOuqeEaJprcJ80wnVysoE7UHR6b6r3OmbMVz7gTD60mEtLgfmZr+0XX4HyBnqRUdod
 Z8zhmSxydV+Xo7SsZDl4kXin8K/q5S5EfOB75YKX/LWLY7ske27Bm19sU7Anp5WrTWy3rNUHn
 5Q481/kJreUNQyIRjeXx5a2pn3qdxtMXikfbWLmGt2VQbFEq/GZZAq1o1CgS8Sp9Ex8zZ7dCY
 r3imz3RPaOd2RKxwLMdKT6CSimx4BRgZjI/lwzuF8i134TaO7zH4slVY7VTVlBXIkZzkZUkZm
 7VDye979qof3nlb4fgcIkHtyV+DPXd48yJypBbhyTRR5l1mNwV94Hn/4RLMz6B1Nto1N8yhE/
 ZwUB403ujlEhruv0kZbNCgko+zW120h/2EoOCcyy6RibGs+AUaGmFp7Kgd2rXht2KMYw1B2/q
 oBCfJuRMR6R7vTsTLNk7c6b+AL2hB9SNIf/NnCsTjvFZSFR69ksbjkjqKYljQ5T5B1nkkxTRx
 +PmmktEGQx+xf0VaLjoWRN3BAIa9oOXMgmsRF6lP2FyMo6Zz8L9YbjkwvBa05W4lZcgDa3HnK
 rIAB8KONUhUeV31nJh10v4nz6UU2no8gsGVoK/ry7iF5Vk0O97LaNYk4MEVMgnGCxOir0MrlL
 S5LCjO4jBcNoc9lKx3A7ux28QJohdAVpWVPcMwzwpwqA1o1lzNqxgn765VcprmZdJ7+h+EyRY
 aL1LXhJP1HZMNHuoGU1Wb9ZscMedkhwqCmTuVsAU4CU8edz403HwmFYmgzKZjDlfBSiA0WdLp
 Nm257JgSfLxAsJ+a0PyxKKaCWLKXacsGHiLcXY/cXztM+yttPx7an9pQCMKWNDw944/UkmglF
 MQ5a7cFayi3RtcaLWsljIIo0swmA+u2vsVLuSBVHNSLonuw4po3BNaFBZalXF64i15PTAQ9Is
 N+mk1sSSxAKMbYxltZqWH3ahdCBVQAObvNxn5b9CIlJ05n61WAQJVWaipbe+PNUZOGOdBcuNc
 PWi+bt2bplDvWFsHydkgljPQ8TG8ynK+tCBwzQak4Za6xid0eBGIdRB0hZVGKH8/6Fy4kojxe
 /FWLyDIf16wyBZQKP5o4j/0tf6SpiR4wO4FnY/CvGOBOF6T07su6oVFpx3AGosF4RXSREeMre
 fmjk8SdhCOcOqQPxfbMqkodlBtPuevGRx9qadVMM+7aH6hg3knHuvJaOE4+4+dYgL6shWhXc4
 BAg8n/6HGyDleckid/f2CE5e2srhdQ54d9eWkctJTDKbSpVe7XwMfmdfessIQ86AZWWd4d4A+
 RSH72+MKyPizlDaH1E7Nx4AocFtlwCqYbMbc6d7pccvVw+an/Us0pgPGFWVzuamM88oLzMUdB
 r3MMa/+vCFwypN0VUzbBJlTWW7s3PwHsdzyUhAWaphBOUHBfkAa9mnOHkmzfyY+9w4pd/Ndi4
 P+n21Tybb6mAUpVjy4DevDO0Wp+2VLNt3Us6DHlQUm2GHGhTkfFWcjRuQNxw7ACQiU467QzuM
 BuhXLBbHNGnkwSkx94n2BpdrM74MmVFFM6OixvjgQpMwh3RyucBvHgInuVrpv68gL0vWM3jvC
 dTx3auCU6Qk25ejOh+BONbMzq5GeMBfzIAiudYkoSRh3dCjE68yzIEwyCz67AyQF9C3f+c3Hw
 StJS+Q7un7RmRV6LdkoijFlJWjYjNcBp9AeVreCF8ya7C09KiXVeQ6D9tahLN2utvpqkFJAwi
 JSnM/et5SgSlxkujQ8NCwep1isQ/6OhUmGj9TYJSUdTZcOE3wheV2NyoUt9dC9K3Up3o+MzhM
 zB03IA3sHvTlvLIxvCmr6zSYEAsZfTd8Xf4gPd5gDFdG62ShmoyT2ojsZq/VoSox5YYWT8O5q
 s85/1rI00qyuecayoJYKqQTuTVQn0HxDsy0SJQzajdx8xWqg+2tA1TrQmON4RbNcZVS+cXdyA
 bKhRm3UaVWDhizP6ta9o/kC9XVFLk9b2Jeobo2phOI8pKRu3Fi9pVVh3U5zcpI4QLhGUYHhWF
 w0zzBF/rHYViceYnAiEtam6neCDYt7c+KhLFPGZvOVhuyW+Z5YXYnMWCrj6gRAUHw3jCGFqUj
 0xgcLjUfJ51kA+Psv7y16+EwWAm6Xw5hDceTNkikrof82PAugV4x+CqFmpcY+X3JbrDxWUMY0
 Aa3HHpTtONZlYNLBnB8TXvVB4xXFhtc1nRSE5EzZIw9FYyp0o++JIrwDcxDO/bdkvEsziH8PN
 I71j87C9OkJMHYHNJMLDJPkngDJ7uhwbAYFmxOacFwESIXDyW4kOlapvw0SNROUbmz9azKGHh
 TgrUI9gPmlfeBX5W9uhjWHyX6PS30BCIZz1+VyvHd8iRCqb6fKb7twG3BDJ9OVZC3MPCcMH9G
 pgenMf3+7Fpm81aEZVdhRhcjl884hrAa+gINNWVqizRW14xMtP606r+Nn3qaUx6VqgMEFn9VK
 JPwW38SToNH3qN3CsQvN6J3oy+GATZNNszCLF0Sfqgnr8tzNX2/TMdbHye/VcrklrR+s73fRl
 e4JqF3WiWKX7J5IRYplsLiNg3PeVJqfddj4evnZ66fQlIEYuJuNU+MkRRqsXMhSHpORnv2bEe
 dXNbnv+9hKd3YVdK5fWBzXcwV/r27e+TLj8GdYRNN3B0HUIJL9zcc4mzmm5iEkWN4CZP5H+pb
 lDx0OrIeMvMiajv+bqwO3ab9eOuHDVZ3MwRhdUgDMW07tH025L48vXA1q/MZqPF1aEKeTBTcV
 aT0hkUxDYSZHMnR0nAwuuTb2+uh5Qw+DEtEdWQ6HuGGZBeQX35kKzs3ASKcsL6KFfWgkCzwfx
 SfN0UcL7n9ofXe8PFS0+SxknmD2BNQJfqencN6NRy0zkbTa/e7BiM6ZNBk/o0vnRZaL1uVAZK
 OY5RCGqhvYP9EgEECG6KMnnxwPdC7CzIXlZNrR9SuLl0hhrq67XBLS3MP1b+hjm6VEgAwwekR
 FbgCAyyiZA7e8+qpglTmJiql+n39/e5JTlBKvcHt5JIXk9jyJYMsIElTD62OCj8dO4i0pULBm
 5M0cJIyyDsuSSEc3gpsh1ik5upJwxkgGhP0zLJRFX4kXMOL7uysc0hwPHKpqveeHr7r4MrrkD
 n7TDawVTYkZoT4hOik5Kp7kc0wKb6REaj18lsCdZI+Oa1OeX3dklzsE/0g1zKcnChoGxK+oXp
 Pa188v2CLnhU9A4fOUYcHgB7zHmWIWsbVmRCc8xAZBOBbPtvhHQ==

Am 05.01.26 um 18:10 schrieb Jelle van der Waa:

> This patch upstreams a part of the out of tree acer wmi battery
> specifically the battery charge control and battery temperature. [1]
> On my Acer Aspire A315-510P battery calibration did not work as expected
> so for now this is left out.

Nice work. There are some issues with this patch but nothing too serious.
Can you tell me more about the calibration mode issue on your device?

Thanks,
Armin Wolf

>
> [1] https://github.com/frederik-h/acer-wmi-battery
>
> Jelle van der Waa (1):
>    platform/x86: add Acer battery control driver
>
>   drivers/platform/x86/Kconfig            |  12 +
>   drivers/platform/x86/Makefile           |   1 +
>   drivers/platform/x86/acer-wmi-battery.c | 345 ++++++++++++++++++++++++
>   3 files changed, 358 insertions(+)
>   create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>
