Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70BD3876A4
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Aug 2026 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865612; cv=none; b=rpQL4uz/+4rDS7PAQhvaoA77dw4QxZUIL126DpRIZqEt8LLEUgsF3Rr4lECwA0MRg4GfpKeGHend89HO1xPTECLJ1qVlMaaZYtZ2d2byxNjO6+nD6nPc3jsSddZkNJmjAK/rJAQqS028Yom4z5TPb8IrGng1UL3UxEa3ZpEOaZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865612; c=relaxed/simple;
	bh=100n+eb2in0spCRdAb4eQoqoUVPPaTeJ4YwhO2RyAbQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Ev3qnZzqxwoVl99G6rPCJUBD/1FymT5ho5TsOLYR6UI5geCz0q+8We5Kl5JleJfdfFzq0SSQuU8+sM0Jdo5cKwPvIHrROcn5U/4MwF6SWCSSo7DrEUQWvlycytYXiUdlw6R2bKHV99ilVehf+tO0UFhCD6BmKBwh3eYbJVh+/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wn1ivgyU; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wn1ivgyU"
Message-ID: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785865606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=100n+eb2in0spCRdAb4eQoqoUVPPaTeJ4YwhO2RyAbQ=;
	b=wn1ivgyUA1zUPwOeTvogD+Oi6pTPDvT4RHAYOSVzpuf+EsCd2oDV2uCrFaYjG8Zcww+Hvb
	r/FZkBmoaQQNUQKL0fca9rCs8Xk+MwDeQmaVxjG1WtfyYhEc+AkTgh9T4RdjGe8wJ/P7nY
	QNH3dXgKzGvdQr5Hxy/levHrs+aCQQI=
Date: Tue, 4 Aug 2026 19:46:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Liang Haowen <nbg2974@gmail.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
Subject: Placement of ASUS Aura and platform/x86 ASUS files relocation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

I write this mail to ask a few questions related to the various ASUS devices in the kernel both present and futures and how to organize that work.

To understand this mail one needs to know that AURA is the name of the lighting ASUS gave to its
products: each device is divided in one or more zones and each zone supports setting an effect like
static (1 color), strobe (2 colors and speed), rainbow (0 colors), rain (0 colors and speed), laser (1 color and direction) and these, to be represented in such a way features are not being lost requires a ned interface
that Derek said he wanted to develop as many other hardware would benefit from it: I will therefore need
to specialize it for ASUS things: where is it better to put any .c/.h file related to this interface? Is platform-x86 OK?

The Aura interface has components (all or only certain aspects) working via: scsi, (hid) usb + i2c and wmi. 

1. Liang Haowen has an ASUS nvme enclosure that supports the AURA protocol as scsi commands:
we want those to be in the kernel, but we don't know where to put the aura userspace interface (see above).

2. ASUS has product called "RTX Spark" coming that are arm and will support acpi: I have no idea if the asus-wmi
interface would be reused, but if they decide to do so (and the kernel can be made to boot lol) would platform/x86 still be the best place for ASUS drivers?

3. During the upstreaming of asus-armoury Hans de Goede asked if it's preferred to have an asus directory containing asus drivers, but the discussion died there. Now that I see there is a patchest that will also move asus files
would it be a good time to spawn this discussion?

Thank you all for your time.

Best regards,
Denis Benato

