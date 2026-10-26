Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012313;
	b=AiyxDWxnt9dZkBT8+S6VplVBuCfWXiOM1ur3Cxn0Ieux4qqRnjNbka/WomByCpqfgr1F
	 6o5ODnzM+pIqrSQ7iL8sxfu5fPC0WvIfiMxz0pByG/s4e+jV476Cf9MYyiqHRt9NDo89N
	 R2FIRsMXZnzAI8R4EkLHUWzTYTGSR6ZDzRsFj9K0ewcu1XnkPVhluLg4MuW8569xiU9TU
	 CwAFTlAn6nM99rXJIM1u6w7ZGUESMyXizy52RpaLa9eiHUnNOBAOp3tUCvXP7b1CmumSe
	 tSYNOqTcrhVWuV2+Ev9uuSEb6gJPOWM02eNb2iN0CBYIHS+7pmu0l3IJxERXjyxzAEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012313;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=F4PTtG0p5qUxkiwJlFf03ohdweVlCHw/PJrDFEEobnM=;
	b=avJvHpbkMRxR2+BKtJjLLrZYew1X1qwr5BJvz2HPiscGAd20FIPRZV+mFqaF259EdMe3
	 hevn61TU7LRKjX4CJJKgDrgsOo3LKTmZX10xafSJPir/9eIRGS40pXcbcm6BVABswUKzv
	 OK6Fnv1YBOXT9VlB+tooO9Wz1bj2fDPCEn2WaKzw5YCfa6JArxRK3IR7Km6fhgsmbWTL+
	 DqO/sd63VJ3mgTj7+2Sd+YpDMObzuYFWqNamRfAKIz+wCotJDwV8OSohMJrwPvHmRpb7h
	 T/d14p2oHvbzqxWKsqH3w7Qo9bZYsbtc49YZk7oj9fB0j3Kuj8S7R67yu3NvYEBA0VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PGxIQdVp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D4F606A31D;
	Mon, 26 Oct 2026 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PGxIQdVp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED471F01828;
	Mon, 26 Oct 2026 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012312;
	bh=F4PTtG0p5qUxkiwJlFf03ohdweVlCHw/PJrDFEEobnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PGxIQdVp8L88LqYyx3vL76tCm8GDgKA++ToGxAeC0ElfCnRejTz2M6Zt6lH4uz2PB
	 56EDJgyRuP1efY06BdLmJUCN7IX5I8d/tMEm9HWUEiKpDL/02pExOI9JgYqqfkTaIN
	 isjmSrBro6LSz2BXkZE2rnHykFrFZIhlDz4WGTYVcfIEr/6G1b9CDZDgQRXro4Oru0
	 AXuxVgM4Em/a3yfPiwiqYlwW3SLK8LBwp5TVbLDztoTuZIAZ8F212Y1nwMpIk76WeK
	 MGD+l6CdTtC+J4WQU5f/TnJIFJQPTy6Ra7sCHsO4Rpw5mQcYGIW01my8u2N7r8xBAC
	 KmHdDudFKApMg==
Message-ID: <dd7765dc-f636-4572-8325-97e901814796@kernel.org>
Date: Mon, 26 Oct 2026 11:58:25 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/7] Merge redmi-wmi into bitland-mifs-wmi
To: Mingyou Chen <qby140326@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>, platform-driver-x86@vger.kernel.org,
 ted eric <ericted8810@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 linux-kernel@vger.kernel.org, Chris Taraszka <chris@miget.com>,
 Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/ig==?=
 =?UTF-8?B?5paH?= <btx342@gmail.com>, powerfullz <wleizc7319@gmail.com>,
 =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe
 <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>,
 Serhiy Shliapuhin <shlyapugin@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Oct-26 2:34 PM, Mingyou Chen wrote:
> This patch series consolidates the standalone 'redmi-wmi' driver into the
> 'bitland-mifs-wmi' driver to eliminate code duplication and centralize
> the maintenance of overlapping ACPI WMI event streams.
> 
> Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
> platforms share the exact same keyboard event stream WMI GUID
> (46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
> the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
> it into discrete type/id/value fields.
> 
> Redmi operations were not contained in this patch series, future reverse
> engineering is required.
> 
> This series introduce a newly reported mic-mute hotkey definition
> for Redmibooks, dropped the previous redmi-wmi driver and intrudoced
> the quirks table for the bitland-mifs-wmi driver.
> 
> I don't have a Redmi or other Bitland device. So I cannot work on the
> real device.
> 
> Features are working properly on my device (Lecoo Bellator N176).
> 
> I leave the future reverse engineering work to the community.
> 
> Tests are welcome.
> 
> And by the way, the no_set member in bitland_profile_entry means a
> platform profile is only report by the firmware but not available for
> set.
> 
> Does accept_zero_function still necessary since the driver now permits
> 0x0 function field on SET operations?
> 
> And I've got a question, from sashiko's comment in my v12
> 
> https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com
> 
>> Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
>> devices?
>> Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
>> if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
>> device:
>> 	if (dev_type == BITLAND_WMI_EVENT) {
>> 		/* Register input device for hotkeys */
>> 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
>> 		...
>> 		return input_register_device(drv_data->input_dev);
>> 	}
>> When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
>> invokes the bitland_notifier_list, and returns without reporting an input event:
>> 	case WMI_EVENT_PERFORMANCE_PLAN:
>> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>> 					     NULL);
>> 		return;
>> Because the platform profile and notifier were not registered during probe
>> for event-only devices, does this mean the events are silently dropped instead
>> of emitting KEY_PERFORMANCE like the old driver did?
> 
> I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
> bitland-mifs-wmi) looks like an event in this LKML thread
> 
>> Since the event reports a change that has already happened,
>> platform_profile_notify() is the natural way to pass it on, as
>> suggested in my v6 reply: power-profiles-daemon then re-reads the
>> profile, which is harmless after the driver's own writes too. If
>> KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
>> keep these events observable), it may be worth not reporting it for the
>> event that echoes the driver's own write, or at least saying in a
>> comment that it reports a mode change that already happened. On
>> Ibragim's TM2209 the profile SET is reported not to work [3], so there
>> 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
>> you confirm?
> 
> https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/
> 
> So should I follow sashiko's advice?

What I think should happen here is that *if* there is a platform-profile-handler,
then platform_profile_notify() should be used (1). OTOH if there is no
platform-profile-handler (the mentioned event-only mode) then reporting this
to userspace as KEY_PERFORMANCE as was done before makes sense to me.

Does that sound reasonable?

Regards,

Hans



1) This assumes the event indicates a platform-profile-change has happened, if
it is a request for a platform-profile-change then platform_profile_cycle();
should be used instead.

