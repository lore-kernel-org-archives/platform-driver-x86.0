Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E6A18DB01;
	Tue,  3 Mar 2026 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566041; cv=none; b=kvshGRtIvCXKgS967itaMS9WItPQ9vDMMFlGlgGwUjPydlX/FLLeiXm54GexqcUdytAf8/z78QyFux980jLV+14dQ/AbCWx1MDykrGT2DRxLeQndgLerqoxzm9igsCTvwVn9cVYgSZhmGFA69p6FjEEozpjkt88DD60E/4doLGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566041; c=relaxed/simple;
	bh=s4Yqb8QneNiddLYkk6aU5ebYBmBfou0DrYCJgWMpKaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCqy2Id989NCnwbfHsR8skoWPHp3jC1X2rbEApSBw0PO9B8nv53BdPN4BiTctlWFsmLNSFUR5TGLkh5KbgTqUfQLs2GY9X104K//RL2SwbESjDoShaQM4UGfoVmPmHV5GjZxNWbsOeYLwoe068eiVIkCafpUkMbqhijL7fDVa5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DA+iU8KR; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DA+iU8KR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772566034; x=1773170834; i=w_armin@gmx.de;
	bh=DhpaDpiN6IUDMBx9/0JojW1qQzCg9zcBOGlPsMMJSrM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DA+iU8KRvDqpZRt+osx41sKyClBa+wmJzSl4dxpYUkXb1unaBCjyWG/A/IZ6If5j
	 fIHFA4RlaQeNomvH7eveQ1SLG89DP0d1QGt+p9bFFCS/9uaw4Lv8+7BBqm5Q+RmfT
	 P3D+1ZOiK8k33u4JNZri4/icVo7UiBDElYD6AliuDXFJfWm6HPd6J1PYxC75yxjXL
	 BA2achopRhIs5c9QcM9f35wnlMZmgNLcdYASwqALLMVhgslsVMpMbUKsHSFIWgPII
	 +URaksDS9b4zTBbatTx2jndhz3tOx1aGaeBgpIM0cXTcBDcyQLzQE3Ws6eM0SVDlX
	 N0jsQEuJFZZhublrmg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLQxN-1wELar2MOh-00U6Jc; Tue, 03
 Mar 2026 20:27:14 +0100
