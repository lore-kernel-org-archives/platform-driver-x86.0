Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0221745FFC7;
	Tue, 18 Aug 2026 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050841; cv=none; b=fKI6d1lIZWhUiY5czkQmWwRwNmYx4BHVaCDqRjPAJY4Mxj72gkDbRAJJJhcNWV5rWjnMIfn56wT+xDcTJ6RpUnF03R1wdgx8OM6HJA44tNBUTQtuR7OSnGAKCiPbBxz/xixeNRfYnQiD2igA5Ilx4FX5qR6CZRHfxE3N9irM0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050841; c=relaxed/simple;
	bh=LHVmE3bPSblhNoRlMtXStbTyH2HfnxWyaAzlX6nvpnY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H4sJsQ9C7DtvjSfmUEwU7e2utSuP86mQakxJKRsN+TCkBLg1hoUasvA28UbySRylrxcreoB87PYip3dT9jUEXdlSiJ7PhoCXP4K45ou9s5AX09d24fArQPdz+IeDbqG/kV7mMQRYLMlD48TvRgJ4V2kG2oqvV05h4jJne0eb/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0EPy9yg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0EPy9yg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99B81F000E9;
	Tue, 18 Aug 2026 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050839;
	bh=lopzyqA3Pve3xHPmnmWWLNctBPpNpnRvOu6gYvkHLqo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=M0EPy9ygsb9tGGLUKKISCwYFgy8wnyERO6tuqJg22cm8HprP4sRX3AjY8SeXVBr+Z
	 GNTKE/tUBZ5wSjLZPfcXQEZg8cw4YIiB31ejMdpBv2IgCup6d/0t5HMEeqvv9eL2AH
	 6Pn1b8CCK+k2JinMARrhGQcPqfeWR51rqXQ9yIs0DjhedvsuGEQL4P0gcJMsmVqeUw
	 MiDQgYGGWHbOSgcbUVKxfxWCeLc6U8yllmX4K7NArcgVi2ugKCoJKspvQFepMLhxfJ
	 O1YKr+CHXTIXKVzjdBZiloJHsnppXBH3R3kZkzVLkRjBHcaslXyTDgKvXktF7K/a4h
	 92pliPmaNWNYA==
Message-ID: <a135b02a-a4e6-4abe-940c-a93bf0ea807a@kernel.org>
Date: Tue, 18 Aug 2026 13:00:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: add HP Spectre handshake delay
From: Hans de Goede <hansg@kernel.org>
To: James Alexander <opensource@inspiredexperts.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20260816204247.2844986-1-opensource@inspiredexperts.com>
 <a062f34e-4e26-457e-a116-5481d34bf8ff@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <a062f34e-4e26-457e-a116-5481d34bf8ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexander,

On 18-Aug-26 12:43, Hans de Goede wrote:
> Hi,
> 
> On 16-Aug-26 22:42, James Alexander wrote:
>> The OVTI08F4 sensor on an HP Spectre x360 14-eu0xxx failed to read its
>> chip ID with error -121 when the existing 45 ms handshake delay was used.
>> Increasing the delay to 150 ms allowed the sensor to probe.
>>
>> Keep the existing delay for other OVTI08F4 systems. Add a reusable
>> handshake-delay field to the discrete-device quirks and set it only for the
>> affected HP Spectre family through DMI matching.
>>
>> Compile-tested against Linux base fd923b32d761. Hardware-tested with the
>> full patch set across 25 consecutive reboots on the affected laptop running
>> Ubuntu 7.0.0-29-generic; the sensor probed successfully on every boot.
>>
>> Signed-off-by: James Alexander <opensource@inspiredexperts.com>
> 
> Thank you for your patch.
> 
> There have been more reports about the 45 ms not being enough of a delay,
> but IIRC I never got around to bumping the delay because even with
> a bigger delay on the laptop in question the probe would still fail
> approx. every 1 out of 10 boots and we got stuck on debugging that.
> 
> And then I dropped the bal on this, sorry.
> 
> See:
> https://bugzilla.redhat.com/show_bug.cgi?id=2333331

Funny after re-reading that bug I see you are one of the reporters
of it, again sorry for dropping the ball on this.

> https://bugzilla.redhat.com/show_bug.cgi?id=2333647

And this is more or less the same thing, but here the sensor is
a hi556. So it looks like the fix is to simply boost the handshake
pin default delay to 200 ms instead of having a model / device
specific quirk, dropping the existing OVTI08F4 quirk.

I'll go and prepare a patch for this and submit it upstream myself.

Regards,

Hans



