Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF02E4A0EEC
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792047656; cv=none; b=TgquCxOPLHdtVzPq6qj+Tu4pHtn5uK4/mmXa7udLV3owH6amQ69xYRF+Ik1ybB+xOA9q85Uy7QSckJrAXG48NmUGGFbwfBqAqjyD+mVQ9ECHVcp6IquNe+6Gi+btrdTes0YaDIeedCZtAPNi0ABRflyfl/e5RAl+shDyewZpsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792047656; c=relaxed/simple;
	bh=n8ZVuA85LNJGXJ+/gWBIhQn0dkSLC7Cy9itfgGlqyIE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4bnjdlP7GR/CP2mdWdwK0f1cUW2/5OP5bv4EU/841yonLVkw2GpZJJS7F5B+qAj5C0XePdDvBCwDSOMlGHsakuPpZ46f10S2AWr/BrBRyZCYvPECGnNaR968F9skneTeSd3vu9n6KwJz0wmo8+vke/R6VkcSqfMgWbH/7yypa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/lmOQaF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/lmOQaF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F412CC2BCFC
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792047656;
	bh=n8ZVuA85LNJGXJ+/gWBIhQn0dkSLC7Cy9itfgGlqyIE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a/lmOQaFcntDJGdGwonDCWLmrxLL/9l4TVw0jnkM8swLRvkrb0S5JTA5HKNylL0i/
	 dm+mIQqU+S5eJP9gcjs6MZt6iEqrA/Z53TYeMU4SEgZhJO1dB1kHPejZMAn4H6/KpW
	 nk2tDMMnG7HR200NseGScu0uokiAN11q7NSYOgwjveVCIQ55qAKm+eSNNrtEIMjlTN
	 vAh+23m7WaqD8OzItBn3LWdBTVnjnJzBenPup4aqsJG14Jg0BlxbLk3AXH+LBF0g+L
	 v6+B28HvSjIMafqsYxxQ4IT6hcT6KC8c9yKmB2bSH8l0OcRmAzwNGjIlNinJVfTnut
	 1cFszDlSpdfgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF4A8C4160E; Thu, 15 Oct 2026 07:00:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Thu, 15 Oct 2026 07:00:55 +0000
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
Message-ID: <bug-222044-215701-NepXdxl00h@https.bugzilla.kernel.org/>
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

--- Comment #13 from Zhang Heng (zhangheng@kylinos.cn) ---
I've already submitted the patch. Please keep an eye on it, and if there are
any issues later, let's communicate in a timely manner.

https://lore.kernel.org/all/20261015065640.377466-1-zhangheng@kylinos.cn/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
