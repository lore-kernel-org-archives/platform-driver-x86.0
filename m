Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B86A215F56
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 19:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275764; cv=none; b=RVhY2IDjyLpaEeJA+LybvhT1wkCM5I7sBHdtKkqgcX5fofFc/rA+nv/bkMoSdA2c1gUIwkPX2aEQ59LNY058jNET+auYxuudyj7ABm8PC1aREjhdaA235d1Ua6apnojlvrASdRIwAtyO2wwRpLrqbgbmAS+/bAiGvwcRhNkSo7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275764; c=relaxed/simple;
	bh=RuJDr/eqtr+51+Wv7Qlm6ogqjpgsZnUjDrmN7KFlCOc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vDlgDgLFp3cYmEkuaFiWtaiEDob05lSzWhTJ/RiNFLlj6WzACKWdu6iZgfoT1zh4Lz9XsdfMT3nGFKBqS9qrI5zRrXoxgiGnSLRFjrsdGjXhnhSDuuegG4d5Fp75ehIlGP22davytzglFNLPmleO9ZNH10RmR99dLsvFhWEHya0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKSwEDbi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKSwEDbi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C249CC4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750275763;
	bh=RuJDr/eqtr+51+Wv7Qlm6ogqjpgsZnUjDrmN7KFlCOc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SKSwEDbile3Ndeo2yfEM6taYUD4urN0V2Ij6XKE3rnPLmOr749eg3BSPbLrdrPcYx
	 7YcrUu4hd2A0ZA9PxQ0+DVkLXhcsC31Kkw+rexCVe2cQWY5sBwzriVUQ0Hf9dFOCUP
	 gMQAdCoVJvVPqUZmfqdEfAkGFbniqpfadkjBoGdMO/NGVj1hyvxPN+5rbA8aSBV1Zp
	 XMhEEbxSSdpCWSlQM7PqiwVXxqUsfNb66I7LfzyLSiXS2saixpFqMc4EDi0qYrpI9d
	 SIMRNmJqGJiv5Pn7W+DF8tElaIx6tS6MCkVMDpPLPK88SoUKRBfoPkvSXfDPg6rjwI
	 hwT95I3OlFaug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B1837C3279F; Wed, 18 Jun 2025 19:42:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 19:42:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-Rjgx8XvUDx@https.bugzilla.kernel.org/>
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

--- Comment #6 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
Full dmesg output attached:
https://bugzilla.kernel.org/attachment.cgi?id=3D308287

dmesg output after single Mic Mute key press in 6.15:

dell_wmi: Received WMI event (00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)

Compare to 6.14.10:

dell_wmi: Received WMI event (02 00 10 00 50 01 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)
dell_wmi: Process buffer (02 00 10 00 50 01)
dell_wmi: Key with type 0x0010 and code 0x0150 pressed

Also I noted difference in loaded modules. `lsmod | grep dell` In 6.15:

dell_pc                12288  0
platform_profile       16384  1 dell_pc
dell_rbtn              20480  0
dell_laptop            45056  0
dell_smm_hwmon         28672  0
dell_wmi               28672  1 dell_laptop
dell_smbios            36864  3 dell_wmi,dell_pc,dell_laptop
dell_wmi_sysman        61440  0
firmware_attributes_class    12288  1 dell_wmi_sysman
dcdbas                 20480  1 dell_smbios
dell_wmi_descriptor    20480  2 dell_wmi,dell_smbios
dell_lis3lv02d         16384  0
dell_smo8800           16384  0
rfkill                 45056  9 iwlmvm,bluetooth,dell_laptop,dell_rbtn,cfg8=
0211
sparse_keymap          12288  2 intel_hid,dell_wmi
video                  81920  3 dell_wmi,dell_laptop,i915
wmi                    32768  7
dell_wmi_sysman,video,dell_wmi,wmi_bmof,dell_smm_hwmon,dell_smbios,dell_wmi=
_descriptor

Compare to 6.14.10:

dell_pc                12288  0
platform_profile       16384  1 dell_pc
dell_rbtn              20480  0
dell_laptop            45056  0
dell_smm_hwmon         28672  0
dell_wmi               28672  1 dell_laptop
dell_smbios            36864  3 dell_wmi,dell_pc,dell_laptop
dcdbas                 20480  1 dell_smbios
dell_wmi_sysman        61440  0
dell_lis3lv02d         16384  0
firmware_attributes_class    12288  1 dell_wmi_sysman
dell_wmi_descriptor    20480  2 dell_wmi,dell_smbios
rfkill                 40960  9 iwlmvm,bluetooth,dell_laptop,dell_rbtn,cfg8=
0211
dell_smo8800           16384  0
sparse_keymap          12288  2 intel_hid,dell_wmi
video                  81920  3 dell_wmi,dell_laptop,i915
i8042                  57344  1 dell_laptop
wmi                    32768  7
dell_wmi_sysman,video,dell_wmi,wmi_bmof,dell_smm_hwmon,dell_smbios,dell_wmi=
_descriptor

Note in "good" case i8042 is loaded and used by dell_laptop module, in "bad"
case it isn't.
I modprobed i8042 in 6.15 just in case. Expectedly, it had no effect.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
