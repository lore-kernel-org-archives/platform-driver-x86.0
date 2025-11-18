Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63F353889;
	Tue, 18 Nov 2025 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473391; cv=none; b=PJifXV+dSRzMHImnRhGN4kRvBo0EqY+IPvdJCtFMDWwOuOpLLaL2ykH2aCXJfrhyPMYzI1RleUu4+IMhmpxb6qzLaqoePC5sjeo6RvOjtECHYCV01aGznHXhBzFfUKEdaHZ4jgocZp5YKUpp88RPy3flcuARk8AMJvQHg4wkaAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473391; c=relaxed/simple;
	bh=zVH5hU74VwWd8epWChFsIrph4BBzwzDlxygLeW3/5vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfPK++gvkTjoV6yAP6HgnyTfl3JB/aBfePTa5e8KRgIRh4H4+WXKzAiNqM6u5xLU/kjzERK/lUaJdORpEwoDrV9UnP+72Ie1wP9NyEwUKBKLtp1PtaoHHnantmUOFmsHeUd6IrGdbjQB3Ob9+OYQ09PuJduiw0ldm2pBWM1EkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IpLhaSgH; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IpLhaSgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763473385; x=1764078185; i=w_armin@gmx.de;
	bh=zVH5hU74VwWd8epWChFsIrph4BBzwzDlxygLeW3/5vI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IpLhaSgH60TVMwjDX5lONCGU8qmHWqEtDEHuIa6VqsgJVkEdU3fDKDWY0Wu4egAi
	 djR0U7YJeCl6zxZ5G/mbHbJPx+LIO8bvcqBMRekHAqE1KdrOsauwREot0URMp/Lif
	 VIt/d9AyMppEC24dNrOSQ0z3SunlgByYqakmeYddICA6tLmaJp2ovXAoCrwACjYgG
	 hH+JcyUkzLesv84/QKtVz7NRr0/lSttc/0HarG26flvwTdc0FJUYYpeDBaQZ0z3k2
	 0q03qUCd/K4CvmnSRk6qeZSJLucOOvdK0tMXznfssFmQNqVItP9ZLY1IdZNy0MGI9
	 e4DtT5NzHZNUzWuLhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.178]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1vkHLe1dSF-00YJGr; Tue, 18
 Nov 2025 14:43:05 +0100
