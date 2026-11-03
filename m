Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720747;
	b=ScvdiApD0yTu+HpCAy0DaAJu5EgA+pvOMC5CfP10hNVCIDAWFTBHlSanCEHX/Ko2HH+T
	 kMvmOnyd4pBHE5S4kF0TOQypYUl20/VbBBq6cn1U9c0Fbje1tJhK2n5j9xtMwtYEipmy8
	 toLjuE5vAQRCph+5SZtnD1ZhDe+YzdyOe+IByNgB4ya+u93RhSrixtcLeMh/YVJRXKhWE
	 P+X5aPU4bKbQApUEscZI71sbxWl49sL8o9AyGTa9j/4A0OXfJAjq3bCw7YfkP1rb8eqRE
	 jk0/uhyz3TiSxYdDz74ewo9K3CzYT/chR5e5+GgCMU0GDEEbqFyhHWGPSlxtKeTvZWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720747;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=OljhEABHZ2uQ7bMg9ruR8qJ57FPo0x0z5ZXHJvSD+7E=;
	b=yrUL3SpkRoPu1gzXOqlauk6BfkzBMtNEtBlMkRZ4Nvi9Q2peYlkRM8R+MLE6QMogtpov
	 J8O5qYvBJTuYaLV2GfJh99voYUEGrofNsUSq2+/41B6/LR4rPDJ5KQhvGydfIbClbImgY
	 CB/pGDO52sqrB5CBrW3QLw06Ec95GOycF4ybCEF1DE2BktLs7oa5J3eoQZB4+5taRTZqC
	 juiBYutb8tBZHOiviCp8XowI8z/IpjAczR1dzmyGOD9+Bkoz5c65SUYON4KL1BvZaZed2
	 rvAJrtQ/97xjFRL6U6bxPAT8EjVcyydAfb+gHU5WY0vO2kFHHxhBCgrtj8v0Mgxxjtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sdkgw9PG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF60606A327
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue,  3 Nov 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sdkgw9PG
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B26513C0
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793720746; cv=none; b=XR7VeVAxa2CQWrbl5Huh0F3ZWhKsl1iB3x/SENBAY/1uWeCiAthzRVjrHlm68qZCsMeuEXjocaaXDVfMzgDBM9PkmVn1eOtVaL2Mg1EJR5CW8dGNoe2GnbNw5tLhtpk0mPIotnDaKRmTVzPzj1WjhJg1MJixehOCgg0IqeJW+Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793720746; c=relaxed/simple;
	bh=OljhEABHZ2uQ7bMg9ruR8qJ57FPo0x0z5ZXHJvSD+7E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJKqkagGhHztTntmYW2BQ7mLeUYg0Uuj7lppnvynC7GxTy7/dKiSW+H686TgpWDR/qCD0oParOazEkBh6QZaPXhmd2QBTA4ExovIiTmMDFxPgOb65HwVjgql2IrAE+KvfJQzPG8rdquMa+uQW+0GQsgUMl8Wn/sYSeLWhEJh2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdkgw9PG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 250A4C2BCFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793720746;
	bh=OljhEABHZ2uQ7bMg9ruR8qJ57FPo0x0z5ZXHJvSD+7E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sdkgw9PG8/YouxRm7QY4r6AzUNEfHJrabsaVb0dns7FLVhEbNQGl1pOpN44ZVViPa
	 fiKJORK152MJjTSRlB2JEeayN06thDkXwuSp2l5pdFKydOy1i8/6RCS8oNGMYPVgp2
	 bpvyLxzDZLPXsvg7plzNX3JqtlSLlA5jFsmgks//7GamKW1bKeFUNffeqi3LagdS6M
	 Yi1Gi4cuWs/5DDkuFj0FOF0QH5ekHT6sauyeNI26GnXub5wnrP58cAUHLdwTUuW078
	 INd1jLKHZX0VI5daTvmMZ/I+gGXeHiRPS3fGrJ2IA97/Kb4jr3XQmqpPmOzTOtehRl
	 c5+BzX3QGLUYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E99CBC4160E; Tue,  3 Nov 2026 15:45:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 03 Nov 2026 15:45:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-50k90bvJqk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #16 from helian.caumeil@clever.cloud ---
> I modified your patch a tiny bit, can you take a look and tell me if you =
are
> OK with the changes? If yes then i can send the patch upstream.

I am OK with the changes.

Thanks for the explanations!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
