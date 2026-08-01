Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E243876BB
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595931; cv=none; b=GpYwbQ/DQL1v1aAwg484nnJZYL9Xzf/ZlMzrE9htAuB3dt4fQp+sHgBb1O1VXUTD8y0CgLzokAGS1AGUkjvboT5zwlZRGzquSB+b51gkpcSo4exd1b2x5wWiiqcqRQBxGIkR1LVnERYrVjOaHoeu/KFODWQrLxbDA6CQyWnzqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595931; c=relaxed/simple;
	bh=31IojYQh/X/NzQSQI129BdI3zF6NZUXMjsvJa7wSvgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfeyNzpHQBRWydPJl3cONCe8kEXMifY7599F4SxnmeBv/0vCcY2llzo/8fHPr1VFePIYiPIg2ghplVTC+CHdHAa4iWCHilwdvjfkQGwXINwx4lqf2VZIICDLN+VvW1dbmVRpY/HLSLAu2wdea0RtT2hjJH5AugHSFSpe1IiCb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MDFHqCEP; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MDFHqCEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785595925; x=1786200725; i=w_armin@gmx.de;
	bh=31IojYQh/X/NzQSQI129BdI3zF6NZUXMjsvJa7wSvgU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MDFHqCEPI8RIwImUPtn2avihMMgbDrBkGBUYFbWMCWojlcDdGia1cb2gplC+b3rm
	 /RclLYgL/VFREvnMByHFZ8+oY+kGagzSoYxHaH6+64lSVP+Ji7raPhbtGZKaz5LUD
	 Jw7jXro32WuM8Uw4omjKLCUGciCsIFF73q6M2lz8Kmb7CkMfFSmYS6kP2iUhfaZ6I
	 GTgFNfhcCpcPkB5wkokwcNsmmPkJ2OH9V+/b6C+SQkSYk3sCMoNNRRkVp9IAp4QAg
	 TO0uRBC7M70vwGdtIKfi468v33Lc6BKvSUcX73dQlLZscmYv70IIda6fW7WgFMXY+
	 LputWmKeKFTjZFNywQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1x4xIW05Vt-013Rpn; Sat, 01
 Aug 2026 16:52:05 +0200
Message-ID: <6284ec25-cdf8-4e40-9a5e-0906d4ed1222@gmx.de>
Date: Sat, 1 Aug 2026 16:52:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the
 modern API
To: yahia ahmed <yahia.a.abdrabou@gmail.com>, ilpo.jarvinen@linux.intel.com,
 Jorge Lopez <jorge.lopez2@hp.com>
Cc: platform-driver-x86@vger.kernel.org
References: <eca5ecb2-7306-4dc6-bda1-faa35220b79b@gmx.de>
 <20260801142025.15515-1-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260801142025.15515-1-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gdfcuR5OJgz5LYoXc/DWA/IYQJAhU4Q9ORFAWBBhgk4XPgZ3meZ
 LEm0c6O1ejXbLcVqNdjdmxhNsvAMg9bi9sAEkvrA6DhyMlXPwuCmj5OQw5leXyVBNMna9HK
 glfYBPoPu5smUvM/KkIFIhFunrCZMJTNzXub3dedTHBSiQTDDqzVa1/Ajt7/Ca0Uyvxs+uE
 54aJv8eLWASrx3RdNhMcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eFJxTitvdRg=;R4iJrOoTIrpiTFI26QhX4SPrFoy
 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

Am 01.08.26 um 16:20 schrieb yahia ahmed:

> Hi,
>
> Currently hp_bioscfg and hp_wmi will both collide to register in the
> 5FB7F034-2C63-45E9-BE91-3D44E2C707E4 GUID, so if we modernize to use
> the wmi interface we will lock one of the drivers out, So how should
> we optimally handle them?
>
> Best regards,
> yahia

Oh no :/

I suggest that you use the component framework to register a component inside the hp-wmi driver
when probing a WMI device. The hp-bioscfg driver can then register a component master to bind
to this component. During binding the WMI device handled by the hp-wmi driver can be shared
with the hp-bioscfg driver, so both can use it.

This however might turn out to be a bit complicated, do you have a device where you can test
both drivers? If no, then i suggest that you focus on removing all usage of wmi_install_notify_handler()
from the hp-wmi driver instead. This does not require that you convert the whole driver to the
new bus-based API.

Thanks,
Armin Wolf

