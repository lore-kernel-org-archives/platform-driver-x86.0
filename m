Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6514EC7E;
	Sun, 22 Dec 2024 23:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734908815; cv=none; b=CUohO+j7UPLEqRoetDa5aXzYWDdUH6gFNtV1dnLvs2XX8mxJx3hKmXv5RRnJPRrWPuwntEEE7dpzADZyI2t7oSikyt5y+vQIb0p/JE7E3bLMJg9Cw8KI6kopDJiwqlPTYz7T+cDtkT/C6FEYCcBW2hv5nABORFQxxT9nuYoATww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734908815; c=relaxed/simple;
	bh=8huhQyVxEdSt0q3KOlTADkMcvtyJP/G/yUfhsSL4+PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtG97Kg4z3SQVwMbiDbswZd/BdH8NVvO1GyKmkY4JDLmQ8SWYVMuiS5zZGxnFN50tbCWGF8JLTVVf1XELvmL6op5swgkzXdR9WuhP6/vapNjkR7Q7x67y5AkBt1mqVWrpxm6ykYj+ZizyVvgCNzk+/jiiHEvxiDpfdgo+4xmhUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=U+k3f0tL; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="U+k3f0tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734908801; x=1735513601; i=w_armin@gmx.de;
	bh=/QF2aS4Ph06bfhRtv+GqXYobOz+sOwn5gKZZwaFRbp4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=U+k3f0tL8X5Jkftym+VnRkR3LR3VNFN7NuVSXfCspRduiwLfdbD5FHKLe0nJNqHQ
	 0p4RDQYohYitHtaRPWLCdzw1G1ty9+rxj/7Xg6gPj8fFyQRXPjA+Eth52QZsYsX2e
	 4pf1EJfKNhCnV1Ml2DxBzBW3ROkBxowf4aiUvoP+4+2maKrnfWKhRInZryfRXCJIc
	 nCxMclzAeAMMbUK6yUHIPiz0UH9P0dO/Eenf2ZdzkTWyTQJF6H52TCOUGFf/n9ec6
	 tfyC7c8o9be7I5pJt4LcX9GGcbL0JVEoZmEmnQ53pNxgUvww8mvMLqT6dD4NA7F0+
	 LpUHL/KejU6Fkq9fLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXyJ-1t3Ixq1S0N-00UqE2; Mon, 23
 Dec 2024 00:06:41 +0100
Message-ID: <66005d6f-e47e-4799-b90e-48751bff52fc@gmx.de>
Date: Mon, 23 Dec 2024 00:06:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] alienware-wmi driver rework
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jH5PZ09c+2+5wvyLHQjhbvlrs947W7HyFz7IE61g+jTMjwfqoNq
 o5adDyR0HngGlrY9iB1MHlOyrHIYtd04Oj+G6sJRI7HF8QfD2u1XnQLpHtxToCmYEysyhvA
 vw6Mm7+TCK6RqgPFt29GoOeJWlLz8IDxYF/a6fzd1Yq7dUQJbGTXkPoTUcKxFdzNOwh/126
 UeXrZU29NjSyuVxqtE4HA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R0QQS1a0wTA=;Z3uUMJClnIEDcov1G9Ws3Ot4yW5
 rt2R1xYbMMjQaQO7PQKqZ15SX5ldu6vaOZa+82ZQPR3V9kkovzRwmp7fAPSM9uVpSetBCV6hz
 iNrjsbuV3HxUyQdI9E8MDjV10ZU1xNXOHO8sav/BwyhRZ7agKSpm+wN7TkZGE9r1F4wDP5w2g
 ZN7shYcBrI91tK2kBdInMKM1J2kQQt1iMpz6J9eZvadIlL1N/oIe52Ag2lBo4+g14Ifw1Qidi
 5ioftlyfHXJihnl54WuGO9kdrBPBdRcc5ijamlFh1l7CBHjoWB37FV5rekze7PRZ0SAlRQm27
 QVuAV41VzTyZwIVceLWt1OF+xVcx5sfeLQTPa3Ib8KVag2OaKur/pJz6EKm4KfwFmm4nHYcGO
 JDeqiGmYJy77jSHo93+usdRsr3YzTox52AiK/0gD6nVu45IivaAfnNGBaXMB3to5GzQZzIyo2
 q/e6Vv6DMrqpANLMz6hBCfktPS55se1A82OdlW8lrSDIYuGzw/E5S6V/HmgCrH1p6m0kYtyJz
 y5BGjxl64uSfR4nQHtBO+qGNFNmhVadMONeVv5aiV+jaHA39bvyLrj0snPjgaKBVjDKWTtFfY
 nYVV+YZtcYTghRlaC9B1KpGvIFxHXCGsAmjwHtGJzzMharby796/OUd0Ap7lbTGswf3swFVkJ
 cbQxW2Oh+wJ9UR0IDm3phfsxlTycXBWE6mcRA5DzMRCFQPGCaArQdvpEYcz/K3a0MpFF7SNQM
 OVMAmCmO5YnBC3WabAIcxXi9q0NBXQor4FjaedQjd2lPgXBmrtEVooLEmv+JAMFmCJeL01P9v
 GWSXyHGhUHDmeB+dXNqHPZm9FwQ8WoGqt34t51NNQxNclmviNGFqVMNx9gYuxFpTuaMEq2XqV
 UznyRp0mVo2Bsp5wPs52BeEXpSVL8RXH+/Z+xxflXdGStLNum3rwS9dF6omo5Ug3NF/BHBfBo
 sFwMuJ2vCVS5PwBEJ/GjDG6HeON0LmRK0PJKcjux2AcxZ98NlUxNrxfcVXhUF4q8YtOksmrWP
 RSYI1skIJk1zHoCPypS8rK4D4fjYuRJxC0kZb5QtoAw7WXU7OogSKYY+HFPfAxyZ809vLdx08
 ltkKYE4ekh9YYpbvQB8U9nqXbzNQFs

