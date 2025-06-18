Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF3278E71
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281490; cv=none; b=aIYEdXt7HpynHb5B+VxcI1/U//f8+nD+pf6V3uDlu5Gq5db438RLa5DKXXvcNQsbq+ZnvzF+eeWPKOJZ8GRTRS6m179/ZuIGyHCPp4EIvUXAmXmA2YDaW/2k/OrBkq+xPcE+CvLi3/BiePYFfAxF7S14X07ANexGjSwgAi8Tk9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281490; c=relaxed/simple;
	bh=KoLP8pGvV5LTxxfRcnx91iYAVVvQmP7U5mP1JqB+oYY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=krBwhSlvzfWWaNCtyW1VzVwaQqZaTQtNdsOswoTDQYfTm8SU9SOAITf6jw25KQ/XH1dnvo7AAGz+XtqbTjQoK2QSpioGXjc+cx8by2zBi1vKsC0GasUAO8yosDfYxfByqM7u8QPn9ThtHlSb/cftiNKvR9Gc1SnxJ2BhlZDv0Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCrqihXW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCrqihXW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B314C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750281489;
	bh=KoLP8pGvV5LTxxfRcnx91iYAVVvQmP7U5mP1JqB+oYY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eCrqihXW16uUD/vWI7XMNDcrfP58DAeAgMFWDDtVdJn1xJvU1N2EPzWOxguPtiPqx
	 TEpV+TV3eHPfFkrQXVS2ZM21fkqjf16trNWa9PzR7CYHRk6/A/gH4ccrZuYNUa5l3Z
	 iAvShXVzUyValU8yXeFYykATQu8gmY2ymMOUMq2OajFJVlF2u2o2DMpfO4mI41QiQP
	 r9vfUc/WkzGgQMJt3R/myFDRMu08Dbl6ms29yITgPgOyX1H9g6Zh03mpgnbUA0V2Rx
	 DihAbBaQidjKYGsBDle04fHvA3D6snF2xcnxq0LlhlbfRJdEIU6AT9xGGZXHKtSeFp
	 BooeNL8Us+LeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DCC4C41613; Wed, 18 Jun 2025 21:18:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 21:18:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kuurtb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-OZLJNSR1KZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #9 from Kurt Borja (kuurtb@gmail.com) ---
On Wed Jun 18, 2025 at 4:42 PM -03, bugzilla-daemon wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220246
>
> --- Comment #6 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
> Full dmesg output attached:
> https://bugzilla.kernel.org/attachment.cgi?id=3D308287
>
> dmesg output after single Mic Mute key press in 6.15:
>
> dell_wmi: Received WMI event (00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)

Yep, this is the problem. Can you please bisect the WMI core commits
from this cycle? This should do the trick:

$ git bisect start v6.15 v6.14 -- drivers/platform/x86/wmi.c

You are using Arch so you can use

$ make localmodconfig
$ make -j$(nproc) pacman-pkg

to compile.

Maybe (Cc+) Armin Wolf can give us some insight too.

>
> Compare to 6.14.10:
>
> dell_wmi: Received WMI event (02 00 10 00 50 01 00 00 00 00 00 00 00 00 0=
0 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)
> dell_wmi: Process buffer (02 00 10 00 50 01)
> dell_wmi: Key with type 0x0010 and code 0x0150 pressed

@Armin JFYI:

I have this exact event in my system (Alienware x15 r1) but I can't
reproduce the bug. The WMI event is received just fine.

I also tried upstream v6.15 and v6.16 and this event still works fine.

>
> Also I noted difference in loaded modules. `lsmod | grep dell` In 6.15:
>
> dell_pc                12288  0
> platform_profile       16384  1 dell_pc
> dell_rbtn              20480  0
> dell_laptop            45056  0
> dell_smm_hwmon         28672  0
> dell_wmi               28672  1 dell_laptop
> dell_smbios            36864  3 dell_wmi,dell_pc,dell_laptop
> dell_wmi_sysman        61440  0
> firmware_attributes_class    12288  1 dell_wmi_sysman
> dcdbas                 20480  1 dell_smbios
> dell_wmi_descriptor    20480  2 dell_wmi,dell_smbios
> dell_lis3lv02d         16384  0
> dell_smo8800           16384  0
> rfkill                 45056  9
> iwlmvm,bluetooth,dell_laptop,dell_rbtn,cfg80211
> sparse_keymap          12288  2 intel_hid,dell_wmi
> video                  81920  3 dell_wmi,dell_laptop,i915
> wmi                    32768  7
>
> dell_wmi_sysman,video,dell_wmi,wmi_bmof,dell_smm_hwmon,dell_smbios,dell_w=
mi_descriptor
>
> Compare to 6.14.10:
>
> dell_pc                12288  0
> platform_profile       16384  1 dell_pc
> dell_rbtn              20480  0
> dell_laptop            45056  0
> dell_smm_hwmon         28672  0
> dell_wmi               28672  1 dell_laptop
> dell_smbios            36864  3 dell_wmi,dell_pc,dell_laptop
> dcdbas                 20480  1 dell_smbios
> dell_wmi_sysman        61440  0
> dell_lis3lv02d         16384  0
> firmware_attributes_class    12288  1 dell_wmi_sysman
> dell_wmi_descriptor    20480  2 dell_wmi,dell_smbios
> rfkill                 40960  9
> iwlmvm,bluetooth,dell_laptop,dell_rbtn,cfg80211
> dell_smo8800           16384  0
> sparse_keymap          12288  2 intel_hid,dell_wmi
> video                  81920  3 dell_wmi,dell_laptop,i915
> i8042                  57344  1 dell_laptop
> wmi                    32768  7
>
> dell_wmi_sysman,video,dell_wmi,wmi_bmof,dell_smm_hwmon,dell_smbios,dell_w=
mi_descriptor
>
> Note in "good" case i8042 is loaded and used by dell_laptop module, in "b=
ad"
> case it isn't.
> I modprobed i8042 in 6.15 just in case. Expectedly, it had no effect.

Yes, as you already mentioned the i8042 module is unrelated to this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
