Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA13E0C66
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406422; cv=none; b=FXev9BjjTh4xprw2JhPJvoutDkzP6RVJGE5rJbQCT9wnzyFNvsvgN45aBZ5sda+P4VuLoVys3LhgcNy+Pvk4+tGhxIA/+j6OQjsD6zsfNMyS/3D3KgA0QjZ1dJWj5jjVwnkVbhHZEKeKcMVRO55dlYCQKPCKbs4HlFEBgjJa/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406422; c=relaxed/simple;
	bh=ZMyPf7cgA1PBcbid1bpuGClXG6ibspVv4Hfs916U62Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BIlokY36OaYP0e7WDICK6wEanrh61b++30ZkntEa3GiVDloMOO1iDTfqD1cs2MHELlFlbMiQ2tZRXxv77ggDVc0qK4J8fXc1r8Q8Q0WOmUS185+mt4FoEbA6TDz4buet0Vvb9zF46cDbssnYKlGWr6KkCbp0uUTIDIRDPRSFLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYI8dQsu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYI8dQsu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C7E8C2BD00
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785406422;
	bh=ZMyPf7cgA1PBcbid1bpuGClXG6ibspVv4Hfs916U62Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EYI8dQsug1e2P/elroI4fvQwDcdMTLlZDT1BMyRr1KbxH8mBginilr9PC8zHAURXg
	 hW5FPPVRVqvQ9fcoohJLU7/658exkFujlQkuvar2yRZ4s7sgAoxZXKfMumHuCKoErx
	 Dthiu3WQlyA28I5NzS+KwZy7gK5B5h89BLUGgiKknh3xygBLqdXjtKVnDprYD7/leq
	 mtinKrJKzE+fHqnefnZMiV2ZqBx2QOLRvWcHnZVVP8IlAsy7nFw7XhKa/nMEXS+qYo
	 MKV+n/VqHY39P860tvdZr8SKMkvmfIsrXMl6yt/U5cZf5+CNZG9Yt22Mdq9BJCT8nj
	 1+sJT5Iwm6qNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2C8EEC41612; Thu, 30 Jul 2026 10:13:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 30 Jul 2026 10:13:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: gunnar.kistner@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-218305-215701-oWYf8VLK5X@https.bugzilla.kernel.org/>
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

gunnar.kistner@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310539|Combined diagnostic         |Before/after CPU frequency
        description|evidence showing the CPU    |and AC power event logs
                   |stuck at approximately 544  |
                   |MHz under full load before  |
                   |an AC adapter state change, |
                   |and recovering to           |
                   |approximately 4.39 GHz      |
                   |afterward. Includes         |
                   |cpufreq/amd-                |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
