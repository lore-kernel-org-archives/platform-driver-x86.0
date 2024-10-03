Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ADD1527B4
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727952441; cv=none; b=TGzj3Xw3mgMAOKd/d406YjnrpXVlFkFhOamEcq02UPZwfhcegw0PuCU9zuNiPtruPpRM5ehacg+qEDxzHILCUeMWADBZZYFD6pxhaS5UikQlS/9mgu8ZnWtybI1uGl6aU57/OBmqAB+/mt4SsRmcTeohgdVYTAuDqSWyy/KIXe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727952441; c=relaxed/simple;
	bh=yOcixlYVAf2nKTh4QjBNodKe/PKIhig8l6uxfSTV/k8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tx54mgQiF9AHj57ZGYRbicBkVZMlJHRUCDsvvlQOouMuTIQuv25x0bkHkqb9f6vyJM+H9foJAIOcfORn49B1NoxXqRpP45gcn+7U1DxCUYlXPBYKBxJ8y2VYQ7xy2ldQ19wkHHeclYw/a+f4PSvyxbd2LD59tH3+dUsf/4E0hH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCzPTiE8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCzPTiE8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C516C4CEC7
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727952440;
	bh=yOcixlYVAf2nKTh4QjBNodKe/PKIhig8l6uxfSTV/k8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qCzPTiE86JyrOGoRWxdO15pqS65jWtFBhVYQmhrw1XZInsfw+mkihWP22C49M4gr/
	 tgKzEce/fcwwu1WFBSVzuyp/3pjtxHlRiC3isuHPgiYPN5JEngEIHY+JHAkEvjuQTS
	 +dIONx6QjVryeb7YJ3iqHxCRzZmaRV6c787RFt+gxAbtCzaLRBaSF0MVMUbcfFjX9C
	 fJCqplAoBssUpyAVApUUXHxU6fC/+X5xz0cfSl7lkB8XBNupppvCJIvNWO5Pnlw3Sd
	 CKry+q5OjX7X1vlxlbXV7Bsxw3etNiiFivfhfVHU8a68IxMBSSMnP1NRtFSlp0hiwW
	 7fFaWZphur3qA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B0C1C53BBF; Thu,  3 Oct 2024 10:47:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 10:47:20 +0000
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
Message-ID: <bug-219346-215701-DFScZkjyNn@https.bugzilla.kernel.org/>
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

--- Comment #1 from Todd Brandt (todd.e.brandt@intel.com) ---
oh, one further note, this bug affects all 3 power modes: freeze, mem, and
disk. So it's not limited to freeze. All three modes hang.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
