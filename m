Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380CA3FF8A5
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013402; cv=none; b=FS4oNyPpFdgQU/JErSQTkWRHxdQUqeA2XvzEiOraWPcIahIEyu1Eod/PUx9BBBtNaL+/WGDEO2zu35uRVvJks1JNJQgbdLTtwwl/rO2b97FFZ0UuyrEoBlKVqc8IPOY8JPp/onBCREcQtb+OzjKYCdij5VW+8dohKQ4/+Z8Zsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013402; c=relaxed/simple;
	bh=OzsRmAmrr3pS0hxGQcfVUbsUNrvWak4Sf2OT/wiqpbw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pWBPPVYWU4Os2kI7yA/OZ9GUtYz7s5WxhmPcEs9CSTqErXM7cru++eeUBqQhx9UTYKUiznuDe+IzEWbwn9XdO/9zIl0DpQhJiwsKl8wweD6MslAQa0yIu8JkElvbesAZpLVNH/U+hoTtmcTRpGtBMPYrlEBDOCDY5LEKXfG5U2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=xb3faqY/; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="xb3faqY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792013393; x=1792272593;
	bh=s9YU51jIs0ZOneVg1p+v50YT3R7NexqdnR317C1RiCQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=xb3faqY/pvRrF5ZYQO+xO1MPKs+WW9UGsiF2tuP3+YilEQHTP7MPrrgLeSbaz/cMs
	 L/Y6GUW+V3aCE+oYRCUicB7cmzdF1NsaxZHtx2WL+sNEcKdT+8v69peZUpdb8C8l3B
	 tAXZsJbHXzJnwv6DuT8vdSh3/kiQSUp5HB2IsRjGjT8F1WAEXV09nYg2VkikC3MbzE
	 gxhjyxcZ72FGchZKdZO+KEfbMhpMSKL3Oojnsj+VmwltZUViUQN7sRCUMDNZXMQpFy
	 BAt3h3W+XCwk5RZL0fOS6iHxQ9aQetzAP6FBQNldOo27Tv04wMmoUL49tjasF4DVsf
	 BiAIHvnZj8Opw==
Date: Wed, 14 Oct 2026 21:29:50 +0000
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "hansg@kernel.org" <hansg@kernel.org>
From: wisdomwebman <wisdomwebman@proton.me>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "emreleno@gmail.com" <emreleno@gmail.com>
Subject: hp-wmi: "Failed to apply initial fan settings: -22" on non-gaming HP laptops since v7.1
Message-ID: <iovLGgb3cIyulKy9cB7nlSPkeyLKOPnGm1-gjIB3oM7KcR4jgfwWjRO55l849KdkH2Xskfk-hVEoGtTQDKy4MWMIhp43TGpWAUChLgAXhvI=@proton.me>
Feedback-ID: 182157067:user:proton
X-Pm-Message-ID: 37c1efc0bd2cb9851742ac7f2ef2c24236e05931
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Since 7.1 I get this on every boot on my HP ProBook 450 G8 (board
87E1, BIOS T70 01.22.00, kernel 7.2.9-arch1-1):

  hp-wmi hp-wmi: Failed to apply initial fan settings: -22

The fan itself works fine. It's EC controlled on this machine, so it's
just the warning.

I looked into it a bit. hp_wmi_hwmon_init() applies auto mode at init
on every board, and on non-Victus boards that ends up sending query
0x27 with HPWMI_GM. This ProBook doesn't have that interface, so the
BIOS rejects it and hp_wmi_fan_speed_max_set() returns -EINVAL. In 7.0
this result was ignored. Since 7265b57fbc32 ("platform/x86: hp-wmi: fix
ignored return values in fan settings") it gets printed.

pwm1_enable also shows up here and reads 2, but that's just the cached
mode. Writing to it wouldn't do anything on this BIOS.

Someone reported the same warning on a ZBook Power G10 A, so I guess
it hits HP business laptops in general:
https://bugzilla.kernel.org/show_bug.cgi?id=3D221880

Maybe an unsupported command here could just mean "no fan control"
instead of a warning? Happy to test a patch.

Thanks,
WisdomWebMan