Message-ID: <9f03a5e9-405e-4f14-bb1c-d9ac9b6d920a@gmx.de>
Date: Tue, 18 Nov 2025 14:43:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Start of Upstream Support for TUXEDO NB02 devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <1ce9d218-d5cd-4821-b224-b52e314b7027@gmx.de>
 <1a4d41a9-c3e9-48ad-a47f-661f38a1c443@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <1a4d41a9-c3e9-48ad-a47f-661f38a1c443@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dYnB6ZxkLKEwCBjJBKdByE3W3t6CfHmnevJL6uxGMQPICJWmLSx
 oo8y4silhrymm/xFTbLoB2HH1XronyJlX8i58No021U1kHXpEtuMIj4htyH2FoQAtDPytGh
 ZTCyGjc7nGMowQTFtX7Dgmsl8Uy7ugxWUzvZ5TbSVMkkk0aDD6fJfGYupmfAgufTCJoXmKU
 pSfrYF3vc36Tcluw+j1Mg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f4Y/7q/c9Rs=;6i7KVJlxR4VWEyndo+szTfa877I
 nHHPsWsWMgSv4CtrB1fYyq/ktBJdcd8UAG6EyNgAUYkBZ34/6cGqlbapSoRVWutAJTVldnd5A
 RO70A2Uh0mlaS7UGn1dRC/yLkkqGghKazZT962Jen+XKsWQgyjJqma2VsTwEea6MONT6gdpdu
 MOAuOB8kgSLwz+FHYnnQc4NEG+kEeV7ujiEA7gKLcjLN612xYwWgPQRz1gMY5BPFcVJnQilpm
 556n4B9w3nqzgH3YTEvZU1l8TvNanRBAKQrGhrhNwRB2D+kCt/Z/uHxB58IOIEWIuW5lCcT7e
 kw88vK5VJL9o12OqMigCI97aZkgnhq3iTvi5Vi6F/q8nemRNN8HFu88TXmMF0h9MLaBi6BuY9
 vM1xYTBh1dfOnMdd3QKxentv+jhxowoDxCIG9hW4b8u7Uu61XOvonFL6QFFxlfJ7glDePUWsT
 r8p5EDqHpxdn13HNVvlnlYgTADuJGL3ZXpxjoqemd5aXR9gjPta4uMw9w8RS+rfyS3W4uyZlr
 wAr7w0KFZdzjVIrKayfi3Bdudwsuw5ydZnmOID4x7+goI7UkPnQjVOa4EYB9RyGsM2hG0p220
 wK50L8OfUwgo827sG8MkVHugtirIGh2+JDI2r9D+I6JULgeE66wXUgZrJzjHmIwOLgkVisocR
 wDaRu+QmTszfBauYbv1tMJ33hAYo1TIvJaRl4WhpLO7fATvqXxGIaoNUyyHP7/S/xJmlZOft5
 wiQcPyJPHdWsWQFhQBCRtjghAZpZF9sg/qya5kza+7z6L0NZs+sn4VraFSLesXQk0Cpc1KYYA
 P29dqnQ3Rm5dkJNrsQbeTsVL/+oC7jDOZPGtaBufSPfA2ow87ejeUk/KxV8JWu2uNJCf0Y/kX
 RVCeWzaiwBa1Ar1ifmO9Z8BVrPgDhIrbebxbbh+nY+FOzFoIj9TO+cKvhLteq6QWTU3kMdBDM
 KgCrsq8Dz6/iY+6y5FK3kqn3WH8h1jsfkOyEOt9CTfCBxVmIOvUiv68A8iT/4/uLlyA+Fzk7F
 COcTX7ELl6cM8NfDlqD0M0BVOz/JXeeDiFhJVi3YKxrsO2TdONiRbPGkdVudHu9Wugznfgc+8
 epgr3TfgnIohI/0l3mLP3RfEhoZqobjtytW2yItFXFoYdpuECEsqGOuMxTiW1n7x5TfF5wr97
 WDw4IlEDjpCgGdhlVqKM952aiY67C7cfy/D6/4T6RaKfegAcLSRalcmvpPmUWcrpN96Cm7bW7
 8VYosJ9FDtAbVcMgqNvBlkwIDJN01Q68Ahyah87XgjCghgMTbWLZQ+FSp8ukVUqsYsuLjEQAh
 q0Z9ahE30QtKvTAbIf+peGWxd0KNnXOnQv9knXkUwnLdU5Zng1ccD3QbQtr0w6UZU78ml/D6V
 BzFt/qxqdkunesxS6bkrmrpSOghQlE9qyB4xIGvCxBoDc3p5zit5vcnFCcxAC3InRBGLYIejJ
 rlWoqq/MJl5vHd7FDrVp8VnG8WIE7t4E9OGkwTZRwmq1XjvBNapZqynz3Onk2Q0IebEM7gWEW
 5HI39iTQE9AW55sRlWzWOIfeLP8hRbmE2WYhT6CBZcQ4zSOUzKydhTsMW9LFNyvSU+6xBJw+/
 stv2udqHSfgJh1MGB7xTbDV0ocJcFTVlCxmK51nlnPHybRRHmCKWBIRML2M7TTyspjsqYCjW7
 Q2udgINS+fPGTMcuVa0rXDh3ny2vlSo1TSMyEPAtnOd9EbJK5tSNrHRp6OA4F/C7E8LqT96EZ
 9XiOMzBepbpSW3hg4X02nr1CyJ8hAPQbHjTbcZBhVq+sCAt65N6pskwXMslIm8CZG2fqIDt4w
 SubaukUgS4QLOTVEYNXgnV7+UGUSR17PDikqyYt/RulVpK0qepYzoJjSRoch2ItH7Lx03IbAb
 RgKku9/3tKakBG6o3W+Dk+sZYYGrXp2vMx0Xpj/UpJDcYtIG3Z1A/emhA6lnA7ojeV8ZSTXlK
 oD4TI+GjH1oNsHVGxQQ7yCmBsoElFonmgBFyiWsOU4nYnx8oHWhFFBQ/EK2hlRP6LOzVoaL3N
 sQJaNKK73vDPbMCU/JxPpxqgMDJkTrTO0/ADQty2ycSuspPGCgffshcQ6D0n5SWviVfOLIeQh
 1L0Rlu8QJrWwPbcIigRtkBXdnY/A7TzLAzQVjRIEJ4FLYKCWX/8lJP7MZVcD8GW1S/NW/PDwI
 56+6HoP5ESllyzb2P6vKcQA7EtUhgs9RxF/G1K6FxJXzgUnEHguY+kaluiZ3yakpGkd7j0Efb
 3+zXp+sCLnEcH8zegy/34QGzrHkaqeuO1AlPZIqpErTa5faF+DCjPOLcp7c3w0/CTJTjfuObi
 5E6DjjLN9vbWaaSChQwX7zZibEF7gh5BjWhxDaJ5clQ4PZ4cB54YbHqVeIC3amBHlMgJ08w+5
 CehGKM0IgvusyQt3cD21oOrK5xUfVzquL+gpHWEDpQ2iM+CWq2tLh9O5rJC9SeNAaA1KisSIA
 y9vxqY+p7i/NOBBQPHs5NYmsYTK4vVO8SsjUNt0cyM218mB8D/HE+J2eOtupbbYYjuUN6NjBY
 ME8ON5rTj+M9BacfcEpnbwAThJ+LkkCT3AIVYAnrgMVKXmLQkCTeXSEKDg1i/n+8WT1zHcBq3
 uD8BdHndtBAeTESjvXXGagm92q6ZhlMnb0gYSt4iGXIC2MN9ObM6fYRRlp/gOuGiycLj59uFj
 yMUlaktLL8pl1l909c8W+OsGyHqWUpQaDVF18hJgMWmHlomqI0SwL6kRSMYJ7pOO88oGU4QGl
 sT6lN7aEHtDcx+TOIF4UvgeLnFpYMuWB3kCch7KyigM9c0yXF0iAwJoeA4+hcLfA2UwiydE0l
 zHVGmI8zDPtNG6cEllgUWSdtKI6pzCWTQq6ko3qsnRGNQ/ILsjpp/Ei53fbIFLLmeafZ/X8rs
 MaNPtBEDI6okl54JV5p4p19VVFH+CI0RAEZCM5VK3ywXT1099+bfDE/d92aol9XGRUcGYoLoF
 RSovPFdiFfGN8feR9eS/exG4b176g/gAVwo0rd0ChyO1xaF+smymIaPLKC7fMEJC2UD1O4TW2
 uLrT5Wf61atIPPl3raM3lrtBSkr9rd2lXHA/MZHMpIedBnGZt1ZBIUyJxRKNkObEWAfeZr829
 SgxTcU1N4+jAw3GQCCB/M4Igx7kFTjmygKi59j+t+WcX2FYEoTp7DkvoP90GPq1hpe7KNmu5U
 uI1BVJEtnu5RXqXDMMurhb9eF+8SfaXSZNSs9sfOLlrbNQru0OSanH4DYUAUhFBNH908boE1F
 fN/csD5x+dE+FWD7YMFqXwh40HIPB+ROZcL4etsHlJmo6I300d1RiZ5hMu2ftR2/04kwQEbxY
 QLVc7ybadCfJ3wJvyjpqaiFXbwI0GA2i45M5WZ7MfeA36UsqadkVruVCF3EWejp5USUw2C6NB
 rcdV1MvJ8HHKEflH6QI/ASPXVh6VUaMMai3VoUhOPv8hsWB+ieiYl5JBut0L4DGU0lGNlp/ud
 AD31LnaQeeMuDheeMALJ+bvQkzPgBQyUH80k8aoHASlwOYrJynzZYhfEGkFMv89XvCfMhiyiM
 Ey+RzyIonvIW7qPR3+zp+24kOKtEjxrsqWGcZRu0Kgmo2r5RKrob2mfrjLgDx/sw7KLsgb4+6
 Qd7uTGw6VQuTrvgqUSiNo51Cs0yoIGo1mpRaPRdFCfWj4cXXNQ9+Pf5v3TQ9kDJzDpnLY2J1u
 Z3dZZ8mGmzrrzjZJzEQFpW+4O2M+ndkeDweaECWmXaYTb3Bp59XNoI1U8YCCd2lrFX6iBv2g+
 7La5WnfnlhFDNEXZbTyaIoaGB/j5aBFmLZcYkW16Wqgp+BbGhyBWYjsCG9iz5LwrVlIa1IhKG
 JzSQDf3nlxDOHhY26BJNVwcEOO3propi06buRhjtCU8Hor+y5cXh197ID0KzJnydKhM6GC2uI
 4LpJkQqpeK1HfsPTf47gV1KHlCSLnpB3vTbY+FzsSQ9HzJAfeYS+77EYuRKoA4Az4Imlm0spx
 Nt2nwuHnGF//ApGrJ26qNRniKbTxHsy6DzWuLiuQP+F63UullCNIGlIB2CoNxGFspeVoVenTc
 0QTmjLIzQU1CCCXGN4NiWmY/3Y8/hmBImrn2wuawBrVB0yxw7JN0tKqEljU5lLObw4dbV5ItY
 zFmJYmARIfJf2LgDMXm3E6Ice2+QwP282LN0TIZtNEAVRIo8tuJhwYnsLH954IkYsMSf7AjVn
 IslyTT5aQE7I3GKxAqq0lkbIwM3g2/HjnJ9al+CpOZ/HDlxMwH08KFZsDTNa4Qdr5b91l+ag1
 JbVsEqaor0pdrQe6UXOLI8zbrzp60eVnEVm+kGvTxT6bSaQyq4YVYlItFpRgAQcijNDiS0TFU
 24tO35C1OBOuXw2wlBZc5gX3grN8Wlru15X2NmCrMAozQWemOn6eoyTQ+pgBeF/tlyCuBbeT8
 5Q36xTIfCcmOskMkBpo9bS6QSUloTNP18FNZE+AmdsSt5cojZpvfkBAjm794SWww5/bhP++qn
 jP25ZkVeABwSDZONLerwGPJlOjeBXGwUCq99+LgRsB4sAQZMtokVgoYuvApmRLVRcUkWPz0e/
 vbH4kVIVu9W5Kygs6bcfxBCvIEiF83MVr8XPyp5vseeIsFJoQGoqc0bwyMNycZj18M1bcDJYU
 VwHAebKLPO46xPg2U4sqvkjxKErDSebZ62LF45G+VTcoQ/r18sAYq17vq9AqK6KlKb3vCuOPv
 FTSgWsaTL60qvuwaujubNu+oT4+57wiq1rNQfcDIFlnXKiEmzSXNUS5UE5nx81taOsM4WMNgB
 wfqcDYbKtHZwhNqPgBEqq37U7tM9iEptAxoHutc9fvMWnuTWWtvhMlrWqUAAsT5Hz67VAuJ5p
 iXltatrH16QoVxW00vA9asGMRdOGb4EGC+IABFdWAZtYR0G6mJqOxD+HZg6v18RdytvlV2epZ
 VxOcPqSXv4/e+7ksL7RAHAXpAqjCT3JETsi74TKnHuPKKgD0p7UDBjqAGL/75kz5NpWacZcTM
 bnF0ahaCDw0wd+C/Cvwle5LI9j6AGmRbS/kryA/bhsXdlHKR09Ymxij3jQe7Al/u6ueMp2eVk
 qDho8zqrqn/eJiua25KIjLSOY3cu3Hh1M9K9wIx9vQzA1y8BCDI/+CdBAFm1UcFxvFFfsb1LL
 XqcFD7SoLY7GLx/n3BdE9VNxriP0mzQ5hC9CYo0CSnQ18noTM9sj7TrReeSvrxAgvfxRP/Fhs
 +ZCQPst0=

