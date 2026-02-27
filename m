Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6E2C178D
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187617; cv=none; b=iCtSdVwgD13MLF8OtAi/S4+CanKK7VrwfJnFBYwC2D3Viks71eujgDOB5gw33YomoCvZET6WakEfzta0+TRTXCLO3KjbEC4acTzgfusWe7Chd2UrBuzLeUanxFzbdy+plPrxh1/g+QmLIHuSsmAOAa6ZNh2QzZIh/VEY3MdfFf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187617; c=relaxed/simple;
	bh=iBVjyB0zZyxUNq4jkAcaaAa15I7c5/H7hv42oFdX3Qo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XqyrbC2WvMxvc+u399JA09ShODg7Wfx6MTSHQo1BLay5n405WmDHJSPWMzFg9Tg1+thTS17OnGInuLxLdi6KGwLCA0fOM6D5r+IO1WjVnJPDzeCABQTUW5WoentVsrr6akGcJLbWMxLdnHabm+w+zNutE1abPPo2RxHfVLYsItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rO38sPng; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rO38sPng"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05F5EC116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772187617;
	bh=iBVjyB0zZyxUNq4jkAcaaAa15I7c5/H7hv42oFdX3Qo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rO38sPngz5kiVU26MGcOhjvJJawxy2Ms9jONoHCj7WVg93jU97mFlROo0TTF/TaOd
	 v0FAlIIK0c5N53UBjXOlBdsYuUuhZKAlCoILTgBr9Q0dSFZ9KB+eaifJpyf35X3tO6
	 U+dkEy831JYPJZq+VcTxtREqvI0JpgLTUTzJ6N7QsmtKBNdRgnPh7ezLZDxKxoJJnm
	 pz0DB42e3S5IEgMbHLMGwPDr4M/GWrqjdI0F3jWywWoedEhCdUxAowxZFOOQ6yXFHv
	 GNBQTddBKEO7VRNteR+vqjMVM9qNl8puJdHpZUilKiw2w6iHVUG9vX8mHtkHsSinmt
	 gsaO4mmDnvFFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F33FAC3279F; Fri, 27 Feb 2026 10:20:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Fri, 27 Feb 2026 10:20:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Jie7172585@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-yXrNUUGb8v@https.bugzilla.kernel.org/>
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

--- Comment #17 from Enderlava (Jie7172585@gmail.com) ---
(In reply to Krishna Chomal from comment #16)
> Hi Enderlava,
>=20
> Thanks for the detailed report and EC dump.
>=20
> Since this bug specifically tracks support for board 8BAB (OMEN 16-wf0xxx=
),
> and your system uses board 8C76 (OMEN 16-wf1xxx), please open a new Bugzi=
lla
> entry so the two boards can be tracked independently.
>=20
> In the new report, please include:
> - A clear description of what is not working
> - Errors from dmesg
> - Hardware details (dmidecode)
> - EC dump (xxd /sys/kernel/debug/ec/ec0/io)
> - If possible, the OMEN Gaming Hub logs from Windows:
>=20=20
> C:\Users\<USERNAME>\AppData\Local\Packages\AD2F1837.
> OMENCommandCenter_v10z8vjag6ke6\LocalCache\Local\HPOMEN\HPOMENBG_<timesta=
mp>.
> log
>=20
> Once filed, I will take a look.
>=20
> Thanks.

Hi,

As requested, I have opened a new bug report specifically for the OMEN
16-wf1xxx (Board 8C76) here:=20
https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
