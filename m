Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DF338BF97
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638931; cv=none; b=R2+DAPQaKbD8ewxVreX6S05dC2a+QbvOt0tuAge8I34WeH3SsypoWBTn6dhLXRzQiNG58F7S0bYD3B9/sQ+nnQZqPoxd2Gex2EQbzys/NuFZ7+UdJspQssMMgbhCK5K+uxflqd4MFu55lZA6NWv7qeuYM43Bv7CCGUolLtYLyMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638931; c=relaxed/simple;
	bh=kCDIziCWEey6W0djOQvMUs7Sh8YsVfGdgHkK4qXCd7A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OStADV7QTAjvMB6W2cY2gOGmP6uhYTFC3dw1eVUl7Uc14wqZdAMFGv0iLZvXT8VuNwc/pFy4y7XdsaZBZMA+GFDS+u0gXOjknN+r0lySGOok5Pip2N0XxeEt6cgSQ0647HMrK5KB9LZPzO7qEDUbud79M/TXXmbqk2bIEQDKtfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONrvzZs2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONrvzZs2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBFCBC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 05:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780638930;
	bh=kCDIziCWEey6W0djOQvMUs7Sh8YsVfGdgHkK4qXCd7A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ONrvzZs2qdZ8txFRSV2lEDbnbr64wWGIe6g6s/qD2FBNAnt4pTAASnJRrw6Az64ZU
	 nzbMwpJkqobrHa/8F0gV71yxkLk/M+jXhfPB12CKDC52Ttp+6zvJK+2ikXmWtbr9E+
	 Uy7ldOZMMQUYoa0BgURhRhMNMCQIYbYT50bW0A2IjgV/U9I1sK743TcwPqytyUI5DN
	 clM8EQV+UVI+kraTjwNyb6B6SWZEYxryDDNLhL8Wg7JOND+9FZ5JML8IOVx/6hIwdK
	 SDrfjaoP7Bb9ZiTgrxS8oyRBScVmlGLfFByfTEPZgtZpWv5YQ6zIurEIji0SeN0wJd
	 S6uQyfPxq4Q1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0073C3279F; Fri,  5 Jun 2026 05:55:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 05:55:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-m4AciOBtn6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #12 from George (george.stafilidis@proton.me) ---
Created attachment 310268
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310268&action=3Dedit
current dsdt.dsl

Hi Rong,
I=E2=80=99ve attached my current dsdt.dsl. With this version, the GNOME Qui=
ck Settings
panel correctly displays all three states (Off, Low, High), but clicking an=
y of
them has no effect on the physical backlight. Additionally, pressing Fn+Spa=
ce
no longer triggers the OSD popup at all.

For context, I previously had a version where Off and Low worked physically=
 and
the OSD appeared, but selecting High would instantly reset the state to Off.
Through EC memory dumping, I confirmed my laptop uses register 0x8A (not 0x=
2A
as in the original patch), and that writing 0x02 to the 2-bit KLEN field
inadvertently sets the UCHE (USB Charging) bit, which cuts power to the
backlight or whatever qwant thinks I have no idea.

I=E2=80=99m not confident enough in ASL to resolve this safely.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
