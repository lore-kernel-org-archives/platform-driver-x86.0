Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851D2142E9F
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 23:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999957; cv=none; b=u33hs0QLPUl1TPfN7emgHbGM5LutfLkI8cY4ytIEJbX12YphHNwnC5XuRxCjh7mnWQYJIqzFKoWX4F76wqejzp4LgNOXH0nF8r5kYFto7SUtu7ls2iQfALrpHOu2uKb6owkUz183Z0jNTVnwPYRQNJjgIWAZjFJ6/tyn46T/Y+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999957; c=relaxed/simple;
	bh=pVLbJTYCqOk5v81xiCOqhCyM/nYThklPPries88elgU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rvLkKNjv2Qu33n64oT4Zg92kJG/IJFfOutKzeCS+1KuLqfDnl9vStRS0r79SC7bdlPgKPQBw7/PjsorUMTZtDrSIN3JIL8PKtHNdi2OCSNv00dIHjZTxFVOaQTutk/CLw7u2+legIOJxmUJIY+sF1o4CoGNhRJRUI7n2DS5c1eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpqslMLX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpqslMLX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 199ABC4CECF
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 23:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727999957;
	bh=pVLbJTYCqOk5v81xiCOqhCyM/nYThklPPries88elgU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QpqslMLXFMxJLg1AqQ4U4fCjFwko8JkOZS/rArBD3IPFMqiiy/wHKpObFyFq5UN/z
	 tguH4GTxvEpA+wEcDPsC4cwAYzvzFplGU2vcjiJU9y/3kJfNyBK6vS6JdUyVzn15jU
	 1pHjEBS/Qz+U5Ki/VKXUZbyJFhU/7f/wvoyEojC75IpkDJTM96rcwViLEG3wvjDy6X
	 Bz3WYZAOD+6p7aj3MDPDe64rAZU8fLJ4sqkzdaEfOIMXCCHN7paxAsYnb1G8OFaF5p
	 ZfgQidb/8Zy17G3I3qB++96PeY9qDToSPYlZEkOA2aKhwyVJ0i78AG1/eJ3EyAzSYj
	 zqoCyz0nilgFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BCE7BC53BBF; Thu,  3 Oct 2024 23:59:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 23:59:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219346-215701-w3bmt5APtf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

--- Comment #8 from Todd Brandt (todd.e.brandt@intel.com) ---
ok I did a full stress run of S2idle, S3, and S4 and all 3 work just fine on
both our AML machines. Looks like it works. Thanks. Go ahead and add me as
Tested-By.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
