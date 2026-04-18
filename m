Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADA37CD5D
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519644; cv=none; b=naJd9rM20vKiYWr5vk3LWa+Cf+atPzAupTAKPUtGmxZlw78NAUo25oBDa25Ojq32wQv23m4ZptY2qDRZ7bO2aYyRO182qIioH0h09qyEN+VhPkcaLJwcm857IbkunjNVPpRMCl6TXWNrVPzBHKh4V7OKH0PVegRxASNgeRZg5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519644; c=relaxed/simple;
	bh=Ygkm8PHL908i3v6Mvnx0fJjyxtGd3t5U1yChTVeelHY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OC5mGXEkID3OGhILM9PioboQ+uAFb3CLn/5RwF72umOGuOp8/Mxo4pbw5IHpmdwFyDRTPIQssa1uNzJyjhHEBCn8OW+uBBFJ33lJcgosHtFRr0uxaeVVdeNS27dGc8F7fkp5bPGxhw+6b+MCv+zw/heKSg6CBgowBrfm4cv7GHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuzG5r/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuzG5r/A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A233AC19424
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776519644;
	bh=Ygkm8PHL908i3v6Mvnx0fJjyxtGd3t5U1yChTVeelHY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uuzG5r/A4jSC8vrmOiM6a4bMGhAunvygWAC7a4kohqwdqpwFFp5zHZLUSrNwn1bGb
	 yCVNTLhg8ih7S7JDhF+Xwh1S+Sl2QTJVJ8vQZC/oED7PA9poduRCvdZhk6/E7X6Obv
	 IkdRTSXeFlNGX1kGFQc5uzQCMZnD4WInLWO5lirtQkUhBpCgcWxzQ3VsCtuCZ3xGRe
	 WPi3XYmZrTSvHqSZpf1VfDdQpD75eMkWj3WntYjEbqTB6CPHKuo5MWup7AG9v05yyP
	 YDo9a00p40xZ74L737skdZ8wJWP4wW0v+yFQDU4VO2ShgVOGxPCVtTKJcgkmVwVYzZ
	 bvSFboxciZCBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C479C433E1; Sat, 18 Apr 2026 13:40:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 18 Apr 2026 13:40:44 +0000
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
Message-ID: <bug-221383-215701-H2pPIpWQ6C@https.bugzilla.kernel.org/>
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

--- Comment #4 from sindrehenriksen93@gmail.com ---
Created attachment 309899
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309899&action=3Dedit
ACPI tables

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
