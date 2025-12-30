Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505672417FB
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103554; cv=none; b=T99BrWC6S4WyhwaEBZ2clEk7ZmxiaCSNFoJDGniG45TICbzKQhNH16GafcyN6oDKpvixtvrQ/kJUYjXkEVqhejBKKgkndwWwFUiznbEyB0EzAN6rVRyPLTYsn3/gU+uE74PhoKKNkL6Bd/XgnnkUSLJ2B1aEDtcKOSQcW5w/2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103554; c=relaxed/simple;
	bh=rinXrxytIkJuDDlqpYuC9gcogsqKuQo9Jk1nKls8Niw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oGYszR3skk4DaBhr6NIMAS7Y0Rknj1aiOn4HyD71EaCDpIx+K7uG0ZU7fnSk/PKhxSLybnoV5ax4rfKsT/SVw1z81nGlNzMZBZsA6hIH6H0CQ6N0NoM4A+0lJHkTHM9RNkE+qwMFVM83DOCV/fhT+s0BL6nWMfxCHC/+oUAktVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=avFkTQE6; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="avFkTQE6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767103538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NVs0ICSek6VWWy+PqbS8QXCJbgYkZW8r0nGbiB1n1ro=;
	b=avFkTQE6UF9TDZ47z1eHbud7kyVKJJigfOeK7CsdYY2X/ARBwC8Qe5gdfeRekW87NH3elL
	Zz53vJgfnAiGb8RCefSurUHJ0XhcutVnePHZ9IyvYNJkPO3SvLb3RJWDRl0aR0u/2/mXT9
	pjLQRbkje1ul9Tkfk71Y7+gL2qxf04A=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	=?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 0/3] platform/x86: asus-wmi: move keyboard control firmware attributes
Date: Tue, 30 Dec 2025 15:05:22 +0100
Message-ID: <20251230140525.42017-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

i all,

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

Denis Benato (3):
  platform/x86: asus-wmi: explicitly mark more code with
    CONFIG_ASUS_WMI_DEPRECATED_ATTRS
  platform/x86: asus-wmi: fix sending OOBE at probe
  platform/x86: asus-armoury: add keyboard control firmware attributes

 drivers/platform/x86/asus-armoury.c        | 252 +++++++++++++++++++++
 drivers/platform/x86/asus-wmi.c            |  13 +-
 include/linux/platform_data/x86/asus-wmi.h |  17 ++
 3 files changed, 281 insertions(+), 1 deletion(-)

-- 
2.52.0

