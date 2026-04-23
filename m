Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8916346AE8
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918041; cv=none; b=YDFraqeClYY4QQcjvNczF4NNNtC5JMEGvIuIzFrahZu/J/iSfFtN9ZtbCYjs1GowV59wWWlsLHumVlr1YuRsfRa6g86WgLJp1U+9hD0qRQPmkdqiKw3KEkhO3HK+r4I9IiqDnS/MWYttxpa3jEEGDNn3H87oPBWeLxHviHOiTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918041; c=relaxed/simple;
	bh=wtVHYPuTzN541q1TTzZtyEvd1Jl6H9+X3qxw4xEp0js=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r6cld7RC1KT/yE7FVEGLv7Z1vmeO9KhyEU7FisKAllMsGHtIdoqOOVZRz35Z23lW0pL7790xqpUax4d0+7lLD4Ff0jAKsA9XYknFRfpsx93cWQwhogmMXELgqmCEb6kGDaTMOSHJxSvNDj+BM5evR4GoL0MiAfPTymHFSJHk64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kW4Oj3CX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kW4Oj3CX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A39A3C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776918040;
	bh=wtVHYPuTzN541q1TTzZtyEvd1Jl6H9+X3qxw4xEp0js=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kW4Oj3CXQr1GKUE5j8dCxci16GKIhAnYZAT+acdO9tlYKEGNjLpMzAOGIEYOBlMXR
	 pDM1QHBYSZySWpbGzpcQasBypTDOp2uFYdFdL9sCq2zKRtaBGvHA3x1bLlyTJeMnVE
	 nyA9b/5VvKAggCOD23GMUnCh/iJRLbbKyYto77ZwuneqM/seHw/3fzI6cAQ7rVVFxP
	 QSILQqLViBzEwnDTIsS9yD599TZ8sIGhIbXyF+H8udDr4NGOWCkSsTjg1j8sqj/bnw
	 pjXyQUF9Uw53gvzkVmT/+TZGEUrHJCL4hRIboOeI4UtbBPTrA5/+SONfQxESiU6Jeg
	 OzQI+L7fqQhNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9D2DCC433E1; Thu, 23 Apr 2026 04:20:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:20:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-z7HS5tPtzQ@https.bugzilla.kernel.org/>
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

--- Comment #20 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309935
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309935&action=3Dedit
Daniels lshw

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
