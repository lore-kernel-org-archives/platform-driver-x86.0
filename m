Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985E43E4B0
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385949; cv=none; b=h6PkWP8X/sGf/SYiIGZRJmDNMTUyRe36TDglzonbGQ8mochL7SHG7pKMpZBwATb6lsiSLCZfGRZVaE2GCcXWGtu4jju+K83j26c7e23/JW90HXpl7Cuv5JyLxb8DK7bZ5J1Cou0LBgITfvXtGy74jZd4Y181K0So/96RMoqEZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385949; c=relaxed/simple;
	bh=B1Xhw+g3PdzwhuvhrsM1a9m2CPLx9i7HUaE+i6Yty1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUYWi/W2yuQ6J11R9X8/Mn3hrFOuSkq51MpGYxaDdmAFzPkptc2mxntq5OxzXY4mAfXYeKQIHxziAIeTiUSm4ykyW6eLg6WCuM3CWeyUA6DovNVGCbyfPEfd6eSPw2B9a4JvWQ3KaoLslViRNCR1ER94p2LK5+j2HCy/OMVi9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPVsTwJV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPVsTwJV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358dff8447cso1737061a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 07:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777385938; x=1777990738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/l/tvbICEbtVIUOb2tF/TKbrJ4oMCuMVruWpyDt6VA=;
        b=ZPVsTwJVs7OLtQ8CXFBjyGKN0PyiBawGjUofhCE1ZAYrPf/8Tw4LP5fbEf6GTBkgKD
         nS9KwYcKIR+pvv18G3OHMd0kWB7fjKjVAdL2OV0GpicRTQvbOsyGymYL6AI2CoHi1pmz
         ewnhIFcmxu1PnwRJgN4hYjQ9UA/RNm2zR8qBbQh3qGsC7A6/hU5fzfpTAGfMw0un81ue
         I/+7gS7LMhAycKRHFRBAL9ePnDfTHsgQV+b4MFLIxrHALaAvYsGsYSv436uU7FvZpleK
         kx2ggPhB3LUheqQIRTyRKhX/fi/vwQ6xaqoEExgXxALEHhmgwuH5DqZVaBmV0LhU1bRo
         LN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777385938; x=1777990738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/l/tvbICEbtVIUOb2tF/TKbrJ4oMCuMVruWpyDt6VA=;
        b=IZzUcYNIy30WwQS+LrWZm5T232nmdVTDvDrVyUe/WmvhVYgv5+wrgFYc5R6IIVkheW
         jkwT/0r0QR67QyP46pSUiSa1KUs7A3lCjQIJXr+6eWfd/FV6WNfIV+1ugnDp2SGqIuts
         Acmy6uj4dySR1Sjmn8z98vcg4lbdwb3//sdDpodkZvQa4QYG9rfsFDi2izggX8R4Pb8J
         8x4HHAXi/A6TGE786iaKAOvUkTMNcRaHRnfUqZ9Pict/qcAoADEUT77/vrFWqOOIyUzX
         NkQLxaIq7MdM6KBnriTSjUu4t4Yw0+Z/vSfP5oF9WG520xYE1pt1aaeXyWGaGqgKgi6g
         D8Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9eewqLt7UDOdI6kzfxeo3hIKPw/B6nskAeh9UvXWUfRaKM2FXknGm/rpA/KcaxGr9rkSzDfKHD30oIblE7CrlsObQg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Ehcm1JnAdyN/iVMhr9EIi179Ujq1lFFu/VjTbNNUzFrLf7Vp
	nA7qMmyXe4v7Mo79jViVenvu+2DbtWJPpJrt18S1zmxSXkJRdVkk+bWH
X-Gm-Gg: AeBDieu+63QESUozC3Z9tCL9cNRbDk36gPnW0tdGNS8/xYEt+SA//xocRMxfG9Cyzfh
	CItHL/ATVYvzx1GDparhxqvmwaIz2UmNVqIe6/XnF77EDRnpHqGbEn4bE0SmBHAxpS7xrhj+82v
	4SNJzgPAI3cb2CjHV2YSoFzwgLNSaAQRl9Mjdldsh+LUqfzDp+ycq0oAF8+6VdZoNjEcW+XOE+/
	RTc2s+tuXgZqm0uszxFv//D6s+7Eh70fxBQSnkDnRnwdjpPItCc1rykIa+J10TwS+YVFUW6djPr
	EROIfv3hwFB9e5XzKPXLXpSljRx96xN0J99yfI/iSxDUOARtgtCAzv0edjrHnPD149jYPP/pX4Z
	QOFh+1vO6FTzIDTAo99AnnjZmV4PfwP+PWTDf/iDpXYYcLkoL6ymtAgLf6+rMhuRwB6MYmXWIJs
	VsEaGXWbLwD6OTtYdb7JE2P7qC9uNKd1ZXaR4pY9VX
X-Received: by 2002:a17:90b:3ecc:b0:35e:576c:7c1e with SMTP id 98e67ed59e1d1-36490ca7aa7mr2116371a91.4.1777385938195;
        Tue, 28 Apr 2026 07:18:58 -0700 (PDT)
Received: from magniquick ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490fbfccesm3114485a91.14.2026.04.28.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:18:57 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	jorge.lopez2@hp.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	sre@kernel.org
Subject: Re: [RFC] HP laptop charge mode control via POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR
Date: Tue, 28 Apr 2026 19:48:51 +0530
Message-ID: <20260428141851.549364-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <abfc9469-5d47-4e83-8c3c-03138f1b2ade@kernel.org>
References: <abfc9469-5d47-4e83-8c3c-03138f1b2ade@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans,

Thanks, that was the right hint. The path from the EC to ACPI methods to WMI
has been fun to trace, and I learned quite a bit.

I checked the WMI path, and the charge methods are reachable through the
existing HP BIOS WMI GUID:

  5FB7F034-2C63-45E9-BE91-3D44E2C707E4

The _WDG entry exposes object "AA" as a method. In this firmware that maps to:

  \_SB.WMID.WMAA

and WMAA calls:

  \_SB.WMID.WHCM(Arg1, Arg2)

Inside WHCM, the command dispatch maps the charge-control methods like this:

  read  commandtype 0x1f -> \GBCC()
  read  commandtype 0x2b -> \GBCO()
  write commandtype 0x1f -> \SBCC(DDWD)
  write commandtype 0x2b -> \SBCO(DDWD)

Calling the WMI wrapper for the three modes works as expected:

  \SBCC 0x0000 -> normal charging / auto
  \SBCO 0x0500 -> inhibit charge
  \SBCO 0x0200 -> force discharge while on AC

So the raw ACPI methods do not need to be called directly; the existing HP BIOS
WMI transport reaches them.

Given that, I think the implementation can use hp_wmi_perform_query() with the
existing HPWMI_BIOS_GUID.

I am still unsure about where to put it. The smallest patch would be to add the
power_supply extension code directly to hp-wmi.c, but that file currently does
not have any battery-specific code paths. Should I add it to hp-wmi.c, add a
small HP-specific file under drivers/platform/x86/hp/, or is there another file
I missed?

Thanks,
Navon
