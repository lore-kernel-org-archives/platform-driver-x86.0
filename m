Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15339021E;
	Wed,  1 Jul 2026 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879550; cv=none; b=jGUOJN8BDQgvXweAgBV9QV4Zkidi/Mung63s6ZGB+9gVHdLhMQwACtEw85C8pPQ5fvyMI2yEU041LSFPv2Fh85+49urx9sJJ/lcldlVIae7s4djry5IVNGnsE9phyGCZAsbKs0bNz8x8/87RZzY7aLR3YOzxKZkF28dUXMt+Iqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879550; c=relaxed/simple;
	bh=efM623KN0BdjFWm8tXa1S9mlCAaAJTkYR5QBKtse4+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnNBqrm4O6SzsUGjMO7ldPL3Xsc6UHuJ+sjzq2YPfzkMYSzqaAF/nTXU7t/UhGgQY8fYpBG4KOf1DLAeXCPtwhhTe/SQneGf9NCxhH2koDt1zEIo49curXdyr9S5SAHetZMXO82IXqgXIaz0xD1VM0ufAFteaOeR55Ncy2+3J4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DHo5WIgj; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DHo5WIgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782879543; x=1783484343; i=w_armin@gmx.de;
	bh=efM623KN0BdjFWm8tXa1S9mlCAaAJTkYR5QBKtse4+k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DHo5WIgj3JdrkDYtg/NggBMA8+tpZFxg5eHCcSEiOv0n/E4kTWvdVZA8jdmBn++B
	 r2b8mTPqwD2+ziVsQsUlcKUF3/Hme8PEFKw01vmvYMU7kxNdwOOFK9qXvcW+4C0dE
	 pv4lw9CFjO19jBHZa8T6Q5ijdcRat9qHjn0Q6dLUrFF6T6ZxE659Hb7NzQ+SJ5mjQ
	 0x7CkG/si8GrE+rSndxJAswn/dBE6vGRsEfdEQhsx4Wr22H6tll9hK2qcWFGJZgRq
	 yENC5FOA0r1UCc0nBqIShuMvEW5Vsno+fUBLYsNY+wRLCcVDd5RxKDOdSeyGDqwvN
	 Fz12mpRSlihK1VoHnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1wv1x61wHz-00Dj5r; Wed, 01
 Jul 2026 06:19:03 +0200
Message-ID: <1584d299-20e6-4270-b033-ab3296e7b624@gmx.de>
Date: Wed, 1 Jul 2026 06:19:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
To: yahia <yahia.a.abdrabou@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <412e1b09-a442-4156-bf21-216ad8177096@gmx.de>
 <20260623001224.7838-1-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260623001224.7838-1-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Wspg49yXGjnNiQX2w9RZv/iozU/pRU9kvzloMLOMIxn9znweMw/
 Lx6hBokBtLfx1oSRj7x/ZzeQMDB/GvlQPW03eXZtdORwsG4LLoGiYH9prfLyjH/rclPsQRO
 aed0z11sLFpcN6E2Nbp1sV0m5BaLyU96TwjKZ8woqpvcOFxFLnCzIYB1Lk5IqjaFAH2auLF
 yZQ5TSXl1y7MeVmS8E5JQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HobRBvQlJ7I=;RtHhUxGmvJA7RFsKdf2uehvNQhN
 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

Am 23.06.26 um 02:12 schrieb yahia:

> Hi Armin,
>
> I compiled the kernel while dropping
> HL_FLAG_AUTOREMOVE_SUPPLIER and the kernel
> functioned normally, all my hotkeys worked
> and i couldn't find any memory leak or issue
> with KASAN, so in my testing it seems safe to
> drop HL_FLAG_AUTOREMOVE_SUPPLIER.
>
> Best regards,
> yahia
>
Thanks for testing this. I did a similar test where i also removed the DL_FLAG_AUTOREMOVE_SUPPLIER
flag. However i also modified wmi_add_device() to always fail with -EINVAL.

This resulted in the following error when the WMI driver was unbound and later rebound to the same
PNP0C14 device:

kobject: kobject_add_internal failed for platform:PNP0C14:00--wmi:C3021213-D0BC-41A2-BA17-816CD5ED7744-0 with -EEXIST, don't try to register things with the same name in the same directory.

It seems that without DL_FLAG_AUTOREMOVE_SUPPLIER, all device links will remain even after the WMI core driver
has been unbound from a given device. This causes a name clash when said driver is bound again to the same
device.

Because of this i do not think that we should remove this flag. It seems that the driver core does not remove the link
automatically if the consumer device was not successfully added using device_add().

Thanks,
Armin Wolf

