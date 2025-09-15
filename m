Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B40025C818
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757915369; cv=none; b=KRKX6jdOzHPfPfqiKZm/uuPXmRPdwA5mHs3q+2pWC359KVKz5Axa8SX7VDnDk1+mJ0jMIl9aHTb1quU4xC6KmbCPTDfm0IOyk7pM7iNQUQ02QL3iaBnd8FZ1CT4LU9N6f0zo2SMyPhM9KSNrWfWXRqSfp0EoK1Jr02Cu5/cOzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757915369; c=relaxed/simple;
	bh=pv+86Q6oF/9ZqmmgKYXXjJekPMEVNgFny03+GKAfYc4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FptUcgNUZfum31p+U4cjSOMozefcXHoTqUD736D2C8ymnUCjCJQCuzXkavht9pdvgqpG1UfLVi3EnKB3pvTvf0QeXwGHRzHqN4dd0T0uO8vmNY4jsdUYz4QYlmhrWYF1//8QhUzMLx7U6GkdF45xAjwxlpI4JmbvUOd2/gI2o2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfPe6+Wj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfPe6+Wj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 899E6C4CEFE
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 05:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757915368;
	bh=pv+86Q6oF/9ZqmmgKYXXjJekPMEVNgFny03+GKAfYc4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pfPe6+WjZReQSbZ4u0hvQLlT8hvCtBLBGX4HOSO7P8QHlH56QgiV4OF5eOnAyeF9o
	 9YiZf7sA3jfQ6qR+T9JaLEl1NNaIXVYGa0HGCfSICRMtNyMMZTN43VhGgmnrgg70kh
	 h1RnAVcjYr5vOe/QTF04ewYr0Us+E7YkCrm36IsReXzL4ObNGq5eauj1qJN5W5DXrt
	 BGi9lmPu+DXQW76yKfl7vqvJENJAXBlz8nXXDN1r58traaqU1lKBhixkfQV5Z7A+Sl
	 r0m6uOD7l9SZ6oVG6lw9cY7labxPD2O6tCTU/IxG8hEMVpNEwNCvx8krzWs4hWAD+2
	 uuknSZwSPWV+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 82FE0C53BC5; Mon, 15 Sep 2025 05:49:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 05:49:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-lemXZedKuC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #120 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
I compiled the quirk/patch yesterday morning.  Executing the steps I outlin=
ed
above hasn't resulted in the low-power mode behavior.  So far it hasn't rea=
ched
that state once, which is amazing. :)  I'm kind of curious how other people=
 in
the thread with Elitebook 845 G10 aren't experiencing this still.

So just curious, what are the next steps?  Is this going to be pushed to the
mainline?  I never tested removing the patch
(https://github.com/torvalds/linux/commit/4dbd11796f3a8eb95647507befc419954=
58a4023).
 Is that something I should do?  I'm happy to do additional testing for a
permanent solution.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
