Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEEB3F4DD6
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301299; cv=none; b=H07zqQSIj/hnVV6E4/nRmtQeXJeuTC982Wl6mvqhC3k5R3XjK6U8hYEYT+Ygq+bac/Ka8FIOBxBIAHFGzMLfPF5QAK3lTmFAb5KB7Cvg72ytQOQPSOF3X6gOLWS5JXdlYjylD6xXOKyDxUcQNJSEoo5wlhD+1ocPkavi6PZthXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301299; c=relaxed/simple;
	bh=jxP7ZvGTbJks+Pa3JnDcPEKJS5yomhQtubcRlG03PX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjSDkfIwTVY8Rn/24bvYEyFJohGXJ6Q241MjqQ19ByKrZJx0+tDENFB/ZYYhIT0+dUBdmglyTMCfcumI+85xyzJXplxldDyGTc8zhWrT8EHFW6mT86D1n2xFelZR/G4SMQkfpJaOWcvm6l1EwBL8+ZNW48ckBenj/zJz2PIxXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PF5ZfzrD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PF5ZfzrD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so4302910b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 11:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301298; x=1779906098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yr/GFDyq54/nhwE7nbNMUF+TokET/FfhjceJOggIV50=;
        b=PF5ZfzrDbvrIrEy0crGm0cZp1YovvsQmL7+gOYgLbNDzsF5J7ImyT24CYt0Qa0aVL9
         ngPa+xTDnjwjUQFFHarjCMwySnBxNd+WwNdE3oG5GR3cy1ljuzyKQmFO1zWat9R//BKu
         5xxssMkv9pYzw705HYGkRv2bvPes4dj/n+o8z+idKDUBHGDXzTiQTqX4RSyfktNWS54s
         5pC+w9hQLuhkzVo3/AtNKgJTWosuQgz891fmfcb1yqV++ik92LWpEthdod/zaRKyAQMx
         mCAvWHUcEvEcE8D5gKm4UQ4/mdvwErQdXkizFfmAsxBZgxurjLN2WIBrXvyNM9z6ur0/
         8O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301298; x=1779906098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr/GFDyq54/nhwE7nbNMUF+TokET/FfhjceJOggIV50=;
        b=Lh1VvngSTeGbbzNCs4G7+z4JSjvVcFb7ghKND0K4f1ZjGzBFRsj9maWU2r8S39BB90
         uc/MYhEAnaD8FGhqm3eJNQV3JDeKxR6jiuPsR9D6QEtfHlrZQdO+A5obmX3DKnxpDXIb
         7Fj71fY4zErlCXNHmtWaHQJoTTD/t+k/1/raXZY1cum/p8bet5FBtFFs+OsSSroOhb5U
         WLtnjKDSx19q/O8UlbhgE/aALAgaI0UqZZ2GbSihiG3Jo0zumYMY33cTkpYV/wYn9ut3
         cUW+JXj2J3ym3K2exUMoB++60XhvHEhggYGJDfZOESeZxaQ+MkkZv05ZVFkQOZrefTKy
         7n5w==
X-Gm-Message-State: AOJu0YzF3GyrWhTe8Pqr/0XWm2wcvGsDIAPZi+x7f2COOR7Q6jSW49US
	VYl3Egq1cwx+1zR9cYSgZUIz0QSrCLy3GNy3+jR5Ybm08ijZnCimWh2F
X-Gm-Gg: Acq92OE4viE46mm1XsXAfQRw4m3n5jz/n/xK1V1xZof5WgQ+ZqZ6KFBmXjQet68r+SD
	aTINljsPSeHJPEJ34vQc8CaRh7eD/MEzQ4Wguz25IPJJf9bw24QnkUXVd9HSSSk/TlY2Y0a9kpk
	cLDa0UA8IYfDPY0ZslWJD/oGdLQ9ai+voOFlvXg5dgJQTrY6nKyFaKs92CP9UvxVKFkFdZXwmlT
	AgLeZ4FTJv2xkFa6qTh+EN/L1yAi4fjCod/ph/7s8jq9gmibZgceS0oig38MuPZTxUpACBPRKAW
	sWAAkG0Wy6g4R/VM9kUvqvSf6NFoTnx9qom7hZe679dpMa1JgrsOtf2Ga39Z979qW0RA5siNUny
	4jV7rXJEqBNsWOrr8Znp9ybICwNn8I7LnVaXyw1dMhMsWLD4LcbRTOAUA2flg5ai2gTW9W+wXBD
	wNvwh8z1kKtPqJl1aGji/m2G035UFajb24TV/fXa+a6daccMGHHfEU3y9k+ZoKNYhRUPi5oXby5
	W9vE8l7jxigtx5HnnJ5
X-Received: by 2002:a05:6a00:8d1:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-83f33f2b93amr26826931b3a.47.1779301297815;
        Wed, 20 May 2026 11:21:37 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:72b8:b88f:97ce:a863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm21577331b3a.45.2026.05.20.11.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:21:37 -0700 (PDT)
Date: Wed, 20 May 2026 23:51:34 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [Linux Kernel 7.0.7] [hp_wmi] EC layout for board 8C9C
 unsupported
