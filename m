Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9B273FD;
	Fri, 17 Jan 2025 04:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737088403; cv=none; b=sVB5NHmjN0AeUvMMviE5/dVmLabgL+YSRJ5BqKlhIANOcG7MRaBQHw4c6nOo0z8ayq1Zh1wJKj27Wqtc12anrSxNWZd6jLZ2zoURHzlL438X2R+jgVItEUTsr97xB3URYwUZbU0/eCRBEsMYsTV00NkcWfdSfvL8QKb2nSp7SD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737088403; c=relaxed/simple;
	bh=UZip3qHWvBdxZIALEOp+G516ouJUjzjFcu2e6BX8oxc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hJlix9nO7zuR+n+KLqiC2e02uE1BsO5wJ1DIFlOvjSlw2MrOPxcpXNs3VZU3IzT2n12ZOdAbOIYuK7fwrAS0YvdmsSN2NqVTosQAhuzAFacMHfi40H2RWT7TvYQOogCCEU1udQgJKi/jRlgpdyDmjvfP5OHwGzGf4oeQCwuZ5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZZlCA+m; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZZlCA+m"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e5787c3fcf8so3117914276.1;
        Thu, 16 Jan 2025 20:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737088401; x=1737693201; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDVDrLNFYzOmBaipAG1QTavUGQln0BxPGpJG1fBH/R0=;
        b=IZZlCA+mieJaUWj/G+fbp0HUgDqpGlVHpVICfF3cybR9UCl9wE2xtolnE+4qiBEo3n
         GhKmiUEOfk8MxfXyhrL/TzEmHCggxQIYIt+TELN0MIMnd1MjCWirXrzmcSo1l0Qc4lbZ
         93ESlCunFcwDqe0PDdqZyzy5rcDIluhvwY+xzVmioBZkHLTMex7wVyibRxCCATW2P3dr
         H9H+ecD9MmZv7KaWtH/CcAYNN/rG7UBsHaZfLllRCCBy8fN/81CrKt8Oxuok1Jlfyfj0
         /YHfJkcf1tR0dehuKR11/U6MJwLuvLYkW1RYCYJVfKathyL7xNwg7+4XHEtGKCDba+nY
         pJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737088401; x=1737693201;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDVDrLNFYzOmBaipAG1QTavUGQln0BxPGpJG1fBH/R0=;
        b=t/urCZpNllCDCZq+BchjOD/m1IByIG3EEWIUD4iD5Yde/wBqifV7DH3jdqUVBBAlDd
         u3g4BJhioN36Ltr3U4FcwBb8DvNth5M2ZCJMGsazJ/4QGLuixVs3feG8FlMdr2bpG1YT
         9sW+P9+9ObpaMKqm0m51YenSFdJ3gafNiUg/T6Y3fWDOj/uK6ayn1zXIJrmwZgsRhSto
         iQlTuO5QY4SoUSGuJbMzd0CKvMTuyi53XkLNy8WS0tGK3GQVxkrpW7uqSmbjf4+Y6DWU
         lZUpC8EHUcKd68x6v52p9it+Ucqx8EYtCOSdiX6HFhROjNT+lZREk4XtFf9nBXpr+VJ5
         kwpA==
X-Forwarded-Encrypted: i=1; AJvYcCWuLM+QiHZCWG+DBB/IEbUapBhxGSQfaVCAqZtVCX4JmnoZuSz4Jjrg44r5V2XCLnjezKB664H8GTUI6TBjBpLQDyssMg==@vger.kernel.org, AJvYcCXoQHqU/bLIheHi6ShebXyZO6ghInI2t1gL1R+Heo8CmohhLwKQzvJbwrO9+QFp0iuZI6olxNAS1ktXRiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEROhlm4hC4C/hbMZwgo0kzwziWAuYTVKbGDf0x2tBC1xKAyO
	NQTVU0BIZ9zjC8rxu2jM9SkzvXBQ4Coq30ZcyAkYnAjB/ekemCpe
X-Gm-Gg: ASbGnctOYbgqhfCsjKK6FO6x0wRu/BVvZ9fig+9g0r0KJA4SfTwGzMcBasHy3pLnUr+
	pYXVe3bHviTfGj6TQDYg8tHKGsOZ9u3oCIba+XRcylJ5v+uO1FYwMmzxzp4nUxXNtHWIZUD7I/f
	GdGaV5w6JOhdApuKmdZRc/KGcqtwprOx+1X/bxtYFDa2tl1sNgCKQoSqZfC3yBl7pRH1Jkvueou
	4ouxgb8JnJothgxFh8x9TfYOSJVWsSQ0Azq5EJue63lDtcs
