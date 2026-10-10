Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9355D455634
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627247; cv=none; b=qe5A5JNa05JKxxjc2u4C9mBs8D5x6/L96pHnYH2uqds1ace0gytdo8AJ7sgrYgZ6krus7Mwr3lXl4dCtXZuxStXS583eAMZzHFWBKPW2U+VktGcwaqX4sImiMrXo5RsXO6U4Zt9uc3zafSZb/jM5bf0XiZ+G3sxFQ7hwtxSN4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627247; c=relaxed/simple;
	bh=3nkVzUitSzxeQPqhkAjwrTP0DWvhf/d9Qf8PQ1O1n7I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hmEa1zKXMXt33ok8t6oynItNzLI4nIwcVK72i7WaGXRDuiMNGqQw0z2wO6uLuL1ZvPsYHmkYeFaZf8OnJ1Tekzut9kKcIyQLs2pWc8COzS1jDSLrnC2q+yKDbVErLic2xoUvW7AH1BuLhYVuxSGjmRWj4DCcqYbueGik3LmiqAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8EOoskN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8EOoskN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC147C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791627247;
	bh=3nkVzUitSzxeQPqhkAjwrTP0DWvhf/d9Qf8PQ1O1n7I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E8EOoskN4AORuQhydpWQjMHgUSmGE2ls9fxzkp7TR4/CPMPrjriTFCHFPKy+KHKRk
	 WUah5P6UpyaJaf9PEuyoYUuslVyVgLS3f+K3FmrFhAMSEJs9ff0AZGMxbMbhAN1/33
	 yzGLiIQcnMD2scAUamlCci0LaBRLYzT63vCbFCFnpadF/r+bZAEb9WQsbMrNJkWWVR
	 /l9d9mTlg0tsOpCWix2xC+9ENrhcioF6pWjuWgtLIu9yRV4aaF8qCNTIS1af6eDH9u
	 +enbZu4rJXQC5o/F64oe+ZvEvWAOQ0uMaycEIqdTFNRzwpARpytax8mwCu/75eTvA3
	 b8W2848n4clnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BFF7EC3279F; Sat, 10 Oct 2026 10:14:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Sat, 10 Oct 2026 10:14:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zhangheng@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-HDlZpHoe0O@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #11 from Zhang Heng (zhangheng@kylinos.cn) ---
-       SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx",
ALC236_FIXUP_HP_DMIC),
+       SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx",
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),


Could you help test this? Because I see that your CPU platform is AMD, it m=
ay
not need 0x12 to be configured as DMIC. Although the previous bug 221233
mentioned that it needs to be set, and it is the same machine as yours, this
differs from my current understanding. I want to know whether the DMIC cann=
ot
be used if 0x12 is not configured as DMIC.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
