Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479016;
	b=5AgxJYA412Vvi9TaJkGD6/QZZyfT5BDZQ6SDANNLGvDaioNQaXCpR0eXtetrxH/ahFiY
	 xCci1bT3r+edccpE5FGz2s+xh7Bs1qkIOLMcSEu/89FEUR67lEDCnibiWi0crvQptwbfr
	 j7usjAT3iR4my/UxS3tkDymagLlWxORk6PxUKVVbSxUnWCcEj6cfupLWLXrfO5gGQAa7A
	 xzACCEHD5DL/aNUU5UinHaSX7rJsj4Fq2LRCCugRUdtC1jshiBEc4mLg2QvxBDN8AUAS/
	 RQtpSz29z/831LcaiIhuCjxW+B+gZ5Wru1TN/xhvhqviapeGkPvQjxBeM4r53AWAqhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479016;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=byX8Y4DVhO9XH6r9A05BVNsqglAsmQsPOcyXJ+GcGgw=;
	b=c4rBUXy6H5C+MOCPXeI+QTRsvIHsn44FVRPH0LA1H/Ls75xrav8QYRu6MJPen9a8h+4r
	 tCct1mBNUVQx46RYQxbQsNhYpUi6MGP7k0364051XqleSGXL5PQeb6L6sAnu6kKRoeQcI
	 PCVeedGiTtZBKdncUan312CDIrT1rJJ8f0GIY25okr62afKvA2wfIBXIookP120vOhqE5
	 YYwX80JfY/Ukb3rcfF0OQlkX71/sV5F8A91S0IY8/JH3jQbcvRO1duUfQRn37B770gxjw
	 JsJAcCPhXwjjnTWvvJnb+1fvVIvlVnvjFEtE61GW6CkEtdqJMvNt/aBqfgs7ktsdB0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AOGyqL+r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAD8606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AOGyqL+r
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88E7B1F000C4
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795479016;
	bh=byX8Y4DVhO9XH6r9A05BVNsqglAsmQsPOcyXJ+GcGgw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AOGyqL+r+SiJWRV9V4pOZ92JgFpJwMcwfFMAbmVlzLeaC7XxhSRPWtUoCFdviOlz8
	 u5NrzfLANEnrIWF/F/XuM+VE/WQDy4+lleU9Du8qWo431g1oVL2PXLzHeEESyieA3h
	 x9BszjzRBWX7koWPREj7PRvs4soJexMAseCjBQC9gBibMFQXm8QaHpiPDRLOgKlpPO
	 PVj6//bZbdOv7z6b2jxBaljzVkcE1emj3mdoKWFO5vMQHpHvaK4q47COUcM7cN+SCg
	 SGftKwoFeppDbGmiUCa5Gaw06hKy6e95s2d/nvvACa/XD1/We6V91yPjnp+7b/lFb/
	 +hvnUUGFC4RLA==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 8622D240040C; Tue, 24 Nov 2026 00:10:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222323] acer-wmi: WMID set_function_mode(devices=0xFFFF) powers
 off the Atheros AR3012 Bluetooth controller on Acer Extensa 2511G before
 ath3k can upload firmware
Date: Tue, 24 Nov 2026 00:10:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arthurstarkit@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-222323-215701-PYdBzruT8h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222323-215701@https.bugzilla.kernel.org/>
References: <bug-222323-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222323

Artur Sultanov (arthurstarkit@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #311571|Before/after data set:      |Before/after dmesg: broken
        description|dmesg from the broken boot  |boot (acer_wmi loaded,
                   |(acer_wmi loaded - AR3012   |AR3012 drops off USB) vs
                   |disconnects right after     |working boot (acer_wmi
                   |"Function bitmap for        |blacklisted, ath3k firmware
                   |Communication Button") and  |loaded); plus DSDT,
                   |from the working boot       |acpidump, dmidecode, lsusb
                   |(acer_wmi blacklisted -     |-v, kernel config
                   |ath3k                       |

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
