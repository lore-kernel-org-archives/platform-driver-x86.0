Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792907200;
	b=e8sialLXCeaLqxXt1df6DwkSvUxqKD5dQVjltuBayTpQLSFjEiP6yQ/PkIJQMCBiFLxc
	 MSGXeWYcdwDnhMBPivfW9lG/ATszOzF3g11VlQbMYk8PObXQ6d7/udMQlETuYMjQcJGSO
	 WgRNDR8LYNITS1hHtdDofv3+LBBnUdNn/gpuroBYKhmBUK8Cu/+nwxZ+B45Y2oUiOLONB
	 JzYuP3/54VMbfo567iHRjTwK2dzPUhouW4m4RCvzldKxV4UVFDSaHREsalh1jOji/izpF
	 C8B06uQO/P2hgrcH52XDHxtrh6GU9RbhMLcHWycrF4FIO+I9X4OHOXfwiLZkozRl3Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792907200;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=v0FJDGnHjSuyBK3p+QNThtyYo7iwdYlkxusEDQR5Cis=;
	b=bZYuMerAir9iupY1r6xXPmPKXQhhoDG8M4iEuzZsWtuTonJ8Urd05QBu3o3OH6SyQwct
	 MdSwymKOXbgCyYQdH+P7RJXZ4roZCxkrs8b6uJ2d9ew06mMymp9/XGaA5fReI/G40axUK
	 +YEIOX0RkHJb5oPqDJuKy838pL8lUMxMf/9cTgquktldEj7cDQri3kAt3xT5s/QlOm+ur
	 SodPY/zZLt0zQstenNKx17inkeU3J6ttwt/XfjYETNMUGSemPhYJ3H1RCySiivK0IS1TU
	 ft1LrURuCML5OZgF2EZRQL7MkIuXGgKlu3s5Pylr0x+G7oF1z5c2NoifI8qM/iukOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bogusta.com;
	spf=pass smtp.mailfrom=bogusta.com;
	dkim=pass header.d=bogusta.com header.i=@bogusta.com header.a=rsa-sha256 header.s=protonmail3 header.b=QDTMHAr3;
	arc=none smtp.remote-ip=185.70.43.18
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A10606A31E
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 05:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18A10606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bogusta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bogusta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bogusta.com header.i=@bogusta.com header.a=rsa-sha256 header.s=protonmail3 header.b=QDTMHAr3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bogusta.com;
	s=protonmail3; t=1792907196; x=1793166396;
	bh=v0FJDGnHjSuyBK3p+QNThtyYo7iwdYlkxusEDQR5Cis=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QDTMHAr3HaZ10ORKgZOiI6IqpzlDLgkxAkVMoc3ktzhYNEpp5pmlGU6a0cZyiQPhk
	 IBk2iCukBgV6fkvj3aJzwddmFvTb/tmK2sUNKtPM/SMnzrImxtp3r32huA7/rot03M
	 s9AhXAwAeRi/t9yGIBIJW6CsrycEv337mq+ZO9rqmfDCxlkGrYcQzS3XVy/CIhlmSx
	 0TppnQb/TKC8GOTPmmYfVHfkPRlI6Pr7Th3+ZfDORfzj3Cp92g+f5ITWN3XVADwr8g
	 K6whf8Ho8spPCy66XQ0jIaKIZdy+FSVhYczRjuEIBTi4FDS55k06Y/uQQ0Ga53q+sK
	 l+4qms9AIA0aw==
Date: Sun, 25 Oct 2026 05:46:32 +0000
To: Denis Benato <denis.benato@linux.dev>
From: alex@bogusta.com
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benjamin Tissoires <bentiss@kernel.org>, Antheas Kapenekakis <lkml@antheas.dev>, Denis Benato <benato.denis96@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: Clamp keyboard backlight level from hotkeys
Message-ID: <Lw2-T3d0vVWwlA_msvm_zjVUms821VDv_EKarQwaugY0E6UtkHDIuZ1a4UQgNeto_RnoB2xxxk43SWSepIWBSKdvKD36G1ss4G-TkuyZv4w=@bogusta.com>
In-Reply-To: <f71595e8-8553-4e18-89a8-cca93cd65f56@linux.dev>
References: <20261016015117.32174-1-alex@bogusta.com> <f71595e8-8553-4e18-89a8-cca93cd65f56@linux.dev>
Feedback-ID: 59787548:user:proton
X-Pm-Message-ID: 10bfe482c1861300159131632a1b6009306bb7e3
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Denis,=20
thanks for the review!

On Monday, October 19th, 2026 at 5:52 PM, Denis Benato <denis.benato@linux.=
dev> wrote:

> Is the change of type really necessary? I think clamp_value does everythi=
ng required already.
Hi Denis, thanks for the reply,

clamp_val() without the type change wouldn't fix the problem, as
at level 0, led_value - 1 is an unsigned type and wraps around. clamp_val()=
 then clamps this to 3, setting the leds to max
brightness

> Honestly I don't like the change of type... I would prefer something that=
 prevents the
> bad thing from happening without changing the type.

My reasoning for int was consistency, as asus_hid_event() and
do_kbd_led_set() already do this arithmetic as int, and the comment
on enum led_brightness in leds.h describes it as obsolete.

That said, if you prefer keeping the enum, one could avoid the
wraparound instead with the call

=09kbd_led_set_by_kbd(asus, led_value ? led_value - 1 : 0);

and keep the clamp in kbd_led_set_by_kbd() for the upper bound.

Thanks,
Alex
