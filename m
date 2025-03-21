Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85778F52
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742578453; cv=none; b=bjvvBfAaFsvvZhH+E2pBfZtUl8GIED+Z+1jdIfXyZ0JQkwNOE9FPUKNaj46xNFI/Iakemc/NQup0yIyuoY8zKhgrRkgHTgJg5+45AeXfG7mj/CzxXtBi/nI12029ynUpYBjPyhRjCXTmBKrExaQnlUrXyX2rWr6zHQf6UZyTC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742578453; c=relaxed/simple;
	bh=gYQnc9Ze+tIbEIpf1wa56iT3sFN7a4JAp4mEke0S2rY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZWdFf2ajUgi9N5Sn+iEZ2LtRHqWcbsjlNpvA8z5Y65ZI5vxnS9WNtQSE5CABC+LXxKHT+23V72iB2EIRUrT8BAMWg+jFLj1Fa/2bZr3gc78pFAANLO88mK6BlhuUNUbwaAVkZ9weOIZ8AZkBzkHP2a9irjjRY1IKqD9H3Tu2g3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMWyyum9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMWyyum9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67294C4CEE8
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742578452;
	bh=gYQnc9Ze+tIbEIpf1wa56iT3sFN7a4JAp4mEke0S2rY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WMWyyum9+qZLLO5bQVtvg2IThrPz76v9sMx8RIiwal6mMW0R+VUfjYBc8IGXW8eEb
	 I1mJLkcBHKJJNsW3ZyAahT6mNp1N6KAXH3ONKZ4iE+DAL/uE76YE2e2fsQTxuzKlhk
	 Rac2jinjcmqYYWbOw8JDX1xYQXmJQaUq6YhfqFv8Kku7EsqTU3BLynCSpMflTs4FQy
	 vtpmBpZQPWz2JRTfqE7aUpEwIiGROqmdU5+JMgjvgUKQ/SHUpTFjtCaVuDcvldHkkt
	 fZ44/2ZsL6/PDQbGfz2iG1lV+NGwjcKdIvNBya4zf71vgMv025dWjreWZyZUxIw2zW
	 r0BKolIBdr17A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5375DC4160E; Fri, 21 Mar 2025 17:34:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 21 Mar 2025 17:34:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tobias.diendorfer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-AjOC1fIQCF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #3 from popy (tobias.diendorfer@gmail.com) ---
Tested new unraid 7.1-beta.1 (which has kernel: Linux 6.12.19-Unraid x86_64)
and issue is still there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
