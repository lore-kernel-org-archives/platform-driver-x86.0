Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8E01DAC81;
	Thu, 16 Jan 2025 22:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067188; cv=none; b=rjnCRFz7qFKHBSi1Zeny1GClaRSE03R7U1hoVGNxv2RrcElUgqWYS3cTzqoZrcj3ZAh9s3BMPws52K8JfkLEJi1sGDKQOdEO5j79PkNi8wRovBMCulPgB3cvzL67YXlrinOar7oohhW/uB34udM6/s1+9mHvO6D6clYkaQoW+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067188; c=relaxed/simple;
	bh=gOP/rLroOD+DvqbsgKwKMxhupfDmRnPIUDkBo1zn72k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEJx9xQziH+SV8u4C29YDeA9k9lfEQpu52/LDJmJxiBoNNPsp78wIdaDCWDfTWUwcMZUuwh1XhzNE6RSlrYa8JEmwLpB1zCJpzRAaTKBKAKleXxvaAnj1u62QBO+uQvk76r+e7eGY215kKbtrRFgx8rHzGdSdG2K+M0LWCFqiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pr/lrjvi; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pr/lrjvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737067180; x=1737671980; i=w_armin@gmx.de;
	bh=do/Z1MIvI4yAPkCv+imwWF0Y/6dKxjoYpqHt8+ncmWc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pr/lrjviMDYO/4DNONi6uMpDlnUFf5eGC7p/pHZ0v4/MjSINb1hvQXDzbUjfPltG
	 9wp+u2kPpp/Gy1X0z4kvsxgIpq4XR26SsTFfcLf7U7K/1IGtYlbXwyU/nISw3gYg/
	 uo2dtVJr6k1Tt/CKD9I4iVN7uywwBBnvzALl5bhLLE6FLkbE7U2JiVVfgKDpC5eMe
	 XjgawWWv6gmnXEmDW6TT8RaoNXU5+5gpWRiRw72PQ4e9izjHjkkPOtSLjkuDzXsVG
	 5ItPEZlmtqwfQnMJmYcqA3kJ8BBBMan9fl6FseiR4Qkq49/WHzVtFc2fySvo7cl7m
	 BaJve4naV2zJILAicA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCbB-1u3CUU3129-00Vyjm; Thu, 16
 Jan 2025 23:39:39 +0100
Message-ID: <71316934-e717-4358-a529-e14c225dcda7@gmx.de>
Date: Thu, 16 Jan 2025 23:39:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/20] platform/x86: alienware-wmi driver rework
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fxZXdvrz8QCUQMSDLfLt1/WxnTndp3FHsiK4tj9UMbwVOYvpIxQ
 5LQ+nBtN7Va3mSB9SiR1U1hSMlmMJnhbRkoXlcovEE35qA/jpvQiP3tETmowLXQaqrc+Dn6
 KhO62o1mEZFj4QxIJiFGMZR6Fj7BtR8XUSWUEhmLWsHpAjnSdVrkylOxU1DL1ZoQ7qOP8Zn
 uwTQNW67ndOalRsTA3QzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KjURUVQNi0k=;tpukcin5R3UNeTSjxdW4Mai72yb
 wARJa7nXGcrpMWzSUNgIrPkhEVkLyMxYJHTSMf/0bUOUUPhVKyHDoEDggOy2DurVXVlJ6RxYP
 XlGXunNIzrd0Qp7dUewPC3Ux+nDN41DhZk8uBqZJh8QlaP5/+2M5mD3F18ipnBWc7nDiQz2xx
 /rRfAz+bex7J86fH9/YSYLI/F4KqHW6Ur1myzbg7A2157jSWakJVhTpe61xwGIFFHbJVVhl9g
 bRh1MgNl/BD7O1jKCO+WNiQLbTHN5zLafAQlJzc8QJKpD/j9BueFDpVfyY8CSQ8IiLXNCbpzW
 vZIbLLxAi/n6S0nPba3NBD0oCC8yB4I8Fq9hSi/CWnmbiCNNNylbMRql51+jpO/I7P1XoENoe
 K85/vZbXfy/oI/ofInTwhqwm8n6Ln5URI6Vp6KXRqwyJUMmS1aPXwGL8xKcbej+PeIGRtaf+0
 vOTYP6nYjPEe94JKSuzxiRI5BCSox88KNeAlLPEHMG4fI/u9QWTyUGGdf4Cl2EKkYGJhnfYDQ
 7aHyyHbdoWcsqbxOi5a4LJX0BwsU59PjwmvEi/DJrYFSV10PzKOnHlCc/ksFpKIsE5q+z0ckE
 SG4xtPN1h/QjBhh+bYurCDY5U2wlvEjv/jD6/9ezyk4cDH3e0FEJ1CA4t72bxhUba9RcSs/7w
 /Uiqc5u2wcdRZ/HPEJVinsPpyp/AZMAEjBAvDXlwm0FEw8gxuSUnMKffEKBhC0EMuzyADAysi
 wk8+f0I6dCFw3XYla2V2Rxg7KqUDAl+TErp+v4rv4GIAIDLTkcTYaHCd8gwmMkG7MbhKX3vMT
 Fcj+nBuEF0VS0ncDHszh4jJ+51PLAuAl5qYqpeATViEWtlYNgqbIhbPWwe2NlGNpJrOVt2ngW
 iZJsm5rLEJRd6r4ZvwqUpRbg0Y2LA82KzA/Vl8SaTwOKMORpsPdI2V+5R4DCX/5qWd8MuaGal
 badb4fyxg+UbRV9esRFRhIiB6LKQLjRYWis3Lv8tEftyyYxrYgwxvlOFQCzk/U70JvpzERrA3
 atO8GnMcf02ucsQBhcy+hKiIxftdcBuGMBfa3lJcjVmE0TkAWHmYXBahJ9MlywsujsqFDr5WI
 yjrTqY4/rR3sbuXIUQQw0p0gx3i7JJIQG1LXILJcFLsFoKk/Cx+FClfGuDyjQRVOjcim5QoV/
 sR7rQkQqdORr9WtvGHe39w6gLMiiDojiGaJdGVegu9A==

