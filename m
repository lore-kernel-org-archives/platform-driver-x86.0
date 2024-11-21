Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5F11BC091
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180050; cv=none; b=bV9AbaKgFyy6bNY8oq4GRFfdgmU1zcAAmO2BIky5+YzyJrWHgr595iKwa8Gv2cHlt9EWn254QkCKPt6SSY9k++Abvm+rqZgYgZfOUYclJZNN2wbo5sHFJJKPE5tphWQWj8nwE3jx2g0YZa+qxuf0B8Ku/tmVS35Uk0vwc9PjP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180050; c=relaxed/simple;
	bh=1C17KXgZqs0NbgFHrHQeusQ3KO+oAURtCdTPs56wmsg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=meWDn6NArBy617REFdONJD6aRIy5NK9AzrI0kUxGZqNyAZDGI4LNDSUCoNIjriiuSW8IUTjGW9kxlPCGhQjBlGl7SUGMrJ7MkXuaJkQaZvVY6N1vItL96rusbHb3SrA0OC4untmVoZ/BMhIsgwh/XX7Hrp+zyom4JVfEFzf/vhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDU4qprR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDU4qprR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44F1BC4CECC
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732180050;
	bh=1C17KXgZqs0NbgFHrHQeusQ3KO+oAURtCdTPs56wmsg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kDU4qprRxDNAH+0IIclKH2/Hex75H47kGn32fxZcl7oUKshgaEaNHZRO7cEFbhccH
	 iqiDBMCXWw3zqNLcuph3W7d0mVX641/SLG8rweNNLeQZGyBhnmPrhTfMWTkR0pubNO
	 Gmgc/IoLWnlXjAneff2/mcMpY2C+PMVss5JyBmALDm5dGWmXra0C/suzPDNiP7DPNk
	 +lLVhp/jE9cdGLTIPb1GfPB+iXBt7mDMGhgm7rFxNYu7tQjLd9LEiHtcCIFWyYXDeH
	 l6mJ7KIocQj8uUR6ri2uCJNSD+vKAUbwNC4cC+zlZeL1zlGQnePaPQKEbXwBH8hfA4
	 /eAh8Wfi0Jm/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3506CC53BC5; Thu, 21 Nov 2024 09:07:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 09:07:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219517-215701-UQSfXGXX2u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #5 from Michael (auslands-kv@gmx.de) ---
Created attachment 307259
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307259&action=3Dedit
acpidump of latest kernel 6.12-rc7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
