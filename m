Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961A1FDA8B;
	Mon, 13 Jan 2025 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774063; cv=none; b=u3dS9OvlnT1MUQ/oVgwtFfkexenhbITfgp3UEZX9DXgl1XHVyvaLEUyjfCib+4VwHknxd3ONtQM+0PLk+NxnUTCNTg4OEbMVjYIpTpPf9Iy74xOrlKZDYcj1rsyy/xEoO7Z1yb+0+TbrTBrwnRKP67vQ3nSSxBo+5rJmCIP63Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774063; c=relaxed/simple;
	bh=ot4mxw43k59jQycEerbgD5VNjn0xzt09xskuhs7ZiLo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QCZZOp56VGS/VgWqdZHzUPGKZ3MJUI2fD+54FYIOx0MZE3uekTDnaNYHCaDSqmcnEV64OXOmXvOnKS1X7NI9tO3omqIpDIXzAgA/UGNoq3sk/xTqm4DoTtbeImHy8gX6lb3LG1iGb3sQjmAPuUdNkWpVN0GvPzyTbznwC12f5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jh/nhnBF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jh/nhnBF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21670dce0a7so89040075ad.1;
        Mon, 13 Jan 2025 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736774060; x=1737378860; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JG4CYc3Gj9ONRoGhdPu/m4XGIHG8mhLOt8sEVexlSw=;
        b=Jh/nhnBFuLkWE7X0ZUdmfR5EVioZvoOd7XJq9fr9jG5gxbz3lVpOjNE8OrNjaa4KWo
         U0OFhhlKmcrwRRBo04yTZRL5/o6WoGAUp5MLj+o0N0Vz5/MZNWE5tR+XSW+exlmfwpXe
         wTgqYIaYK8sVixm9zQJDRbhU/H5L676jX3F2gfxkhqIH+9tI1zug1+A67hQZGbu0lRVA
         9VKZWduDuN+8FNu97SrgiOCLq2fN500gH5fxkXaJf099y7+uYsR0nUPkCVqYgsxW1Xv5
         t1tmKl4LZE0vMXeh+EA2zPrM9LDS0MvcPkhjrfR/dJDBqldtkwyzvKjfijNSxChk757U
         uUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774060; x=1737378860;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JG4CYc3Gj9ONRoGhdPu/m4XGIHG8mhLOt8sEVexlSw=;
        b=Fo4veySvZLouvhrNj1vfwV+/g8HcIArRc+BovrLnMYabU8Sd5ApbsBv+v/9Gnsa63e
         VQURbzTlmXcMTt/rqhgPvRz1RSxWZpSlEZFmznFsT3LJqekOOndFZE8pVkcAYyQh/OzB
         L9yT9SrOq+/+rf6Ps+HxMgQu5JPczfKDi0weJGDXOqx7F5242lt71VX9ldBIyLaTTdu0
         CtWGVq7BHK2QoncOfwmpL7uj4Z/tBTsTd3L2UCDGPNsVaIhRdIWgo7oqeQ9skNJzkq4D
         GrEqWMgf5aovIo5mrAqID9dt629SrLN1MAGnWIt90ZqQ6PHr95vDmUGpddOyTRdq7vvD
         B21w==
X-Forwarded-Encrypted: i=1; AJvYcCUIyBuhecFpfZgBZdTnruUybjR2EMyCK8BKh4bn+YTHM4QMNAyBWizTh2gw01jVvN4F1Er88JrGvqnbUCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9mT5bD/LE7vV0XIogZll69VWE0msRXK9Etc8A9zgeJQVKYLE
	Zd2P8OGkKm9/Q0kjpJ8/OLyblnYT2b3LVqibJHhdqAZQl5PDEcj7H8EzK9Ab
X-Gm-Gg: ASbGnctxwvCBSv+n76RKrY/V6DrlQhNk+r2uaXHQzqJGLkMxC9wuPUDGJkl8WF2w+tm
	SiuR5E9oB2b9CTmoeY0HRz4UglRyHFZTMLtXeY50x4IQLg3KJAreJ720jbKkJAevb1qntWSBOhe
	CNlhfdd5okPdCGLkWyGlrfOmKYMLBzUf8VTKTWU/d3Bi/0ISEm3tais69Zfw0jvLsgvT6Gvl0Ec
	WmhcTnU8agjA1bO0kAehDz8HCUHw6WreQCbRbQGTplWjK6w3a9Qdr2xmYJ8cw==
