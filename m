Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E547F2F8
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629251; cv=none; b=nYXyH/H8YIpAtGlzytBZqDwqYt07MwLXyH/xw1lSffx9QfmEj2Oy+Icj5hLv9MuslrcFPG/V24hkR0pTtY+ZyBumK1UKr+OJlDH5artOtbLZFN55lhlrsYlqF4gSyZFJQlh09a30hTXXPLgrYiV2TJqpssLuaGCOY9Vjk96WEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629251; c=relaxed/simple;
	bh=iBd69bb8EuVif3tUAwJ9D/+XJVAhImzxdFHxRKdgGDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0/0vihptcojb6F6eJ+21T0Lcy8Z0+GKa+aHnwFEIEVI3c7xAYzl6NmHT/Gdm6K5lJve36FXZoHICKP/VlV5w27wBPAT1XflLaLybBFBDi0O+Gg/NKdtO3P0665xRFo4rTikt6jXxLgtOgwQHsTn/SSIcdVuUoXLCXn1HN9h/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Bpg0ATYG; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Bpg0ATYG"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4h4D131HZSz6GBl;
	Tue, 21 Jul 2026 12:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1784629239;
	bh=iBd69bb8EuVif3tUAwJ9D/+XJVAhImzxdFHxRKdgGDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bpg0ATYGdipKokOaUEJ4ejSvBupR9TBT/LBfGP3KYRQwMQzWDVyKvtUZvMhfXKnzQ
	 uw16uOgZmQKqrZK7j7rKESVogaeft+O9udWNQtwLHsJ/mCYR10aDdCtdgccCfH1VW5
	 ajFWnf3Av/jbDNvydWOBpfeAa+dL7k0jnkLBgL/Fu3ZfwePLzPQumVuvxtiItwgEqW
	 F2MMvWFt3PNZai3/p9Ul85vlN0bR96CYqwHujZmJRjDMZJK9xPszEYfh30Ez4p/lhu
	 rQadOik59jtdKkwNmSOc8bKxLJ3Uf14QGnJGWlMdrmEaESy609e2kqBXGmcDshUIm9
	 fBMQBdYVB4qNQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4h4D130Yjcz4xYH;
	Tue, 21 Jul 2026 12:20:39 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h4D1217rlz8sZw;
	Tue, 21 Jul 2026 12:20:38 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 146C55FC9C;
	Tue, 21 Jul 2026 12:20:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e9fc777e-fccf-4173-a564-3846396ba6dd@leemhuis.info>
Date: Tue, 21 Jul 2026 12:20:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted but
 profile remains balanced on Redmi Book Pro 14 2022
To: qby140326@gmail.com, Gladyshev Ilya <foxido@foxido.dev>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
 Robert Munro <robert.munro@ethicsbowl.ca>, ilpo.jarvinen@linux.intel.com,
 regressions@lists.linux.dev
References: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178462923742.1020471.14469628590378182114@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 146C55FC9C
X-NC-CID: rSaY7LPMPElVVui73T6me1sALVtdKrrLzRyhQJut5sNRMDxo6wY=

[top posting, to facilitate processing]

Hmm, nothing happened here.

Mingyou Chen, this seems to be cause by a change of yours. Not totally
sure yet if this qualifies as regression (sounds like one), but could
you maybe share your view on all of this?

Side note: Robert, have you tried if latest 7.2-rc works any better?

Ciao, Thorsten

On 7/13/26 20:35, Robert Munro wrote:
> To: Mingyou Chen <qby140326@gmail.com>, Hans de Goede
> <hansg@kernel.org>, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
> Subject: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted
> but profile remains balanced on Redmi Book Pro 14 2022
> 
> Hello,
> 
> Linux 7.1's new bitland-mifs-wmi driver binds on my TIMI Redmi Book Pro
> 14 2022 (TM2107) and exposes platform profiles, but selecting power-
> saver is silently ineffective. The userspace request returns success
> while the sysfs profile never leaves "balanced".
> 
> This reproduces without KDE:
> 
>     $ cat /sys/class/platform-profile/platform-profile-0/name
>     bitland-mifs-wmi
> 
>     $ cat /sys/firmware/acpi/platform_profile_choices
>     low-power balanced balanced-performance performance
> 
>     $ cat /sys/firmware/acpi/platform_profile
>     balanced
> 
>     $ powerprofilesctl set power-saver
>     $ echo $?
>     0
> 
>     $ powerprofilesctl get
>     balanced
> 
>     $ cat /sys/firmware/acpi/platform_profile
>     balanced
> 
>     $ cat /sys/devices/system/cpu/cpufreq/policy0/
> energy_performance_preference
>     balance_performance
> 
> I repeated the request while polling platform_profile every 50 ms. The
> only observed value was "balanced"; no transient "low-power" state
> appeared. The request completed in 162 ms with exit status 0. power-
> profiles-daemon also persisted Profile=balanced afterward. There were no
> relevant kernel or daemon log messages.
> 
> Expected result:
> 
> The advertised low-power profile is selected, platform_profile reads
> "low-power", and the AMD P-State EPP becomes power-oriented.
> 
> Actual result:
> 
> The operation reports success, but firmware, power-profiles-daemon, and
> all AMD CPU policies remain balanced.
> 
> System information:
> 
>     Distribution: CachyOS
>     Kernel: 7.1.3-2-cachyos
>     DMI vendor/product/board: TIMI / Redmi Book Pro 14 2022 / TM2107
>     BIOS: TIMI RMARB4B0P1010, 2023-06-28
>     CPU: AMD Ryzen 5 6600H with Radeon Graphics
>     bitland_mifs_wmi srcversion: 0C0A58A1AE25437010C0B5E
>     power-profiles-daemon: 0.30-3
>     Power source during reproduction: AC online
>     Active profile holds: none
>     Other power managers (TLP, TuneD, auto-cpufreq): none
> 
> powerprofilesctl identifies both drivers:
> 
>     power-saver:
>       CpuDriver: amd_pstate
>       PlatformDriver: platform_profile
> 
> The kernel taint value is 512 because of an unrelated AMDGPU display
> warning during boot (dcn31_program_compbuf_size); bitland_mifs_wmi
> itself is not tainted and emitted no warning during reproduction.
> 
> This began after the 2026-06-24 update from Linux 7.0.12 to 7.1.1, which
> introduced bitland-mifs-wmi (dc1ec4fa86b2). Power Saver worked before
> that update. My installed 6.18 LTS kernel does not contain this driver,
> but I have not yet performed an LTS or vanilla-mainline A/B test, so I
> am explicitly reporting this as reproduced on a CachyOS kernel.
> 
> 
> Regards,
> Robert
> 
> Assisted-by: OpenAI Codex:GPT-5
> 
> Robert Munro
> Director, Executive Team
> robert.munro@ethicsbowl.ca <mailto:robert.munro@ethicsbowl.ca>
> ethicsbowl.ca <https://ethicsbowl.ca>
> Ethics Bowl Canada
> 

