Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE40376A0C;
	Tue,  1 Sep 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275026; cv=pass; b=jSBz8iG93x5XuRKOoVo8ynm0Cq/P3tftCX+/1LXipWYk+tHP9pf76yxeRh9YSxE69r6fjRS7xeTgH100TtYdmiuaoXIlzTJUTwX+OYEF+vPl3BfRIAs/KPoKX46d0OOUQmLyBsUd3LY7FLThrLkQgneN0uDVLtCYVa/OqGW4fLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275026; c=relaxed/simple;
	bh=695EQeps+yAMFDUemmHOAdFbZ0pYZn2fKcy4RUCcTaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=da0hrhOilRgCeBeBFzflMYIRhvtdzvNR2ueQsVU2zgiJK5ull00xlQXAmDFFeaDfon4nZLQ2aIf8QknBWd8fkZ9fyZ4U5DvHJWIXcT3JgIfLa5U5+8apS8eAyu6H8Z+jO7RZj6pMvJuzqB2bqyVdlIe1nCU4rHZw17Nz9p4dZ+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=AvQtsjvC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="AvQtsjvC"
ARC-Seal: i=1; a=rsa-sha256; t=1788275015; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gc75f5kPQIhKYTouQpYHe5nqo4xjgIYggAVbDS+Mc1+pLBX27gvzbBA4zUwCHPNnldRE+enAKaZ9Wp0eOfjdHa1xRL8vApS8fj97+R64g9J/CtS3VJlLX5c/Oqivg98mZ1xY5ubwb+XeRyZt6p+AgCePzeDvx72R3iQAEsNliXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275015; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=srPWlNuTqCs2PzpuGEVQeFzRN/tgS0eXJa4m1CpSl4I=; 
	b=XEt3D97DsBaGoBmb0abF+1+aABLHhpfHf7drQVVQWH7NW73NJ6dJKanv7wdumF68AbPS7n1d+xV+qx1JOokCbR4kywudt++7dD86Neb3D1z1SKLE4BtGOZbIGcQjS9KhoDge4IiVoz8JXO3lnBetAdAQsIah8cmb6g69nqgrYsU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275015;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=srPWlNuTqCs2PzpuGEVQeFzRN/tgS0eXJa4m1CpSl4I=;
	b=AvQtsjvCuNZMR1l785YOKvNfP32BYCnZo+GLg113Yz1q9H0PWc1Y5VcQkoeUy6EE
	6MLQB9LigsuABhpWMJ2kDHQGgf7Nv83m8EhbcHNCRkiAeAamLNDzexvHX5ygZBTBYbI
	GhyChjCDncU2JICbRaFnDBde6bXwcy64lzgrdEWAZmlR7xN7GA0aPGH/Fx4IcAn1LEC
	jhMHVYv/n8pTTg5T+1PuAI9pXT7zXD8MyH9wSK0m/lC8F9VUR+KnuwPuZVLAdRb8Bgk
	t9CHaKgGfR3ioZKoZG0Cm4pzMFmlpt+QlT7+ynFOTPouEaWjUyl6hNYu67wkHLBc3qH
	JIG3U3g4lQ==
Received: by mx.zohomail.com with SMTPS id 1788275012047984.2457097577368;
	Tue, 1 Sep 2026 08:03:32 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/5] platform/x86/amd/pmf: Clean up undesirable function
 outlining
Date: Tue, 01 Sep 2026 23:02:10 +0800
Message-Id: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqEIBCF4VeJuW4gw0T2VZa9KB1roiw0I4jeP
 bcuPzjnPyFSYIrwKU4ItHPkxWeIsgAztL4nZJsNygmthO2wnS2us0PHBy5pm9iz77GuZCMVaS2
 Ng/xdA+XB0/3+XsfUjWS2fwyu6wZgpsnneQAAAA==
X-Change-ID: 6f1861db-amd-pmf-fix-outlining-204546e884cf
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sanket Goswami <Sanket.Goswami@amd.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The amd-pmf driver is notably bloated due to undesirable function
outlining and linkage. Simple and dump helper functions as well as
wrappers should really be static inline functions instead of global ones
from the very beginning, or else they are prone to the overhead of
function outlining and linkage, which bloats themselves and their
callers.

The series converts all these helper functions and wrappers into static
inline functions, and shrink the module (!CONFIG_AMD_PMF_DEBUG &&
CONFIG_AMD_PMF_UTIL_SUPPORT) size by 1472 Bytes (GCC 16 -O2):

      text       data        bss      total filename	(before)
     26810      31672       2768      61250 amd-pmf.ko

      text       data        bss      total filename	(after)
     26046      30964       2768      59778 amd-pmf.ko

As for CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT builds, the
module size is shrunk by 1187 Bytes:

      text       data        bss      total filename	(before)
     34593      45500       2784      82877 amd-pmf.ko

      text       data        bss      total filename	(after)
     33988      44918       2784      81690 amd-pmf.ko

This should also optimize the performance a little bit theoretically,
though it's probably not very important on modern hardware anyway.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (5):
      platform/x86/amd/pmf: Inline !AMD_PMF_DEBUG stub
      platform/x86/amd/pmf: Inline simple helper functions of Core Layer
      platform/x86/amd/pmf: Inline simple helper function of SPS Layer
      platform/x86/amd/pmf: Inline simple helper function of Smart PC TA interfaces
      platform/x86/amd/pmf: Inline wrappers of ap{mf,ts}_if_call_store_buffer()

 drivers/platform/x86/amd/pmf/acpi.c |  76 +-----------------
 drivers/platform/x86/amd/pmf/core.c |  22 ------
 drivers/platform/x86/amd/pmf/pmf.h  | 150 +++++++++++++++++++++++++++++++-----
 drivers/platform/x86/amd/pmf/spc.c  |  15 ----
 drivers/platform/x86/amd/pmf/sps.c  |   5 --
 5 files changed, 131 insertions(+), 137 deletions(-)
---
base-commit: 9ffed84a24d60ec506d8961fe138f0baa92fdbd0
change-id: 6f1861db-amd-pmf-fix-outlining-204546e884cf

Thanks,
Rong