Message-ID: <ag30nQFG1xFvs4Gc@archlinux>
References: <CA+ORkNSkzcFwfXhKKN7yFGvUujJKtvOC8jTPYyy0fhFtWUcDuQ@mail.gmail.com>
 <agd0LPeoD7CVRpbT@archlinux>
 <CA+ORkNQXdrN_yboUfWuaQy6vVa-wrbUBFDvtGA6Rru-oB90JkQ@mail.gmail.com>
 <CA+ORkNT2ZVr8Cyg3udUGuXQYBx8pRCzwKvn5eE4UFB7UxDprDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="oojwm3crkm5jgfib"
Content-Disposition: inline
In-Reply-To: <CA+ORkNT2ZVr8Cyg3udUGuXQYBx8pRCzwKvn5eE4UFB7UxDprDw@mail.gmail.com>


--oojwm3crkm5jgfib
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Fri, May 15, 2026 at 03:21:46PM -0500, Bogdan Nicolae wrote:
>Krishna,
>
>Well, no, power profiles do not work at all. The system is usable, but
>not controllable. I tried both power-profiles-daemon and tuned-ppd,
>neither worked.
>

Oh, this was unexpected. Your board (8C9C) was the first to be added in this
category so I assumed it was working fine all along. What about fan
control via sysfs (/sys/devices/platform/hp-wmi/hwmon/*), does that
work? Your device should support AUTO/MAX/MANUAL - all three modes.

>Here is the EC hex dump of /sys/kernel/debug/ec/ec0/io:
>0000000 0000 0000 0100 0040 ffff 00ff 00ff 011b
>0000010 0001 203a 00ff ffff ffff ffff ff11 24ff
>0000020 0000 0000 0026 0000 ff00 0020 3600 584b
>0000030 4e43 4b30 3138 324a 504c 0055 0001 ff00
>0000040 ffff 01ff ff00 ffff 4cff 4f49 004e 0000
>0000050 0700 ffff 0031 ff00 0002 412d 0000 0000
>0000060 8000 0000 0000 0000 0000 0000 0000 0000
>0000070 0000 0000 0000 0000 0000 0000 0000 0000
>0000080 0000 0000 0000 0000 0000 2d2d 0000 0000
>0000090 3333 2d33 4341 342d 5742 304b 3034 3037
>00000a0 0000 d600 0041 2400 0000 0800 2a73 1802
>00000b0 0025 0024 0000 2022 0000 0000 0301 1111
>00000c0 0000 1986 02b4 40da 3c28 1b5f 1986 1964
>00000d0 0000 0000 0000 1986 0146 115b 0000 00e0
>00000e0 0000 3300 3610 3a10 3710 8710 0603 a600
>00000f0 0500 000b 0000 4330 0090 34e3 0658 2d00
>0000100
>

Understood, thank you. Please try applying the attached patch:
- 0001-platform-x86-hp-wmi-Enable-thermal-profile-readback-.patch

and recompiling the hp-wmi driver (located at drivers/platform/x86/hp/hp-wmi.c)

Expected results:
1. Warning disappears from dmesg
2. Power profile is working
3. Fan control is working

>If it helps and/or related, there are a few other issues:
>May 15 08:24:29 kernel: ACPI BIOS Error (bug): Attempt to CreateField
>of length zero (20251212/dsopcode-133)
>May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WQBC due
>to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
>May 15 08:24:29 kernel: ACPI BIOS Error (bug): Attempt to CreateField
>of length zero (20251212/dsopcode-133)
>May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WQBE due
>to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
>May 15 08:24:29 kernel: ACPI BIOS Error (bug): Attempt to CreateField
>of length zero (20251212/dsopcode-133)
>May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WHCM due
>to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
>May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WMAA due
>to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
>May 15 11:23:25 kernel: ACPI BIOS Error (bug): Could not resolve
>symbol [\_SB.PCI0.LPCB.BAT1], AE_NOT_FOUND (20251212/psargs-332)
>May 15 11:23:25 kernel: ACPI Error: Aborting method \_SB.PEP._DSM due
>to previous error (AE_NOT_FOUND) (20251212/psparse-529)
>
>Thanks,
>Bogdan

--oojwm3crkm5jgfib
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-platform-x86-hp-wmi-Enable-thermal-profile-readback-.patch"

From 25396b4c7303b61a067baaf37dab45a5a3603d64 Mon Sep 17 00:00:00 2001
From: Krishna Chomal <krishna.chomal108@gmail.com>
Date: Wed, 20 May 2026 23:31:59 +0530
Subject: [PATCH] platform/x86: hp-wmi: Enable thermal profile readback for
 board 8C9C

Board 8C9C was earlier marked with quirk victus_s_thermal_params as part
of 8ca7515d3c76 ("platform/x86: hp-wmi: fix platform profile values
for Omen 16-wf1xxx"). This resulted in thermal profile readback being
disabled. With the correct hardware information (EC layout), we fix this
by replacing the quirk with omen_v1_thermal_params.

Fixes: 8ca7515d3c76 ("platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx")
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d176c..323e6c13526b 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -239,7 +239,7 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&omen_v1_thermal_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
-- 
2.54.0


--oojwm3crkm5jgfib--
