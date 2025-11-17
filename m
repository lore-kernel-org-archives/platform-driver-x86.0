Received: from outbound.ms.icloud.com (p-west3-cluster4-host5-snip4-10.eps.apple.com [57.103.74.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1717B2264C7
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 04:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763353487; cv=none; b=ADLiOEbrGOFEXZZkLs7qeNfc2lkgJjzwLe7eIY6JKSbrHeIESJ5FlgJbwaOE09WV3EfTFDCG3cN/j6UzjGNy0kfkWzVMJkfg4+MsG0pAPOvq7yGW+JThqizbcXLUcbObewvo0e9EYNaixrousF7Y0XWrXJTc5wJ7+y+i4cxRAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763353487; c=relaxed/simple;
	bh=r2LhBPEAnt2aaojJ/eco1IQ5h4gdVPLfrsoako4rXOs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Lsty7BDFeirdRp1KGWMPy6L4w0799gtZT6pfCd9bze2/1QoXdYiw1eIxh2svvNIEI7ABu/4i9vxf40BJXGOK5quTvysw7rDynpImD2mLtqjPmnhrK++cHJ6t5MY6YKG185cfozVd++gn8SYichNyYVwSO9rXGt09oHriPIxKucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=UrvHpuPq; arc=none smtp.client-ip=57.103.74.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="UrvHpuPq"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-1 (Postfix) with ESMTPS id 2421C1800403;
	Mon, 17 Nov 2025 04:24:40 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=du59hgTtn3hO+yuzJ2xEMrxjpJbRoKAFxKjoJP5R9BM=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=UrvHpuPq7ZecVRnE5Xnvl/VMq9yaVa+mwtNsYrOSGEu/XVJcUlBA+B/6AlOQgWZdCppmiQ1Me7/sgS5n/+0KuL+wwLySUXrlRr4GigVbqP0hz91Np2lzffbgsRv+9TNASxWwnr6unAo+IO1A5LPj0hdR0C5WGrf4GeUZoNhZvKiHEpRvvi2/dEUl+xaBsvkpPbaz6gS1Lh1x2qHpXXBiR0lTgnAa8JykK0GA4SAxuuGo1IsPR0u8Ujn5kTSUSg7XIQChiLk88y87aptXdxOvAi6dxnh50bMKYI6l9zmpC+3POp7nglgXSKzKhj6dWst+qI9xMWOoiAs8ZxPAJt7PEA==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-1 (Postfix) with ESMTPSA id F1F091800304;
	Mon, 17 Nov 2025 04:24:37 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.22\))
Subject: Re: [PATCH] platform/x86: asus-armoury: do not abort probe on
 unexpected CPU cores count
From: luke@ljones.dev
In-Reply-To: <018ce202-420c-40c9-a089-b3509c7ee4bd@gmail.com>
Date: Mon, 17 Nov 2025 17:24:25 +1300
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Denis Benato <denis.benato@linux.dev>,
 linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>,
 porfet828@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B0986440-6A7E-4CFB-B7C4-9335E91EC433@ljones.dev>
References: <20251114185337.578959-1-denis.benato@linux.dev>
 <8b999b96-f1bf-4231-b2f8-5c4a55e21d5f@amd.com>
 <018ce202-420c-40c9-a089-b3509c7ee4bd@gmail.com>
To: Denis Benato <benato.denis96@gmail.com>
X-Mailer: Apple Mail (2.3864.300.22)
X-Authority-Info: v=2.4 cv=P4c3RyAu c=1 sm=1 tr=0 ts=691aa38a cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8
 a=6RKtWbuoXnBlL-142YUA:9 a=CjuIK1q_8ugA:10 a=poXaRoVlC6wW9_mwW8W4:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
X-Proofpoint-ORIG-GUID: 02PZA0RU3tl9d4DUpceJxLVKDU0qif70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzNSBTYWx0ZWRfX4HcITZDi/3GG
 fq0kY+8xJMsjA6hkPooGafhQPInPBOHbF9coRwbNlhwDVUogSxKit/XOlqS7z1siPQoslYwwNqK
 xPBElB6M7/V7RsqbkI6Vxq3EIjxG+8irPJKYoz4hapjy9z3Rqy5AK7inldPamAK70EAYMNDKf/m
 97oOSTZSuyxJpzyigoYr1dek2dxMjIQDPFOGrgJCiictjnxA9C7RPhE+OllAZLUyjGVrisG/jWa
 uXhwQlvMmBAMo1Q9soi2amHm2pmAdcXXUL1K8rLkZaSDrN2Q74x3XVnWNYcSYNxIQG6iinmahPA
 EXgyzgNXiK4CdeRmg75
