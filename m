Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425363;
	b=OUFNQCda1M0PCtu8bONIyH3fL/4l5Kv1CoXsh8Fs5sZJxmdGgR26nWmqcVO5WPe4Umtr
	 Z2QcJj8ve0aEVC6n/6zBXWj8TQFeDR78gFGIADLv7+VtW6eyasmloKyVNMqRWqrVhZTYE
	 D1CRtgYVumC5jJ5ssuweKpbq3clD0U1aSRkAjEJ8JNtGONaEDRi+Xbdr8k6tzrB3KyC/N
	 0373pyfF9ulIvGVAyLw7hpqNtbo7n3gbejv1HARstjq0lMvJNQwPxQ3xQvWuVRng/87o+
	 Jio0lCxFLr2GZcKaPr7T9iR7qY/U+RyhTp/RMrTIYcywwlXpW/19lniMTsRZkRKAYow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425363;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SBtxlT+Qp4W+IJHkb15i2LvcCwgPafujvbV+bqx52tw=;
	b=wJ2ahpDz5fQVmu+YPdfIUDV3OG+63QiIK2D073otW9iCy6HJ+DspgM0VsRUr89DJmyY8
	 xIhErjQSELnMp54rgu6+PU+ct2ReRP3yzGY6jw2icpPI+yCeSOPiEAPXQGvz1UlQ7AX8K
	 fw/I4dP4PNa+K8F0KDwsCiXnLhtzCFkHpILiIZYmTbo0G0HVj1xDmLppokePKbvESA5JG
	 f2Jxr4OgV01w/idCjOrq3hQp+FzujHkXdmJ3K6hCyqV9kOm7ZhQWCnyDFuDxx2KTIQxj3
	 9U5J3FzJ3xAg/QEdxssL05pciEur8H/P3c3sPYm0PjEW+WQYOAwk5/QerAFhsW17SXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=CuE+Fqe0;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD2E606C149
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 15:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD2E606C149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=CuE+Fqe0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792425359; x=1792684559;
	bh=SBtxlT+Qp4W+IJHkb15i2LvcCwgPafujvbV+bqx52tw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CuE+Fqe0VPEcvQtt4M5Hjuv5oUlpEJX34dz/HT4r9HJQWltRATX9LWGdev7tgydB1
	 UDG9AVcyJMTJ/oKrYooHRyEu1qJBTeechb73YqIAVfMIi6Wy7Mfq+1iWfgfmeumAq6
	 hPauXIU2+KhToxYXzGU7z3tPlE57dTdEpCcY4qMW9rpY95/GGJhk5JPfZtxQ4vM4QP
	 vY42n0NWBIWAWW3NhEM6onhkS2OEa3VCyN4qAxkucjQaxyj5t7Lfkvex6rG81nS9Lx
	 HstjI0xzwtSiE5KQ8a/9eZBFEPUTke1OoeoWFvQ9W/lZOnyxXh8MUGZBRNAVhA5rBi
	 maNxyxAyVjr/Q==
Date: Mon, 19 Oct 2026 15:55:55 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Jona Sadjak <jona.sadjak@proton.me>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] platform/x86: hp-wmi: OMEN board 8603 gets no platform profile, and a 0x1B event loop once it does
Message-ID: <19157a11-33c1-42ef-b7a5-7be1f5682c79@proton.me>
In-Reply-To: <69aafae4-acbe-4e69-91ec-204f1f7aa310@proton.me>
References: <26460fe0-b8c6-42fc-847d-3cbeea8d3721@proton.me> <69aafae4-acbe-4e69-91ec-204f1f7aa310@proton.me>
Feedback-ID: 174706356:user:proton
X-Pm-Message-ID: 918d14565bc480e783217e217530d5b0d1ee8e5a
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

On 19.10.26 16:23, Jona Sadjak wrote:
> Switching back to performance at runtime
> ----------------------------------------
> After switching to balanced and then back to performance at runtime,
> the call succeeds ("set mode 0x01, result 1") and platform_profile
> reads performance, but package power stays limited to 40-45 W.
[...]
> So the EC seems to apply the higher limit only at boot or on resume.
I found what is behind this, and a third problem.

Problem 3: performance falls back after about 120 seconds
---------------------------------------------------------
Even when performance mode does take effect (after boot or resume),
the EC drops back to its default state about two minutes later. In an
idle test it held for about 127 s, with AC online and no battery
discharge. platform_profile keeps reading "performance", but the fans
drop and package power is limited to 40-45 W again. Under a gaming
load, the EC's battery data showed the battery discharging after the
fallback (up to about 1.9 A, cell voltages dropping) while AC stayed
connected.

In my ec_sys dumps, EC offset 0x12 reads 0x29 while performance is in
effect and 0x1f otherwise, and it flips back at the moment of the
fallback. I could not find a byte that counts down, and 0x62/0x63
(timer and flags on the timed boards) stay 0x00 throughout.

hp-wmi already describes this kind of timeout for the Victus S fan
modes: hp_wmi_get_fan_count_userdefine_trigger() "enables and/or
maintains the laptop in user defined thermal and fan states", and the
fan keep-alive repeats it every KEEP_ALIVE_DELAY_SECS (90 s). Doing the
same for the Omen thermal profile works on this board:

  - call hp_wmi_get_fan_count_userdefine_trigger() right after
    omen_thermal_profile_set() for a non-balanced profile (it returns
    2, the fan count)
  - repeat it every 90 s from a delayed work while the profile is not
    balanced, and cancel it when switching to balanced

Log with debug prints I added:

  hp_wmi: Omen thermal policy version 0, set mode 0x01, result 1
  hp_wmi: Omen user-defined state trigger, result 2
  hp_wmi: Omen keep-alive trigger, result 2
  hp_wmi: Omen keep-alive trigger, result 2

With this, performance mode has held for roughly 12 min under
prime95. It also explains the runtime switching problem
quoted above: with the trigger sent right after the mode change,
switching from balanced back to performance at runtime takes effect
immediately, without a suspend/resume cycle. After writing "balanced"
and then "performance" to /sys/firmware/acpi/platform_profile, prime95
holds package power at about 89 W, which is the 90 W PL1 I set with
throttled at 3.4 GHz and 93-95 C.

I'm happy to send the full local diff or to test patches.

Same note as before: an AI assistant (Claude) helped analyze the logs
and draft this mail. The measurements and tests are my own.

Thanks and greetings from Vienna,
Jona