Am 21.12.24 um 06:58 schrieb Kurt Borja:

> Hi :)
>
> Hopefully these series are quite complete now. Your feedback is much
> appreciated!
>
> Previous discussions:
>
> [1] https://lore.kernel.org/platform-driver-x86/6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb/
> [2] https://lore.kernel.org/platform-driver-x86/20241205002733.2183537-3-kuurtb@gmail.com/
>
> Comments
> ========
>
> Patches 14 and 20 are proposals. Feel free to NACK them.
>
> ~ Kurt

Nice work, i will take a close look at those patches tomorrow.

Thanks,
Armin Wolf

>
> ---
> Changes since RFC:
>   - Incorporated comments from Ilpo which include style and organization
>     issues
>   - Instead of splitting functionallity blocks, split WMI drivers (Due to
>     Armin's comments)
>   - Replaced most of the patches near the end because of the above change
>   - Some patches were squashed into eachother where it made sense
>   - Rebased on top of recent platform_profile changes!
>
> Kurt Borja (20):
>    alienware-wmi: Remove unnecessary check at module exit
>    alienware-wmi: Move Lighting Control State
>    alienware-wmi: Modify parse_rgb() signature
>    alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
>    alienware-wmi: Improve rgb-zones group creation
>    alienware_wmi: Clean variable declaration in thermal methods
>    alienware-wmi: Add a state container for LED control feature
>    alienware-wmi: Add WMI Drivers
>    alienware-wmi: Add a state container for thermal control methods
>    alienware-wmi: Refactor LED control methods
>    alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>    alienware-wmi: Refactor thermal control methods
>    alienware-wmi: Split DMI table
>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>    platform/x86: Rename alienware-wmi.c
>    platform/x86: Add alienware-wmi.h
>    platform-x86: Split the alienware-wmi driver
>    platform/x86: dell: Modify Makefile alignment
>    platform/x86: Update alienware-wmi config entries
>    alienware-wmi: Update header and module information
>
>   MAINTAINERS                                   |    4 +-
>   drivers/platform/x86/dell/Kconfig             |   30 +-
>   drivers/platform/x86/dell/Makefile            |   45 +-
>   .../platform/x86/dell/alienware-wmi-base.c    |  721 ++++++++++
>   .../platform/x86/dell/alienware-wmi-legacy.c  |   89 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    |  526 +++++++
>   drivers/platform/x86/dell/alienware-wmi.c     | 1269 -----------------
>   drivers/platform/x86/dell/alienware-wmi.h     |  103 ++
>   8 files changed, 1491 insertions(+), 1296 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
