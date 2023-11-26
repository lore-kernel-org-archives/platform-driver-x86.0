Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468920FA
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkHE+Zug"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC48AC433C9
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701013107;
	bh=retoFWnj4E7qdb5NjjMcZeQo99+Q7xxFL4w4xMgoiNw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gkHE+Zug4i7qrLiCUcYXnh2dUaizWbHL0LmeBBaQ5dy+FN9V6jtBbAqIcFPDL5OV7
	 Ob/i6mEZ3oPBByVCYAscojjjgaHl/HusPZ1LNdPAt0eZg2iOvtInNMynYT5O5BrH6w
	 v+8yGFvID+icAAQo/bmn9ZayUVvMjTNSZrpXLp3/ASCHKrfBFQfHQPmXs3ywZZ7vfE
	 FNsH2702FNhu25+unXhAx9LHIF0yaTwrW9s75MTqgM1W9naDIHlzew+/o2nrXhC+oL
	 exDosbbc9qcN6imSyL59kd+Xc/c8dGrp6/pUX5655EM/azUA24xbqie5jZcCDY1rot
	 W3GFymiwpu5KA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AF982C4332E; Sun, 26 Nov 2023 15:38:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sun, 26 Nov 2023 15:38:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-pP7h3E8q4I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218188-215701@https.bugzilla.kernel.org/>
References: <bug-218188-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218188

--- Comment #12 from Alexis Belmonte (alexbelm48@gmail.com) ---
It seems that there's some regressions that I'm observing now regarding the
stability of the system with the custom built kerenl:

- My Elan touchpad no longer works
- The Nvidia driver randomly freezes (maybe not related, but still adding it
here just in case)

I'll try to do two things:

- Use the default kernel config and rebuild everything
- Remove the patch that you've provided me

I'll send the results once that's done.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
