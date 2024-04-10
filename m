Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602964A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712726950; cv=none; b=LZTwSy16e4MZm/sFYO0SPslzkcDOw9cmoxWu0SMgQUDq4DsqyaRTzeLjeWbD1lPbPYBs72tTfeB81DCYYquDw91oDtuqvD4ZxwXZTpAA5cvbtUquTUNOOuJvjEGsGBjBneTTDwrpeKwWpaRmAuV+dJLSsqgnXss7w9hIQrxPcv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712726950; c=relaxed/simple;
	bh=NmeHepWbr7981d6M1ARXHtX8CAsMBSwquY2MboENPZ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vm9j2cpaypY3p1ZUNO/M7yy4nIEA2pq302Yl6Ki1tByXeJ72VlRIqIP+nqFOuyVWWSvE8lcrdFLDA32+Q/Zm3+LprMCbdCF94oJB6Dwy2P9QMYMoXeAayJXld1Tldvi+wIjkVNBZntPgdnkr0wp2gG+CKERUWt9mLvAJ4DZS7HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmVl7Vq/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmVl7Vq/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E85DC433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712726950;
	bh=NmeHepWbr7981d6M1ARXHtX8CAsMBSwquY2MboENPZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EmVl7Vq/umD846AzhiYNO1at4FrnPyCA4wLwnSNmlcQxlI+8eJHxCdW0qbXt4OBRI
	 g7fqSuFZZIHX82SoMPSZTXjWwI1QKQL3ES1u6JQUP+HaHLjygI19nv0tqwHnf2SvFX
	 GPbSu8AqXrXdEyfMCaMWhuWysyLQYOgKodrIXFqE67ybBnIQeqSF4gQv1bhXOypxpf
	 oWCCsNdcoZ9QWv6Xw2iGWbDwDp/Jis7RfPi5VbCS3DAORWsL+NvK4Wv/SyhDlJlR0N
	 MnSQVlMPWlY/ffP9JaKhPZ7wDg1h4h5gu8V58bDacSod8w2lVgFN4ZMQflI+/uQRQh
	 fWWvGm7/+SnkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56FACC4332E; Wed, 10 Apr 2024 05:29:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 05:29:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-iQoGJNBeb5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #16 from al0uette@outlook.com ---
[root@Zephyrus:~]# cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
performance
performance
performance
performance
performance
performance
performance
performance
performance
performance
performance
performance
performance
performance
performance
performance

[root@Zephyrus:~]# cat /sys/kernel/debug/amd_pmf/current_power_limits
spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0

[root@Zephyrus:~]# echo "powersave" | tee
/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
powersave

[root@Zephyrus:~]# cat /sys/kernel/debug/amd_pmf/current_power_limits
spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0

Seems that they don't change

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
