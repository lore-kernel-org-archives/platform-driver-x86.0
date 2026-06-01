Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0181D346E50
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295206; cv=none; b=ieOyp0gqXS8asGewq0ghmDCj/VMYCWZD6kCkUjT5t5Eu+EOijG9U6BIz75nm/LEBSnjgbOyzxaXOSjgPg8Irw1Mqh6S0ZWX6vdqoB6IIrGTkhQfS+hhGpHJpSADT79TG8ioL4DE8LbYogZ0LMW777B0fnnXw0J/bzYITf/26ajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295206; c=relaxed/simple;
	bh=mWBxFibVhQHA3l0lhmnUAozzvm6KVqmLWhdlGzEzJNY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RN1gZWZX3hTQK+aaZ+Uch8Pf9OkYRG6PPTc1jDtRUiPmHL6vcvOluFyhHIj1djpGeuvHawAWofhjZPQ6ujFbCOZGittuujEaD6Q0qHnvm06QlFavtDVees/qkf4ujNQb7NHFlgZrGaMC1yzZ7Lf7TzEso1+pTIEUBAWub/IWs9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/JiPwMG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/JiPwMG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AFFFC2BCC9
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780295205;
	bh=mWBxFibVhQHA3l0lhmnUAozzvm6KVqmLWhdlGzEzJNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T/JiPwMGtPkHZfe9KbzuK98g9N+sMSpRzdDH8kAqDVcnLEADDpn8exUsCQ6IiCTaY
	 LDMG3wGBlH4OFI6bOWATlrr0nLqLoTHTloUs0g8EB+FzcNnLIMXlw5S3L1Hv4k+y9l
	 GSEYyYoeUPlez4rW3T7wmk1WsdDUC92aErtLPrtSSWrk58baZU4KSV1pAH03B10tes
	 pugSOEUW/rkBw1AtWJbTKxDX9TBqDU2QKOBgFAxiWtcx3hvQBtzWGhqqc7idKsOsst
	 fcmy4gUIKrpvGwyF+ZeKYM0TQ7a8Ho3Qz/gjvpPAVgdT+pOHc55Dgk5i9PBrPH3gM1
	 rElS7WSyElA+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C74CC3279F; Mon,  1 Jun 2026 06:26:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Mon, 01 Jun 2026 06:26:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-gWJDFlvl1H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #13 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Alright, I will send the patch soon. Thanks for the help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
