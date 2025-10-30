Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915272DA759
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761836521; cv=none; b=XYAV+anLzzjhULNAIBQemtgbtxKiUBAEFLba8QfZwRqmOJZcus5AwaERr2/76Wxos0JazsyVm5VOpRUYlN4eZLqNUX22HnOtf1Tt2M2ogTCNxlxBbHP5SvjuIk+2gGtwRqdsddZOoHSPUVMrd06szDozrQAAOFBcebct141c6F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761836521; c=relaxed/simple;
	bh=JsSr/D4B66l5AbedUKscmJ+neK9+FbxgF0F+lkes3QY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BXLjIazdlSALhbI2/4snBXM1Jope2D+4CahVXvnEWCz79yv7lL7yMtoeHl9+2sJZfx1JRhSbQkdmm9bPEaTXlv91Bytv+K4IONmChCQJoxhBfZ7TRXzWidbKzt2r47UYm+YeErgb1FPnsOHEAmXFs6JhPJlq0tOjP4HlplWLY9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trAYKgim; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trAYKgim"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3317FC4CEF8
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761836521;
	bh=JsSr/D4B66l5AbedUKscmJ+neK9+FbxgF0F+lkes3QY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=trAYKgimi8/eQOH7B2iAILqyJh6//1KKeuXnwTkQBst5l3XtJ3TZyWbI+4sHmUOA8
	 Yg9w6xo+ILb+xRu2/5UrJfPuu4z78tDYSLOphucdhbr7BRGGd2a6xqX/f+vT+8fhMR
	 QvGJjAPlCAt6VbgYk4IdvH9ZfIX7M1QVeNOwoFAjYBLXdBtCAKno6iZB9ykru+298i
	 GAO9GrDb+eOEz2PKOcvEj/e2m8Nbr/F4Ns94D0hD+aIlVIwkC2L9sEYXxB4cFry/Jv
	 iuni727SykH6gpzC+N+gG76qKXM9JfwmccpH7DW+jglY82WiaVNymS+bmwlSzAU8XR
	 3f55xrGfOcAIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D8B4C41612; Thu, 30 Oct 2025 15:02:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:02:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220722-215701-ggF5KDBe4L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

Hans de Goede (hansg@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hansg@kernel.org

--- Comment #1 from Hans de Goede (hansg@kernel.org) ---
This is weird, the hid-battery code is supposed to ignore ELAN touchscreens
exactly because of this problem, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/hid/hid-input.c#n401

What kernel version are you using? What is the output of "uname -a" ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