X-Proofpoint-GUID: 02PZA0RU3tl9d4DUpceJxLVKDU0qif70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1030 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170035
X-JNJ: AAAAAAAB3fWEPQDW4E9mx5TF9nR6rPxUzbJ5I4q3KzyUjY6B4OkXmIH1mCS1cXLNxzHLw3TodJbBBMLUm/l5utmCjf6tcz7sKx+habOhIxE9RXHUkxTMRtAKhRQ1MoHgPJsE4r1D500ubOxRhzh8YU7oPkOaE2wZggO10xq2RyuPTnR5srHhzFlx/vFzqCssCLsN9/TeHDUR9A1QwQYqeuwWtgZ29R3fqIhynrxPN51WWY2P0o6BXKFYe6/3r3ecWgSV8nFm4gsEzL5i6pUc3xTO6vn55YeQaIdZhQbuhMxOf4FahaNY2ag1/8hsSvPt5K8TJC57iHZt7of7X4EjtUcvN/efsDGVym4wBeWrFJsNvC1K0RSrELmb7zWGhOLbglKZts/oj08WBwWMqO/c4Ic9vrc3YSkvOcc743KBWKi2x+xKou6A3rAQrQKPqM4iO38ae7KVqCXfg7hp4/zc5TffpYRkK+OdzSVvbLel7ewCNvjyO/43iKR9d2jDVZhKjy+R3S8i11rjZgG8imPrHeH8/lJZE2LcXfHLHPMpa1K+4xN4kr4f9Z3owAdmuBJU4KjhFl/0bEB7K0qPd18Leou/3zGUPVu1SeEoDWvYMqOa6P5crtcbIFYExOghROWu9/kIijim95qECZvUJ6gyf+/jj0bjOveWB+hnoysptirtXJepjqUtJQHkFesL1AfnO+u8ueHCTMTislB9MGhyxrxzmOkTR6K+tEmF8GESEuMJKd5fXjmQ9PmHav5yzGgZV1c1duZsTSJ/LWHbFqMNlv/NUncefxA=



> On 16 Nov 2025, at 02:38, Denis Benato <benato.denis96@gmail.com> =
wrote:
>=20
>=20
> On 11/14/25 21:35, Mario Limonciello wrote:
>>=20
>>=20
>> On 11/14/2025 12:53 PM, Denis Benato wrote:
>>> Until now the CPU cores count was only available for
>>> Intel hardware, however a few weeks ago an AMD hardware
>>> that provides aforementioned interface appeared on the
>>> market and data read from the interface doesn't
>>> follow the expected format and the driver fails to probe.
>>=20
>> As a general statement; I don't like this feature at all.  You've =
said yourself that it's bricked systems.  Now it's not working on a =
bunch of systems due to mismatched expectations.
>>=20
>> We already have core parking in Linux at runtime (you can trivially =
write 'offline' to any core and the kernel will put it in the right =
power state and stop using it).
>>=20
>> So if it was me I would say axe the feature all together, or make it =
experimental and opt-in via a module parameter.
>>=20
>> But nonetheless if you decide to keep it; code review for the patch =
is below.=20
>>=20
> These past days I reflected much on this feature and these are the =
major factors
> that contributed to the current position and future steps I think are =
appropriate:
>=20
> - I didn't want to drop work already done since I promised to fulfill =
it
>=20
> - I tried to satisfy all involved parties
>=20
> - This interface is very unsafe
>=20
> - This interface appears to exist to solve a windows problem that
> doesn't exist in linux (disabling specific cores already work)
>=20
> - How the code is written is not liked by a maintainer
>=20
> - Reworking this interface is difficult for all the wrong reasons
>=20
> - This interface requires a reboot unlike the linux-specific one
>=20
> And since a few days, as discovered here:
> https://gitlab.com/asus-linux/asusctl/-/issues/695
>=20
> - This interface has already become problematic and it's just
> a few days from its introduction.
>=20
> Considering the fact that running today's code in future
> laptops might very well increase the risk of rendering hardware
> unusable (what if on some future CPUs the number of minimum
> core becomes 8? What if new CPUs shows up with a third type of
> core that must not be disabled and the interface does always
> set it to zero?) I want to apply my own judgment here and say:
> "let's drop this interface and ensure it's not used in its current =
state".
>=20
> Please Luke forgive my decision, but for now I don't feel like
> putting more work on it makes anyone happy and my time will be
> better spent in other more important areas.

I spent a long time debating this myself. Never liked it tbh.
It seems that at least making it RO so that if a user changes the =
settings using the BIOS controls for it, it can at least be tracked in =
userspace and not lead to confusion might be the best option. It only =
needs to show the values then - no min/max or other parts required.
This setting is independent to the AMD version and if BIOS changes it, =
it may lead to a lot of confusion between this plus the official AMD =
setting.
Intel is a different story.

Do what is best for users and maintenance and safety. At least make it =
RO at a minimum.

Cheers,
Luke.

