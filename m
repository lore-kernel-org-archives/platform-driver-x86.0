Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E189150997
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715360; cv=none; b=UEy9ZnskIb9+09+/W1DKNAHrF5QHsPZ3C98BZE5ARbJ54u7bD2WZ3WLKVgexppOR0xgYd7LyFcRByv1MUfxZxG7BvaUy+8Czcnh+Wg4Ho9LWs6FqEkz6YdEI1D+8brzSRs/I+Ggj+ebdTsL+hbCiP8HkDrE2uRDJgs+nCV91ff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715360; c=relaxed/simple;
	bh=f+5fQMr7lv2HwJBmWGWyh6uOdUiVr16AdA9UDWdJyDk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VfEwxopRrA78QqotWARuG8f9g7Ew29LH48JlR079IBtrl5FaUfAfQKhER9Vrj+wW6UHpd34lSzbvsMThi14/BxDnHjwFaBYS3jSN/7DDdon0uuWfwQQclqh2Adn6WPz4mg7yOpdv9OcgPutIQj5F2izK8Arim9Clb7HwJzajwpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUBJKgG/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUBJKgG/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B1E3C19425
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 20:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776715360;
	bh=f+5fQMr7lv2HwJBmWGWyh6uOdUiVr16AdA9UDWdJyDk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZUBJKgG/0I8ICz7uO1YW8TdlI2EWnWbaBXUCLyeBVcQM90G9vvhgABorhJhoSrJU/
	 /nR7DN4roiADTcWLzVNpn6v7CROOv5qsHj4EdZxVYGCERxTgWTajQWWYIKzPxn5WQi
	 1448tJPQYlsSnzx9xvDSzyHV0kW8nEHpzCCFLWKik5wMR5pkUhwzfyZ9joWp6XOw57
	 Ben7suEXLoPxlDEn5rovt5EKw5cpRaHvLggB5JB62q1Es+z9IZliAzgfiZ22bF8i8V
	 UybkDHqHA2wCB6j8uz1uJS10qkcZhdwFxCPZnqcgRjt1kSr7sRMseDTdRRTMQXMQiZ
	 puvObxrH8hCrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 23508C433E1; Mon, 20 Apr 2026 20:02:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Mon, 20 Apr 2026 20:02:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-YdkTcoi9cC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #8 from sindrehenriksen93@gmail.com ---
Created attachment 309920
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309920&action=3Dedit
evtest on event2, all 7 modules blacklisted, post-s2idle resume (broken)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
