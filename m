Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2B3F1AB0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291797; cv=none; b=pUndzYybojgmtdjDy5HAQhVL4uwV15Azvrt5VSeaObZ6/+8/7cBMEl90hu/aZYFICARFZcwCEzwJkw0f6FaVZ+YVJ1fu5nnEqkgxfQMSTrFoRR10jX5G0HLPmsh8mtqkgq491+3+OHMof1agCE76v4+IuF0F0eYaJqzxwpQg/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291797; c=relaxed/simple;
	bh=kIksn4wDXtS62LTWWN6cHKIRgH3kGlo+0SfoorCtsPw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQcnbzra78yBSQjlfOjUa5b51yRQO7PGtiQvTELP0oAqI0cvid5+/N+qvVYuTuMUtOsK5BJUFSsr/zgwJIx+eUJHETCt/62kQ+VhNKWAXQllGUaXXDxfTlNM+U21HPSBeoehKy2u0jh+XIz93tfOvGclcMCWVOfcvvtBXPDIpW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkNA5ZgS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkNA5ZgS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF2A3C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779291796;
	bh=kIksn4wDXtS62LTWWN6cHKIRgH3kGlo+0SfoorCtsPw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rkNA5ZgSye/3bYJf9uhD/CKiQnHFuM7kHcODePJq2+qsoi1Th9laJ2J1Lsfms8WnT
	 iFV8KoJOHUvpPlHSKL6JgTqbRjGsAJZUIxCAQ6gNbHQOf+xvCnW+cPY25ardtXLSoc
	 6Hihh2ChHWjSX7nS8IfE97TyiI8DjfwyATzohES0jQ/xIlQ4NH8CZGEKZHVq6DPoo9
	 a2OBs/oCFIMcZmM+Lw8suo91YifuA0jA/1DX4kAuGfLoR7fsMTJyIWsgNgb6ztDhLT
	 tZgF0imB5X3znGGp5uiwcakMGznUxaLUf5dENvpRy7GW5dmh1j2Xkv3G70M27gZiDV
	 6YHHbnk88F58g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D6820C53BC5; Wed, 20 May 2026 15:43:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 20 May 2026 15:43:16 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221065-215701-UyVWLqYVBS@https.bugzilla.kernel.org/>
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

Rong Zhang (i@rong.moe) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #309348|0                           |1
        is obsolete|                            |

--- Comment #91 from Rong Zhang (i@rong.moe) ---
Created attachment 310168
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310168&action=3Dedit
[PATCH 1/2] ACPI: battery: Synchronize get_property() callback

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
