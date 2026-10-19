Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445724;
	b=kanmvN2NSIAQd0YSfTdvxHps51pS3sHzo9J5rp3wKVg0ns03Ebph3ZoR/gfvLxLxhfEZ
	 mR2P1jWr4It/sFG1ThvAqnh2fVdKXMP7SNXD85h+odvmV/SDaqHCb7fX2G74XBqLxl4zU
	 /dWpDxuuQZQSJNyjsmxcEUgtMv7Rdo+6HhSZWBLra6yxsDs5QCfsi7YYEpmTVbIfk7Nri
	 huOPAzRwo/By8Bwr9vemoBKHkizREJsO9lF1VkQJss2BgbCUoIMKuFxJudG4olNfVv6Nh
	 piUv4s0viaeypWnITkvWGq2TfcYQTTtLshT5mhtqUik9FusKwdPdM1bktqbxdycBakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445724;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vHL+OCLoMPPykU/EzZkExlVkKDRpQnrt5ls5P4riEHI=;
	b=IUoqc1JZlJZFwCTPrh4FC+l8E8S8t8XxUVwJC3/Cqip5+nz/+Q1GhUuCtGYZabRIbcJ1
	 D53frdrmHGvmP1yquWVRErpSWBQu/p//9Y/FIbabci9z10MD7LWrS8fNTkmAc/T/m6Ydw
	 24w7COcixG509GKicn0bOYXoBd18weVz30a12GL9c9HDgR/mdZeXz1xgT+mL51sOofYv8
	 L/u4t6j7lQ6lLV5/7g8R2oI9KIF12cVYuYc8K1zjzU+Dq6zEnduueJef09qP6CkxSFZml
	 OhmBORMy1DRvflS6n3WN4fY6kxWsIiPDjXmEASNDfxUDkCVreMCqbVxKrkwnDJhwkBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=yuh7i5iribccpkngmjosjkrl4i.protonmail2 header.b=sxObmSJd;
	arc=none smtp.remote-ip=109.224.244.25
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C5606A31B
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 21:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613C5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=yuh7i5iribccpkngmjosjkrl4i.protonmail2 header.b=sxObmSJd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=yuh7i5iribccpkngmjosjkrl4i.protonmail2; t=1792445720;
	x=1792704920; bh=vHL+OCLoMPPykU/EzZkExlVkKDRpQnrt5ls5P4riEHI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sxObmSJdvY5lQ5WfR+Lqln6YArQoAfFjxQr850X/3sv+dBDn+fAJlB95L9wv679Bl
	 SAF8/kN+LXZX61PXvUF3QiTKDEQEL0DKs8/c3SVaYiNP5+fhnwyRfFbEg7NGNS2CQc
	 3yrYzu9cwPvbMFE0jQwSDAsRMm5K8obM2lfuaIWJRrVDUfCGhl/WMMyA+sdehqis10
	 YVfYnQ+UadYhEwoZWoLaF0uaWzbejBY9EjlbjugLVclDsk9q4CS4ku3qENA2vcxmA1
	 +IjvfM4/ZD6f4TozjCEAggOsyVzplWoTbogFlQ51uRCw1x4fMk/kC+GLXaf2dhrux/
	 j3GXPNTtipBtA==
Date: Mon, 19 Oct 2026 21:35:15 +0000
To: Lyndon Sanche <lsanche@lyndeno.ca>
From: verazimmerman1987 <verazimmerman1987@proton.me>
Cc: "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "superm1@kernel.org" <superm1@kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: platform_profile: power-saver lost on Panther Lake when SoC Power Slider and dell-pc are both bound (low-power vs quiet)
Message-ID: <BZwCwyE08uZUOYVbDR8jIYn6pG9aKdn5VG6e5EzDnlo6KgYEmMA2szkOBVrXMbbDclud59u4DWTPP5h9tr2IqM43QL3tDXUnGs03TqgcGJw=@proton.me>
In-Reply-To: <DM8T7ELISJJB.2MKMPBE1BELFC@lyndeno.ca>
References: <UPfoGdnS1R04q8uekSMTyes9PbDuvsGeBE42zHmsjD2xIdfPYx7ejdcpZhrxWFq6uwoMvClHTuHbrwaCh3yxD0Rw7OarNABC4dZsDra44mk=@proton.me> <DM8T7ELISJJB.2MKMPBE1BELFC@lyndeno.ca>
Feedback-ID: 187400468:user:proton
X-Pm-Message-ID: 55d50284c3692d3dddaf569c107074e03854b4b6
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


Hi Lyndon,

Thanks for looking at this.

> What if platform_profile itself was changed to separate the user/system
> choice: the "desired" profile, from the "actual" profile(s)?

From the user side this sounds right, and it matches what I would
expect as a user: I pick one profile, each driver does the closest
thing it can. A few observations from testing on this machine:

1. The legacy /sys/firmware/acpi/platform_profile is where it actually
   breaks today. When I set dell-pc=3Dquiet and the SoC slider=3Dlow-power
   by hand, the legacy file reports "custom", and power-profiles-daemon
   treats that as an external change and falls back to "balanced". If
   the legacy file reported the desired profile instead of "custom",
   the main userspace consumer would keep working.

2. On the ordering: low-power / quiet / balanced / performance fit a
   linear scale well. "cool" is less clear. On this Dell its DTT table
   has the same PL1 range as quiet (15-19 W) but a lower skin
   temperature target (40 vs 42 C), so it is more of a thermal
   preference than a power level. Placing it next to quiet, or letting
   drivers declare it as an alias of the nearest level, would probably
   be good enough.

3. Ties and gaps: when a driver has no exact match, rounding towards
   the lower-power side seems the safer default (e.g. desired quiet ->
   low-power on the SoC slider rather than balanced).

As an interim step, the hidden-choice approach would fix power-saver
on current Panther Lake Dell systems with a small, backportable
change. Another user on the same model (XPS 14 DA14260) hit the same
power-saver -> balanced fallback independently:
https://github.com/omacom/omarchy/issues/14174

I'm happy to test either approach on this hardware.

Thanks,
Vera

-------- Original Message --------
On Monday, 10/19/26 at 15:21 Lyndon Sanche <lsanche@lyndeno.ca> wrote:
Hello, thank you for reporting this.

To me there are a number of ways we could handle this.

On Fri Oct 16, 2026 at 1:10 PM EDT, verazimmerman1987 wrote:
> This looks like the same class of problem as amd-pmf + asus-wmi,
> which was solved by adding "quiet" as a hidden choice in amd-pmf
> (commit 44e94fece517, "platform/x86/amd: pmf: Add 'quiet' to hidden
> choices"). Would a similar hidden "quiet" (and perhaps "cool") choice
> for the Intel SoC Power Slider, mapped to its low-power setting, be
> acceptable? I'm happy to test patches.

This certainly would fix the immediate issue: platform_profile providing
consistent choices across handlers to allow selecting a range of
profiles exposed by the system. I feel like there is a better way to
handle this besides adding hidden profiles.

What if platform_profile itself was changed to separate the user/system
choice: the "desired" profile, from the "actual" profile(s)? In this
scenario, different drivers expose different possible profiles, the
system tries to apply the closest possible profile per-driver to the
user's choice. The possible profiles would have an index to indicate
where on a linear scale it lays. If I request quiet (2), but the Intel
SoC slider only implements power-saver (3), the system chooses 3 for
that driver.

I am only thinking out loud and would find comments on this to be
useful. I realize the behaviour of some profiles do not exactly fall on
a linear scale so this would need consideration as well.

Thanks,

Lyndon

