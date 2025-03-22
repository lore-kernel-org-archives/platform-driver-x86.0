Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D942A1D7
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742665646; cv=none; b=H2P2ZB1lCvL+wCbB045rC8bQD6YGBcp7cJc7bVXS7BJpB0rAUcqN8Zc2youTMNycjVDxxrNlastNjSayhTB6jSfQmHkymWAnt/9eL6+wzffRUoO73wgi2ME2v5ngehYAHqXkPPgs7cUZRE+2U/wszwgYgKhTA6w7DAO1f1CdQXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742665646; c=relaxed/simple;
	bh=WftYZw3emECwNUKSOizllLMZ+BRDyfaOyJcTTRPlZBk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WPIuSm1uL0n1L3v7KA7vLH7aV47DxEA3N0Q1uWJENNHPWr0qFUsIPlbH1TWzgra9+VTJAwoHbnKqY2VRiwXGeentU5WDk5Kz44ShXEtGyhTY0l11a5THFY/d9oA4iOIYE6RNcnyMQKhyKlF5AWsjGUnuxE85S6XhsMQRb6syrDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bst49LUy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bst49LUy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07196C4CEE9
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742665646;
	bh=WftYZw3emECwNUKSOizllLMZ+BRDyfaOyJcTTRPlZBk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bst49LUyC2CtZywq+NrlUUoD6EDQDolnO8zYauAktJK85JBysxmMQDa7vwkRk0u8U
	 4SBunK3ip0366x7NAWkN3nGW2HqGvICEJPN3pIQpUW586l4afr3KkqDMA1MHHBqQiw
	 sPnWKEPRieiaqtB3/q8frgC/QtUFn6zElXPBwKkAUNphpV8ZSCafXWtFSRUFFq0gL6
	 4eaCixxbHSr7dvfeuv5eQiOiF4MrNoA3YiWm7q3nJXFFb6SlBW5pc0vCU6evlY2fLk
	 jZ1KXVmnwFznraFzxtdNyNJ72O27M1627k4JgTo4288P+pVEUTGYQIeEvItiiohtF7
	 2L8VgPG2xpKIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6C77C3279F; Sat, 22 Mar 2025 17:47:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 22 Mar 2025 17:47:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: masterwishx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-XVH8u6NqB0@https.bugzilla.kernel.org/>
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

--- Comment #7 from masterwishx@gmail.com ---
Also posted to Asus motherboard support
Hope they can/will do something about

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
