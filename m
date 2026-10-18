Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6488D426693
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 19:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792352109; cv=none; b=bhWU6Qt4d6mfmLXtxS0kaWvR7srI0HzOriyWf30/3pZHpb3hvNTxSulvsv5Z2ePCZbtdRMORPDJlGz8OOYIpVDrRjIywMbzX+tVjDNx02PUEeZ+Flz2qlGyP340t9Fsn7rzeJ5etI80O/UWcUAMHme7IJdozYJMikKO3HZadOIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792352109; c=relaxed/simple;
	bh=yoVpQNkKgYx9xVfJgXvvPyskClNT5Zq8c2kAglfFOLM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=mhSE9IJ+AyvZfElf2YDws4oyiasc3wDg8ZOiqaMv9gOsxG7bfXYh16RxQcYvpZDyx1m9QOJaSbMZ9sTL35cCc6i5AgsCYaJOuaouUILN/svP88vEEqo8Muz2q3GOBGnTNkd5sNAXpuGHjfeIpGLhgpYXAXfZtX9Pn2bgxPQ7YJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kam.mff.cuni.cz; spf=pass smtp.mailfrom=kam.mff.cuni.cz; dkim=pass (1024-bit key) header.d=kam.mff.cuni.cz header.i=@kam.mff.cuni.cz header.b=Yume6lrj; arc=none smtp.client-ip=195.113.20.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kam.mff.cuni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kam.mff.cuni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kam.mff.cuni.cz header.i=@kam.mff.cuni.cz header.b="Yume6lrj"
Received: from [10.12.10.21] (jon.blatto.eu [188.75.189.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: katia)
	by nikam.ms.mff.cuni.cz (Postfix) with ESMTPSA id 6775228221A
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 21:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kam.mff.cuni.cz;
	s=gen1; t=1792351717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJGwb2t4Ub4wapnctsijk8Ol3v2P2EdWZr/9k0tL7JI=;
	b=Yume6lrjI2k+/xAzgy/cy05GuhqL/x70p5UmylTaHJwWkjVixYc3naJOhcuuQ1uxlCrnG+
	jcJGcNvHPlz8pP12Ggi1REoEMBqH+RzgxfmK2AB1ig3r2sCY3Sz8jL+WEUVnvqOf6vqQVy
	K4U5OxdymL2BHdF27kuftHElh7RjyxQ=
Message-ID: <29b30fb3-3f6f-4b93-afbe-a7d391ed3064@kam.mff.cuni.cz>
Date: Sun, 18 Oct 2026 21:28:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
From: =?UTF-8?B?S2F0ZSBLb8SNaWNrw6E=?= <katia@kam.mff.cuni.cz>
Subject: hp_bioscfg: error 0x4, "Invalid command type"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have been trying to use the hp-bioscfg attribute write feature, so far 
with no luck. The system itself is a HP 845 G11, with BIOS 01.09.02 
(08/21/2026). The attribute I tried to modify was Force Cold Boot, via 
sysfs:

/sys/class/firmware-attributes/hp-bioscfg/attributes/Force Cold Boot
possible_values: Disable;Enable;Once

echo Once > current_value
write error: Invalid argument

dmesg: hp_bioscfg: Returned error 0x4, "Invalid command type"

Is this a known issue or limitation?

Thank you for answer,

Katia
