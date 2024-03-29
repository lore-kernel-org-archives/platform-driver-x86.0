Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7B218643
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711722734; cv=none; b=h1kV/5p8gaqovJv4vCw4Atx8Yvs0gcg90jF9UU2gFZvxBphSGNAKukMczlCyw6o7E1pj1s5cWLGl3MHGj2P2OptpRxSE/pKyuC2CBMZmRUiShwP3IWmH36mcprnbnmnsWvmBIRx8zWWgiMDJFWtVc7oil66JpD9aNK10ndpbl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711722734; c=relaxed/simple;
	bh=XZOxE2DewWzxH/CoeY+staODrFN0YpqiN16ttPlus6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOPjjSMOlGneCXQODKvSY19Se+4KOU6mVKYvsKFaxt5Ba411Coccj6U3Tirm+iyg//iaDKKpSgyg1BLX1lH2WqYfV9ntcm0krNUCBcksClRf88ZhAedgwdbTVn505Zxz8DDIqJZqQJMtTeMCNCpL9eqWaMFbC59bqUMf11yC52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ph07Rcom; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ph07Rcom"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e0878b76f3so15460575ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711722732; x=1712327532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfJXhfOMasTJP1msaSAsD8IcMhe4+ahDsqEiGggMSx8=;
        b=Ph07RcomwHQ2SK+GoQXje2Y2IvyKtr2NBbuLDKSpG0ziJ7LxF82aPw9V/8ucMRuHCk
         quFNrW91lLBvo/YoRnHNHiyMvIucGYuPbR1LrX8aVwxISP5+UdJnv8cRmRZfGse+7T7J
         /onBi41jBfUDlWpWdP3Y9Y72D+f5uSgDC8rSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711722732; x=1712327532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfJXhfOMasTJP1msaSAsD8IcMhe4+ahDsqEiGggMSx8=;
        b=fImHiQYTnqJ5Z2aLm4I4yFj3Z+UVDmF9dngUrbuF9gzI0pRvgv6IIGmJU8zxbI0z2W
         44GNr5RHsUDZx8oEbDWT4TXwpz4P9nNEa7HoAc9r93SVvrDQPqH8OEjBG/B5dy6seGAU
         KJtm+WMEOdS+48MlojYcCYGoV0s16wL3641pAqTW20jimbbWNaw6pG3JHlAfVhKE363B
         kFbZS/Gosxs70MmGixm4NObaGkeMJawx5h++dWiPS87q1eRZbl6irdDyPUJA5XT3kQI0
         gE9lN/UKk4+6DtMOPg7EKqGk7sOAigQ1apEOUuIfpzjxlcfAWcK+dyeiEH1x17MTQ6Q5
         MiRQ==
X-Gm-Message-State: AOJu0Yz3UpdRr/bthAD/0GUFo06/9TCyG8gBTszU9YgcL77L2r6UVzOi
	wYDOLWrRHXc95fkq5UOAy4o0ibJKHJtMfC8p/V8sXYEQUBzHuwPam5BBRtuJwQ==
X-Google-Smtp-Source: AGHT+IHecrELI6+lrTv5mtccbMdQjPR9aabIpfQ7VuR+LPqwTSqIXc8ldjVwZHU/I9VHjq+DXfLCQA==
X-Received: by 2002:a17:902:d487:b0:1e0:b697:d3ae with SMTP id c7-20020a170902d48700b001e0b697d3aemr9244202plg.19.1711722731693;
        Fri, 29 Mar 2024 07:32:11 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:dfa:a229:6909:21a8])
        by smtp.gmail.com with UTF8SMTPSA id a11-20020a170902eccb00b001e0c94913d4sm3514055plh.15.2024.03.29.07.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 07:32:10 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH 0/2] platform/x86: intel-vbtn: Fix ASUS VivoBook boot state
Date: Fri, 29 Mar 2024 07:32:04 -0700
Message-ID: <20240329143206.2977734-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While qualifying ASUS VivoBook Flip 14 (TP401NAS) for ChromeOS Plex,
we notice it always boot in tablet mode, with the keyboard and touchpad
disabled. We have to rotate its lid over 180 degree and back to get into
clamshell mode, or put it into sleep and wake it up.

Disassembling the ACPI table, the virtual button/switch ACPI device is
implemented as follow:

  Device (VGBI)
  {
      Name (_HID, EisaId ("INT33D6") /* Intel Virtual Buttons Device */)  // _HID: Hardware ID
      Name (VBDS, Zero)
      Method (_STA, 0, Serialized)  // _STA: Status
      {
          PB1E |= 0x20
          If ((OSYS >= 0x07DD))
          {
              Return (0x0F)
          }

          Return (Zero)
      }

      Method (VBDL, 0, Serialized)
      {
          PB1E |= 0x20
          VBDS |= 0x40
      }

      Method (VGBS, 0, Serialized)
      {
          Return (VBDS) /* \_SB_.PCI0.SBRG.EC0_.VGBI.VBDS */
      }

      Method (UPBT, 2, Serialized)
      {
          Local0 = (One << Arg0)
          If (Arg1)
          {
              VBDS |= Local0
          }
          Else
          {
              VBDS &= ~Local0
          }
      }
  }

Method UBPT is called when lid angle cross 180 degree boundary or when
the device is woken up.

At boot, VBDS is set to 0 ("tablet mode") until UBPT or VBDL are called.

VBDL used to be evaluated before VGBS by the intel-vbtn driver probe
routine, but since commit 26173179fae1 ("platform/x86: intel-vbtn: Eval VBDL after registering our notifier"),
call to VGBS is delayed until after the notifier is register.

To bring back the expected behavior (device booting in clamshell
mode), make sure we evaluate VGBS after VBDL.

While at it, use function acpi_has_method() when we only need to know if a
method exist, as commit 26173179fae1 does.

Gwendal Grignou (2):
  platform/x86: intel-vbtn: Use acpi_has_method to check for switch
  platform/x86: intel-vbtn: Update tablet mode switch at end of probe

 drivers/platform/x86/intel/vbtn.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

-- 
2.44.0.478.gd926399ef9-goog

