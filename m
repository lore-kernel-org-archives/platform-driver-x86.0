Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9B37F8AB;
	Mon, 12 Jan 2026 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240844; cv=none; b=BUUoFLAVhnXrKeILyJZnKIkLuq/uBoGXe/k9ez7wA2RqUOxKK3NWpsw8JpRr2Jq5x1bLIlhvu0D/eyibe3bYqnMTz3jBxK1/DwiRhtHyIsn6d/c+MD6eDlfTdStvCXpjCYpMFzTd8ZJM//YnDL2D0ib5OIeU+MqfNRvA0sVJLg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240844; c=relaxed/simple;
	bh=BGsyaAe3ks/ytF3/pzCnsb9yxRYwSpTkt1c5gm6pQQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sv0bKZ1bBeet0YFFuIT5D1XA7FrFS2QwPrJd9eepl9wRgwwxmpXSYbWlx5YjlU/LL4RrE2/eeOYQ4eEZRN7SJ4AXLtf9uxvdOYqA/XYeJGK9Cawyo3wMPecf5KrapLP2SKvjZ3lsO9jHKOwVFV16NEvfwiXn+Z9HATMJClWtbSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Bv6Mo+sW; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Bv6Mo+sW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768240828; x=1768845628; i=w_armin@gmx.de;
	bh=5SS4aQFWxrGj96GC/MwDTxhXKL0itp0u+hCSvBqA46Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Bv6Mo+sWMCh7vRKIe5HRFAXznLiTadsItDu7rmPC5nvKqKCoNPMPkHPH0hTi4gfg
	 0LxjLRw7QI0nqBJVxDRWDbfH96VaVY2ES8dkZfBJSTyiLieoVy9m5PUjn4yaiqevQ
	 aETANO6ZSUVY+7L1qbzKaxprvW/WyZPFfsfSK7PCetZh5LNzsaXg38ieKfl8sGNpP
	 kSQQ8zQQt2sp5+xqcSbWWDv4D8b29AETG5M6JBFEqqyS4GMVyK2Fe1WtRY3akijIZ
	 wKNsKbrILSVRkXZj2kO1gkCXrqLYe+bXBoBcL5zs9myF8VXK2F4PEL8IgmGI4CfrZ
	 qNIqzBtDbOK/aXY7ow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1w3kkW1FZg-00r4nl; Mon, 12
 Jan 2026 19:00:28 +0100
Message-ID: <0914098e-e61b-40c1-9b6e-357832fef5a9@gmx.de>
Date: Mon, 12 Jan 2026 19:00:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] platform/wmi: Introduce marshalling support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net,
 linux-doc@vger.kernel.org
References: <20260109214619.7289-1-W_Armin@gmx.de>
 <176823202983.9723.14857677950268577030.b4-ty@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <176823202983.9723.14857677950268577030.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dHzVbf25GEv7GfxWYi+jige/MR1zvBg/koOiG+sXUQ6KcahPEZe
 E+FTEWSks6M0p3VJDqBTDA2Gx0dUm2677jvaeGLQpRK9TOFLQ1czJ2FfkJ2pMEtuCKIOGB3
 azdAY4weItXzMIgDaH76FTS5oFX3YAPowyS6nkAV0cDhg99TY+1/b/EcuMQu2wtIInJfyYY
 AZVOc2PbRo9TU8BBn2ULQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gnzmhy+MdFk=;w+p+xiCZmwYSpwbXgb8Dr8zlU2R
 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
 9jrlZCvU6+eTW5ub9e4Kao5jFw+8y

Am 12.01.26 um 16:33 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 09 Jan 2026 22:46:10 +0100, Armin Wolf wrote:
>
>> The Windows WMI-ACPI driver likely uses wmilib [1] to interact with
>> the WMI service in userspace. Said library uses plain byte buffers
>> for exchanging data, so the WMI-ACPI driver has to convert between
>> those byte buffers and ACPI objects returned by the ACPI firmware.
>>
>> The format of the byte buffer is publicly documented [2], and after
>> some reverse eingineering of the WMI-ACPI driver using a set of custom
>> ACPI tables, the following conversion rules have been discovered:
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> The list of commits applied:
> [1/9] platform/wmi: Introduce marshalling support
>        commit: bfa284e9f5e77c9e7389116a403b1dc478f2d58e
> [2/9] platform/wmi: Add kunit test for the marshalling code
>        commit: 1e4746e93871168f50f237e9e316dc6c9a883719
> [3/9] platform/wmi: Add helper functions for WMI string conversions
>        commit: 3ae53ee45d5c958aae883173d1e4cafe15564cce
> [4/9] platform/wmi: Add kunit test for the string conversion code
>        commit: 3579df4cf0b5a3c1d50146c72b13bb4215d509b5
> [5/9] platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI AP=
I
>        commit: ca7861de6a37a52bf75fe41be51fd39162a9281d
> [6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
>        commit: 7f331e5f10ebb72d3bbc83470e4b409337024093
> [7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
>        commit: e9997669653bc0622f9ed8a3fe778cc989d1e254
> [8/9] platform/x86: wmi-bmof: Use new buffer-based WMI API
>        commit: 70d37a7fd341e5c0090385034feb8f6f93a56ae7
> [9/9] platform/wmi: Update driver development guide
>        commit: 0835f9737d4705a9f72de05fde09ba806dcbc862

Thank you :)

> --
>   i.
>
>
