Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E48271A71
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780692318; cv=none; b=qpzELmrXld+K/054OavvfldRJ8JqF5fVUvgXnc9qlXIE8ASHXZeFwuuaxjU2yxFvKobdqZa+yiVt1+cUVfCWufHdvXQH9Rzb1em6OuFa2b2rFDsvDXdbwqx2clReg568kRftXc4gom16nBNT6USWoqks0gN7PPdoiU+amjiyrFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780692318; c=relaxed/simple;
	bh=QA8h9uszcsdhbHsnqgG3FwTyV6W/2/JhLnV9H+9ceeU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=osICQbSSV28xtnQrXXg/+St7ieVX5SfXui7m9vFvs44Tqui71MSJCMrwWoGtaA3WAbNXmT7h7xfFZIxroTCp2Gnxz1mY0exxHA2XTKZ9hVxsIArTwfiJHyO87PrF/LFyBNI5lJrVcdcmOxEd+jAkcrdJzZDmi9yG5rk8m91QwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZ9V3dTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZ9V3dTp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D017C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780692317;
	bh=QA8h9uszcsdhbHsnqgG3FwTyV6W/2/JhLnV9H+9ceeU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JZ9V3dTpyilgQgFNBrHq8LTIcaMTvF6CDhetrcDM5+vj9avTevqdPHb8+qpCBu87k
	 Jm+AWL9kt3DJ/4USFPh2/Udm5VxR7ziOsqpGNCvg43aO24Au2j51Kb07dUL6EaNfPF
	 kO9KUWM/LzCoq7fNgUXf0DedwVyrOwyq6bRqDplxyknxhzPnz0um9GFLsZrhUCZFJ4
	 BwaSHvERHGUFGcr3Ww/QADY5cHbm7eFi5IwtIYukNEHOVyVbQWsOZksVgpF9JpVLV7
	 gqiL+slb/yMwTM4mY/TgPWKBNwPFbI9j591iaA2DvFxZ0aCKJpFF8geZYug7aNydkc
	 hDuaMQKwquFIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81D37C3279F; Fri,  5 Jun 2026 20:45:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Fri, 05 Jun 2026 20:45:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218901-215701-CePxpRX3cw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310254|0                           |1
        is obsolete|                            |

--- Comment #80 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 310276
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310276&action=3Dedit
Prototype driver with improved hotkey handling

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
