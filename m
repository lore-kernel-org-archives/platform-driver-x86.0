Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833151;
	b=HcjEarPlETdhPMx/gEuPjUhF2lYK7mDJCOILb2bovHfVH7me0ZxNBirMYYJMTgZ7yNQ/
	 PB5zWas3uKDYnlN5VJfF9wZoJHPOuK2XOwrShlaGnukS44fhUlU3jv0PzVVu7o3z3JoTY
	 z9puWuGRUY/6rVlAhrKj9L09isct84S/WakiW3njUJjdbBaUOJhhd1qmvHJklmXcXXTXO
	 s835V1GnXxN24AtoO0EllrZIsIS7grmvThyI1xVq2mQZMBdsAPHTiykSQe1S8tLyqHt89
	 C0JNt4W9ZRs8X+krRBtqLtTFXCUCQNgasP8Gi4lQqM5mTXb4/YJK8H7PnqFARk/4duQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833151;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=b9Lg39zNGARrgWvFPubL+Ivwg8OI008e3h+QGoP2Afk=;
	b=U+HtZy7meJqeUzJ7y0ItVZBtR5Ic6mzd9+CE+ak+esZY57yf0GlqxzT2iBkrePZha9e1
	 6kFarGmHDRu9EP9TU2PZBjVXfTobRwZfQPfIGJk0p49EKTeAnEWybsW+Q2rM1C+l8Bggo
	 B/CBCPrPAjjmWxGPLV9z315qOA7dkEOFb5BfaMOao3B4mB/YUB5BaXRMxIqG6QrhQZm31
	 ynNfSl4CrbBzekyde9Sq1Vh/oCChKC7MaJ94FsEMwOShNrqMOXyxJKey9luIuLtzF+nbs
	 rGy6K+KHEu8eXFaUxwx4Y+VyAcdGaIKp8/z00YQEcFPjzOZ8TboTi2jjwJn6ZI8IgXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fv9m0nWS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38A606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fv9m0nWS
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C4F01F000C6
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833151;
	bh=b9Lg39zNGARrgWvFPubL+Ivwg8OI008e3h+QGoP2Afk=;
	h=From:To:Subject:Date;
	b=Fv9m0nWSXnR5qMH+ehMkQChE8JRHnDOTYlYjq9c3Y+a/KL8DuumIo0GQHJYrS+crY
	 H6ZtBiARnQKrRrLz2PeTJD2WdDBcH58Ie8odr2ndkrszWXcF9YRw1MPbCi7tHLaZf5
	 F1jJhBDCOW/eKLrZGONpF+VlQdE+1Oxr1snZRsckdicFGlI6j+m/OjpRm/Zze7KBRE
	 QPEQHpRmX+uqlDpIFcjp8EqKubUoK3SeLS8ohUkAHvBclDlInxFMFXGwauzGPiTHZ4
	 3ZYt0FsYq43Eem0+RHHbeQPpu86SABWfaLoZAjbcKx5h9nHyzs4wqcaR52kgFwHBak
	 9Rc2lYzFZQSKA==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 4C069240040C; Mon, 16 Nov 2026 12:45:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222277] New: hp-bioscfg: HP t640 Thin Client: BIOS settings not
 enumerated
Date: Mon, 16 Nov 2026 12:45:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dwrobel@ertelnet.rybnik.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222277-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222277

            Bug ID: 222277
           Summary: hp-bioscfg: HP t640 Thin Client: BIOS settings not
                    enumerated
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: dwrobel@ertelnet.rybnik.pl
        Regression: No

Created attachment 311473
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311473&action=3Dedit
dmesg from boot

Hardware: HP t640 Thin Client (SKU 6TV79EA#ABB, family
          "103C_53302C HP Thin Client")
BIOS:     AMI, M43 v01.24 (04/28/2026); the same errors with
               M43 v01.08 (11/17/2020)
Kernel:   7.3.3-200.fc44.x86_64 (Fedora 44)

# modprobe hp-bioscfg
# ls -ls /sys/class/firmware-attributes/hp-bioscfg/attributes/
total 0
0 drwxr-xr-x 2 root root    0 Nov 16 13:19 ''$'\372'
0 drwxr-xr-x 2 root root    0 Nov 16 13:19 ''$'\336'
0 drwxr-xr-x 2 root root    0 Nov 16 13:19 ''$'\016'
0 drwxr-xr-x 2 root root    0 Nov 16 13:19 ''$'\022'
0 -r--r--r-- 1 root root 4096 Nov 16 13:19  pending_reboot
0 drwxr-xr-x 2 root root    0 Nov 16 13:19  Sure_Start

kernel log:
  hp-bioscfg 5FB7F034-2C63-45E9-BE91-3D44E2C707E4-10: Legacy driver hp-bios=
cfg
cannot be instantiated multiple times
  ACPI BIOS Error (bug): Attempt to CreateField of length zero
(20260408/dsopcode-133)
  ACPI Error: Aborting method \_SB.WMID.WQBD due to previous error
(AE_AML_OPERAND_VALUE) (20260408/psparse-543)
  ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000050) is beyond=
 end
of object (length 0x50) (20260408/exoparg2-393)
  ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
(AE_AML_BUFFER_LIMIT) (20260408/psparse-543)
  ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit offset/le=
ngth
128/8 exceeds size of target Buffer (128 bits) (20260408/dsopcode-198)
  ACPI Error: Aborting method \HWMC due to previous error (AE_AML_BUFFER_LI=
MIT)
(20260408/psparse-543)
  ACPI Error: Aborting method \_SB.WMID.WMAA due to previous error
(AE_AML_BUFFER_LIMIT) (20260408/psparse-543)
  hp_bioscfg: Returned error 0x300a, "Generic/Other error"

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
