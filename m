Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5915245014
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Jan 2026 23:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767397434; cv=none; b=KqO+VZuDUY6jr1AG3XK3oHq73lcYw8IGuoEfNMlu0AJRAnz5pm6eecc0eV49dTTJ53kNPvYys5Byj2BAsrAEASII/awQLcElGSx5W3L3adwVNORh9mCDRTrd07QlPhclzQW5VsZ5tEJgGdrztA9d1qPzyX4I9ioOT4D3acPBdO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767397434; c=relaxed/simple;
	bh=lJF7koj7xndjOROAsXcmMbeiumqurimC2NVaaQ6nG7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gcycBOBmxeLzFTEWHAWok2Q8fO4K4Z1+GA/4iVAWMDiTPSNomE2ynrC6/DK+WX8FkInayMwFXmN+cL01KxKj+J+PveiGQVHK2PRMfjCb/6olG6Xm4+LnDC6nH9qk4NltuLSbAnEz6nnV25zB+AtJ1coYPn2JUF4KCl4Ibzzdom4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aTTDxtU2; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aTTDxtU2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767397428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ocqsrRDl31aKDAj1je0lVeXsT62eKn1DEtpqHUCuHjE=;
	b=aTTDxtU2oOZTMhhAeYK/8xq65LvJiTtEBgC3dEybUE0TLd7bg4nxBxEk74dasGsIul4ecf
	LH69NMb4936X5+6murQVSW2KHS8hVSptTjZGEwjeHh01PBdilPRE+ORJp0xDvRla9DuKEQ
	a0vJJudt0bqoqaaXW1sZzTd3HjLfbco=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v4 0/3] platform/x86: asus-wmi: move keyboard control firmware attributes
Date: Sat,  3 Jan 2026 00:43:41 +0100
Message-ID: <20260102234344.366227-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

I was recently reading through the asusctl issue tracker and I found
out that some users have been having troubles with the keyboard RGB control
that was working before since the creation of asus-armoury and subequent
deprecation of old sysfs attributes.

This patch series aims to re-introduce those attributes in asus-armoury
so that userspace tools can still control keyboard RGB lighting
without having to rely on deprecated asus-wmi attributes.

In addition to that, since disabling OOBE is essential for controlling
LEDs on some models and it was incorrectly tied to deprecated attributes,
this patch series also fixes sending OOBE at probe time.

Link: https://gitlab.com/asus-linux/asusctl/-/issues/619

Regards,
Denis

Changelog:
- v1
  - Initial submission
- v2
  - asus-armoury: drivers should be silent on success
  - asus-armoury: make better use of __free annotation
- v3
  - asus-wmi: use GENMASK for flags
  - asus-armoury: fix error handling in keyboard attribute creation
  - asus-armoury: fix logic bug in error path
  - asus-armoury: use proper defines for keyboard state flags
- v4
  - asus-armoury: reorder variable declarations
  - asus-armoury: add bitfields.h include for BIT and FIELD_PREP
  - asus-armoury: reorganize armoury_kbd_state() for clarity

Denis Benato (3):
  platform/x86: asus-wmi: explicitly mark more code with
    CONFIG_ASUS_WMI_DEPRECATED_ATTRS
  platform/x86: asus-wmi: fix sending OOBE at probe
  platform/x86: asus-armoury: add keyboard control firmware attributes

 drivers/platform/x86/asus-armoury.c        | 253 +++++++++++++++++++++
 drivers/platform/x86/asus-wmi.c            |  13 +-
 include/linux/platform_data/x86/asus-wmi.h |  18 ++
 3 files changed, 283 insertions(+), 1 deletion(-)

-- 
2.52.0

