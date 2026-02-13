Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904135F8A6
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988826; cv=none; b=Tc7jHXo6zgeh+hIK9HQDzC87le2j61QZKHY2lP9mMq20DM/wdtaqMlq0J5T9BdbPXl+rnltSRSExS92w9h/Jt3aD9Jy0SRqVuAbdTlM75tZ0FiMQw5JM1h8S/O0T5fi1uqGapWdDWs/bdlP9INaE9DT4SkvfLTiTwFp7pfMpV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988826; c=relaxed/simple;
	bh=0jcR/v6nk065YJg632LT1WytGhKvJxo0LR0o0MgFi08=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HX+SX590PdImz7ks7aNXDXqTzxf0cH95kYRlq3I2kA9j9BldeQvLavfQiStls4yygSZgumiTyxaBSgF/u2aWyH55sheMHDx6fpTDBfVXKCoSd6aw9oKSFL/b4sI6UhMAmmK4QgJyOq+nKcKkWKGwDP6E1MaUWKTYJP4nU0IHZjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9MahnvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9MahnvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9616BC16AAE
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770988825;
	bh=0jcR/v6nk065YJg632LT1WytGhKvJxo0LR0o0MgFi08=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C9MahnvZi+y+XibZu8pFPbaA2iOELsVocPcAphihn6KBWI3aCdVttR5Tm/GdmDolu
	 nBlynYsc1yJIUDfFAWtceVVm9KGpz3cN1hnsrJXGdA7xXVYerckMcC2uqHg30g9ejo
	 t4T4qywRvaR7H+gFfQk6lu2781P4EAjeRZJsbkrElJD+/5HzMZddc4gKTbcqaGUDc/
	 XvSDKVJEoDA20q+8snLlVmreLYlQDd7B52Q0b6377ev6x6XhYwDUsgyEIfT3b5DePS
	 3vIw6878xLfVZj5d+cAsMnUIm0D8fvywqwtRw22nXIgrc5mAPOAa4Km3YFP+Tvqhmm
	 3gX3VvtTl3LXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86E82C433E1; Fri, 13 Feb 2026 13:20:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 13 Feb 2026 13:20:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-kwoYqxJoMW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #33 from Rong Zhang (i@rong.moe) ---
(In reply to Avraham Hollander from comment #32)
> Actually, it just seems to be really intermittent.

That's expected. These error logs are due to two reasons:

#1

Many ACPI methods need to acquire the ECMT mutex while executing. Most of t=
hem
are helper methods, meant to be called by outer methods.

When the laptop is connected to or disconnected from AC power, a bunch of
events is generated simultaneously, causing the corresponding ACPI methods =
to
be invoked simultaneously and to compete for the mutex. After several secon=
ds,
some methods have waited for too long and timed out, causing them to return=
 an
error.

However, some outer methods don't confirm if the helper method succeeded. T=
hey
blindly propagate the helper methods' return values, even if they are error
codes or nonsense. If an outer method calls a helper method multiple times,=
 it
will end up returning a half-valid-half-nonsense value.

That's how the ideapad-laptop and ucsi_acpi errors are produced.

#2

Some helper methods are not implemented properly. They release the ECMT mut=
ex
even if they have failed to acquire it due to the timeout. When they are
unlucky and time out, releasing the mutex (even if they do not own it) caus=
es
the ACPI error.

Hence, not seeing the mutex error simply means that the ECCC method was luc=
ky
and didn't time out.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
