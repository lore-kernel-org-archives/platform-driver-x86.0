Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218571C5F0E;
	Sat,  4 Jan 2025 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736004660; cv=none; b=vBNpwQuWcJtP/0RV4fNBODQMiC90IGIMu35qWHCWBA4e1HeXC8OBHnerIVMrCkSRrsXSYvJRSn+6C1VI8IEH8vCVqzDwq8L3bVyNfYivV6eW6USPC9p1KnM1ZLbI37dtbS8+ww4Jx8k5wqozvWkGpNDdylwlHvYMEFAxkNWf0nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736004660; c=relaxed/simple;
	bh=gYCUqoa/AQjN2mgGeJu7X4e9McIWS62U9byVzPGGQP0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HiChiHQz5tqICC60RlKJe0WHJg/DO87Ycltovg47IviX1nsYXPY+AWkpfjY+l6tLbzA7ZuIvydoOs7d3Q+RgDHv1O0FZpLN5vF5AkfpUinXk0yMUqSy3fdeXP8lwOdVd2ORsCjyT3uiGAP69Z4vI8UmmjsunNV+wrsI4lfArdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKic/teH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKic/teH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21636268e43so104119305ad.2;
        Sat, 04 Jan 2025 07:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736004658; x=1736609458; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ceVKvsBoxPIjQ+Uh3ePZRvp1H4S74LllFdVn9G3RDnU=;
        b=cKic/teHfFBjIKSE6IX3jFDaUaCp08ml28ZdOf49uqJtlHI1kcxcHJq9avt1GcGdpw
         RlOhXTVutG2QgGXcdpNSdylVe2E04aVN1YexQBtnJIcY6t4UhW6P5AnRY8C9LHmrnNA8
         H/ToReKeaR2XnVPlGS0U2zAPRQXL7oPkyVFdaEWkJ7kZ3JeGgFo7jjujLjePASn8SfK3
         YS9xS2ITX9UWNv5NGO21oJloQVusebNBOFKyli1RhL+DkzUAjXDihjK4UqwqB+G4lutY
         50GER+8H7IBk3VAtMXUjOlDtOeEsQODv8bfoJK0hOQvPCgTkJ/TNbWVKlCu100J/M1b7
         zFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736004658; x=1736609458;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceVKvsBoxPIjQ+Uh3ePZRvp1H4S74LllFdVn9G3RDnU=;
        b=SRwKrWfwJe5/kafvRj9cQxCVsso8WCTcqjKDdGgDKAilOwP6d6r63cdTixEoqEuMSG
         SePk64b7B22S/SJeKanfJS3w2u0czP8LLs4Yp4s0LhWyEOG3cTxiSdEeSHVCC3cL8Spv
         VpQN/eZf9K+ViEGer/QfGCVNit+a7p+HQz6QE2Utux2baT/AVtB+f5WCtk9YjGl0IXHh
         TE81LP5UmrTDXT8AHTTwSzlhp18vpAnbfX9rh6jUM7mmZilqRrk7wYCRYXS9A+OnEYKI
         JqEmYfr4HhLF0i3A/1Q9z3YMKHO3jeruxscNC/Zn+lwyYyGMBgQZZ1IXYMjASjAfKlik
         blEA==
X-Forwarded-Encrypted: i=1; AJvYcCUm4VG0PlGrZ7kPL37C4TetsWfJdMiIq4ZJdo/ijKmfA3vN87Tppml4K52ohj2Nygb6s9mYOoq5C4ZyR/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhWSjrUi730LQMlTC48E3T3dvzvr/MRpsAWbauXxKOEXmZcs+x
	wqmhfIg6MXVM9aLlJOhZdizy2daaq1mJqphvAr5oOn7MlsWVzK6qyGI1vybZ/kU=
X-Gm-Gg: ASbGnctZKqgrum9EeR51B098aO51nvWRYmdi+jOBtbNuAyov9aswrqTZ9EZetn+GlM+
	6SKr4fuzx4tOz+Ev73WpyDaRz6CofP+9QeVsbnbg0Cc8GqKHgIYfyVuXY8ob/lXepfOE3yWE9oX
	rRgAZ1UATcikzt4krg5GisnDfWI67yb6n972b3QJxOusxwe1TuIfni4PX9AORHrz22wej4Y+3Rh
	kdJzVRAiVGEiNntnlHaTaZCeJA3ECJI2QCPVdPoX3EqqsU5kKXdY55+umM/wkqn
X-Google-Smtp-Source: AGHT+IFZfpHZzx4TEdTABr1UD7rzQ5doiCkscDrCpSjS2R1Cfu7xuXGXwlaBxMbW4uguT0EIe23n0Q==
X-Received: by 2002:a17:903:2c6:b0:216:3c36:69a7 with SMTP id d9443c01a7336-219e6f262admr748478775ad.45.1736004657686;
        Sat, 04 Jan 2025 07:30:57 -0800 (PST)
Received: from [172.19.0.1] ([2401:4900:315c:e91e:a8f1:4734:ec05:235a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97182dsm262417815ad.82.2025.01.04.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 07:30:57 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Subject: [PATCH v2 0/3] platform/x86 acer-wmi: Improve platform profile
 handling
Date: Sat, 04 Jan 2025 20:59:19 +0530
Message-Id: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9TeWcC/x3MMQqAMAxA0atIZgsx4KBXEZGiiQbUllREKN7d4
 viG/zMkNuUEfZXB+Nak4SyguoJ58+fKTpdiIKQWGyQXd39JsGOKFkR3djI3jN4LdYhQsmgs+vz
 LYXzfDzcRsqdiAAAA
X-Change-ID: 20250102-platform_profile-fc1e0aaf2900
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736004654; l=1294;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=gYCUqoa/AQjN2mgGeJu7X4e9McIWS62U9byVzPGGQP0=;
 b=TE0XEti39ToC8qgiVaclAwKqNKhHA0IdDu3SeKqYvOQuzEi35KDFHFPnwvYaf8we0cRE3dOg8
 AHd8d+IWXmIAfrZht6JciZdeTVVyt0eIMf0huvqOJsOIuJnjUjeQAe/
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

This patch improves the platform profile handling for laptops using the
Acer Predator interface by making the following changes - 

1) Using WMI calls to fetch the current platform profile instead of
   directly accessing it from the EC.
2) Using an ACPI bitmap to dynamically set platform_profile_choices.
3) Simplifying the cycling of platform profiles by making use of
   platform_profile_cycle()

v1->v2:
[1]
   - Fixed enum member alignment and reordered them

[2]
   - Made use of test_bit to check bitmap values
   - Replaced magic numbers with proper variables

Link to v1: https://lore.kernel.org/platform-driver-x86/20241231140442.10076-1-hridesh699@gmail.com/

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
Hridesh MG (3):
      platform/x86: acer-wmi: use WMI calls for platform profile handling
      platform/x86: acer-wmi: use an ACPI bitmap to set the platform profile choices
      platform/x86: acer-wmi: simplify platform profile cycling

 drivers/platform/x86/acer-wmi.c | 270 ++++++++++++++++++++++++----------------
 1 file changed, 161 insertions(+), 109 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250102-platform_profile-fc1e0aaf2900

Best regards,
-- 
Hridesh MG <hridesh699@gmail.com>

