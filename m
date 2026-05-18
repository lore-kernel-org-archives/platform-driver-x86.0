Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA87481A8A
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122892; cv=none; b=KRaBzjc9RDmdJj6nHIsLWMGuT0j1b3I7Bl6rAoOMgb8crWBEI+kFyz2zccCniC4tL/wzlO532qpLY23m1OwLFnftTmkazpxtmzYph+pXBsQizaVs6ha15g/Zc7eIwJlEQiUbIPI6/llVpdpKnBk2qD7u84Ek/uFde8Tzfny4p8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122892; c=relaxed/simple;
	bh=YYWykHRwoqA5YfPaQ78bMeahTfJEAfHzidpaGUk3qUM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xd1acr89vgRD5ZWv/9V1u7EVEYLuCbLCnJQZ1LkAXreakzf0UXBqsMOzzaNV973TYVH59L33l9HFvlL+vAiH9Mry+/57mGLmkYh52M5XrP5/0RbDqc5OzG05O7BA9Sqp/4tCvMk+cD0WioX04GoOmdLTUPp+8N4W75tENLEl/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ5gJY8j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ5gJY8j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3476CC2BCF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779122892;
	bh=YYWykHRwoqA5YfPaQ78bMeahTfJEAfHzidpaGUk3qUM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KQ5gJY8j4nrjEX5SI/nraIO+tcTAgZu4fsCLB8MIV3OE9iq9XmHQp3OZscRGZ7omF
	 YdeiQ0YROcKeTQUE8MWICLlFRIch0HT6W2zLO0EkFWvCQDZQGNL+MDRZFLIs/S1pqZ
	 cNFYtLFyv/ZLyz80x+uEjZS/IzQZ48dH+XqfVle+Tm5wgaVb9igwW2jFYGb5DgcZQD
	 R31WDdBn2ruylvHRNd4z0fkhUNmblTeoch63U/hroO/53GCDy80nN8qR7wN1O7QzyY
	 WnTGMV+OZj2Jj7PV9J2upzMtvqtW+ZyosCUeLssSMq2gBVnRdL2i52MCa3uZFDXaG2
	 axz99GAl6eHHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D8F9C433E1; Mon, 18 May 2026 16:48:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 18 May 2026 16:48:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-B0wp42Wd90@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #90 from Rong Zhang (i@rong.moe) ---
(In reply to Rick from comment #89)
> As there is now more output into the dmesg window I decided to capture ju=
st
> the system sitting alone through two pause events and captured that in my
> first upload #310145

The EC query was \_SB.PCI0.LPC0.EC0._Q0B. It indeed notifies BAT0 twice!

Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
{
    M459 ("Q0B Event\n", 0x00)
    P80H =3D 0x0B
    If ((Acquire (ECMT, 0x2000) =3D=3D 0x00))
    {
        Notify (BAT0, 0x80) // Status Change
        Notify (BAT0, 0x81) // Information Change
        Release (ECMT)
    }
}

>=20
> Next I did the spamming requested (both l and w alternating until the pau=
se
> ended)
> This is contained in attachment #310146 [details]
>=20
> I noticed with the first spamming attempt that the new output ACPI messag=
es
> happen in the dmesg window before the system actually pauses.  So I did
> another spamming attempt but this time I tried to start spamming as soon =
as
> I saw the dmesg window start displaying the new ACPI messages.  It is lik=
ely
> this file has data that starts earlier and personally I would start looki=
ng
> at this one first.
> This is contained in attachment #310147 [details]

Thanks. They look fine. At first glance, I did find some new information th=
at
confirmed my previous assumptions. I will find some time looking into them
carefully.

>=20
> As always - let me know if you want more.

The current ones should be enough. Now I already have some thoughts on how =
to
improve battery event handling. The current code path is really awful and
"contributes" quite a bit to the unfortunate combination of FW and SW bugs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