Message-ID: <00147a2d-6829-4867-9ae9-8a27eb51289a@gmx.de>
Date: Tue, 3 Mar 2026 20:27:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 0/2] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Mario Limonciello <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260303181707.2920261-1-lkml@antheas.dev>
 <2af36c81-4619-4f90-a04c-c3e5ed7a0cc5@kernel.org>
 <CAGwozwGTPKH5Lc4pEzmrNd7YhHJpZHod=YhViYVVcJTVbLX9ug@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGwozwGTPKH5Lc4pEzmrNd7YhHJpZHod=YhViYVVcJTVbLX9ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:W2YEeNByOAQRzDWBVkFfkYzlVBjbk6A3Nl0mbAkxHaZ9PApmiFm
 1qTdySfADzB1hwm00Vdk45OlEfrM+5Bw8YNuaqnQTUMi0X20XRqKIjKkGDQuz5wzb0VB/zO
 x3KT1B7IKx1DeiO/FE90Q68l34pf4E46SzzSc0WmLGG45VllhHDSAdFy3wp1Uou5oNDtCq3
 S8tXmWFUYJVs8CiXYCYxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tGyPwgWll7o=;hIR0N/c2UxoUSRDDAHsy3lFciLC
 Mfq45wIlZdQfa18sbkcjgGpw9NAMwEqRCI8Fsa33KtjlnRNaPaqb1Us1fNXx6J7tJCinLaq2v
 wTC93I4RGuWI34xJDedHGlyvkJnpWl/tVyM/uo+8Qdn5VAf3UkREgwi7ryJBSSliP3+k9kTsG
 3yx7G+sI6elqh9CfB3j6uB1X/WcgcKlf9Qn4jgdTB28NTnDmn1C9f3dMlSGSESOxyitq1Lut1
 Dg1N32GPlQrVahX9/khqN6pFHlkoBywScKmmy8c14BPb6kfkPsX+OLMdevJ2YWwBK07IEnx++
 8lMsCpd1/d8HV2VKaIlb8flHJUYGKBSOd4SSFJ9sYbV/+22+6dlelA+nrPdXKd1oblYrMppqD
 p6jGOFG0SHRKNiD+MzqJrg6h1Zhc+QxCVa4WE/P6smeARsroP0COcM45X86glXu9VHhJvDdIk
 RJ50V9qz1p1JdODZY7GYIpq16zKmGewLe4z7ieKaB4tRWk45RKy/RvjynTAIXvokvomN/UeE2
 fFvMxMp5I449Q/ZCxoKI+/L5Zi2nJxZdNCQTjeRc14vciSAl2vSUYs1TDH9piHXb67g090XyV
 s2SMXMlfi7zd+J09JT3ort9FDuumi/DSvTj9ZFrAPf5kLRaZGDtt079NiA/yo9pPDKcnzJtGS
 TVqTR6JNL/YvqwFBTvg349iJelhuwx7WB+csZ//dz5RRjWudjs+dKhf3pYP1pWGYxcmekzd6q
 OCnoL7rKxYZy0VTFQ898035T+kdMdQ4lXW5Pqh8Y2aBK1N+rGHA4jgLz/cs0gN1WLbbH1MJcW
 AoK2c0oAjx4lCaR8fDUIcYKKwn6i+0jVwDsJQ7O7FMRR10c6QauNaPTUWBL19Ek0fcHuwcsTo
 1gC5w+ZbvM0XlarILodAwEViThrKmgoUWB9DATs0bPtKcBMXJGbFb7Cs0AbJB7iSbTJKTk4dG
 mtGYW5BdXbv9hgw2JEYbzLdCT+SvEbpUrFx8C1QuVRok/SYLFfLZd6jFlSUWnKMo/MpIWFdZb
 vmEH85l/oVXO3k1KEwnU6lmhdiKM6tuJc+gNNuYisMLNoCgQzrhIhcXTX1Z9AXjY92lW6hWTr
 VnjVeKMP+OfceKNZ3NWwud9q8xxbxgiUYFwmpEyIukyMyeM0UPlqU1c9pz9jxAXfzRfZPXExQ
 +G0INkhGhD0yhWGc2+1FOA0/Yb259gGkLI6uvg3lITWlICOREK4w97ODV81xi2AkCcmfU1X5r
 n5mohBAoGQp5vued3HVM+bJ9G5/jinRVu+KvHL2XhoOH8i2Y2PU7pOYouxefGzj/ZzZihSmcT
 rDuKpbsYeKoPcmxtubYvocDQG/KnO59CYUxc0NIxEQ5yL6rFYkCYeuk/UIcfBtDJNKH+/WN7a
 SNhWVd7DaWwzX5xnKVXNYlOfaT8qp0w004ZtgfXyIJGt1SM9am+5YMWVaushIjx41U6qo5Aer
 zOv9oGjii3pqokA2AVv2IGHq5eY5wNymYvi5miBBP2FvmsisO+frykSl4EJ7kwv+upCO7vDeR
 Te90d7XYpD67gxWs9R04fErC5JMGYEBPg8jYdgJfWb42pHZfAbK25xaCHHsHiGehzx5gE+/O1
 dRq6B8rbpOKh9JCUq7F0CywhuLiMBDBwQiM/S2fuW4yd2PXYoHvrUlWr2Ic8K7N6NM89Bqtoq
 ksB7ELSE3rxzfSRBagvRLw/Z/RlzNXLrlNEP5gwm95o/+ZHgZvfq/M/axx147DzzJg6PFcvjI
 neqrwYZM5zHwDXI+NWzAK6/Hj1rMiKGJqtO0jMwwOSjMLhAUPNfgYcr5r8zOYjiDU/8Uf0QqL
 NWsWOJd6pm2+YcyxEu7CyAp/ZY+t9YCxLDAQR6412F01P6gGN5EvnLe1CNdmjj/1/OxGE8kx+
 FdawGv5mkvPQT/q1bJ9GosROKmdu3Iq5l14PXQz7w/7hz9Blm6fsgMNb24yYkpYg78uJhTZyx
 EoE4p081lukPnEIt3LVv9DwhlmfbZmEBcjnWuwTc1anwKlwmGtuUF9KCD6QkaqfQ58fVD2nYf
 X8RrvceXOcY0nv4NNxlv7htTeWAVhaML/HqcikqlgHTt6dav48cEJ770aX0i2ZuDyfgbF51Np
 ZbYvLRuwSXSyb2qp21eLVzlvLlXbASENFEROytPzr6CFEgXpp1Ht1wwVApTkGd0FC4PqVShFW
 6LCN6ZcQtYtNFMu75kYn7vp6RPJzySceCtsGmU018UwvQM4mfpu3FC9P/sEVLIxkePIIs7Z48
 cr7Sa5kOT43c8aewHzZuqYDhzJL952bVesKHGpWYeYSN3VpiP+/nBJHmZCH+wD3VQkOG7OwvR
 kPL1w4VMwxH/rmjWJuVl9qxjEE7xg2kl+Ii0YkxQPkXLpxU6adMqBGEZgSEfkE7gAKzKc1Y7Y
 3C0Z4VaunbjD+bCvJrSsyM/BdtCIXaRgwcVP8kUiYcA8mjjptxmyf7V/a6IHJi6cS25Bwp1M7
 Z8U/75m0k3CSFBR4jb7CO9dCzHYffzDaaHY6BkUgoM44/5fUUumYXMha9pE/BjY78xk7Wr86o
 EqKWHjJv79JIQBcpzYbHFXgpnnAK8EdsLztpycrxsi0lV2GKO6wbZXddYr7lgLGlgeZJQ+oFY
 EnND0SaVWBfNgMrlMp+Ll57eZ9xt97CfnPVsLpXEIe/cL3nKmZVeLLd0092oUFuiWzX32in4z
 P+IQCR6JbQyFXDrNcHbLfTym/NLyE7eGR+M4/pMO8Yp14H3+tyd3s2MEZZ1AnYy3BD3BtLFDS
 EL+3mUKMP0Jz2jyuw0uHbg6ozevyyRwYr4DBB1pDl8aWAyFkedLUdijygNhxxASxjUS2Yvt4n
 jBSzor3JgkDMvGh7g9dKdBiUEVy39kjuSaNEOftfA3h87Xn4qfaDkVTFpxfL1C6/lQKFdqV9p
 nOuTtoPQzdq0dihx4AZH7+Xqa0p8nsg5pz+TfX+eZvBjdF2IjXxPfL77C064bENl/WD6hV3Oy
 5SCT6sBTmZ/nnCgjCdMndViEekEH7ob8DkzVUS5VPgfFAh5GRn5iugi1y5jGCtlgbrWQkGBhL
 JYI4g2Tg5bLkEOga49oevjJBypuTqO73lhQNIdURSDX+q4OlwGT5G/wg43ppnSRr2FBAlnswv
 FBOVlLQ0rUu1+G1QoyCLJmwd9rrAcCEHvl01homHVBr4NZKNEP0N/iEcbgoH7m6B6jtQL3hA2
 8AZ91ud7o6+UzX+qspqxsqIfNoeIiuf1/Vai+UMSxFWVgtt6Z2dudmSY+LADgca4mMvMDcDOf
 VOwmwiNcmpQBCBvcfkUmoapH+8WdmkSs6Dl5GlMPxDp1y3VOzlKMvb9sR1nz0seD8jKIzJv1b
 Kx4zmoyGK4m7Nm5nGn8HROopdm6ZYAprcmXgtMt0vmSGJkJ9wZx5anAix0MH8ghGD2owsAE91
 xeJs570PATZealO+CEJoFoKB3zJddBdeOfI+gpcLuMDkZiX6keh2Zs4hMuCj9hplNLuM/IOdP
 diSjI4fmMEMN5uId5Xa6WjiqyJekU9G6LafnpE4XzX9Q6F0t7+FKbpQUz0BFnxG7+3HhoE2RG
 IVTcVlh0Nekc3TGGXawp+UIiEC1w051JaGmmDsvA2EXH03agLqid5MtI8ygx3i7PWnc8SwoyM
 2conDnUGs+vFqS9XtjdCvimZDd/XNw2blslNeP8U8zKP31khd2Ce6HlwQ+bo79f8eLRNE08qP
 RSrUF48z1ALrMGzBJnz/Ax3sp5HcMJc8NAB9tcdB7iL2V4FMub5/8DK1SA2k49V2/cJ3MXlt8
 wk0BsXll0OsOANe0S+jolOHRfVJmUhZh++r2f4WmkuSccgXyEmt6L2YTJLN2SngCCwgE7PZAM
 4gwf7AfzWec4ZRXwD/M1Wf4huiEcUbKFUXvXLzGbxYMYp9LGygbRQa6e8YQqkhT9gvRNIRiT5
 7bRkUMIccpdEpILp/EQhsydnD9BYfjwwTpXKmhk61wtSVOO17parCL+urKJKGCkSeabJ+YjYc
 TR1Bt0K6f5FD5OEvqKhLQ9t3uvQIs0U2pRF+yXKBJ4B7A98eIJpWb5ikcEF0NBGUY6gb0CFvQ
 ShqxWsSiVFOdw7mpT1EH5MnWLQFP8Ol9dj3z+virGP6tekyBMHIHwlpZlbd6JTZCOC+OuJRym
 E36pbyMx2x764gr/Cye91FE9C9WR9hzGM4iDGhLhRnN9bNwIbpyhkW+BY5MFMsyfEOvDD3ZiL
 Mk67IjOnG7Meh4Zjt3n9YQDUvhpjm2gKNuUVHjRg2x52LGa3lIqg9L6jyntMNoOeCjeCXbYG+
 c7u73BHWC82Ddd4m2M0q+dVkZvCG475uMkIOVMMpJb2SfHRsk0wi79jdtv34E8+hTo7CX+O/u
 PvD6zT+qabR7Z56hPmOoe5AE63VVR00dlWN8I/XAxtTDaupAGO3ob2DywNC5u7YDB/GHVZ0cO
 Zzm5D0U2vZkcC1hNqi4q7wssWxn4r2uzGtx4rHJ3TQxbJr8KDXztck2QLq2in+eDgux3G6yDF
 ZOszVahdNCbC3CP1eOXXKJLhiAJo4goaP/ot8DZfykf9jg9XsiE8k7OTiSwpOocZvm9AZ9CKX
 1y6C9BKSlUZ7XQSD3ReiRN34qdcZpDlAVM9B4WEG+W5FR0v8Ey8R/M7xycCWS1OlBknyXfX+1
 nLX5/yzExHbHPvngjzcQXl889uRXGgJi4IISy6y8kXnNjTiUOHD9fRkwM3khPUIoZ5QYMoSYQ
 f1URU869bsHFY9je8G/ZrVaGKN7A/gn2sRGdEbHZs1gZjQlixz5HePOWRz6K1Fd8LGc4VNGLd
 o13pIKy2w5EFhHXZwuef9NQNhIaFkFT+Tz1gpW9ZVcwNZ0o/souL9jW7Sy+DQ6+uQZHMytPtD
 tM2ei8Vfjqe7vKb1xtfoBHTXy28ZUnjFLqhnKfWgLfhgQqkfWHoCJ7ur6YZE9Avvi+DWtDLQF
 viOMkcos+qHA2l7mhH0YGyu3+g1sE138MY02vx8Rgc1KilQbEilfW6l7I1cf7exr0hvagIAut
 AVmdCd/hSZVJUZicZROByl9XnRmOT7B63nBBhGy2oUK3rXqkqkzq44+zM8SEj9RNtnI1/pxFj
 qiCIcLk8SAAFuCGpKTwGKfd6bvpN6mJ/7xuKJLxdwWkk+2nvkKwd9L/eLiqrl9Ada37AtABYq
 q4b/0QhXffQo61Mo1i/VWGS5wepqG4dbvji1fgEZdQMlFe5XwOivAEO3c8/Mv7qbX+TudxG3p
 mS0YPrEk5glTzlZJknM8Eb9+Nj7HQ5PmXiYD1HPkLD+8YmveIvKSJQEHIowoew4evLGkxCIQ7
 AIYZG/a2bKtltkKFxSMapZiC3Fx+xYtkO/g7Pe7QfRn9x74nAsVHKXAne1XTehs=