X-Google-Smtp-Source: AGHT+IF9m/fl6ugNKOIvIr1U/qHXgRIaeFopkW9l+HMBZZ+lekunJ+kG4X6srVKUEiuD/UjVbsZ72g==
X-Received: by 2002:a05:6a20:4303:b0:1e6:5323:58c5 with SMTP id adf61e73a8af0-1e88cfa6845mr30479973637.12.1736774060054;
        Mon, 13 Jan 2025 05:14:20 -0800 (PST)
Received: from [10.113.16.67] ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31840e93absm6961209a12.20.2025.01.13.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:14:19 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Subject: [PATCH v4 0/5] platform/x86 acer-wmi: Improve platform profile
 handling
Date: Mon, 13 Jan 2025 18:44:08 +0530
Message-Id: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKARhWcC/23NTQqDMBCG4atI1k3Jj9rYVe9RSolxogNqJJHQI
 t69USgI7fL9YJ5ZSACPEMg1W4iHiAHdmCI/ZcR0emyBYpOaCCYKxpmgU69n6/zwnLyz2AO1hgP
 T2oqKMZLOJg8WXzt5f6TuMMzOv/cPUWzrF8t/sSgoo3WheJlfuKqYvLWDxv5s3EA2LMojoP4AM
 gFgZFmopqqhMkdgXdcPfHZ3bfEAAAA=
X-Change-ID: 20250102-platform_profile-fc1e0aaf2900
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736774055; l=2297;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=ot4mxw43k59jQycEerbgD5VNjn0xzt09xskuhs7ZiLo=;
 b=475gPxERqeXWWspQpIk1to6w2geGEkYJpTJoCjATeb0Wf8JHYzftoIAuLVYIweBbzCmTKBG6J
 Laiu+T/YbioC4CShc9REoiOc+R+IBKwEYLPzpeNsuunMq6ekXAe5fiz
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

This patch improves the platform profile handling for laptops using the
Acer Predator interface by making the following changes - 

1) Using WMI calls to fetch the current platform profile instead of
   directly accessing it from the EC. A new helper function is
   introduced for this purpose.
2) Simplifying the cycling of platform profiles by making use of
   platform_profile_cycle()
3) Using an ACPI bitmap to dynamically set platform_profile_choices to
   better reflect the supported profiles.

The last patch also adds support for the Acer Nitro AN515-58 by adding
it to the quirk list.

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
v1->v2:
[1/3]
   - Fixed enum member alignment and reordered them

[2/3]
   - Made use of test_bit to check bitmap values
   - Replaced magic numbers with proper variables

Link to v1: https://lore.kernel.org/platform-driver-x86/20241231140442.10076-1-hridesh699@gmail.com/

v2->v3:
[1/5]
   - Removed a line which was supposed to be in another patch

[3/5] 
   - Moved checking of max performance profile to [4/5]
   - Restored code in profile_set which updates last_non_turbo_profile

Moved the supported profiles patch closer to the end of the series

Link to v2: https://lore.kernel.org/r/20250104-platform_profile-v2-0-b58164718903@gmail.com

---
Changes in v4:
[3/5]
   - last turbo profile is only updated after a successful WMI call

[4/5]
   - most performant profile is set during profile setup 

- Link to v3: https://lore.kernel.org/r/20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com

---
Hridesh MG (5):
      platform/x86: acer-wmi: use WMI calls for platform profile handling
      platform/x86: acer-wmi: use new helper function for setting overclocks
      platform/x86: acer-wmi: simplify platform profile cycling
      platform/x86: acer-wmi: use an ACPI bitmap to set the platform profile choices
      platform/x86: acer-wmi: add support for Acer Nitro AN515-58

 drivers/platform/x86/acer-wmi.c | 315 ++++++++++++++++++++++++++--------------
 1 file changed, 203 insertions(+), 112 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250102-platform_profile-fc1e0aaf2900

Best regards,
-- 
Hridesh MG <hridesh699@gmail.com>

