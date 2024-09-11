Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605219AA4E
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726072374; cv=none; b=Uvdr7eN0YWno82rv6KuqNuYNeBXP2UxwIk86plBGBXf3LL+vjDBDxo3EVFTy76nDqDdJ6SoGzzKNtU1zgaYdf3MLtZX84752KTfiMVV7bpzlU03BaAYB9Sb61prXOCa+5Le0g/XlS/KTRS6021wEK9YLqgHcbVnjjhh67whAcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726072374; c=relaxed/simple;
	bh=KcqXbMsvC6AK0q4DG2XUmH7gyYwnB5k4+AS3ULqqFv8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EDAY9acVv0Owhq59thu6+zsvTljvzWTNsMvqQxeFErJQuHApZWEiF0VqdDCUlCPcsQ5LmGMBeARCnMRrJ5BsU2AgMqav0aZobO7hDCyoUMeawKU/u0Ixr0ymtMuYmZJxU8TjIF0ZNS6vSGgdNZ2uIWh6ThRLfvAhjE+opc9fZd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnTfAysw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnTfAysw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C782BC4CEC7
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726072373;
	bh=KcqXbMsvC6AK0q4DG2XUmH7gyYwnB5k4+AS3ULqqFv8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jnTfAyswmejXkPokQvrAnYvL0uNJF3tMIg/bpugvpzO344hXLnki+i8xtSGq5CrCB
	 HXWf+fDke6GNSpn144KJ3+N4N0QNuQ3miIedrjhiMPCKpWKpdHUrRQrS0Vd6uKy60K
	 lflyqoXFtEVOn5YT5YjKQoNae9m95Ksjp2nbq5DOpv2JEtTjGwqd/qk2RtPPCJMPxg
	 BQTlmC+d/i2j82ApbHFQokX/y7eh7cWFENtH39jtEKRc2/sO6UERj0WGigbjA+8l/b
	 kopHGkXAWbZi2lSS8YyKI0lTNwjO1nm7u/JWF6+36j7bI8xpKDZPItKInXrEpY+woX
	 JMBkyONcCO+EA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C0BE5C53BC2; Wed, 11 Sep 2024 16:32:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 213977] Unable to lock HW IRQ 44 :: TigerLake Proc :: Clevo
 NH58HPQ
Date: Wed, 11 Sep 2024 16:32:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_gpio_pincontrol@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-213977-215701-vKOhmDzoG4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213977-215701@https.bugzilla.kernel.org/>
References: <bug-213977-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213977

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |GPIO/Pin Control
           Assignee|drivers_platform_x86@kernel |drivers_gpio_pincontrol@ker
                   |-bugs.osdl.org              |nel-bugs.kernel.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
