Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC42D7398
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771046805; cv=none; b=Cs1NlUPTFXPACNySlh1E/X40ONlmFGKhEYJs4vukePjX312VaiBFvoRX2hQOVe1UfF5F91iYXfI72NNrtbHNiqOrGwohXzpCWD4q3BjAZwvaKx1/iR7FwKKK6PHjlAR2O+pX9W3/IHT6VW37p6Hv1G7G81820ZffCzhOIBpZMp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771046805; c=relaxed/simple;
	bh=N9Vl/FZbLJr+JoL834HaNrqygEMZ+mYoCh+j6PnNWfk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q+VAfnNumeipSokhbXTPNchn7Qu1rNh1C6LiKeV3r09Y2DFn0miZQDb2TxTGc8DZUdCcjWZ9g9muu9isLJhH58FqtM0/LOwVy+mEDU7BL/osJ9W8st1Bqa8OVTvSAJoLYEmUIhB1A7/uYcYeRP3dO5MjLgodZR2HXul/oI+Jb/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEt0kPoA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEt0kPoA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6C9BC19422
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771046805;
	bh=N9Vl/FZbLJr+JoL834HaNrqygEMZ+mYoCh+j6PnNWfk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kEt0kPoANMI2nVG0D8SYpseFJspax0h2Y9PLPtguG+gqwemla90kHHuIAVCobS8Qm
	 dGomsucf+bIRglwcglBrFfaEa1FE8hWOMzXLlRw5KRgUYuSwLIIv+nyNANV2Pmzssv
	 o84mkiobBFEbIY+h2JHs0GYj6zKzM+XkuqPLfMFI1hrGCXRo13+Gr5cBegu3is1CZ6
	 aSwc9UI6R5/qHHvBECFqe7POXhYSk9i+YCpQOStKRXgxj2C2AFE1U5R7LaNZz4G4o3
	 TTC/1PsUUbNogDE2QP1ZcNXUDcd3os/DDSUF/9jJDM0pkRAosKgcn9PGA1fqt96md0
	 kAmqH2omtoggA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A5C20C3279F; Sat, 14 Feb 2026 05:26:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 05:26:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-Vs6sB8JP0x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #11 from Juan Martin Morales (juanm4morales@gmail.com) ---
Identical Limits: low-power and balanced result in the exact same sustained
power draw.

 low-power  ->  PL1: 55 W  |  PL2: 130 W
 balanced  ->  PL1: 55 W  |  PL2: 130 W
 performance  ->  PL1: 130 W  |  PL2: 130 W

No Change: Switching from balanced to performance produces no difference in
Watts or Fan RPM. (only on cpu stress test)for p in $(cat
/sys/firmware/acpi/platform_profile_choices); do=20
  echo "$p" | sudo tee /sys/firmware/acpi/platform_profile > /dev/null
  sleep 1
  pl1=3D$(cat /sys/class/powercap/intel-rapl:0/constraint_0_power_limit_uw)
  pl2=3D$(cat /sys/class/powercap/intel-rapl:0/constraint_1_power_limit_uw)
  echo "Perfil: $p  ->  PL1: $(($pl1/1000000)) W  |  PL2: $(($pl2/1000000))=
 W"
done

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
