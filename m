Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852ED3370EB
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780587835; cv=none; b=LFFumm23h95l/oWxliv4xPZihh+pAvTUEkDaVPMnG9vjBpK0ZLHWeL1n1rUNJ6WAQJUZT5BNd2ez0aVRaILtYiFwPLWhYbWfl0SLCLoHcLt5x4YZEeNSPJ8CyiZqA7LUSnSsbUoFf1QSkSXFDDfyOQRGJQBJ7zqvmwIRpkPBqeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780587835; c=relaxed/simple;
	bh=lj36S0jQIcgit/cHujEeaXwhWTbWQOprpVcAf3xMQdQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BkAXu1VP8TeIQKn/MkHb4mGAdkWLHHGSpxAHritUezIH+x2c4b4xarA9ysv0fBEue6Tk4z0vmPJR2T2UPPwPUsqMDVGlS86hZZu/m9eXpZiq5Uovj+QH7W0jOFpqbNHLgcfRfS/Jjj9a0Bx50ek7d9bcp90qGPKbLmBMfW6TnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNhMulyb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNhMulyb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C58BC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780587835;
	bh=lj36S0jQIcgit/cHujEeaXwhWTbWQOprpVcAf3xMQdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nNhMulybAo72y5iKZaEkFGqUx1GW/qIAGWdTiHxPghdKzct4HDLv8vQihmBcMRKuR
	 9h+YjWdDOx9WUw1ALwz+yEK2To15kapsOHc6oEQerFpBYQBLhHF+7HgqnlQnVnKYxo
	 ngJEeGa5d4qwKo0w+kUJGbsxYK0L2YLTnRPBVzJa6y4PTs8BFrafNYyFyIdAnyVqU3
	 ISgtED5rKaK8fQ7X9i6jDkPK04nqgpHgpHalAqPbtVMbpZVdz34D0rVauoL9pvg7Nu
	 7ZiAc4R0qrDN23H5h2WopAOTfk5vtCpIAMa/mDOcKwgbcO4d7nRwid27fXmEvwxLyV
	 uRKVZnLO/7y7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1C73DC41614; Thu,  4 Jun 2026 15:43:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 15:43:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 4966508hayk@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-wgQKQhXL5u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #76 from Quaternion (4966508hayk@gmail.com) ---
This is weird. When I run=20

sudo evtest --grab /dev/input/event13,

only one touchpad event happens, so everything works normally. Otherwise, t=
here
is the double-toggle, but only one touchpad event is registered in=20

sudo evtest

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
