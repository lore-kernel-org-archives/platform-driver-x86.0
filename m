Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAE015E97
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781960870; cv=none; b=q62ajuDYSPtzQwrsdfmaRlKbuNpFZxF57ELy1pa/QTkq+rrm7wmoIPC266INik3pjKtkxni5pKcYxf2tPs/AmIbdcEsC3xAmWKqlBeZmx7RXgmpVH/qONxOeP91eOGbYS45bb272chtwPQT+ZhYxEP8kZvZoaAcic/mPTJ0H09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781960870; c=relaxed/simple;
	bh=mRfT0rJAxrWkba0aveqZBMgQ/g+o/37bM67WZIzfM/c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dFDpBJvKebqHJ/thNrLA87ijjsyf+C70NhuGVXjpLD6fO2GCcSUTEp/ZKRk4etksh2oxDan/6R5TEAzOH2l6u5tNLEA0wGttdxZLY5A1WOp4msIefGYYyPWrNJX/0eWgUKrtKWsrB5N8QNeJXyCiFUIIvkqX6caNysSwcT4OwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPJkednG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPJkednG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFFF6C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781960869;
	bh=mRfT0rJAxrWkba0aveqZBMgQ/g+o/37bM67WZIzfM/c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gPJkednGIKvolglv+7cnD/6FLEMkpPJRD2+cUa0sgDpEPyUunLax3bO/6qOjTx8sm
	 LkWoAeemf34squKvzj9nCL/z1r9tUGbT3UBKohI7NTteuti1YYOM1MJvg9/CK3q/4w
	 xhfPku1t1h9HyIz6ca1xp2fCSzIPsO5td9+bwZyWjbqCajJQndeZJg47D4VUK39Eg1
	 /jxxweLeMnRj0ygy6JrKYjSMJ3RIQJY3mOVB8LekOyc0JnQQXRMshg36K15A75JWV1
	 ILN3vKnJiXDKuKrLsNzQs32UZbu94ZKpw71GPLBG9usAKIm0vaBAvmhOUc3Vqo4piV
	 fwQo4Ean5lXSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C922AC41612; Sat, 20 Jun 2026 13:07:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 13:07:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-fP14TuOIs6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #43 from Marco Scardovi (scardracs@disroot.org) ---
Since all your temperatures are now very low (CPU at 39.9=C2=B0C, WiFi at 4=
9=C2=B0C, NVMe
at 37.9=C2=B0C, GPU at 38=C2=B0C) but the fan is still spinning at 2100 RPM=
, there are
two likely explanations I can think of:

1. HP BIOS "Fan Always On" Setting [1]: HP laptops commonly have a BIOS opt=
ion
called "Fan Always On" (usually under System Configuration or Power setting=
s).
When enabled (which is often the default, especially when plugged into AC
power), the motherboard firmware will keep the fan spinning constantly, eve=
n if
the laptop is freezing cold. It will only ramp up when hot, but will never
stop.
2. BIOS Thermal Hysteresis: Firmwares use a cooling hysteresis window to
prevent the fan from constantly pulsing on and off. For example, the fan mi=
ght
trigger at 55=C2=B0C but will only turn off once the system cools down belo=
w 35=C2=B0C or
30=C2=B0C. If your idle baseline is around 37-40=C2=B0C, it might stay just=
 above the
cutoff threshold.

[1]
https://h30434.www3.hp.com/t5/Notebook-Software-and-How-To-Questions/quot-f=
an-always-on-quot-in-bios/td-p/8924322

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
