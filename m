Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EBF16D9BA
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862926; cv=none; b=Mw2pI0BSE+3urnLTjZRumIGlJmmyqOGwhF2j4FtGXJet6ONX7e1XfQL+K6ZQox7HJpzpJ1BQ8KfZcS+CyclUkCAzwrqOK/LcMPFGZUTSCPYf7ZHgSu+wyfTbIow6j9u9dsB1PlcAlzGtv16Ag1aEYnRm4e/r+tgsuyT2MT65zZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862926; c=relaxed/simple;
	bh=K/XwVIqwVOiiomNKm+I1igRBVqGbL3m3D2+K75QbObA=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKvVHnog+ek0uZebSt5UuTBFyAQXWbWvW4HnFIpgLRitUlNOM+Xq7a808747KkJ2ydoBbnvRUo8U+yehon1KHbNjdcOlZTL8pqXAxQhvEdO/x6LCPRTzCY4duf2ZsmSnPih1JLlubwdhDFGIy2TatXN8oPIWrRXFwYlhwFsXOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=LVXpU+dj; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="LVXpU+dj"
Date: Mon, 01 Jul 2024 22:41:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1719862919; bh=K/XwVIqwVOiiomNKm+I1igRBVqGbL3m3D2+K75QbObA=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
	b=LVXpU+djMMGI5MPeoTrzSgYiXFL0xvWyehcqLHmLGCkHwNw/gkTJrgffJuYR6EPom
	 CIp69TxTuLm4Fw0pYhS1U12vPeetGheSHTcxaTNa9VAd6KlcnogMPu9tmRWf1ZJuaA
	 8sWcGTslvcjc3XybcF1UfKUCZhhVpBhb6N/NePeNV3EuSPLNmEKIxB7cdtupShrtX4
	 XCWK5Jeqa46q6XcQE+OlQ9VAUIob1477UUY0slaMf3hsfMlL0DwRpHRKudy8vsr2dS
	 lcgSVOzrP4SR6AOmbB+Xr1/lA1GQmABxWv6HPRp1AjVCWylJx5B4EubaPD2kvlNlC/
	 fSae36W4YbhoA==
From: kemal <kmal@cock.li>
Subject: Re: toshiba_acpi: fn key started working inverse in satellite L50-B
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Message-Id: <QPMYFS.N62TVTKUUR0K@cock.li>
In-Reply-To: <a58e68e5-286c-4f16-bd4b-37d44dc021d8@gmx.de>
References: <R4CYFS.TWB8QUU2SHWI1@cock.li>
	<aa43984d-ded7-4edf-8d8d-00225ae39979@gmx.de>
	<a58e68e5-286c-4f16-bd4b-37d44dc021d8@gmx.de>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

im very sorry, i think i failed to mail my reply to the previous 
message.
also huge thanks for the quick response and fix.

yes, the prototype driver does indeed fix the issue.
On Pzt, Tem 1 2024 at 21:09:40 +02:00:00, Armin Wolf <W_Armin@gmx.de> 
wrote:
> Am 01.07.24 um 19:14 schrieb Armin Wolf:
> 
>> Am 01.07.24 um 17:53 schrieb kemal:
>> 
>>> in my TOSHIBA SATELLITE L50-B, the fn key started working
>>> the inverse of how it should after upgrading to kernel 6.9.7
>>> fn+function key used to emit an actual function key press, now 
>>> instead
>>> it emits a hotkey press and the key itself emits an actual function 
>>> key
>>> press. there are some recent commits to toshiba_acpi, but i cant 
>>> see how
>>> it could affect my hardware.
>>> what could be the reason i lost the old behavior?
>> 
>> Hi,
>> 
>> it seems that commit 23f1d8b47d12 ("platform/x86: toshiba_acpi: Add
>> quirk for buttons on Z830")
>> botched up the DMI quirk handling.
>> 
>> The global quick flag is tested in toshiba_acpi_enable_hotkeys(),
>> which is called by
>> toshiba_acpi_setup_keyboard() before the global quirk flag is 
>> properly
>> initialized.
>> 
>> Can you compile kernel modules on your device? If yes, then i can 
>> send
>> you a prototype version
>> of this driver which should fix this issue.
>> 
>> Thanks,
>> Armin Wolf
>> 
> I attached a prototype version of the driver which should fix the 
> issue. You can build the module using
> "make" and load the resulting kernel module using "sudo insmod 
> toshiba_acpi.ko" (remember to unload the
> old driver first using "sudo modprobe -r toshiba_acpi").
> 
> Can you verify that the prototype driver indeed fixes the issue?
> 
> Thanks,
> Armin Wolf


