Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67F3CFF61;
	Tue, 22 Sep 2026 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109955; cv=none; b=rhsTuIPnKRpP3cGqibIniCGQJE9igqm+T+zY/gxhkXMPJoha0tSBZnrWDuhw7oPCdmM8Xu1RDmwZMGSPIP4of70qyigVWWWKaIhD1RxYP0rnCNo7sqcY2Ui2sz/xvoo9rVBOclOgl9L6HKQ0M16fPmNn14WwQBULvxBKS1zMx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109955; c=relaxed/simple;
	bh=7B7GNnGwag5VRO4VivZzY2kskBymqzce4DRqYy+qZL0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ObnZcSEpLI0ItMpgqizyUVLGTMfLrN8WtLTSxiq7jVoMeHY6QWg92Lxq6/sQjupGcbw34q4huURJ622carjcg5RQeAmA2i08am0h6l4iiAbL6hdshrO7YKUmJwqu31dJq4+StLWmlN2GrOCLQfC3/L37H9zjFCJJy0XqVOuyXF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZzYvA5FB; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZzYvA5FB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790109930; x=1790714730; i=w_armin@gmx.de;
	bh=nD/8YE+/v0xQHn+4W3YD+Fvv3h4eoC7glqQIjF4MU2I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZzYvA5FBfuGK6Y1H2XUxAvJaGQyDkSwijHZLPOQ0eYD9ZvNeLPxnFlEm0Pk3R91M
	 5cuVhK2taVEG1i3uvoJ8BZMRhryDlLsIyOgKtUVXrrW4iyboLVzPZoahKlLnI+PYK
	 Xp6Vu5xpMMP3wdQt7KpubdhFJ8bP/JPnpCyD5pnGx5GjW2vRtXHiNdY+CA3LPXiA6
	 FtquJxWoy7VIrmM/7fBPnh9ohVxAi1XhHVLFPMor6SXv7k5r7M2VOKoUMTmf4Iaqu
	 J34bxtT6Yud59wSa5kfF/S21eI9GTye246HZeJvtZUqWK+O7OIN2nqcKsQk5PS7IK
	 0idEZELME7WtdjxqJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHQh-1wTPoh12Az-00lUmb; Tue, 22
 Sep 2026 22:45:30 +0200
Message-ID: <80b6e76f-24f8-468d-a241-dee8ba113d4f@gmx.de>
Date: Tue, 22 Sep 2026 22:45:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86: uniwill-laptop: Lightbar fixes
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905130138.6814-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260905130138.6814-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:UnR4lNWKr1HMEB9RtEuT3IiP7Ww/EGsorKU9qcUuijhWt3413c0
 jhT6vXeWlnvL6A2YXnL5hBIRi3SnIfdgLwi9CCcjqn2WP4+ZtnUadHCqUrz1duG1Hzo9YAu
 KXKpB+tvqyWbam8xVAkUzuFFgGnifu4KhPi1Z4dNibLx8iad2jPNrgqQVXnvEBp1InBpFdy
 LeYLq37TNl8vVtu+lrTlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hdNraQlG1i0=;8iNlupBjgWW7kkEWHLOfeegNCad
 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

Am 05.09.26 um 15:01 schrieb Armin Wolf:

> This patch series mainly deals with various issues inside the code
> responsible for controlling the lightbar on supported devices.
>
> The first patch utilizes the improved multicolor LED API to report
> the correct brightness of the lightbar to userspace. The next two
> patches fix issues discovered inside the code for controlling
> animations, while the fourth patch fixes an issue with the naming
> of the LEDs in general. The last patch also adds support for another
> variant of the Intel NUC x15 laptop kit.
>
> All patches have been tested on said Intel NUC x15 laptop and appear
> to work.

Any thoughts on this series?

Thanks,
Armin Wolf

>
> Armin Wolf (5):
>    platform/x86: uniwill-laptop: Report correct lightbar brightness
>    platform/x86: uniwill-laptop: Implement rainbow animation as trigger
>    platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
>    platform/x86: uniwill-laptop: Label multicolor LEDs correctly
>    platform/x86: uniwill-laptop: Extend support for the Intel NUC x15
>
>   .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 +
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |  15 +-
>   .../admin-guide/laptops/uniwill-laptop.rst    |   9 +-
>   MAINTAINERS                                   |   1 +
>   drivers/platform/x86/uniwill/Kconfig          |   1 +
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 225 +++++++++++-------
>   6 files changed, 161 insertions(+), 100 deletions(-)
>   create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-laptop
>