Am 05.01.25 um 16:30 schrieb Kurt Borja:

> Hello :)
>
> I rebased this series on top of review-ilpo-next to pick up
> alienware-wmi's latest commit.

Hi,

sorry for taking a bit long to respond. Could you send a v4 series without
the already applied commits and which cleanly applies onto for-next?

I will then try to review this series till the end of this week.

Thanks,
Armin Wolf

> ~ Kurt
> ---
> v2 -> v3:
>
> [5/20]
>   - Use traditional if statement in zone_attr_visible and return attr->mode
>
> [7/20]
>   - Remove quirks from priv
>
> [8/20]
>   - Call alienware_alienfx_exit if device_add_groups fails
>   - Call device_remove_groups on .remove
>   - Return ret on alienware_wmi_init()
>
> [9/20]
>   - Directly return create_thermal_profile in alienware_awcc_setup()
>   - Assign priv on declaration in alienware_awcc_exit()
>
> [10/20]
>   - Fix alienware_wmi_command()
>
> [13/20]
>   - Rename x_series_features -> generic_quirks
>   - Rename g_series_features -> g_series_quirks
>   - Keep previous module parameter logic
>   - Additionally rename *quirks -> *alienfx
>
> [16/20]
>   - Export *alienfx as an extern variable on alienware-wmi.h
>   - Move pr_fmt to alienware-wmi.h
>
> [17/20]
>   - 2024 -> 2025
>
> [20/20]
>   - 2024 -> 2025
>
> [*/20]
>   - Add platform/x86 prefix to commit messages
>
> v2: https://lore.kernel.org/platform-driver-x86/20241229194506.8268-2-kuurtb@gmail.com/
>
> Kurt Borja (20):
>    platform/x86: alienware-wmi: Remove unnecessary check at module exit
>    platform/x86: alienware-wmi: Move Lighting Control State
>    platform/x86: alienware-wmi: Modify parse_rgb() signature
>    platform/x86: alienware-wmi: Improve hdmi_mux, amplifier and deepslp
>      group creation
>    platform/x86: alienware-wmi: Improve rgb-zones group creation
>    platform/x86: alienware_wmi: General cleanup of WMAX methods
>    platform/x86: alienware-wmi: Add a state container for LED control
>      feature
>    platform/x86: alienware-wmi: Add WMI Drivers
>    platform/x86: alienware-wmi: Add a state container for thermal control
>      methods
>    platform/x86: alienware-wmi: Refactor LED control methods
>    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>    platform/x86: alienware-wmi: Refactor thermal control methods
>    platform/x86: alienware-wmi: Split DMI table
>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>    platform/x86: Rename alienware-wmi.c
>    platform/x86: Add alienware-wmi.h
>    platform/x86: Split the alienware-wmi driver
>    platform/x86: dell: Modify Makefile alignment
>    platform/x86: Update alienware-wmi config entries
>    platform/x86: alienware-wmi: Update header and module information
>
>   MAINTAINERS                                   |    4 +-
>   drivers/platform/x86/dell/Kconfig             |   30 +-
>   drivers/platform/x86/dell/Makefile            |   45 +-
>   .../platform/x86/dell/alienware-wmi-base.c    |  488 +++++++
>   .../platform/x86/dell/alienware-wmi-legacy.c  |   98 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    |  767 ++++++++++
>   drivers/platform/x86/dell/alienware-wmi.c     | 1261 -----------------
>   drivers/platform/x86/dell/alienware-wmi.h     |  104 ++
>   8 files changed, 1509 insertions(+), 1288 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
>
> base-commit: 6b228cfc52a6e9b7149cf51e247076963d6561cd
