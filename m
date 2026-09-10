Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55DE47D95D
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041939; cv=none; b=EAVhdEa3YDnP8ONgoT6+by3506ez29bIbUT8sxhbaWKOejkFZsYE2CFpfx6t+H4IIcpxv5RtZtOl+Avqm6GH9G3VkMO/1wr574+tyrVdQb0T/Dl4e8ANRD0xvQ71SmyTXtCHGrZManMUoPjkIUrqycE4/wu3Qp7C65dNoBLOukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041939; c=relaxed/simple;
	bh=WY+dXVBXmI47TvSv7iYAyosKXqKz0Wxyv6VtD2D9vJI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oN72+wlTIhL1Li74Oc1342FDIVYsCyRroDsfZkukVC9gIXXWBVGu7o9d1GoCQfAWI7V44wYuOBToKcJf6b+vw5DskjjUiahlwGKf/Aa2G5f5n7F44pKEmmeam9bW9StBjFieXdBhCg64dak34+zcuo2vHO4Y2V0DlV5N52bAdpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHFB9TY4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHFB9TY4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DBEDC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789041939;
	bh=WY+dXVBXmI47TvSv7iYAyosKXqKz0Wxyv6VtD2D9vJI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UHFB9TY4iodsxWQM8hB3aMVDyWKFexDfIuN7TkzMybstOr68+bjZevO22FRzR7LDT
	 hEmcgSID5awg46s9s0OuKef4NeuzR507H1ZSExWYkx0cxi+3/pOqLI/V3plrplXQRI
	 R0/eg9YxLgRisABuIcF/I6D4r8Ot44wGZcQ/aflYELIhlQn5gZ/BBPTON86pAuSGgn
	 5OCKR3Ty3dwIDX/wQYcOLcmDg21VqaDnZRKVz+0OF9K0gBWC/VkCvZUHJgL/wdo5hv
	 ogdlOaFsJElpeBqRjf10jL16EPlZi109k1UpXlSCeLdYFyhMB7GwhcfpxbEqTu66A1
	 EuJu6U2nXha+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C32EC4160E; Thu, 10 Sep 2026 12:05:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date: Thu, 10 Sep 2026 12:05:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: silverducks@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215883-215701-mL3ZATZF8C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215883-215701@https.bugzilla.kernel.org/>
References: <bug-215883-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215883

--- Comment #7 from silverducks@altlinux.org ---
Created attachment 310827
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310827&action=3Dedit
Archive with attachments for comment 6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
