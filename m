Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5034BE4A
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515470; cv=none; b=l4FkpL+1RULj/z0V0FlfXhVxaTiJeoWlFZ7IDPnHIEjACmLo7aH+DZZX7BeSdTg4vSNRO9odx5Ln8cl4rttyGMDD5RNRh1/6Yfjb+G/gfne7lLvH+YekFZTp5VgCFTox/Oex9GwpkyxDmNxQ6T4G5zsVpL3ZCN6pm4ygXn7a6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515470; c=relaxed/simple;
	bh=8zlImy5meAwsjS2d2cX0Mr5USXThh5E86XAh9ONRLCs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ujK0H5vImy36v8XacXpzsw9QDkZPAzTa2cY8H/L2+19iOZ4e8X42vsyGCxzZg+uG8uLx9Lvx/LBVY5ubktxdOW2S5s6wk+P4WxQmyoxydooYAncd4aJymlUCG9Kh5kqKx/TwBoqC/S+9in2uVV4JCvRqoAYtv/6jdwV6LubZLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqTPa3Gv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqTPa3Gv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63816C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717515470;
	bh=8zlImy5meAwsjS2d2cX0Mr5USXThh5E86XAh9ONRLCs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nqTPa3GvngFP+SNBW18Jv0/2TnsjS1eT+OzpcB7bAGoHX9zbOjp93EPTphU8Um8d5
	 3Y4LJTewpPIwt1PJ3Rghxro53SRq7/Z7OJ0m0sFSOrRwFa4g87DXZc4Xn+CctrC4HM
	 0wDNG1ZAm7ADl3WhoKF3ee/4tzJ7InoebMPwim+VE4P9iecarWfnw4hWq3p+FBkR6R
	 FMcg++7XG0Wl4J7G/qlOrgUjqI7bJaienWfHCVOZvfEWgu+nS88voPRLhas/bHiF2w
	 WB+jO4+Q9phvjgXjOSsoecGQsqpdFroacxRnBGC/yAK0T5Q5bFUPp2AoVE7c6fiBiT
	 qbJlq83TchrFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52704C53B50; Tue,  4 Jun 2024 15:37:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 15:37:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-sCOa2vue5Z@https.bugzilla.kernel.org/>
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

--- Comment #40 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 306410
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306410&action=3Dedit
Prototype wireless kotkey driver

If this rfkill button does not work out-of-the-box with the new lg-laptop
driver, then please test this kernel module.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
