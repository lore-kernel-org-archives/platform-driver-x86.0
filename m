Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FBA1C5D59
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 05:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168609; cv=none; b=cx+POIk8jgooQ8gGFcqBewfrwJ53W90r7B7f/6ErnC24+CA+h8dUf8KD5kwoGpGwnB65PP3+gLD9XvuOkfzNxDV3OMPpmRSJaVdTnAQM9FFZK4FPyremoXyhUVF3Q3WB6Svh8iU2MfN8bWIOxxRcrftblwX1EpC+92ZqNUUJAoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168609; c=relaxed/simple;
	bh=jVcVWjpC5Sd3FP8xbotmll9aJ9XFv/rxmnI2+itSPJ4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t81g3suE40WZAGioeZ2cBQvmqVh4M7jF1XgmLVW28FfU0duEAv27sztNpE8FaKxCCklGDeyYaXis++DYw8wX7Qqw6bCPxzTgLOMlzs/+eAWxfgVd9am4S4Ae/fU25dH9DZeGepI1tQnwukqx7F4fIhc/9clSaIwwCat9jZxHQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PivizX83; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PivizX83"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F8C1C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779168609;
	bh=jVcVWjpC5Sd3FP8xbotmll9aJ9XFv/rxmnI2+itSPJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PivizX83wHSrmcXpfUn5l7tS+QovxUZY2BdeyC9p7lLfzJKWxPAg47eBwLH3mZxrh
	 +dJki33z6IvzTqjB/VJoGSoxHsBt63WjFoAVZTYAjDWMqKiE7s1xyDgNwmq2xN5vvd
	 tisW7Z8Av4ol5ACWz00ns2C8L5Q5DaoaS6Z5av0oBTWDNYq4Q0UK9uXSSb+w75yeV3
	 caoUmbNIkrAnLCKAA2v1KWORAMBO5PmD2rbrkn2ebqZx1ew3vtW+C6cSk9Q0wd0enx
	 KLW5NDot04R6Aq3BHcxvJuJB5lj5E+OHmp6sTcY+u/ST4nTfdKVNrML7kN+hrbcHdY
	 6y2i5n8k12Ejw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E4BCC4160E; Tue, 19 May 2026 05:30:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Tue, 19 May 2026 05:30:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-4D9QSWTnVZ@https.bugzilla.kernel.org/>
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

--- Comment #10 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
Hi,=20
sorry for the question, but it is not clear to me now if you will proceed to
integrate this fix or not. Can we go forward with the fix?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
