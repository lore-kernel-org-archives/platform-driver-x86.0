Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A1B3815E2;
	Tue,  4 Aug 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867733; cv=none; b=lVDw1sBAyQqYMAofPj67T1l86J5OL9/vq/2+onhXmZvZSdGOO5nuTLi0k5oUGLIgjVnAq1VycUd9OL8k7DfZh+i7tqSpx2wWf/vGxxNkCTvJbne5W/LSlxaFOJKzZOyviJcONaaBa3JsIXlOu6TLrc0Wt1vktMLBzc38nAH5p14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867733; c=relaxed/simple;
	bh=pDworT4e1iLAA1DdwLSMPZ20dOCqejB8uxyRVEK+quc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Fymhownc1cZMtgjWgQmrVM5oMaZRfGA/NcaIE3WWA9u4YbIontcUuU25fIKB3XDnTiTNpu6NGMkqwKT9wkaiP06DlXuGPOqF3KuJAJyNmJ2o4rDcDppO8aSDaxzohtw8LyAvdGXB3TDJZH+YC6IIY8GGe1Li15+iNMZ2ZJY8DS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FQskeODT; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FQskeODT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785867728; x=1786472528; i=w_armin@gmx.de;
	bh=pDworT4e1iLAA1DdwLSMPZ20dOCqejB8uxyRVEK+quc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FQskeODTMlxSGd/W1KwdorHrDEo9qyqedp5043xNPM4XRhvBlrrpNmot/WBjTWhx
	 j7o+Xdq6C26Pbuf2tEZ9WJqHdejhtsARtnJUOhzVntNIxWwicYlq3R8lPGVdhxU6h
	 x0EURsJ5XPy/0kPkFS8ltymUfpfAHtkPzGoitGM0YGUa8LkT3Zjnagyxp+Ozc9ByN
	 bdrrb8VcmORpBrGxWnAeOfcQKdQEijDX+p7/HSeu+Znb+aK7v3wgzpBWO/6Wlb7sC
	 1Zfuyu9yjWHeaf/I+KoYgiQCJNww0Heo0sGECuQC1TulUZqLF1mz4JuyXdh9fE5z9
	 iRohXJ+jjcc6pfu4qQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1wfkGQ38Ti-005CKu; Tue, 04
 Aug 2026 20:22:08 +0200
Message-ID: <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
Date: Tue, 4 Aug 2026 20:22:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Placement of ASUS Aura and platform/x86 ASUS files relocation
To: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Liang Haowen <nbg2974@gmail.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
References: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0GrSLsxQQAtoAjyW7i7V/UGuaYTc29+5HjIt8r/oKB/I/GRs7+o
 rtCWa27VrRbyi8TAmjiT7ivbrihhkOgbPL8/7+GQtIMCsa6PrZOl2U6GNq6FGJnRKYvhLRa
 E0bphE7oflutdHviYSJtW8P4uMUdKxnBefVs519IuaLPiT6bTc7/x0BU+oYQ9Zyym2rGcpJ
 RodKzKfdgkiTZeCeY87cQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oedV1AOVhIo=;ONDmBFErp1IiLzKfuutbH/eMDwk
 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
 fZMyBdBHLNDyTF+WECLmci2phlJ5s4tSDw==

Am 04.08.26 um 19:46 schrieb Denis Benato:

> Hi all,
>
> I write this mail to ask a few questions related to the various ASUS devices in the kernel both present and futures and how to organize that work.
>
> To understand this mail one needs to know that AURA is the name of the lighting ASUS gave to its
> products: each device is divided in one or more zones and each zone supports setting an effect like
> static (1 color), strobe (2 colors and speed), rainbow (0 colors), rain (0 colors and speed), laser (1 color and direction) and these, to be represented in such a way features are not being lost requires a ned interface
> that Derek said he wanted to develop as many other hardware would benefit from it: I will therefore need
> to specialize it for ASUS things: where is it better to put any .c/.h file related to this interface? Is platform-x86 OK?
>
> The Aura interface has components (all or only certain aspects) working via: scsi, (hid) usb + i2c and wmi.
>
> 1. Liang Haowen has an ASUS nvme enclosure that supports the AURA protocol as scsi commands:
> we want those to be in the kernel, but we don't know where to put the aura userspace interface (see above).

Hi,

it depends on the userspace interface. If you use the LED sysfs API (with some extensions for the effects), then i suggest
that you place the driver in drivers/leds, because the NVME enclosure is not a platform device.

I assume you refer to the ROG Arion? If the SCSI commands are used to issue i2c/smbus requests, then you should also
place the i2c controller driver under /drivers/i2c/busses.

>
> 2. ASUS has product called "RTX Spark" coming that are arm and will support acpi: I have no idea if the asus-wmi
> interface would be reused, but if they decide to do so (and the kernel can be made to boot lol) would platform/x86 still be the best place for ASUS drivers?

In such a case, moving the affected drivers to drivers/platform/asus/ would be a good idea. There is currently a patch series pending
for enabling ACPI-WMI on arm, so _theoretically_ the asus-wmi driver should work.

> 3. During the upstreaming of asus-armoury Hans de Goede asked if it's preferred to have an asus directory containing asus drivers, but the discussion died there. Now that I see there is a patchest that will also move asus files
> would it be a good time to spawn this discussion?

IMHO having a separate asus directory for all asus-related platform drivers would indeed be very nice. You could reuse the drivers/platform/asus directory
for that, and leave the older asus-related drivers inside drivers/platform/x86 for the time being.

Alternatively, you could move all the affected drivers to drivers/platform/x86/asus, and after that move this directory to drivers/platform.

Thanks,
Armin Wolf

> Thank you all for your time.
>
> Best regards,
> Denis Benato
>
>