Am 18.11.25 um 14:42 schrieb Werner Sembach:

>
> Am 18.11.25 um 12:31 schrieb Armin Wolf:
>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>
>>> With the Uniwill driver from Armin now accepted I want to push the=20
>>> first
>>> big addon to it that I worked on in parallel.
>>>
>>> First this adds all current Tuxedo devices to use at least the input=
=20
>>> part
>>> of the new driver.
>>>
>>> Second it adds a new feature for cTGP control on Uniwill devices with
>>> NVIDIA GPUs and enables that on the TUXEDO devices.
>>>
>>> I have not yet enabled the other features in this driver for TUXEDO=20
>>> devices
>>> as they either don't apply (Uniwill did a line with Intel that=20
>>> behaves a
>>> little different to the rest of their ECs and that line is what the=20
>>> features
>>> Armin added are based on) or are, as of now, untested.
>>>
>>> There are plenty more features currently implemented in the out of tre=
e
>>> tuxedo-drivers dkms package that I plan to port over one by one, but a=
s
>>> always: No ETA given.
>>
>> Very nice, i think that especially the cTGP control feature will be=20
>> very popular with users.
>> I am also currently working to add fan table (aka "universal fan=20
>> control"), PL1/PL2 power limit
>> and platform profile support to the driver, so you might be able to=20
>> reuse some of that
>> functionality for your devices.
>>
>> I think that we can merge the first two patches in the near future,=20
>> but the remaining ones
>> dealing with the DMI table and cTGP support need some more work.
> After reading through everything i will resend the first 2 patches=20
> reordered as v2 and work on the cTGP stuff as a separate patchset

Fine with me.

Thanks,
Armin Wolf

>> What kind of control does
>> your software (Tuxedo control center) need over the cTGP values? I am=
=20
>> asking because Intel
>> devices have fixed cTGP values for each platform profile. If your=20
>> software does something
>> similar, then maybe we can integrate this into the platform profile=20
>> mechanism.
>>
>> Thanks,
>> Armin Wolf
>>
>>>
>>> Werner Sembach (6):
>>> =C2=A0=C2=A0 platform/x86/uniwill: Add TUXEDO devices
>>> =C2=A0=C2=A0 platform/x86/uniwill: Handle more WMI events required for=
 TUXEDO
>>> =C2=A0=C2=A0=C2=A0=C2=A0 devices
>>> =C2=A0=C2=A0 platform/x86/uniwill: Implement cTGP setting
>>> =C2=A0=C2=A0 platform/x86/uniwill: Make uniwill_dmi_table accessible i=
n probe
>>> =C2=A0=C2=A0 platform/x86/uniwill: Run callbacks of uniwill_dmi_table
>>> =C2=A0=C2=A0 platform/x86/uniwill: Set cTGP support based on EC for TU=
XEDO IBP=20
>>> Gen7
>>> =C2=A0=C2=A0=C2=A0=C2=A0 MK1
>>>
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 546=20
>>> ++++++++++++++++++--
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0 |=C2=A0=C2=A0 =
2 +
>>> =C2=A0 2 files changed, 502 insertions(+), 46 deletions(-)
>>>
