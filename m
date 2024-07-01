Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277E716E872
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854066; cv=none; b=DvF/4x+SiPIxibPfATOdqrPZda0LF/JkQii66bH2BHofkg4vPSIaNVq/fpg2mnUaXB0lfo14RSMafgdtn/4V6Aj7XGiS+M1S8XL6EouKIR81lF4+reHTVddv1bcv3PFHB/Th4nbgk0xPM1gV5iszFPQn7A4xe9IJshrSq3QLklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854066; c=relaxed/simple;
	bh=cFWRRZ/LVYG2xLH3pNlBLY+FIcAUghE1X685djmRdho=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MnlmOyY/DGTcjAaWb1mPVUjO2NAmw+W2wtSiCz6U+AS+WBQQIB93i4oz95mH8z45mBpSfm1jelZW5e1dGH1EU5AzNliAD5aimeBSVcYn0FCZLNn49xZSwsd/A2+MH2ixb1i43kz+uan4HhZ3HiEDH+bKSyRUI08y+FisT5yGsQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PyRbp8f1; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PyRbp8f1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719854059; x=1720458859; i=w_armin@gmx.de;
	bh=cFWRRZ/LVYG2xLH3pNlBLY+FIcAUghE1X685djmRdho=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PyRbp8f1IBstJxjmKNfwg4otqqr0KK6oLSffJ03iZhqoKiusdRgz9wjxxpQTFh3B
	 UsSXxH4G+J9RhczgL3WX4yAr3LF4MuFzd+i01kVLPRq/udEz39FpFdQcpe/DpgRNU
	 RzuL1WcIiS7h+pbWMrBMWEVytcr5FafJDPouP6rjvX3Lph5SdVPb4gJ4/X2dJWMA1
	 0HMND0K9O21bCUWgih6xoIy8nXhzfC52vR0o5hxB9xREuuEOYS1Bg57f/EWmRfZqv
	 pOb531gjWtqR132IHfwPZSWF340/iDfdtnMJkYAJgvBAYrMzYDxx56ihxabnqAtOi
	 zb11yJimYX8yKWaCVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybGh-1sEWrG0oGr-011may; Mon, 01
 Jul 2024 19:14:19 +0200
Message-ID: <aa43984d-ded7-4edf-8d8d-00225ae39979@gmx.de>
Date: Mon, 1 Jul 2024 19:14:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: toshiba_acpi: fn key started working inverse in satellite L50-B
To: kemal <kmal@cock.li>, platform-driver-x86@vger.kernel.org
References: <R4CYFS.TWB8QUU2SHWI1@cock.li>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <R4CYFS.TWB8QUU2SHWI1@cock.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0UoCghEnYkmjehmP+Mk7dEPfKjRktpioL9TRTG7l82gqtNmb+S1
 vcDF1IKnJ75nDhKBxd0EzffrC8JApOFnxReOAmEBd3VbZEUjV/LcfkjlLL5l80md4Zk7LiF
 7LWaTguY5n/0RqXf+jGw/Gn1tUyRA8bYa0v/MWg3KESXbMOpUq2Tx3PmOcxiBaLOeuFGnt4
 Enjj7Vve9C1RvwMO0ZqWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0QYejh6iLg8=;srYwvVt3eVD/UkwFV4143YlAxId
 ec2dFibXFBKbkwFX85i/rUyHLhAflBQ00x3rQLLik1vMRZvUkd3dtP3G+902Ce838CPgkOTle
 PIewc4EqHUR0tsPKi9g0UEDCdGlGqXC/i/8XPM3CWQBN20qccSWkGoLqjd787e8BSCFM0nlms
 mGFTGZ1GJE8ymgdWe9YeVutKcO9+AOV0Q2qvOT4+K8gVIQqRBaazBbsIt71MlQ7ZOpbw5jSvj
 8yy4LgO4u+BOMc0NLEE2YsIoO8knuYUFZAjMQmGBuPiJlMO+FMyXIptQJSJT3Hci8HULf+sU2
 PltIq88lVWBE3Cq68bSS/VDCKLJdk885A29jk+U88AAQNrkbvP/OePrYIBoEWN11ktVN02Qyh
 Y0Fz20tmndthcJMdYo6NNdCFbuqOnywceo5lnTq300NTI2DKdkUe5sJxt8+CCJuk5ULGNU3x3
 Za14gjqh7H9e7LWVRIm+vS67K6fhHvjYMRbE2KCTZXGIUzpUJ+7JpyKI4fF6NEtI3/wd8+JJU
 M+mcYQiDifCvyLOVP8uGdQB7jF99tK9HZLN4xndkk7dvebOFWuJDMgaLDZpwF8vjpiPY3+sPg
 XEs4edFXzzo3VtW0VG9PbwR6xwhk2hvAconspujFILpWDtXWcuAqULgUk5euxtu6Xo3BSbL8g
 D6uhpc0N6sJz62eB+SP2c6HGNSgDPkXpMx625j1D5jyxA5SZtIjhSWtCTUzdYlQaHv8Gyl0MA
 UazTyoXFFhEASZvUYpvFJXD6qhHZ7Zd/B335J2UQL6foiX55TuCinyTBIK+Di2dnsB/l3ZZ+w
 oGnb9bhtjvnHT+5bddDolmVXuvQjOE2vt8Z2pPbi/0hkk=

Am 01.07.24 um 17:53 schrieb kemal:

> in my TOSHIBA SATELLITE L50-B, the fn key started working
> the inverse of how it should after upgrading to kernel 6.9.7
> fn+function key used to emit an actual function key press, now instead
> it emits a hotkey press and the key itself emits an actual function key
> press. there are some recent commits to toshiba_acpi, but i cant see how
> it could affect my hardware.
> what could be the reason i lost the old behavior?

Hi,

it seems that commit 23f1d8b47d12 ("platform/x86: toshiba_acpi: Add quirk for buttons on Z830")
botched up the DMI quirk handling.

The global quick flag is tested in toshiba_acpi_enable_hotkeys(), which is called by
toshiba_acpi_setup_keyboard() before the global quirk flag is properly initialized.

Can you compile kernel modules on your device? If yes, then i can send you a prototype version
of this driver which should fix this issue.

Thanks,
Armin Wolf