Am 03.03.26 um 20:16 schrieb Antheas Kapenekakis:

> On Tue, 3 Mar 2026 at 19:59, Mario Limonciello <superm1@kernel.org> wrote:
>> A high level question - why aren't these vendors implementing PMF?  It's
>> 1000% less work to enable PMF.  All the values that match the design get
>> stored in BIOS, driver pulls the information and uses it.
>  From my understanding they do not implement anything and just use
> ryzenadj with their windows vendor software.

Do they implement a WMI ACPI device called "AOD"? AFAIK this WMI device
is used by the Ryzen Master utility, so it could also allow users to change
the TDP limits in a reasonable safe way.

If they indeed only use ryzenadj, then shame on them.

Thanks,
Armin Wolf

>> Same approach for Windows and Linux.
>>
>> More comments below.
>>
>> On 3/3/26 12:17 PM, Antheas Kapenekakis wrote:
>>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
>>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
>>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
>>> allows software to adjust APU power and thermal parameters at runtime:
>>> STAPM limit, fast/slow PPT limits, skin-temperature TDP limit, slow/STAPM
>>> time constants, and the thermal control target.
>>>
>>> Until now userspace has reached this interface through the acpi_call out-
>>> of-tree module or ryzenadj, which carry no ABI guarantees and no per-device
>>> safety limits. This driver replaces that with a proper in-kernel
>>> implementation that:
>>>
>>>     * Exposes all seven parameters through the firmware-attributes sysfs ABI,
>>>       so that standard tools (fwupd, systemd-bios-vendor, etc.) can enumerate
>> What is systemd-bios-vendor?  I guess I'm not familiar with this and a
>> quick web search didn't turn anything obvious up.
> I used some AI assistance to compile this from my userspace
> implementation and the ASEGA pdf from the AMD site. I need to go
> through _everything_  before this moves to non-RFC. Same with
> copyright year. I focused on the implementation doing the things I
> want it to do for now.
>
>>>       and modify them without device-specific knowledge.
>>>
>>>     * Enforces tiered per-device and per-SoC limits. The default "device"
>>>       mode restricts writes to a curated safe range (smin..smax) derived from
>>>       the device's thermal design.
>> Can you please elaborate where you got all these numbers from?  I don't
>> know if they're accurate or not.  Someone would probably need to cross
>> reference them to be sure.
> Trial and error, research, references from Windows, etc. All of the
> devices in this driver have been tested with a userspace
> implementation using the same limits for ppt/sppt/fppt. Nobody has
> complained about them. To be honest, I usually do not set tctl slow
> and fast time limits, so those are referenced from the Legion Go and
> for tctl I go lower than what manufacturers usually set. Users like
> tctl because some of them like their device to stay cooler.
>
> The big idea for this driver is to allow locking /dev/mem and ACPI.
> Other than the legion go fan curves, and the Zotac Zone driver which
> needs a cleanup, everything else is handled in the kernel now.
>
> But this approach works fine for the Zotac Zone as they seem to be
> using a very simple WMI shim.
>
>>>       An "expanded" mode exposes the full
>>>       hardware-validated range. An optional CONFIG_AMD_DPTC_EXTENDED Kconfig
>>>       adds "soc" (raw ALIB_PARAMS envelope) and "unbound" tiers for advanced
>>>       use. The active tier is itself a firmware-attribute, switchable at
>>>       runtime.
>>>
>>>     * Stages values and commits them atomically in a single ALIB call,
>>>       matching the protocol's intended bulk-update semantics. A save_settings
>>>       attribute (per firmware-attributes ABI) controls whether writes commit
>>>       immediately ("single" mode) or are held until an explicit "save".
>>>
>>>     * When in "single" mode, re-applies staged values after system resume,
>>>       so suspend/resume cycles do not silently revert to firmware defaults.
>> This isn't the only interface for setting power limits.  How do you make
>> sure that the EC for example isn't stepping on toes on these designs?
> For the DMI matched devices it is not. For the ones that are not
> matched, the driver does not autoload and needs a kconfig parameter to
> even load.
>
> OneXPlayer is a bit more complex with their turbo button doing TDP
> swaps but turbo takeover in oxpec takes care of that and then you are
> supposed use ryzenadj.
>
>> I /guess/ it always will need to be opt-in a device by device basis.
>>
>> What happens if the vendor enables PMF in a BIOS update?  How does this
>> avoid conflicts?
> Some manufacturers enable pmf without implementing the tables. From my
> understanding none of them implement pmf with limits. If a
> manufacturer wants to move to pmf, we can amend the DMI entry with a
> bios match. However, from my understanding, there is no TDP slider
> equivalent for PMF.
>
>>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
>>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
>>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
>>> 8000, Z1, AI 9 HX 370, and the Ryzen AI MAX series.
>>>
>>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
>>> that committed values are applied to hardware, and that fast/slow PPT
>>> limits are honoured under a full-CPU stress load.
>>>
>>> @Mario: can you suggest a CC list for V2? Thanks. Even if not merged, this
>>> driver is still good for downstream use.
>> You should include Shyam (AMD), Denis and Derek (community).
> Sure.
>
>>> ---
>>> Usage
>>> -----
>>>
>>> List all exposed attributes (read-only, no root required):
>>>
>>>     $ fwupdmgr get-bios-settings
>>>
>>> This enumerates every attribute under /sys/class/firmware-attributes/,
>>> including current_value, default_value, min_value, max_value, and
>>> display_name for each DPTCi parameter.
>> AFAIK - fwupd doesn't understand "save_settings" today
> Yes, I do not expect it to even allow writing, but at least you can
> preview the values which is useful. And from what I saw defaults are
> not shown either.
>
> Antheas
>
>>> Sysfs direct usage
>>> ------------------
>>>
>>> All paths are under:
>>>
>>>     ATTR=/sys/class/firmware-attributes/amd_dptc/attributes
>>>
>>> Inspect a parameter (no root needed):
>>>
>>>     $ cat $ATTR/stapm_limit/{display_name,min_value,max_value,default_value,current_value}
>>>     Sustained TDP (mW)
>>>     4000
>>>     85000
>>>     25000
>>>                             <- empty: nothing staged yet
>>>
>>> Stage values (held in memory, not yet sent to firmware):
>>>
>>>     $ echo 25000 | sudo tee $ATTR/stapm_limit/current_value
>>>     $ echo 40000 | sudo tee $ATTR/fast_limit/current_value
>>>     $ echo 27000 | sudo tee $ATTR/slow_limit/current_value
>>>     $ echo 25000 | sudo tee $ATTR/skin_limit/current_value
>>>     $ echo 85    | sudo tee $ATTR/temp_target/current_value
>>>
>>> Commit all staged values in one ALIB call:
>>>
>>>     $ echo save | sudo tee $ATTR/save_settings
>>>
>>> Switch to auto-commit (each write commits immediately):
>>>
>>>     $ echo single | sudo tee $ATTR/save_settings
>>>
>>> Return to bulk mode:
>>>
>>>     $ echo bulk | sudo tee $ATTR/save_settings
>>>
>>> Clear a staged value without committing:
>>>
>>>     $ echo | sudo tee $ATTR/stapm_limit/current_value
>>>
>>> Query or change the active limit tier (device/expanded/soc/unbound):
>>>
>>>     $ cat $ATTR/limit_mode/possible_values
>>>     device;expanded;soc;unbound
>>>     $ echo expanded | sudo tee $ATTR/limit_mode/current_value
>>>
>>> Switching tiers clears all staged values (old values may fall outside the
>>> new range). Stages and commits must be redone after a mode switch.
>>>
>>> Antheas Kapenekakis (2):
>>>     Documentation: firmware-attributes: generalize save_settings entry
>>>     platform/x86/amd: Add AMD DPTCi driver
>>>
>>>    .../testing/sysfs-class-firmware-attributes   |   41 +-
>>>    MAINTAINERS                                   |    6 +
>>>    drivers/platform/x86/amd/Kconfig              |   27 +
>>>    drivers/platform/x86/amd/Makefile             |    2 +
>>>    drivers/platform/x86/amd/dptc.c               | 1325 +++++++++++++++++
>>>    5 files changed, 1386 insertions(+), 15 deletions(-)
>>>    create mode 100644 drivers/platform/x86/amd/dptc.c
>>>
>>>
>>> base-commit: c89ce241c1909d2c2bdde88334c33f3000d364fb
>>
>
