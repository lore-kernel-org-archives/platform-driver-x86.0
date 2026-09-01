Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A52D7398;
	Tue,  1 Sep 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269754; cv=none; b=qG7EOj6a2AI6uFtlNL8GrNDhFd+8Xtg0+3Dhsmks2iRC8pM1AwXHPfwqVHtSx5oT83g5WpvS4I/RA1SXrwZ5gIazg0sdwruOz1AIMn2ZakVD47+bhMOwQgim0EAhxAjxjvroe8RsA0x5KX1XpeomDoJoAKExmAfLdI6TQzgd34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269754; c=relaxed/simple;
	bh=BEZSqzgqKkVtMPyjZEXxDEFetEdFyxyp1n4nWBeuGyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBHsjW28/FR7eqSA/MaiYpEjMyUwXvAMQstKcn+2n2MYVv4CIPwIVdXxI7h0tMdRx28/O5Da7FxW4NyTBEGO+4eMGm01KxbHgM40QVn39WmDCUaHmr5gpmAcId5DlOOtqvEOAbYzH87XWUU68Omj0svTWRkkte+pnSZtu4cfS0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ag6+6ui3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ag6+6ui3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1297E1F000E9;
	Tue,  1 Sep 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269753;
	bh=mzO+bYppb5Zmv3Hn7XxzPKX20sxxrHx25fF2rE5/Z7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ag6+6ui3bjpETsI7/oMnYjn9Hl07blI6ypqdVxL6YSGlq5W6j94P+HD29TruHeSwe
	 WhWz+vC8OA7qGS8wvz9q4TYH3JBjrfTvDW9SyPsfPls4PPuuhL+eOsRwqstKFtJDvm
	 agVCwm7RQrJBygjREoI+DqOjFgdknGTYLklR/TYzzVHMG2G009qH2IU/xxrh9mE9wf
	 Lk6IMeBD/27m9fyorfEBknig/98sfDio0XQ+sqWSinqZEPhr4yZMhvnwf/OVyyi8e8
	 HbEXrfCkIlArvwSRfxft6AHaFBs2h+Db+KzyHJEfnRB+MdqZ2fPHzisDAOxSS3w7/t
	 BXLF7VT9OGyAg==
Message-ID: <5e406926-f35b-43a2-b41c-912c281a21a1@kernel.org>
Date: Tue, 1 Sep 2026 15:35:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: int3472: the vendor GPIO type table, and four values that differ
To: Sergey Lebedev <lsa.uz@pm.me>, Daniel Scally <dan.scally@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20260831180837.69000-1-lsa.uz@pm.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260831180837.69000-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Aug-26 20:08, Sergey Lebedev wrote:
> Working on the cameras of a Surface Pro 11 (Lunar Lake) I pulled the
> complete GPIO type table out of Intel's Windows camera driver,
> iactrllogic64.sys. Ten of its twenty entries correspond to constants in
> int3472.h. Six agree. Four do not, and I cannot tell from here which side
> is right, so this is a question rather than a patch.
> 
> The table as the vendor driver indexes it:
> 
>   0x00 Reset          0x01 Enable         0x02 Strobe        0x03 Torch
>   0x04 Flash          0x05 LedRear        0x06 LedFront      0x07 Power0
>   0x08 Power1         0x09 Standby        0x0a WriteProtect  0x0b PowerEn
>   0x0c Mclk           0x0d PrivateLED     0x0e Avdd          0x0f Core
>   0x10 Handshake      0x11 HDMI_INT_IO    0x12 HDMIDetect    0x13 Reserved
> 
> Why I believe the indexing rather than a coincidence: five entries land
> exactly on values the kernel arrived at independently. 0x00 Reset, 0x07
> and 0x08 Power0 and Power1, 0x0b POWER_ENABLE against the vendor's
> PowerEn, 0x0c CLK_ENABLE against Mclk, and 0x0d PRIVACY_LED against
> PrivateLED. Five independent hits on a plain array index is not chance.
> 
> Where we disagree:
> 
>   value   int3472.h              vendor driver
>   0x01    POWERDOWN              Enable

Same thing just different names, sensors typically have an active
low powerdown pin (so driving high enables it). Also older Windows
code has been known to call this "pwdn".

>   0x10    DOVDD                  Handshake

Another reverse engineering has mapped 0x10 to AVDD, see:

https://lore.kernel.org/platform-driver-x86/20260901063353.67252-1-dmanresa@gmail.com/
https://github.com/linux-surface/linux-surface/pull/2252#issuecomment-5483523423

Which seems to make morse sense, given that we've determined that
this controls a regulator and we also have a mapping of 0x12 to
HANDSHAKE provided directly by Intel.

When we mapped 0x0b PowerEn to avdd we just knew it controlled
a regulator and weren't sure which one. Since most drivers just bulk
enable all regulators this does not matter in practice.

So when this second (after 0x0b / power-enable) regulator related
GPIO showed up we mapped it to dovdd instead of avdd. Maybe we should
swap them but then we first need to verify that all relevant sensor
drivers check for both dovdd and avdd.

>   0x12    HANDSHAKE              HDMIDetect

We have:

0x12 = HANDSHAKE
0x13 = HOTPLUG_DETECT = HDMIDetect

Coming directly from Intel and both have been verified on
actual hw.

So I believe that the mappings found here:

https://github.com/linux-surface/linux-surface/pull/2252#issuecomment-5483523423

are the correct ones, no idea where the differences you found come
from.

Regards,

Hans


