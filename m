Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB3375AC6
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371499; cv=none; b=bTrn8c7Gp/ANxvhDYUDe9UKhyVcdYoWDM5tn9wvOVoholeR3F7bgmpbc4/0pl9lM+PNMz+3bHg4xaJbeDx2722EcuBW58sUoPeD9sSx4tvTTT3jcdwla4WkKyS/2DkSOGuQS7Kf70JzgerCsQLylJIlqWO6q/yd4LSfT0ZKjd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371499; c=relaxed/simple;
	bh=tIEBbhrG5VroKrtzxwX8c6F6yB+XOisLbgc39xj2jX4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hjHjtC8dzBwjRiPNFF980rrM9NSWCT8Mv/ALNpkFC+nYSynZd2qGqYjO/ICXIbdy+42/JX+iExZrxDiF3J9kB4b7EmbbUVUfSEocb9h+ipdZ3nTUYqyd6u0am1lAAfMbYBlMJ3ZYemHupgKW8F+Nr6ZclN5PCuXtDUJYhxJ6PtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfaiYuOj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfaiYuOj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3129FC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788371499;
	bh=tIEBbhrG5VroKrtzxwX8c6F6yB+XOisLbgc39xj2jX4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LfaiYuOjLMoleADYb3qhq4X2NA1td3ipTbZQcNq3b92cbIEEK6rx+0prpXLT1EYRs
	 mzM6EZGLh3RX5MvpmT8Kk96ZYUSctrYrUxZuz3S+2PKPv93HEKjBqBly31xFtImEbF
	 pXN1WRYfjX5Ijnz0p00XvsiCIvkD572mzl4eQL6L8rduDLF8XVjc3EtL8p21bNjWAc
	 fm9ZwPVaHAVwvktJDIwQjiijTOgviKZk/LG+KULPpPFClrCAbNmyrHafmtZkYYhhRx
	 LCl7rZT7O67EnVRGbaik/JoahKUWDqkuhnryTudLCgJW+j+o31y0ZTAMoLuc8x6ZNY
	 mDtRL/Mmni59Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 171C0C41613; Wed,  2 Sep 2026 17:51:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Wed, 02 Sep 2026 17:51:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220926-215701-ygmor0X1Sk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #17 from Gibs (gibs23@proton.me) ---
(In reply to Suryansh Singh from comment #5)
> How were you changing the profile, if you meant you did that on Linux, or
> did you change it in Windows prior to rebooting? Since the driver hit a -=
22
> probe error when you tested, the standard
> /sys/firmware/acpi/platform_profile node shouldn't even be exposed. Was it
> exposed before you even added your board ID in the driver?
>=20

I forgot to mention, this is with standard hp_wmi loaded. Without it there'=
s no
platform_profile node.

Is there anything I can provide as info?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
