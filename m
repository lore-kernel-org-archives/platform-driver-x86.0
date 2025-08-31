Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27BF78F34
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Aug 2025 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756664274; cv=none; b=EoNLawBAbzLT6mtouf/MWwXlsDWeCvaiRv+MAje0WSEaweDrucIAz4gzXMe+9DY9gzjiHQqlrvDTsP2NEPzyADgISRN1z41Oi3Icosz7V4mSXgnD5uLSoPXvqq+c1SIg13bovMwjCo3+Mtia/CYjzAw54CXCcUFb1w3xgHZUWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756664274; c=relaxed/simple;
	bh=n4ci0Ffi4HaqMzzhQRf+howPjKADTDCNosMqj2x1wgE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=SdF3G1uGIrINJkoQpBI4jyiCTs2eEC+xiMa8olb1hBTI+yHhEc1/7ufsS+Zyn0aQDxb/ugdw/POkESnwmUByaTol4+PSE5WxIhKqrEqV1vT4ZJ6Rtfg0y1h/kdtLMijQqkZS8hfU27pL84/Yq++I4+YbYlXgkB7x7wWxEWF3sjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Eck3eVjc; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wyocjpRw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Eck3eVjc";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wyocjpRw"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:From:To:Date:Message-ID; t=1756664224; bh=hbOZc5H3iGaskcdUJSMZ9lF
	AxFuiBrqsghXUsRZ74Bs=; b=Eck3eVjcX6iv+u4HZITo1z4RcdKk5ZEjca5YlVkN8pVwmqFEqY
	ydhgnQbBVjUtu5zsIbxUFS1hxphLzj3FvW7ZrveCaIwZFG1UQM0vG2JzCC35c9evxTtM+5ROh1F
	ss72zhhWE8omyqMZtaf7vptrXT+679wOHs7nTOlj9N2vQGZ3GLjumeEV2Ye7MeApNiX+pqCbHKz
	B5/x+T0WqP9RN33jKwWhYYJB3hGmDYgVSdXZraZqeTjL/xxPGAYwaJ0g3Gaf9e4voi4v6F/NLva
	+tjRHujZlAc44VR9XUeNStuyy1c44NsQYbySYOxrTx0hN836p64HiLosP5hoXjIGdHQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:From:To:Date:Message-ID; t=1756664224; bh=hbOZc5H3iGaskcdUJSMZ9lF
	AxFuiBrqsghXUsRZ74Bs=; b=wyocjpRwJh7CFmggVZXDHNP5GzgLBFq7pulzR0FpBZbQlsH9gl
	kldnOpk2yaPIVtc4MvDCriFUs8tQos0R3pCw==;
Message-ID: <c3d9b2ba-8c7d-4b9e-ac22-b0a48aebb8f4@mainlining.org>
Date: Sun, 31 Aug 2025 21:17:03 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru-RU, en-US
To: platform-driver-x86@vger.kernel.org
From: NIckolay Goppen <setotau@mainlining.org>
Subject: LIS3LV02D accelerometer found on Dell Latitude E6530
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone. I've booted Linux on my Dell Latitude E6530 with

dell_lis3lv02d.probe_i2c_addr=1 parameter and dmesg reported me

that LIS3LV02D was detected at address 0x29 and successfully probed.

So can you add a "Latitude E6530" in the lis3lv02d_devices list please?

-- 
Best regards,
Nickolay

