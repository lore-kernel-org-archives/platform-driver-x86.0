Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5E7370;
	Sat, 21 Dec 2024 05:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760791; cv=none; b=Ibz6Ssn09+Xwh6ZHZvWWRagNyBAEcHL34otCRh/wogD6lehtx3B9b/WzNgi2w9HN46DZ8f2Z6S4c0mlcHDGSIJCBmEXt2r2fP+pCr6/9Kb3+0MnBRYDYhIXyIM5a4ZCN2xeS5E0fw+tJBti454o1nIpdsFk8A/sIM88K8njPpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760791; c=relaxed/simple;
	bh=vXBeHWhhwgV6Y+4/2MdOnDj7Dp6dBcZdmVK/tdae2NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AH+cHKtuNNn5jGZyWliVQszSRMSoD+2+oOBTEU05uu03eTh7ecQBv5O6OArmp2ItW8DHqG7TaVN3RGRaqVowiejXV/jDTAkor0bJB7g51o7a57xFQwq1Ad1ZZLM/fAzE1mAkQusFApLxRwjnQUTdTzLKQ0A5QKgOMoMAa9TVCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLQwJZw2; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLQwJZw2"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e3a0acba5feso1831779276.2;
        Fri, 20 Dec 2024 21:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760788; x=1735365588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQbHPfl3S5Y95iq6J3sAswLlZA1Pd2AFCsITj/ubEsA=;
        b=RLQwJZw2MnfPi0PGUyYguSHvNKYJlT3QPmjpOVKJxeNsxDMCMUmKG8zUWxYI3x2+00
         e0CqgRBbs12aVJv5vfe7rr7vXygsOGEgDr79oYyhRS9zr2YvRx4fznJfBRNquZWVyn9t
         ptD1HK6xdEnfujcO1Dfpns+tk4k540gRbtxKAVfMWOEWq7JKap6BDfoBeXV9Z+CwDr8l
         g1MG5TACdjvZZ7zqthSp1lrCcQzCEXbukkBH9k4zwsHyFFdD+kJ5G4YMkkAbYEhU4Nh4
         E0KgGF6ZtPEOowTDqnokabNokMcaesB4mreLCEy7P2yKGMPqkd4Wud39KwiqDNSqQ5OJ
         BThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760788; x=1735365588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQbHPfl3S5Y95iq6J3sAswLlZA1Pd2AFCsITj/ubEsA=;
        b=NsBiAYXjK8UbsDWfMCJ3M7BWpq04pwBUxj4wtcf8g0GWSTGUeSvwb6lNfI3K54jK+z
         pQkKmK6K0SCqYPx86GhmpeJPT1tuB817iL1rXcbISXk+CPBzMFTprLjNScPTHRM/uo1h
         VSTtxyzmuW/bbHHtMxbprfWHyEpw7P3t9A+nKAzk/taHlqMiGBIvZG1cwDgS6YwEueMs
         hPELZfHa8a6GuEP9JyugTqoNCoP12Dvb+naaAlEHGXi01DwKoiMuaqmSLU9gy6e365pq
         /4lkmtYWfRNUeuZIbO4ZeK1HjnggkOo2UoxmkMIOCEFOlJWulfM+NnfrJ66mlLEDvfkm
         Ixlw==
X-Forwarded-Encrypted: i=1; AJvYcCUPjCYrGiAM19GdV49u1aLx7BaeS+OpC47xAwC9m1tlnTT7SIrPvizA6Y4I2C2vpUA4rAcKnTkwEjXrZIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2NCuBjfonAxfsvSUdLDYfsMVmbG9V7h89yzclvXjUDYv2XoY9
	DK1QWbf6EWK1pca1dYBak2afirJ4Z3r4tbLsmrANtbymZ8aWB6u0bCM7wg==
X-Gm-Gg: ASbGnctc0cUk97TYbuCzD/lpUs5CrtmPENtmsa26saZGkyBmwUlEu64oahTIedejlEx
	2WZ9IdGS3owbfTyYI+chxSN34REwXxDwRe44RGmv8pHt0noYCrPmqnrBEdMpMdIQ4VBOdoXCu1g
	fTeyvxciP81XtBqrO25nMJTTn6BMAHTg02GbrReIl9cfr5lYkXWjlGu1GLwFFo2r6Cj72glLEud
	ujvadA3c92CXM9tBhEVwAsas2/9Ywdg+PswRTYBSWLaRqvWRZ2DRASM03tJA3m5
X-Google-Smtp-Source: AGHT+IG6JpnMWeK8kcPAubqySYR6sdF9LcHzopd0MdNz8uVYnqxDgD5hafX3QQHEXrmA3FzMOKAOUw==
X-Received: by 2002:a05:690c:6185:b0:6ef:a227:c082 with SMTP id 00721157ae682-6f3f81168d3mr50945997b3.14.1734760787830;
        Fri, 20 Dec 2024 21:59:47 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.21.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 21:59:47 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 00/20] alienware-wmi driver rework
Date: Sat, 21 Dec 2024 00:58:57 -0500
Message-ID: <20241221055917.10555-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi :)

Hopefully these series are quite complete now. Your feedback is much
appreciated!

Previous discussions:

[1] https://lore.kernel.org/platform-driver-x86/6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb/
[2] https://lore.kernel.org/platform-driver-x86/20241205002733.2183537-3-kuurtb@gmail.com/

Comments
========

Patches 14 and 20 are proposals. Feel free to NACK them.

~ Kurt

---
Changes since RFC:
 - Incorporated comments from Ilpo which include style and organization
   issues
 - Instead of splitting functionallity blocks, split WMI drivers (Due to
   Armin's comments)
 - Replaced most of the patches near the end because of the above change
 - Some patches were squashed into eachother where it made sense
 - Rebased on top of recent platform_profile changes!

Kurt Borja (20):
  alienware-wmi: Remove unnecessary check at module exit
  alienware-wmi: Move Lighting Control State
  alienware-wmi: Modify parse_rgb() signature
  alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
  alienware-wmi: Improve rgb-zones group creation
  alienware_wmi: Clean variable declaration in thermal methods
  alienware-wmi: Add a state container for LED control feature
  alienware-wmi: Add WMI Drivers
  alienware-wmi: Add a state container for thermal control methods
  alienware-wmi: Refactor LED control methods
  alienware-wmi: Refactor hdmi, amplifier, deepslp methods
  alienware-wmi: Refactor thermal control methods
  alienware-wmi: Split DMI table
  MAINTAINERS: Update ALIENWARE WMI DRIVER entry
  platform/x86: Rename alienware-wmi.c
  platform/x86: Add alienware-wmi.h
  platform-x86: Split the alienware-wmi driver
  platform/x86: dell: Modify Makefile alignment
  platform/x86: Update alienware-wmi config entries
  alienware-wmi: Update header and module information

 MAINTAINERS                                   |    4 +-
 drivers/platform/x86/dell/Kconfig             |   30 +-
 drivers/platform/x86/dell/Makefile            |   45 +-
 .../platform/x86/dell/alienware-wmi-base.c    |  721 ++++++++++
 .../platform/x86/dell/alienware-wmi-legacy.c  |   89 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  526 +++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1269 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  103 ++
 8 files changed, 1491 insertions(+), 1296 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h

-- 
2.47.1

