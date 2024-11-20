Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789F3E545
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732072610; cv=none; b=L32P+mCLxDHA67WQ7mPeaejcVF0vEa3or1/1nk6S7gDsn6I5ehicc3dU2eom6Zl7QsKdQweUPjVYVkTdrQuwZJs6qUA8CONlOpNqS3lNcsOLMxExK3sfW4aDROg18ZqWJRQWkYwGm7QY8d4GfFosCvFmvJb1qK/VNETguHfgM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732072610; c=relaxed/simple;
	bh=VDPACIWsdPVJaFluGAFBBHc2Zpwg2yThdhiQ1FWzWSE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TMuLc8JgTV037E0wu+UIv83+Dbrm4rC5EWuV5sV2A6iCLmFHSQPkbAjsuSMCHkLC2WMfiA8FhnuzBSxgbEQbGDcGwHOAz6uR+XkpQA977BaA2e21EHqpZkuLW/Xf5BuX5f7PmQQLtCUAp0JhvJ3kdUgUzT9QaHWlilmu1HmTaIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4dz9lt/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4dz9lt/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12E41C4CECF
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732072610;
	bh=VDPACIWsdPVJaFluGAFBBHc2Zpwg2yThdhiQ1FWzWSE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P4dz9lt/ZW77RzyURDXEPyQVeU7R1NK+XNbLVhttRDM0OaZjjyofTzEmPHbSZq/qD
	 v+R0a59F9ZAwln+xxbYfJYOhBn5Fz6YqAaQWxb/po4Z3PAtKueldo8BC34yFMO5L5Q
	 Kw0M5h26HeFM4KnOezcKJ9kFrIhwj96PJmRKXuEeG4wzaSlDpjPOtqsossL/JPLklG
	 vVb9KcOkmVnx3Xhgb3mfytUmkqbDr0ZvwzcAiw/oTbrQSSKFQRIXz6Fx/1hpam70Is
	 q7pqeY5Z+RRNOWubhhu1jDO0YZtjEJkDE/Yu1bSKegt1yeSRQ6V1FyuXvjItO8dOKf
	 zn19bBJfT2i+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08BDAC53BC5; Wed, 20 Nov 2024 03:16:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219515] intel_th_pci Driver Probe Failed with Error Code -107
Date: Wed, 20 Nov 2024 03:16:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219515-215701-XPB7C0QNu2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219515-215701@https.bugzilla.kernel.org/>
References: <bug-219515-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219515

--- Comment #1 from andy.liang@hpe.com ---
Created attachment 307249
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307249&action=3Dedit
v6.11.7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
