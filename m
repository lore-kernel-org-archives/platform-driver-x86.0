Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7CA194A66
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jun 2024 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717768191; cv=none; b=GHhonGq3pWQHLKaB0fllwQZtYDbI5quAa2tojjAyRtrUR5csRHBnfnTQGvWUcAEQ+2Vod1c9qk8uN/dD8hzPXkKW6snHpydG6amCyHpK/U6x4uDTRHiwBzzROA9SeykK3e29zAAxKiQrGdf2QM/eLmE+lSZENxGJGlcaby/6SKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717768191; c=relaxed/simple;
	bh=TPQHxN36RJOSvNSk3ZCU82hLp0wsDLvNAQUp8XUs2Uc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aGR+H9XOLhWnZ2l3LAgdG59dah0dtyMbpUXsjRNi32kJaveYeoJOc4vaIMdI/mzUvaCA/GOFurFS2j75OAP5WjCsIyjMDtvGi6dT+b4CxYsZ/BSL0ql6dytXifx2AtaZ2FwJlvEaZAiYMvwca/rtcheyUSwXOXORAG5buApjrrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGq4YRsn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGq4YRsn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B331C32782
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jun 2024 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717768191;
	bh=TPQHxN36RJOSvNSk3ZCU82hLp0wsDLvNAQUp8XUs2Uc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OGq4YRsnMnX3jxB0mZ/CaybACchWRci2qEBjXuKAk8ZlzLNXuJnkSU/A/K6sv6iW7
	 wm2DtKqY3yG9zhQwcew/Zzbp5xKKWshsWzn+Clpw1QGSfqz2obBg3HPsv56g3b+99N
	 l/rJgBfDcDMR4bgGpT8FMQdMCz09wLJV1ykthpIRV4w/5g6XCNhHpP5NiItrtUfYga
	 xdL1DDW2QksoBCx51TJiuFZcy+PGa4/PyMiC122H7WeZUtCpiBFYfw52Hb8zvRs4aC
	 XWQSoDMPZ/Z9cJn6msQRPkCYgdAk+WMXPibL7scoyC9lhzqcOeGqzFOXdYer0/FJ4P
	 V+rSQnNsFhSAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7E11C433E5; Fri,  7 Jun 2024 13:49:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Fri, 07 Jun 2024 13:49:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-3Xp6Pz5hbn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #12 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Thanks - that matches what we tested with. I've asked the FW team for more
guidance on if this is a HW issue - it feels like it to me :(
Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
