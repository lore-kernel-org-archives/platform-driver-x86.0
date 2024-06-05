Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF916152793
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Jun 2024 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618827; cv=none; b=JtzLZAm3OhOKi+mmCuImHN7bWcHURADuAcihqbbpGZB3JZ2Erso6Iq27MTlT+x2rOIvYjZWhmx0DPenRYpy+7m5D+oa0TJ1i2WQAsp+X5tRjzoOxZvFOGT+UnJSU8J9mZQIX0yx1pQhzvZfjZDa0kJ9U9ai+k2tWWkQtHYgZVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618827; c=relaxed/simple;
	bh=P7fdAmM7Mk+XqnpTvvPn3AnonWcOsJ7CyxrNPF+WGeU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KZeszsMT+pKyWgNXkPb1dej3BDigejXGWa+MiuGukZ3nlitMern5C6qL+D0q53d3o4xUtp1CyUK0Euhc/wvVyerUMNgJiv1xou0eykXWaGh3mxp6bxaKFPPjlA1d8JWi23ImSJdcSJI8+X++9Twb6B6CEEWa7nnURmfgnkN9B7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHt6WnJa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHt6WnJa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C83AC32781
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Jun 2024 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717618826;
	bh=P7fdAmM7Mk+XqnpTvvPn3AnonWcOsJ7CyxrNPF+WGeU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MHt6WnJaEosbTZQhn5XEe96vIN0eLjfUsfnF84C0K9bRC2JTgEGqBV4JjcitdTeo8
	 U3NHVvv+00UDjgB5J3a6S127t4fqiAXtpiKNfG45BR6f58/zj6qH4FiNmsUQ83DzBj
	 5DOcC+QT6uWiUw3+FupARLZC5lYcJhkSfidV/L1CpkWGRhJ5Owua96OwQPXIuHxD3R
	 nPzn8FwV3KBcE8x3pNhUct+RmNs8FUdt6VBYDhpP3DFt2/ieZmOaPUUkqGuGs0BAQR
	 3MLTE+aqlaFGBABEbvQYksoM/4987Xi6529hqfKuXUZyk3huq5XHvAQIa1RHZxF8O/
	 YLYisYR8JIdmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35201C433E5; Wed,  5 Jun 2024 20:20:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Wed, 05 Jun 2024 20:20:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-218771-215701-fLQDXdV0YI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Hibernation/Suspend         |Platform_x86
           Assignee|rjw@rjwysocki.net           |drivers_platform_x86@kernel
                   |                            |-bugs.osdl.org
            Product|Power Management            |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
