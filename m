Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AD191
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732118212; cv=none; b=Z1lpp7ApD5tFgEvnb22ytnMAhZ6b1URbDlIwhRUsHE6jiPKrTsIC1tp8RDYZzUieoAf1YmT6dYDXikcP1qHqCA1Ezyp6UzjKpeV1SGv4kUz8+FEObIzeynckOYcR2uCBUXJWWIr95d4XCo8E+HnTthkMSGoapqh2SC6noC8R0ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732118212; c=relaxed/simple;
	bh=bYKOtq/sZ24PuRBSUgtIwbocwftKOn4eU42sjM23AFg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LmoUULRDRE9vSy1kXhcpcYk/FA6x19AnT0BXHR/MBj6iPLazE+XgKZf7t1ENQnUBQ0GamMyX6PI10yxVqAHieLu8DMaWGeCH/mD+nFZ3PzBs9KwfjfAKh2UP9TZzE/tz2BVR5+R+sLXiv5xUEe7i+pigOOs6K/u8EdR6ljTCvw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQ6nbpda; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQ6nbpda"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89450C4CED1
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118211;
	bh=bYKOtq/sZ24PuRBSUgtIwbocwftKOn4eU42sjM23AFg=;
	h=From:To:Subject:Date:From;
	b=WQ6nbpda0EIFMW2m8l286S3gAi//pMuJ+HRfMlJkZvovcNw378+4MA93bSMRsXCZP
	 XAI9wDa9t4wJbPGfrdUn6aPNNsv4hA9TMdln4xrmFqDGt/XK6WabFbrXNvwoShiwXL
	 QJLBnVXgGKqiqpFXX+Yhv5d/tRJGYLYZreu4qhMeYjJpXwv9qyxGwI8fnzcilAPA0P
	 8LIgb+h2KfZ4F9z48I81K2fpvx3SMImvfm4v/SpUldfp+6lg/yNJvd5T6UCuqPj4HS
	 S8j6A1Yhk6Ar+ApL2mHJz5Y7LJgkkkEBI+T0GoS2gKhFDoUZr9D2An24jBGetNmSZ2
	 SxU4gBupKc19w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7CC94CAB786; Wed, 20 Nov 2024 15:56:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] New: REGRESSION: charge_control missing in 6.12
Date: Wed, 20 Nov 2024 15:56:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

            Bug ID: 219517
           Summary: REGRESSION: charge_control missing in 6.12
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: auslands-kv@gmx.de
        Regression: No

On my ASUS Vivobook S14 (TP3402VA) I noticed that with kernel 6.12(-rc4,-rc=
7)
several charge control related /sys entries are missing.

with kernel 6.12 the corresponding folder looks like this:
ls /sys/class/power_supply/BAT0/

alarm               charge_now   manufacturer   status      voltage_min_des=
ign
capacity            current_now  model_name     subsystem   voltage_now
capacity_level      cycle_count  power          technology
charge_full         device       present        type
charge_full_design  hwmon3       serial_number  uevent

Specifically missing is charge_control_end_threshold, which is normally use=
d to
set individual charge end points. That worked nicely up to kernel 6.11, but=
 is
defect now in the current 6.12 version.

Anything special you need from me to fix the problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
