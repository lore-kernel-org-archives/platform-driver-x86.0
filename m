Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4241DDEE
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717340793; cv=none; b=EIMhsrTXJOBkcnUx/qz6UptR81JaodHar9ydiCqoL4EBvqBYlvVlRrJR4CQj1bXS3nCzh2qvyUrO9gMq4ktgSMB210jEC4X91drKRflck1ujp397q1parM2Z466KCb7bWn32SCnh7Z7n9ziSlbfV4cd8bSmyRuyBk22Ek1zoyMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717340793; c=relaxed/simple;
	bh=oxnDlY6XtwR2TsE4qW3YRFxQZ51eeF0mGzhhJplbHZg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DyYY9Q3bwexkubvM5rMFqeIcIs/P7BGnLM51wL1XmJALf/0ZLMHuamaYzHutCoK5Iw1VNpuevBQbNzZUDRiSSXo20DilmHr3Gj7x+lIXPN2WPsIHlw7tcx54/McU+ZnEAN2X6byAUCEcUGUoj4HOvDytZuxeMxIWn0BHCC5rBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoP8JfUQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoP8JfUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEE5AC2BBFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717340792;
	bh=oxnDlY6XtwR2TsE4qW3YRFxQZ51eeF0mGzhhJplbHZg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XoP8JfUQ/oAx6uZD1lYzd2okkVK0CY5/c/Jsux0Hf+MiWRir2Gxw1CSy9C2BtAvmN
	 YkyJPmOn9DzKX+V7DEFskr7dGX4GYOme9UzK/2TXfiwsyLxXxpsQxmI2b9F1mBl3u8
	 G3Ov4UBOW3Us7rSGBwyPlsPsSAe16XjZNeEEDovA/b4+RhWhJp6wPQaFQWINtgrrbc
	 RxHf2nYORP+h/lhXLrA4nODWiPBTwrBdZjfcL06g5dhG672DPY1R3QHaw6sECpMgxk
	 Q0ioaiMO9XYzV0NMiKdsQHOLliTCh3TLa7k1pYCKJprLWyTcAJR71Yhmf+mm2/13Wy
	 BKDiffMHqI1YQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E0681C53B73; Sun,  2 Jun 2024 15:06:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 15:06:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-jerxfuvRk8@https.bugzilla.kernel.org/>
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

--- Comment #16 from Agathe Boutmy (agathe@boutmy.com) ---
I just rebooted to check if the bios was now correctly saving the 80% charge
max value and it does, so it seems to be good on that end.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
