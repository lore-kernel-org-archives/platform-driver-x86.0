Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1692DAD51
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717500707; cv=none; b=MqpzDVxG16XsBKe5CLfkuV8BDrQkOvgngh1jGowlwCEOuRxvfVtRTHZsuygmg1cgOO5UgKTWTpbAyBvkj3eUYlUP292YNeE79kNIRLxeHZmYn3n14vFTw3bKR1yXDBDj6V/qPv5ybyRBb9lFqUJE7pf+U8YtOO5GVoSTUwPEJQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717500707; c=relaxed/simple;
	bh=wtLFbqayjRP4wHdKhd0SzhirImO4qAvtEO+AOTa4S60=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DuGTQNAPqqLHebdUuFFxizpEh6uCwZlI+lGEzje4xxS7gWsuVHmpydKnfZY0grz70hd8C75RSi21ucRxcccjeANt8H/mrh6UaIjpc9OkNVmc/bS1Iyfu1cdAsQePaxylFOqFaejKAdfRBv2D4NF24BbzLnCrAXtxnWUvVipYFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WC6tfITO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WC6tfITO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DAF4C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717500706;
	bh=wtLFbqayjRP4wHdKhd0SzhirImO4qAvtEO+AOTa4S60=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WC6tfITOcmC+IuUIfOH0v/kx/s/Lt335IINeF93mHZ4v6AkmZEs6D5v/atZqE2FoX
	 uLHZAmB4aglU8QoLnL/7uzTZHV5EZdAaGfDvI0YeYJtAQ254j9GCZ90eWAwVc5UUqL
	 W5tsgvDR6563TUH+JfiiUFkZ/XigBFbd+1C3OlPqhw3+zPEQR3wbW/6czTZqzTElz2
	 GBsh9qahnGtXdajWrLFedEHiBJdUOKsvfI/WqTuaHY4WqQxeoWezqHtAiHsKhbh0iy
	 oigC5RaOcLo97RuQTrFmlA/5AUJcErJE384LDYVb3hE2VQ0Oin8cFV5qYiS7V5JL6O
	 hRSUgh6rkpvAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CBFFC53B50; Tue,  4 Jun 2024 11:31:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 11:31:46 +0000
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
Message-ID: <bug-218901-215701-xkRNcj39Lu@https.bugzilla.kernel.org/>
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

--- Comment #29 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 306408
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306408&action=3Dedit
Prototype kernel module v4

I have removed the airplane mode hotkey handling from the driver, can you t=
est
again if the wifi issues are resolved now?

Can you also send me the output of dmesg after pressing FN+F8? I am curious=
 if
the strange ACPI events are still happening.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
