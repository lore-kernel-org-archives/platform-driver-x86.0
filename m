Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768B78F4F
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766684645; cv=none; b=p3SUAoDznHA7MtFJ/23OZZCkvQmosIoMrB1xrDrSLegHuje2anWldFGZQjmBy4Pcvz0xtgmiuK9mN2tnIXRhc/FIdTHZj8brF7RR+Dy5yGswKTlcHA90Vo9O2tqjYORgHEt+VU9ar/8ZEwHCc10nsQs/NZIXJOcDMAMBTaKe0gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766684645; c=relaxed/simple;
	bh=HNMhAEP09l1eMqeIWfjTcGyHXt4HluYRr6L5nsiVrdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JknA1I+I5sD2Kw24tN9O1h3N18T4PO0X8B7WQNucSEVQflfZcT+/zeJbF3hoAnOyj7zgTQ744zREpcCChRkbQ7PPoyhL+LiqLoehAHE+JgGcM0keMeXyuQWs6A9IZ0bCBxgLHDYP8fIlTsLBGMpe1XC9IBVXiRUwhBQdxEMmh/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Tv2LCGcy; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Tv2LCGcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766684638; x=1767289438; i=w_armin@gmx.de;
	bh=HNMhAEP09l1eMqeIWfjTcGyHXt4HluYRr6L5nsiVrdI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Tv2LCGcyeVcpWTp1Z9NEkM7ZLfEPHhcy9dp/5CfZH9D3aa321Qf5bQzcKRh3Wf5q
	 8hixfQV5YKn1460mo1g/5KlBN6E9tvKMrZmk9WzW9iXCLJhLfRMCAIlgrHkfZUt0a
	 y0kdC3MTtnY9YpZLnoapVnq8ViC5S878PbQzk3xBG9VPkW8CE0N7VFDCthtHuBfmE
	 mg4IOAtrxwA9XiB0jo13GE52JmXdJ3qMBuLPYhZsaxKdiyGwvxIetnLRdamXWzj1f
	 nDMIB64F3YqT4rTL9CKuU6GBcoNvaGJznnSQsBbpwico09kDZs+BeVHgGJ1foYscR
	 McQEHKh3Zo1QOR0t1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([5.61.142.23]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1vwVns0Cuk-00zlm9; Thu, 25
 Dec 2025 18:43:58 +0100
Message-ID: <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de>
Date: Thu, 25 Dec 2025 18:43:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Pranay <pranaypawarofficial@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:IOBPUI3B6mJEbLr8UetpjBnmCakfxucSDVgBWjg+A5siKpkSD1O
 DAU7a1pRE4javMkEH1sx6dpSQaRJ+reH4jQxn9KI+vBMY/RcnAR0H4Eq9fZBG26MQHcso4Z
 n0vcQZUSGlv1Uv8nxSVwy57e3HkpIe+sl+ZSf6M+wUUb7OY7nwWMdNSY7Nf4lrGD7e0n2tX
 ZUjVgVwKbrV9Yl1SELJrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oCt2l3BpLAs=;5bOxztAIcD9mmxoCrxi85SUb2Av
 5ocCAobZJcJMxxylA1IsupQLvPDyW/1WiQLl/yjHwVDUJI6I7RBHLWPl3v8aKhuJALJZoqGv2
 iEH69OORkcD76Ur4Wf8jzhTgnVCoghW3LHkU3wDvvImwRLMFX6M55x7tnVH1ZCZKvjY8DG/cs
 H+teyBbh8ZHHiaQgokzmw2df7HdpIGU4qPm1njyY13mbjbapJlyN+t+bqZy1u5g7CZGFlle2f
 aQT/vZ4VPPRh1xe/pDugUSX4guEE1Oqc/McNlPYCvUPZ8Nxqi/ssE7TgYCa2/uxYyXZN8wb1N
 3VaSqes0LD9JK9dOWdSHbZmZBNtAw8XfevsFnCJgBaglzEHdgYjPM9Y3DdCubZ7w2H9XAPhRm
 XU/J/+8i7TpifFZK3jvk/avV5FTWB3fnlJQtoJHPJzoGM1nOhobg+UsPsfrh/AmkIocVXma1U
 i0odIIJr8n12/EPvoRu3atdyc4hVeeemE4F+rdUGXYA62RB3B2EYhq3BUT4ISIl9EAi6KDMZn
 3AnR92JZcygBtPyyfyUSRbcV4OCbJZrNf4TLa6hqLXxu7fqkaeoRsVIfTnPWe04+TzaNfuCe3
 asUShJfJZ7Oz/5eavN1PM8VN2sAsBPMvzpOSbyT8gsB4wEZfJAxRrhkSWGTD2Ukk2n8LD4EuC
 oHnDyer5MhH94oOFQCqTH2lnE30bbLfNkBwtF1exZDrqrNgE9psM8Ow7+vbhVejorrepLEwa2
 QryKVvDckCZIcpan5IInIZB3Ip6iuOQ4gI8B33LmXsEmgM4XP4caIEbqXpU/UGgNgJNwMr2Ic
 OfzPVoiGqDBU1X2+eDUhLmjKPVBdbuK9REQxVKfw5l19xW950lckwvYwDGVMt6rlN9nbP1Sdo
 PPaQNmasHcBv248YKSvnoOqyhOj+ZsHdGs139RqpHSRJLa2AdMfRkEMk4rtRTrUdsa/p39VnR
 SJtwoqVXK6A2mLKHtRgZTUpodU/Cy2t9J8yqnrHO/6fBJdZhhnw+LprbxsIzdidzD3cxHGAg7
 TCBuA8I9Fn3m1oilvTY4gS8ZN7a2ZWOKCckta/WIR3OpdAgabet+/b9RbQxzvO/hVgE4UTT54
 LaXw+Su/cPD6hhSqo4tfHgNh0RiWqRYNv9V/yPnsu2abY/KdlwMO4h2bAbMqoQTWhdvx86yIJ
 SuzzgHQ/HiAnF1De9BpjAtpPzNmDSbpUnj9aA/3ZtZJHmNS+JkjevJjD/unA2aeW4WC7fXbIn
 TrJeX0mFXwl1mH16+7+UVw291LDK3ktu0U9s136diQsJjHQn/5X9wjA+OHIEFSIo8924/LdBc
 eImRGZ9PfRkyEPrM/iTEP+360Zf8oEg5dakXhM5Go3suAQRku6tTY5rQqLql3kQVugnJxNLU+
 eorlNdyDlaobzRM1sqwqlaValBnf/lVkQjh0xdgObuR9kGWFf8EbTfhEI3D8tk1IL+4psMS0N
 5wZ5kRLLpKQXS3KoXgjtnbTOu9qDwZ+BAaDOmO8d4zuN014pd34mCph4C39/uPXJBHuF/t1pg
 WLeaFabD/xz0PT0OLaPWif1HU4scZAGsqOYzOBv+lRdc4SOVTovysVKjMIoNIBys5O8CrrJ62
 LgXfiBsBZ8SFuNUi1SdK8BCz+pWn+8MUUfQco2Zt+AvCUuuhrRvmvj0arWOwrzjwfn6gKf0av
 tsz1dhD7tI4nDRPfRFt4jDTim621yuv+q+GsNXzGYyplaS2h4wfJ2N88qt0WIU9Y4sptOZkIW
 MHl7l2QSm8mYgzyx2qpu/lhzoWZEeea13fy8bBW+8OJcGjTac+MFu4nt3HCv150mBIk6KtBoW
 +YHp32GoLtAbi/xsH/TUaLoXN+4JNB5We+dLGHptHqZCT+5pDedVcOxnj9d8MxxskPA8cfmMs
 MADFXyRRF+PCRoRpxLhZusa83Uh+q+DBvBczNfeRj91U68KNxfzuJD+BTL3cSqd4YyQ2Zb/Xb
 WbL0XOXKD4KKeAETE2lmfIFCKoE4/Y6Sw2dOEVwcF81lH+Z6y3JZbiauHUY+bbKwHSOHrgC5S
 p7hgOyeIGIqaGkPiv7O1Zqotncoa0vdz6vrc/jA4N1Mw11fOTHNJ1vBXZiYep6kaiLYttpQSe
 ilt/0fFyvmZaKrxj9cfpvqJozUQgWqOZvNkBFdfF3jFvRsG/yuGDjK4HfVVNpXcPGldLHym68
 mNuTI7Xp6pNb4kUct+2+3L14Ed4FV7liCNtY5XP/BtN0QJHtK72rtfrWlYC5BOFo3uFzC/WK3
 ObNNdext/r3PrrWcG2MTizwAiqjFC3I5vLKQzg3OLfvfS7MSwXqIks0VBJkAnafxrdn/EAGQI
 s7LU+KYb+pwYNjtL49MmoNbgr5DLHBwsm+7h2CkdJt62N6x0ObuBI1M9ptGwTUikyQU6Ss5lC
 U6BiRo416B1JLE79mKXT+CMulJnioZXnNjEfFod1TzX5LKsFrwL4Zd/e2aorrXpHNFL1xDKoW
 TYeq2OFCYyqXoWJ6urDG8pAZbEQIg2A0nV/AzXIxquq7UxkAvNrqmLW0Si7SG8ZWx5lYpp1qg
 9ADdEp4w7MZnJ1mkzmEPjlOz7HV2g1uDWO4m5bJd0u6/DWDW8Xyg6RxU04rk/ln/kFQXRuDUu
 kF3HclOm9OdQDR5WPHBfi/I6UqA6nxn2Mxs3xi0uj8iChcYHO9DMJq9Y57GVTNqzwusFODSQx
 9/Tx2av3D9MVKdix9Ils6JNs4qKa42cJt55KvFXjc1PG/6qGpWsyQQoHNTIg3iYzYAV/O8f4f
 cM+iX2h5nBgG0x8rlUabWgKQmU2cYqNRyQ5Aah9O3a3X5qtWcrBa27NZkJncuBnyISsED7fwy
 AzwPBUfPAQoL8zrDFgrtPf3Zwt8IdSfpdWu10UkVHymmkk371MHKIK1+5T3iyJbCFLI+X2NDi
 5rUsb7dgEKZmI6bgEs3nyC76HjGPBmNBfYJ39LCxnW52yCCds6r3FkoY3qrzpao7rly7BzTwv
 eNTRrar3thhKw1HXi1jyT5howvmcUXMD96IrUNC18mV1aihk9lS6LBCEZO8EC0040llj96Db6
 RVWXlPMAmVfUEsKlAsUKto0pZVuuJo+A1J6c9OjK7kfNX28rWCV+btGHllgKRPx8Uz28Po3rN
 7LPVe4ZmPHI/2RtA01JKqEXNqyZRRnw+0/zzOVG6H1c7obhNtrfpBIA0tz2xFaEszYEFNd2A0
 qn3jPlto4eqeqBlin5DNZJaN0TeUW8RBIZQfj7S5nfBu7OyrprLrYyocU8mV0I+Mt6jqJhpZ7
 +MdiXlelUSuagQ3bn0yaJWj45ktyBkpeH4vKC7GSxCknELQqRSZmphrVTOpBSROh4MVOXmEa2
 N/GX6Inwlq8jjh++6zmtExQs/+KXeNU6PUNbkH7mfVDHIXkSxgaD0+aon8if5AaglreVK9rL2
 tl9B2OOvYbw8D4QV2R1FJgg4UUTFLmDS7iUdAPyLp7bvOic+TGBI4TKLn4a2haIX+Z0qfpVI1
 Ikb72hZiq0siWKCAg1jxIO/wS4/xHp2bIsPpGMWobK3F/tRkp2J2Q6kKUia9ehhTTaOgyn3m6
 OAuf20FkogsiQBSYJMviFvJMPN+AmR/Gi7PG+A8XwUAgsPJuBDv4KZ9AUMaB4Negl5otqoxfE
 VQcgvGStqzSSBURsDtGTYpnQ+vIoWYveamzxmfcn4jrcW0JEAT8LvVzo4HtfbtMJah/2hVYAG
 y8FEg/gZVHuwpjM5DXQwoFybBZlGAgamkCQctxRdRO/TZ8zrccwQc0a4wKdgK/3xvnckEGDzk
 gUA2kclWmsddceI3xpyoLcY8rg8X9AGhkRtDisjwkeYG8cjl1OOXKkovtWAH/Ur9dJcXORlTB
 eyT9Agg7d4aSWG00vUyJ36gm8NiGY1bAEgXzQ1mT2U5rZPg/I5ADPmdqGlwf5n+Rx0hymbqVD
 +Nkz27P3fo5yz5jjujzDjX9wt+/fPvf9gbeNAn+VFmN0fmuIQ12WGG8mRKwmkGqZlfyQddU2J
 EbRTbFQTdQO0SjW0BG+8HbUunWaY0S40vzDyeKrC4IM732/U4D40QkaQh4YlHOGPd0+0G9NE7
 V1/+uqWizPSV1/MHL7QWcnVOoYGMDYLZ0BhkGMkTUF+BH5pOxL5VjHNA95BxxRHD1kwASzx+J
 Ksx1iGVrg3TdyVjrjkzX3vrkLVHo8d/HzyphHPrcIkTXLKGtUv9fieREDJG762gBLvTbNHBEq
 nYJqZfQTDyW9XXNG8K4EmZyDhCdx/1OyzRnZIoECsVvOZJ7wcoLQQJXoMDFvOSltwKaRzVMCl
 CyCIXs6oPYwmrJ8C9NXqbbgvjU+TVAxvi71L3ezkPE1Fg6y5oFRzcC2dIFpYQ83DbnGC8gLwH
 m8KMVkEBhSc5LmqoF8MzjfhnklIlKPIyCa5FU8yRW2YXhmwkwbPMQc+mkekeyFvXMQMJoVWgE
 YIZ0U21zpqPiwh7eWvMpatRaUOrh8/8vCeTzdhzGCkNPfifkxhRFLDoP1U0JVItcLADiLJbkv
 QwTcw+i3PBglBCjM/5PZivCBA7VkOLEFR7NYv7adZ90Rj2GXk3jAZc4FnAiy3fbJr3NjtDn8D
 6vIkkmx66ELZinrGTS8AcdtEIbJ3CjrN9muXI4wE+ZNS9JVafMo01n2NzQwMWC7b9pgUNotCb
 +fF1ent+k1XD4w6ryivR9LwY2WiVtXpf0e79KhJHnhagGI9o+mD3jKLXGbLcK2L7DezuZNi7Q
 ZHdlsXkGwv/3j4GZDdy7RdXqZZ1hUjj2QeIKXMGNLl7G/Uu+ajTSBK+JMcYoMGqs/U9FSMCNt
 1Z4MvKHDA/CNCSBXP+mQakhWsDgXvwZuqMkShgWI2Vw0DQms2eSk6nBJ0z0Tuoa7EQsEklXsS
 UqhZbsEaK0LMpkL4shaX5cyES0+T7e76BtZjU5lYIsp+uUJCbYD1fxdDgVPprMngA6vxvlQgP
 PO7tn9TAt/PVTMcEYgeFhtP6lz2h5yse56j0d65+rQdIjPeq7aunqALYkvxlTY1mkyRiCFv9w
 IMaPwyEs/ZBMEOzV9sHmDvJ4k9jQ7d6HYAKf5Ez5qRAIqvgH2KCcZZJ7YXqO+sHZFYZ/IfSc1
 DJeZVJiPK1PhxV3SI553ydDCH6m+FC01xFrWhviuyjRdwNOyLDnhvjIEE3i/GAOMd3JkO7jKE
 eZ8eJhUPS5EztwZfS4mIkJSHZq4P9PXVkloneJ

Am 24.12.25 um 20:40 schrieb Pranay:

> Dear Maintainers,
>
> I am reporting a limitation in the acer-wmi driver regarding fan speed
> control on the Acer Nitro AN515-58.
>
> The Issue: On Windows, enabling "Performance" mode via NitroSense
> ramps the fans up to 7000+ RPM. On Linux, selecting the "Performance"
> platform profile boosts the CPU power correctly, but the fans remain
> capped at maximum 3500-4000 RPM.
>
> Observation: This laptop model lacks a physical "Turbo" button. though
> there is a nitrosense button which is useless in linux.
>
> I am requesting that support be added to fix the maximum fan speed state issue.

Sure thing, can you share the output of "acpidump" to i can whitelist your model
for fan control?

Thanks,
Armin Wolf

> Best regards,
>
> bugaddr
>
