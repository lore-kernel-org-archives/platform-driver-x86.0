Received: from cs.upt.ro (smtp.cs.upt.ro [193.226.12.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE72628D;
	Mon,  7 Sep 2026 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.226.12.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788739612; cv=none; b=HhLTaQyNDz6Rbo+wzD50BVqI4LHTpMpsktDKtTJq5e/eq52xP7ZXRZKRsBbyJXpmcO9kLEd0a9VzI1VT09vCcViB+ouqdf5DvEq+Fzu3p2EO7juG13HCeglLq8vii1HPlz+fU8ZJXnvGY26CLlnJw3rMDkINiOc02Bd4Iz1Z78Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788739612; c=relaxed/simple;
	bh=Sjn5sQa/1cU6LsTI0yua3qDEZLFnx1sxSShHuHNwaGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTTFYOYcp/3feoDQb/2fNEI2pW8K4Lp752jNxNI97anvYdro/dqcX01dTTvHgaHvqBPs65E5NXeF6YKhlnDNaQTjMwhTq9OS8hsRbxCoiRIJJt/nBrjWQuoXYxZNqrskLNGKV+YwWUdYCAMPzqiYpdJSt1Tp/UMF2X8lR09Tcb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.upt.ro; spf=pass smtp.mailfrom=cs.upt.ro; dkim=pass (1024-bit key) header.d=cs.upt.ro header.i=@cs.upt.ro header.b=etiPi4yu; arc=none smtp.client-ip=193.226.12.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.upt.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.upt.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.upt.ro header.i=@cs.upt.ro header.b="etiPi4yu"
Received: from localhost (localhost [127.0.0.1])
	by cs.upt.ro (Postfix) with ESMTP id 16FBBDFA3D;
	Mon,  7 Sep 2026 03:06:47 +0300 (EEST)
X-Virus-Scanned: Debian amavis at smtp.cs.upt.ro
Received: from cs.upt.ro ([127.0.0.1])
 by localhost (smtp.cs.upt.ro [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47ry4XIKlIcp; Mon,  7 Sep 2026 03:06:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.upt.ro; s=mail;
	t=1788739604; bh=Sjn5sQa/1cU6LsTI0yua3qDEZLFnx1sxSShHuHNwaGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=etiPi4yu7d5Wjm/Sivu+gFL7gKoqRp6opFDhTK7DGqbTO9E0Th9FMOrVoDILPr+zg
	 9k0CiEHF8ncn911Dw+/rzhH6PzVSTVAPk4GhsxAPNQB2r2EGoRol6cHGUnHits9hHr
	 ZVyrv7yjapLhdKxDtebNKJP//nC83KSZG2BwWyhk=
Received: from kcstation.tailba65d9.ts.net (unknown [5.12.49.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by cs.upt.ro (Postfix) with ESMTPSA id A8FD0DF947;
	Mon,  7 Sep 2026 03:06:44 +0300 (EEST)
From: Catalin Cereanu <catalin.cereanu@cs.upt.ro>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] platform/x86: asus-wmi: no kbd backlight on Zenbook S 16 UM5606WA
Date: Mon,  7 Sep 2026 03:06:31 +0300
Message-ID: <20260907000631.18373-1-catalin.cereanu@cs.upt.ro>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906235355.13404-1-catalin.cereanu@cs.upt.ro>
References: <20260906235355.13404-1-catalin.cereanu@cs.upt.ro>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up on my own RFC: after sending it I came across prior art for
the first of the three questions I raised, which makes that part much
less open-ended than I posed it.

The FA401 series has the same shape of problem with a different device -
WMI device 0x00100057 is not reported by DSTS even though the EC does
support it - and that was handled with a DMI quirk ORing a quirk_entry
flag into the availability test rather than trusting the probe:

  https://lore.kernel.org/platform-driver-x86/20260902174718.16228-1-idotohors@gmail.com/

If the same approach is acceptable for the keyboard backlight here, the
equivalent would match DMI_SYS_VENDOR "ASUSTeK COMPUTER INC." and
DMI_BOARD_NAME "UM5606WA", and do roughly:

    static struct quirk_entry quirk_asus_um5606wa = {
            .kbd_backlight_available = true,
    };

with, in asus_wmi_led_init():

    asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL) ||
                          asus->driver->quirks->kbd_backlight_available;

That would restore sysfs brightness control, since the DEVS setter at
0x00050021 works regardless of what DSTS reports.

It would not restore the Fn+F4 key, which stays gated on KBLC in
firmware, so questions 2 and 3 in the original mail still stand as
written.

Happy to send this as a proper patch if the shape looks right.

Thanks,
Catalin Cereanu
