Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202768;
	b=BFhf1KCY0iBWV4471S2bABhesfw0/6gpkZUE/6G9IWqXmK8heH6VBw02Ly1PCV0NB5PT
	 m+iuGJZS6pGBrtJ2viBklpQ7B1D3myCcQzpLFvhiTWdKe1YOXzng5SmHyGN1coRzDadvC
	 fJXaajfSLNs8dGIt7DHPb0Z4g+6euyAsUd7RnrWng056+BfCXo77ScHx7ahs3xZz4hcoy
	 ntRiVr0W2y8RGWn+nXDXaXjiyj9xh2YaY5XJ5AwtOKhAUUwYSR7fD8XDlRXwx0+S7HmxT
	 LjKHDXDc3sTPcYKVjdurR/hik0vgl+/DXjTNgCAHPm/p/Tgd61cZJh+PyLkeiISOyAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202768;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=ruYomIEWGhX0RKvhJ5qa6Qt/gzfbeEj+BseL3mS+8P0=;
	b=TIUrsa5efm8rQCnjXtt2/xaPgIDUDzrR05WX4mG0HwTImT5mtmatEzj4sfNeDTJDOPxA
	 s7b8ZP/drG7N7rU0oUAl1Pc1v0vzeTphv4hyrw0ygHJOVtGwuFflN6ZQONt1geyKRrqhQ
	 ayg1Q9436IyFZo0TFohCtt4oGEr+wPt/JsApACwC/M4XO8yQ09Z9gp1XHoexvgH/SuRBA
	 yQmcZ4x2XfSmY/CcLWHRJmnkbIk1hZF6uBTtNrPNHnH+3wOPppETuIC1RsnnNBT8U2vve
	 quhOjNagp7ivGB671UeSpuliAbWvaGHDqGvaMCFW+07Bbjwuk+uKA20wLiM0jeItPWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojxBUtUD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F48C606A6E4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojxBUtUD
Received: by smtp.kernel.org (Postfix) with ESMTPS id D15EA1F000C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202767;
	bh=ruYomIEWGhX0RKvhJ5qa6Qt/gzfbeEj+BseL3mS+8P0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ojxBUtUDsX4nw9c0QMSoiF+30yRvlyrbml76gUFxp7W8lS+wRAeOJCt1KGrhZ1iDE
	 voDxEwhFx+ZX+GPiG6hncv58/C6p2p1iafAmbHdv9HJxL8YiP2ZpWmijr+W7KOYH/4
	 oyi2ihnBhDmDfvlRj/GNGiOL+HqA7Uv9Tfb8T5VZ304e18HwWfXFWQ60nO1jYU7beQ
	 tVHmEPnPLfKAAQ0lZGZ4GiOEGKx8W6ZlBnrB465TCeMhScfJ8dffrnQaeHyvOH3OF9
	 ZgbYHUF+d7Xb/TzinXLosZtt/s/aoeBPEQ/qFb28txO/QT6hXAgibr3qe2S1gL+gdx
	 Ae5p24lqq0fQQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id CDB80240040C; Fri, 20 Nov 2026 19:26:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Fri, 20 Nov 2026 19:26:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-m4aJtUo3DX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

--- Comment #8 from Armin Wolf (W_Armin@gmx.de) ---
Nice, i will send the necessary patches upstream then.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