X-Google-Smtp-Source: AGHT+IGPEXgMfjYfdmoXDZsB+GfzFrJ46aJaLHG3afv3WkF/uT7hZxmxLuCzlXUuwnn/SJP7llhFVQ==
X-Received: by 2002:a05:690c:4d87:b0:6f6:c8fc:61b1 with SMTP id 00721157ae682-6f6eb9221b5mr7419567b3.28.1737088400629;
        Thu, 16 Jan 2025 20:33:20 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6e63ab80esm3108387b3.11.2025.01.16.20.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 20:33:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jan 2025 23:33:17 -0500
Message-Id: <D742G198CUCL.1OO9ADQKQWWVM@gmail.com>
Cc: <ilpo.jarvinen@linux.intel.com>, <mario.limonciello@amd.com>,
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/20] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <71316934-e717-4358-a529-e14c225dcda7@gmx.de>
In-Reply-To: <71316934-e717-4358-a529-e14c225dcda7@gmx.de>

On Thu Jan 16, 2025 at 5:39 PM -05, Armin Wolf wrote:
> Am 05.01.25 um 16:30 schrieb Kurt Borja:
>
> > Hello :)
> >
> > I rebased this series on top of review-ilpo-next to pick up
> > alienware-wmi's latest commit.
>
> Hi,
>
> sorry for taking a bit long to respond. Could you send a v4 series withou=
t
> the already applied commits and which cleanly applies onto for-next?

Don't worry!

I also have to rebase it on top of the latest platform profile API
change.

>
> I will then try to review this series till the end of this week.

Thank you very much!

~ Kurt

>
> Thanks,
> Armin Wolf
>
> > ~ Kurt
> > ---
> > v2 -> v3:
> >
> > [5/20]
> >   - Use traditional if statement in zone_attr_visible and return attr->=
mode
> >
> > [7/20]
> >   - Remove quirks from priv
> >
> > [8/20]
> >   - Call alienware_alienfx_exit if device_add_groups fails
> >   - Call device_remove_groups on .remove
> >   - Return ret on alienware_wmi_init()
> >
> > [9/20]
> >   - Directly return create_thermal_profile in alienware_awcc_setup()
> >   - Assign priv on declaration in alienware_awcc_exit()
> >
> > [10/20]
> >   - Fix alienware_wmi_command()
> >
> > [13/20]
> >   - Rename x_series_features -> generic_quirks
> >   - Rename g_series_features -> g_series_quirks
> >   - Keep previous module parameter logic
> >   - Additionally rename *quirks -> *alienfx
> >
> > [16/20]
> >   - Export *alienfx as an extern variable on alienware-wmi.h
> >   - Move pr_fmt to alienware-wmi.h
> >
> > [17/20]
> >   - 2024 -> 2025
> >
> > [20/20]
> >   - 2024 -> 2025
> >
> > [*/20]
> >   - Add platform/x86 prefix to commit messages
> >
> > v2: https://lore.kernel.org/platform-driver-x86/20241229194506.8268-2-k=
uurtb@gmail.com/
> >
> > Kurt Borja (20):
> >    platform/x86: alienware-wmi: Remove unnecessary check at module exit
> >    platform/x86: alienware-wmi: Move Lighting Control State
> >    platform/x86: alienware-wmi: Modify parse_rgb() signature
> >    platform/x86: alienware-wmi: Improve hdmi_mux, amplifier and deepslp
> >      group creation
> >    platform/x86: alienware-wmi: Improve rgb-zones group creation
> >    platform/x86: alienware_wmi: General cleanup of WMAX methods
> >    platform/x86: alienware-wmi: Add a state container for LED control
> >      feature
> >    platform/x86: alienware-wmi: Add WMI Drivers
> >    platform/x86: alienware-wmi: Add a state container for thermal contr=
ol
> >      methods
> >    platform/x86: alienware-wmi: Refactor LED control methods
> >    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp metho=
ds
> >    platform/x86: alienware-wmi: Refactor thermal control methods
> >    platform/x86: alienware-wmi: Split DMI table
> >    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
> >    platform/x86: Rename alienware-wmi.c
> >    platform/x86: Add alienware-wmi.h
> >    platform/x86: Split the alienware-wmi driver
> >    platform/x86: dell: Modify Makefile alignment
> >    platform/x86: Update alienware-wmi config entries
> >    platform/x86: alienware-wmi: Update header and module information
> >
> >   MAINTAINERS                                   |    4 +-
> >   drivers/platform/x86/dell/Kconfig             |   30 +-
> >   drivers/platform/x86/dell/Makefile            |   45 +-
> >   .../platform/x86/dell/alienware-wmi-base.c    |  488 +++++++
> >   .../platform/x86/dell/alienware-wmi-legacy.c  |   98 ++
> >   .../platform/x86/dell/alienware-wmi-wmax.c    |  767 ++++++++++
> >   drivers/platform/x86/dell/alienware-wmi.c     | 1261 ----------------=
-
> >   drivers/platform/x86/dell/alienware-wmi.h     |  104 ++
> >   8 files changed, 1509 insertions(+), 1288 deletions(-)
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
> >   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
> >
> >
> > base-commit: 6b228cfc52a6e9b7149cf51e247076963d6561cd