>=20
> I will soon send a patch to exclude the core control interface:
> please Ilpo, unless you can think of a good reason to keep it
> (such as Intel CPUs having a different power drawn depending
> on how cores are disabled) or you know a better way of removing it,
> accept my upcoming patch to remove this interface from the kernel.
>=20
> Sorry for the trouble,
> Denis
>=20
>>>=20
>>> Avoid failing on invalid cores count and print out debug =
information.
>>=20
>> You seem to be printing it out all at err level not debug level.
>>=20
>>>=20
>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>> ---
>>>   drivers/platform/x86/asus-armoury.c | 34 =
++++++++++++++++++++++++-----
>>>   1 file changed, 29 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/drivers/platform/x86/asus-armoury.c =
b/drivers/platform/x86/asus-armoury.c
>>> index 9f67218ecd14..6355ec3e253f 100644
>>> --- a/drivers/platform/x86/asus-armoury.c
>>> +++ b/drivers/platform/x86/asus-armoury.c
>>> @@ -818,10 +818,23 @@ static struct cpu_cores =
*init_cpu_cores_ctrl(void)
>>>       cores_p->min_power_cores =3D CPU_POWR_CORE_COUNT_MIN;
>>>       cores_p->min_perf_cores =3D CPU_PERF_CORE_COUNT_MIN;
>>>   +    if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>>> +        pr_err("Invalid CPU performance cores count detected: min: =
%u, max: %u, current: %u\n",
>>> +               cores_p->min_perf_cores,
>>> +               cores_p->max_perf_cores,
>>> +               cores_p->cur_perf_cores
>>> +        );
>>=20
>> Should this be debug level?
>>=20
>>> +        return ERR_PTR(-EINVAL);
>>> +    }
>>> +
>>>       if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>>           (cores_p->min_power_cores > cores_p->max_power_cores)
>>>       ) {
>>> -        pr_err("Invalid CPU cores count detected: interface is not =
safe to be used.\n");
>>> +        pr_err("Invalid CPU efficiency cores count detected: min: =
%u, max: %u, current: %u\n",
>>> +               cores_p->min_power_cores,
>>> +               cores_p->max_power_cores,
>>> +               cores_p->cur_power_cores
>>> +        );
>>=20
>> Should this be debug level?
>>=20
>>>           return ERR_PTR(-EINVAL);
>>>       }
>>>   @@ -841,6 +854,11 @@ static ssize_t cores_value_show(struct =
kobject *kobj, struct kobj_attribute *att
>>>   {
>>>       u32 cpu_core_value;
>>>   +    if (asus_armoury.cpu_cores =3D=3D NULL) {
>>> +        pr_err("CPU core control interface was not =
initialized.\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>=20
>> I think you should control the visibility of the attribute instead. =
There is no point making an attribute that will always show an error.
>>=20
>>>       switch (core_value) {
>>>       case CPU_CORE_DEFAULT:
>>>       case CPU_CORE_MAX:
>>> @@ -875,6 +893,11 @@ static ssize_t cores_current_value_store(struct =
kobject *kobj, struct kobj_attri
>>>       if (result)
>>>           return result;
>>>   +    if (asus_armoury.cpu_cores =3D=3D NULL) {
>>> +        pr_err("CPU core control interface was not =
initialized.\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>>       scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
>>>           if (!asus_armoury.cpu_cores_changeable) {
>>>               pr_warn("CPU core count change not allowed until =
reboot\n");
>>> @@ -1389,16 +1412,17 @@ static int __init asus_fw_init(void)
>>>           return -ENODEV;
>>>         asus_armoury.cpu_cores_changeable =3D false;
>>> +    asus_armoury.cpu_cores =3D NULL;
>>>       if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>>           cpu_cores_ctrl =3D init_cpu_cores_ctrl();
>>>           if (IS_ERR(cpu_cores_ctrl)) {
>>>               err =3D PTR_ERR(cpu_cores_ctrl);
>>>               pr_err("Could not initialise CPU core control: %d\n", =
err);
>>=20
>> AFAICT you don't need the err variable anymore for this function.
>>=20
>> This can just be:
>>=20
>> if (IS_ERR(cpu_cores_ctrl))
>>     pr_err("Could not initialise CPU core control: %d\n", err);
>> else {
>> ...
>> }
>>=20
>>> -            return err;
>>> +        } else {
>>> +            pr_debug("CPU cores control available.\n");
>>> +            asus_armoury.cpu_cores =3D cpu_cores_ctrl;
>>> +            asus_armoury.cpu_cores_changeable =3D true;
>>>           }
>>> -
>>> -        asus_armoury.cpu_cores =3D cpu_cores_ctrl;
>>> -        asus_armoury.cpu_cores_changeable =3D true;
>>>       }
>>>         init_rog_tunables();


